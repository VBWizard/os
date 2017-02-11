
Debug/cross-Linux-x86/libfatLib.so:     file format elf32-i386


Disassembly of section .text:

00000000 <fatfs_init>:
fatfs_init():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:44

//-----------------------------------------------------------------------------
// fatfs_init: Load FAT Parameters
//-----------------------------------------------------------------------------
int fatfs_init(struct fatfs *fs)
{
       0:	55                   	push   ebp
       1:	89 e5                	mov    ebp,esp
       3:	53                   	push   ebx
       4:	83 ec 24             	sub    esp,0x24
       7:	e8 ee 6e 00 00       	call   6efa <__x86.get_pc_thunk.bx>
       c:	81 c3 1c af 00 00    	add    ebx,0xaf1c
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:52
    uint32 FATSz;
    uint32 root_dir_sectors;
    uint32 total_sectors;
    uint32 data_sectors;
    uint32 count_of_clusters;
    uint8 valid_partition = 0;
      12:	c6 45 ef 00          	mov    BYTE PTR [ebp-0x11],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:54

    fs->currentsector.address = FAT32_INVALID_CLUSTER;
      16:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      19:	c7 80 44 02 00 00 ff 	mov    DWORD PTR [eax+0x244],0xffffffff
      20:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:55
    fs->currentsector.dirty = 0;
      23:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      26:	c7 80 48 02 00 00 00 	mov    DWORD PTR [eax+0x248],0x0
      2d:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:57

    fs->next_free_cluster = 0; // Invalid
      30:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      33:	c7 40 24 00 00 00 00 	mov    DWORD PTR [eax+0x24],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:59

    fatfs_fat_init(fs);
      3a:	83 ec 0c             	sub    esp,0xc
      3d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
      40:	e8 eb 6e 00 00       	call   6f30 <__x86.get_pc_thunk.bx+0x36>
      45:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:62

    // Make sure we have a read function (write function is optional)
    if (!fs->disk_io.read_media)
      48:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      4b:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
      4e:	85 c0                	test   eax,eax
      50:	75 0a                	jne    5c <fatfs_init+0x5c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:63
        return FAT_INIT_MEDIA_ACCESS_ERROR;
      52:	b8 ff ff ff ff       	mov    eax,0xffffffff
      57:	e9 4b 05 00 00       	jmp    5a7 <.L8+0x4a0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:69

    // MBR: Sector 0 on the disk
    // NOTE: Some removeable media does not have this.

    // Load MBR (LBA 0) into the 512 byte buffer
    if (!fs->disk_io.read_media(0, fs->currentsector.sector, 1))
      5c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      5f:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
      62:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
      65:	83 c2 44             	add    edx,0x44
      68:	83 ec 04             	sub    esp,0x4
      6b:	6a 01                	push   0x1
      6d:	52                   	push   edx
      6e:	6a 00                	push   0x0
      70:	ff d0                	call   eax
      72:	83 c4 10             	add    esp,0x10
      75:	85 c0                	test   eax,eax
      77:	75 0a                	jne    83 <fatfs_init+0x83>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:70
        return FAT_INIT_MEDIA_ACCESS_ERROR;
      79:	b8 ff ff ff ff       	mov    eax,0xffffffff
      7e:	e9 24 05 00 00       	jmp    5a7 <.L8+0x4a0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:74

    // Make Sure 0x55 and 0xAA are at end of sector
    // (this should be the case regardless of the MBR or boot sector)
    if (fs->currentsector.sector[SIGNATURE_POSITION] != 0x55 || fs->currentsector.sector[SIGNATURE_POSITION+1] != 0xAA)
      83:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      86:	0f b6 80 42 02 00 00 	movzx  eax,BYTE PTR [eax+0x242]
      8d:	3c 55                	cmp    al,0x55
      8f:	75 0e                	jne    9f <fatfs_init+0x9f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:74 (discriminator 1)
      91:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      94:	0f b6 80 43 02 00 00 	movzx  eax,BYTE PTR [eax+0x243]
      9b:	3c aa                	cmp    al,0xaa
      9d:	74 0a                	je     a9 <fatfs_init+0xa9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:75
        return FAT_INIT_INVALID_SIGNATURE;
      9f:	b8 fd ff ff ff       	mov    eax,0xfffffffd
      a4:	e9 fe 04 00 00       	jmp    5a7 <.L8+0x4a0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:78

    // Now check again using the access function to prove endian conversion function
    if (GET_16BIT_WORD(fs->currentsector.sector, SIGNATURE_POSITION) != SIGNATURE_VALUE)
      a9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      ac:	0f b6 80 43 02 00 00 	movzx  eax,BYTE PTR [eax+0x243]
      b3:	0f b6 c0             	movzx  eax,al
      b6:	c1 e0 08             	shl    eax,0x8
      b9:	89 c2                	mov    edx,eax
      bb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      be:	0f b6 80 42 02 00 00 	movzx  eax,BYTE PTR [eax+0x242]
      c5:	0f b6 c0             	movzx  eax,al
      c8:	01 d0                	add    eax,edx
      ca:	3d 55 aa 00 00       	cmp    eax,0xaa55
      cf:	74 0a                	je     db <fatfs_init+0xdb>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:79
        return FAT_INIT_ENDIAN_ERROR;
      d1:	b8 fc ff ff ff       	mov    eax,0xfffffffc
      d6:	e9 cc 04 00 00       	jmp    5a7 <.L8+0x4a0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:86
    // Verify packed structures
    if (sizeof(struct fat_dir_entry) != FAT_DIR_ENTRY_SIZE)
        return FAT_INIT_STRUCT_PACKING;

    // Check the partition type code
    switch(fs->currentsector.sector[PARTITION1_TYPECODE_LOCATION])
      db:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      de:	0f b6 80 06 02 00 00 	movzx  eax,BYTE PTR [eax+0x206]
      e5:	0f b6 c0             	movzx  eax,al
      e8:	83 f8 0f             	cmp    eax,0xf
      eb:	77 1a                	ja     107 <.L8>
      ed:	c1 e0 02             	shl    eax,0x2
      f0:	8b 84 18 78 c4 ff ff 	mov    eax,DWORD PTR [eax+ebx*1-0x3b88]
      f7:	01 d8                	add    eax,ebx
      f9:	ff e0                	jmp    eax

000000fb <.L11>:
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:94
        case 0x06:
        case 0x0C:
        case 0x0E:
        case 0x0F:
        case 0x05:
            valid_partition = 1;
      fb:	c6 45 ef 01          	mov    BYTE PTR [ebp-0x11],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:95
        break;
      ff:	eb 19                	jmp    11a <.L8+0x13>

00000101 <.L9>:
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:97
        case 0x00:
            valid_partition = 0;
     101:	c6 45 ef 00          	mov    BYTE PTR [ebp-0x11],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:98
            break;
     105:	eb 13                	jmp    11a <.L8+0x13>

00000107 <.L8>:
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:100
        default:
            if (fs->currentsector.sector[PARTITION1_TYPECODE_LOCATION] <= 0x06)
     107:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     10a:	0f b6 80 06 02 00 00 	movzx  eax,BYTE PTR [eax+0x206]
     111:	3c 06                	cmp    al,0x6
     113:	77 04                	ja     119 <.L8+0x12>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:101
                valid_partition = 1;
     115:	c6 45 ef 01          	mov    BYTE PTR [ebp-0x11],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:102
        break;
     119:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:106
    }

    // Read LBA Begin for the file system
    if (valid_partition)
     11a:	80 7d ef 00          	cmp    BYTE PTR [ebp-0x11],0x0
     11e:	74 4d                	je     16d <.L8+0x66>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:107
        fs->lba_begin = GET_32BIT_WORD(fs->currentsector.sector, PARTITION1_LBA_BEGIN_LOCATION);
     120:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     123:	0f b6 80 0d 02 00 00 	movzx  eax,BYTE PTR [eax+0x20d]
     12a:	0f b6 c0             	movzx  eax,al
     12d:	c1 e0 18             	shl    eax,0x18
     130:	89 c2                	mov    edx,eax
     132:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     135:	0f b6 80 0c 02 00 00 	movzx  eax,BYTE PTR [eax+0x20c]
     13c:	0f b6 c0             	movzx  eax,al
     13f:	c1 e0 10             	shl    eax,0x10
     142:	01 c2                	add    edx,eax
     144:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     147:	0f b6 80 0b 02 00 00 	movzx  eax,BYTE PTR [eax+0x20b]
     14e:	0f b6 c0             	movzx  eax,al
     151:	c1 e0 08             	shl    eax,0x8
     154:	01 c2                	add    edx,eax
     156:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     159:	0f b6 80 0a 02 00 00 	movzx  eax,BYTE PTR [eax+0x20a]
     160:	0f b6 c0             	movzx  eax,al
     163:	01 c2                	add    edx,eax
     165:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     168:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
     16b:	eb 0a                	jmp    177 <.L8+0x70>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:110
    // Else possibly MBR less disk
    else
        fs->lba_begin = 0;
     16d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     170:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [eax+0x1c],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:114

    // Load Volume 1 table into sector buffer
    // (We may already have this in the buffer if MBR less drive!)
    if (!fs->disk_io.read_media(fs->lba_begin, fs->currentsector.sector, 1))
     177:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     17a:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
     17d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     180:	8d 4a 44             	lea    ecx,[edx+0x44]
     183:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     186:	8b 52 1c             	mov    edx,DWORD PTR [edx+0x1c]
     189:	83 ec 04             	sub    esp,0x4
     18c:	6a 01                	push   0x1
     18e:	51                   	push   ecx
     18f:	52                   	push   edx
     190:	ff d0                	call   eax
     192:	83 c4 10             	add    esp,0x10
     195:	85 c0                	test   eax,eax
     197:	75 0a                	jne    1a3 <.L8+0x9c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:115
        return FAT_INIT_MEDIA_ACCESS_ERROR;
     199:	b8 ff ff ff ff       	mov    eax,0xffffffff
     19e:	e9 04 04 00 00       	jmp    5a7 <.L8+0x4a0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:118

    // Make sure there are 512 bytes per cluster
    if (GET_16BIT_WORD(fs->currentsector.sector, 0x0B) != FAT_SECTOR_SIZE)
     1a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     1a6:	0f b6 40 50          	movzx  eax,BYTE PTR [eax+0x50]
     1aa:	0f b6 c0             	movzx  eax,al
     1ad:	c1 e0 08             	shl    eax,0x8
     1b0:	89 c2                	mov    edx,eax
     1b2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     1b5:	0f b6 40 4f          	movzx  eax,BYTE PTR [eax+0x4f]
     1b9:	0f b6 c0             	movzx  eax,al
     1bc:	01 d0                	add    eax,edx
     1be:	3d 00 02 00 00       	cmp    eax,0x200
     1c3:	74 0a                	je     1cf <.L8+0xc8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:119
        return FAT_INIT_INVALID_SECTOR_SIZE;
     1c5:	b8 fe ff ff ff       	mov    eax,0xfffffffe
     1ca:	e9 d8 03 00 00       	jmp    5a7 <.L8+0x4a0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:122

    // Load Parameters of FAT partition
    fs->sectors_per_cluster = fs->currentsector.sector[BPB_SECPERCLUS];
     1cf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     1d2:	0f b6 50 51          	movzx  edx,BYTE PTR [eax+0x51]
     1d6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     1d9:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:123
    reserved_sectors = GET_16BIT_WORD(fs->currentsector.sector, BPB_RSVDSECCNT);
     1db:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     1de:	0f b6 40 53          	movzx  eax,BYTE PTR [eax+0x53]
     1e2:	0f b6 c0             	movzx  eax,al
     1e5:	c1 e0 08             	shl    eax,0x8
     1e8:	89 c2                	mov    edx,eax
     1ea:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     1ed:	0f b6 40 52          	movzx  eax,BYTE PTR [eax+0x52]
     1f1:	0f b6 c0             	movzx  eax,al
     1f4:	01 d0                	add    eax,edx
     1f6:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:124
    num_of_fats = fs->currentsector.sector[BPB_NUMFATS];
     1fa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     1fd:	0f b6 40 54          	movzx  eax,BYTE PTR [eax+0x54]
     201:	88 45 eb             	mov    BYTE PTR [ebp-0x15],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:125
    fs->root_entry_count = GET_16BIT_WORD(fs->currentsector.sector, BPB_ROOTENTCNT);
     204:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     207:	0f b6 40 56          	movzx  eax,BYTE PTR [eax+0x56]
     20b:	0f b6 c0             	movzx  eax,al
     20e:	c1 e0 08             	shl    eax,0x8
     211:	89 c2                	mov    edx,eax
     213:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     216:	0f b6 40 55          	movzx  eax,BYTE PTR [eax+0x55]
     21a:	0f b6 c0             	movzx  eax,al
     21d:	01 c2                	add    edx,eax
     21f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     222:	66 89 50 28          	mov    WORD PTR [eax+0x28],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:127

    if(GET_16BIT_WORD(fs->currentsector.sector, BPB_FATSZ16) != 0)
     226:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     229:	0f b6 40 5b          	movzx  eax,BYTE PTR [eax+0x5b]
     22d:	0f b6 c0             	movzx  eax,al
     230:	c1 e0 08             	shl    eax,0x8
     233:	89 c2                	mov    edx,eax
     235:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     238:	0f b6 40 5a          	movzx  eax,BYTE PTR [eax+0x5a]
     23c:	0f b6 c0             	movzx  eax,al
     23f:	01 d0                	add    eax,edx
     241:	85 c0                	test   eax,eax
     243:	74 25                	je     26a <.L8+0x163>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:128
        fs->fat_sectors = GET_16BIT_WORD(fs->currentsector.sector, BPB_FATSZ16);
     245:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     248:	0f b6 40 5b          	movzx  eax,BYTE PTR [eax+0x5b]
     24c:	0f b6 c0             	movzx  eax,al
     24f:	c1 e0 08             	shl    eax,0x8
     252:	89 c2                	mov    edx,eax
     254:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     257:	0f b6 40 5a          	movzx  eax,BYTE PTR [eax+0x5a]
     25b:	0f b6 c0             	movzx  eax,al
     25e:	01 d0                	add    eax,edx
     260:	89 c2                	mov    edx,eax
     262:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     265:	89 50 20             	mov    DWORD PTR [eax+0x20],edx
     268:	eb 3f                	jmp    2a9 <.L8+0x1a2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:130
    else
        fs->fat_sectors = GET_32BIT_WORD(fs->currentsector.sector, BPB_FAT32_FATSZ32);
     26a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     26d:	0f b6 40 6b          	movzx  eax,BYTE PTR [eax+0x6b]
     271:	0f b6 c0             	movzx  eax,al
     274:	c1 e0 18             	shl    eax,0x18
     277:	89 c2                	mov    edx,eax
     279:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     27c:	0f b6 40 6a          	movzx  eax,BYTE PTR [eax+0x6a]
     280:	0f b6 c0             	movzx  eax,al
     283:	c1 e0 10             	shl    eax,0x10
     286:	01 c2                	add    edx,eax
     288:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     28b:	0f b6 40 69          	movzx  eax,BYTE PTR [eax+0x69]
     28f:	0f b6 c0             	movzx  eax,al
     292:	c1 e0 08             	shl    eax,0x8
     295:	01 c2                	add    edx,eax
     297:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     29a:	0f b6 40 68          	movzx  eax,BYTE PTR [eax+0x68]
     29e:	0f b6 c0             	movzx  eax,al
     2a1:	01 c2                	add    edx,eax
     2a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     2a6:	89 50 20             	mov    DWORD PTR [eax+0x20],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:133

    // For FAT32 (which this may be)
    fs->rootdir_first_cluster = GET_32BIT_WORD(fs->currentsector.sector, BPB_FAT32_ROOTCLUS);
     2a9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     2ac:	0f b6 40 73          	movzx  eax,BYTE PTR [eax+0x73]
     2b0:	0f b6 c0             	movzx  eax,al
     2b3:	c1 e0 18             	shl    eax,0x18
     2b6:	89 c2                	mov    edx,eax
     2b8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     2bb:	0f b6 40 72          	movzx  eax,BYTE PTR [eax+0x72]
     2bf:	0f b6 c0             	movzx  eax,al
     2c2:	c1 e0 10             	shl    eax,0x10
     2c5:	01 c2                	add    edx,eax
     2c7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     2ca:	0f b6 40 71          	movzx  eax,BYTE PTR [eax+0x71]
     2ce:	0f b6 c0             	movzx  eax,al
     2d1:	c1 e0 08             	shl    eax,0x8
     2d4:	01 c2                	add    edx,eax
     2d6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     2d9:	0f b6 40 70          	movzx  eax,BYTE PTR [eax+0x70]
     2dd:	0f b6 c0             	movzx  eax,al
     2e0:	01 c2                	add    edx,eax
     2e2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     2e5:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:134
    fs->fs_info_sector = GET_16BIT_WORD(fs->currentsector.sector, BPB_FAT32_FSINFO);
     2e8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     2eb:	0f b6 40 75          	movzx  eax,BYTE PTR [eax+0x75]
     2ef:	0f b6 c0             	movzx  eax,al
     2f2:	c1 e0 08             	shl    eax,0x8
     2f5:	89 c2                	mov    edx,eax
     2f7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     2fa:	0f b6 40 74          	movzx  eax,BYTE PTR [eax+0x74]
     2fe:	0f b6 c0             	movzx  eax,al
     301:	01 c2                	add    edx,eax
     303:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     306:	66 89 50 18          	mov    WORD PTR [eax+0x18],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:137

    // For FAT16 (which this may be), rootdir_first_cluster is actuall rootdir_first_sector
    fs->rootdir_first_sector = reserved_sectors + (num_of_fats * fs->fat_sectors);
     30a:	0f b7 55 ec          	movzx  edx,WORD PTR [ebp-0x14]
     30e:	0f b6 4d eb          	movzx  ecx,BYTE PTR [ebp-0x15]
     312:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     315:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
     318:	0f af c1             	imul   eax,ecx
     31b:	01 c2                	add    edx,eax
     31d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     320:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:138
    fs->rootdir_sectors = ((fs->root_entry_count * 32) + (FAT_SECTOR_SIZE - 1)) / FAT_SECTOR_SIZE;
     323:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     326:	0f b7 40 28          	movzx  eax,WORD PTR [eax+0x28]
     32a:	0f b7 c0             	movzx  eax,ax
     32d:	c1 e0 05             	shl    eax,0x5
     330:	05 ff 01 00 00       	add    eax,0x1ff
     335:	8d 90 ff 01 00 00    	lea    edx,[eax+0x1ff]
     33b:	85 c0                	test   eax,eax
     33d:	0f 48 c2             	cmovs  eax,edx
     340:	c1 f8 09             	sar    eax,0x9
     343:	89 c2                	mov    edx,eax
     345:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     348:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:141

    // First FAT LBA address
    fs->fat_begin_lba = fs->lba_begin + reserved_sectors;
     34b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     34e:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
     351:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
     355:	01 c2                	add    edx,eax
     357:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     35a:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:144

    // The address of the first data cluster on this volume
    fs->cluster_begin_lba = fs->fat_begin_lba + (num_of_fats * fs->fat_sectors);
     35d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     360:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
     363:	0f b6 4d eb          	movzx  ecx,BYTE PTR [ebp-0x15]
     367:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     36a:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
     36d:	0f af c1             	imul   eax,ecx
     370:	01 c2                	add    edx,eax
     372:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     375:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:146

    if (GET_16BIT_WORD(fs->currentsector.sector, 0x1FE) != 0xAA55) // This signature should be AA55
     378:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     37b:	0f b6 80 43 02 00 00 	movzx  eax,BYTE PTR [eax+0x243]
     382:	0f b6 c0             	movzx  eax,al
     385:	c1 e0 08             	shl    eax,0x8
     388:	89 c2                	mov    edx,eax
     38a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     38d:	0f b6 80 42 02 00 00 	movzx  eax,BYTE PTR [eax+0x242]
     394:	0f b6 c0             	movzx  eax,al
     397:	01 d0                	add    eax,edx
     399:	3d 55 aa 00 00       	cmp    eax,0xaa55
     39e:	74 0a                	je     3aa <.L8+0x2a3>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:147
        return FAT_INIT_INVALID_SIGNATURE;
     3a0:	b8 fd ff ff ff       	mov    eax,0xfffffffd
     3a5:	e9 fd 01 00 00       	jmp    5a7 <.L8+0x4a0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:150

    // Calculate the root dir sectors
    root_dir_sectors = ((GET_16BIT_WORD(fs->currentsector.sector, BPB_ROOTENTCNT) * 32) + (GET_16BIT_WORD(fs->currentsector.sector, BPB_BYTSPERSEC) - 1)) / GET_16BIT_WORD(fs->currentsector.sector, BPB_BYTSPERSEC);
     3aa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     3ad:	0f b6 40 56          	movzx  eax,BYTE PTR [eax+0x56]
     3b1:	0f b6 c0             	movzx  eax,al
     3b4:	c1 e0 08             	shl    eax,0x8
     3b7:	89 c2                	mov    edx,eax
     3b9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     3bc:	0f b6 40 55          	movzx  eax,BYTE PTR [eax+0x55]
     3c0:	0f b6 c0             	movzx  eax,al
     3c3:	01 d0                	add    eax,edx
     3c5:	c1 e0 05             	shl    eax,0x5
     3c8:	89 c2                	mov    edx,eax
     3ca:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     3cd:	0f b6 40 50          	movzx  eax,BYTE PTR [eax+0x50]
     3d1:	0f b6 c0             	movzx  eax,al
     3d4:	c1 e0 08             	shl    eax,0x8
     3d7:	89 c1                	mov    ecx,eax
     3d9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     3dc:	0f b6 40 4f          	movzx  eax,BYTE PTR [eax+0x4f]
     3e0:	0f b6 c0             	movzx  eax,al
     3e3:	01 c8                	add    eax,ecx
     3e5:	83 e8 01             	sub    eax,0x1
     3e8:	01 c2                	add    edx,eax
     3ea:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     3ed:	0f b6 40 50          	movzx  eax,BYTE PTR [eax+0x50]
     3f1:	0f b6 c0             	movzx  eax,al
     3f4:	c1 e0 08             	shl    eax,0x8
     3f7:	89 c1                	mov    ecx,eax
     3f9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     3fc:	0f b6 40 4f          	movzx  eax,BYTE PTR [eax+0x4f]
     400:	0f b6 c0             	movzx  eax,al
     403:	01 c1                	add    ecx,eax
     405:	89 d0                	mov    eax,edx
     407:	99                   	cdq    
     408:	f7 f9                	idiv   ecx
     40a:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:152

    if(GET_16BIT_WORD(fs->currentsector.sector, BPB_FATSZ16) != 0)
     40d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     410:	0f b6 40 5b          	movzx  eax,BYTE PTR [eax+0x5b]
     414:	0f b6 c0             	movzx  eax,al
     417:	c1 e0 08             	shl    eax,0x8
     41a:	89 c2                	mov    edx,eax
     41c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     41f:	0f b6 40 5a          	movzx  eax,BYTE PTR [eax+0x5a]
     423:	0f b6 c0             	movzx  eax,al
     426:	01 d0                	add    eax,edx
     428:	85 c0                	test   eax,eax
     42a:	74 20                	je     44c <.L8+0x345>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:153
        FATSz = GET_16BIT_WORD(fs->currentsector.sector, BPB_FATSZ16);
     42c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     42f:	0f b6 40 5b          	movzx  eax,BYTE PTR [eax+0x5b]
     433:	0f b6 c0             	movzx  eax,al
     436:	c1 e0 08             	shl    eax,0x8
     439:	89 c2                	mov    edx,eax
     43b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     43e:	0f b6 40 5a          	movzx  eax,BYTE PTR [eax+0x5a]
     442:	0f b6 c0             	movzx  eax,al
     445:	01 d0                	add    eax,edx
     447:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
     44a:	eb 3c                	jmp    488 <.L8+0x381>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:155
    else
        FATSz = GET_32BIT_WORD(fs->currentsector.sector, BPB_FAT32_FATSZ32);
     44c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     44f:	0f b6 40 6b          	movzx  eax,BYTE PTR [eax+0x6b]
     453:	0f b6 c0             	movzx  eax,al
     456:	c1 e0 18             	shl    eax,0x18
     459:	89 c2                	mov    edx,eax
     45b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     45e:	0f b6 40 6a          	movzx  eax,BYTE PTR [eax+0x6a]
     462:	0f b6 c0             	movzx  eax,al
     465:	c1 e0 10             	shl    eax,0x10
     468:	01 c2                	add    edx,eax
     46a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     46d:	0f b6 40 69          	movzx  eax,BYTE PTR [eax+0x69]
     471:	0f b6 c0             	movzx  eax,al
     474:	c1 e0 08             	shl    eax,0x8
     477:	01 c2                	add    edx,eax
     479:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     47c:	0f b6 40 68          	movzx  eax,BYTE PTR [eax+0x68]
     480:	0f b6 c0             	movzx  eax,al
     483:	01 d0                	add    eax,edx
     485:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:157

    if(GET_16BIT_WORD(fs->currentsector.sector, BPB_TOTSEC16) != 0)
     488:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     48b:	0f b6 40 58          	movzx  eax,BYTE PTR [eax+0x58]
     48f:	0f b6 c0             	movzx  eax,al
     492:	c1 e0 08             	shl    eax,0x8
     495:	89 c2                	mov    edx,eax
     497:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     49a:	0f b6 40 57          	movzx  eax,BYTE PTR [eax+0x57]
     49e:	0f b6 c0             	movzx  eax,al
     4a1:	01 d0                	add    eax,edx
     4a3:	85 c0                	test   eax,eax
     4a5:	74 20                	je     4c7 <.L8+0x3c0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:158
        total_sectors = GET_16BIT_WORD(fs->currentsector.sector, BPB_TOTSEC16);
     4a7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     4aa:	0f b6 40 58          	movzx  eax,BYTE PTR [eax+0x58]
     4ae:	0f b6 c0             	movzx  eax,al
     4b1:	c1 e0 08             	shl    eax,0x8
     4b4:	89 c2                	mov    edx,eax
     4b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     4b9:	0f b6 40 57          	movzx  eax,BYTE PTR [eax+0x57]
     4bd:	0f b6 c0             	movzx  eax,al
     4c0:	01 d0                	add    eax,edx
     4c2:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
     4c5:	eb 3c                	jmp    503 <.L8+0x3fc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:160
    else
        total_sectors = GET_32BIT_WORD(fs->currentsector.sector, BPB_TOTSEC32);
     4c7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     4ca:	0f b6 40 67          	movzx  eax,BYTE PTR [eax+0x67]
     4ce:	0f b6 c0             	movzx  eax,al
     4d1:	c1 e0 18             	shl    eax,0x18
     4d4:	89 c2                	mov    edx,eax
     4d6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     4d9:	0f b6 40 66          	movzx  eax,BYTE PTR [eax+0x66]
     4dd:	0f b6 c0             	movzx  eax,al
     4e0:	c1 e0 10             	shl    eax,0x10
     4e3:	01 c2                	add    edx,eax
     4e5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     4e8:	0f b6 40 65          	movzx  eax,BYTE PTR [eax+0x65]
     4ec:	0f b6 c0             	movzx  eax,al
     4ef:	c1 e0 08             	shl    eax,0x8
     4f2:	01 c2                	add    edx,eax
     4f4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     4f7:	0f b6 40 64          	movzx  eax,BYTE PTR [eax+0x64]
     4fb:	0f b6 c0             	movzx  eax,al
     4fe:	01 d0                	add    eax,edx
     500:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:162

    data_sectors = total_sectors - (GET_16BIT_WORD(fs->currentsector.sector, BPB_RSVDSECCNT) + (fs->currentsector.sector[BPB_NUMFATS] * FATSz) + root_dir_sectors);
     503:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     506:	0f b6 40 53          	movzx  eax,BYTE PTR [eax+0x53]
     50a:	0f b6 c0             	movzx  eax,al
     50d:	c1 e0 08             	shl    eax,0x8
     510:	89 c2                	mov    edx,eax
     512:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     515:	0f b6 40 52          	movzx  eax,BYTE PTR [eax+0x52]
     519:	0f b6 c0             	movzx  eax,al
     51c:	01 d0                	add    eax,edx
     51e:	89 c2                	mov    edx,eax
     520:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     523:	0f b6 40 54          	movzx  eax,BYTE PTR [eax+0x54]
     527:	0f b6 c0             	movzx  eax,al
     52a:	0f af 45 f4          	imul   eax,DWORD PTR [ebp-0xc]
     52e:	01 c2                	add    edx,eax
     530:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
     533:	01 c2                	add    edx,eax
     535:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
     538:	29 d0                	sub    eax,edx
     53a:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:165

    // Find out which version of FAT this is...
    if (fs->sectors_per_cluster != 0)
     53d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     540:	0f b6 00             	movzx  eax,BYTE PTR [eax]
     543:	84 c0                	test   al,al
     545:	74 5b                	je     5a2 <.L8+0x49b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:167
    {
        count_of_clusters = data_sectors / fs->sectors_per_cluster;
     547:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     54a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
     54d:	0f b6 d8             	movzx  ebx,al
     550:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
     553:	ba 00 00 00 00       	mov    edx,0x0
     558:	f7 f3                	div    ebx
     55a:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:169

        if(count_of_clusters < 4085)
     55d:	81 7d dc f4 0f 00 00 	cmp    DWORD PTR [ebp-0x24],0xff4
     564:	77 07                	ja     56d <.L8+0x466>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:171
            // Volume is FAT12
            return FAT_INIT_WRONG_FILESYS_TYPE;
     566:	b8 fb ff ff ff       	mov    eax,0xfffffffb
     56b:	eb 3a                	jmp    5a7 <.L8+0x4a0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:172
        else if(count_of_clusters < 65525)
     56d:	81 7d dc f4 ff 00 00 	cmp    DWORD PTR [ebp-0x24],0xfff4
     574:	77 1b                	ja     591 <.L8+0x48a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:175
        {
            // Clear this FAT32 specific param
            fs->rootdir_first_cluster = 0;
     576:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     579:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:178

            // Volume is FAT16
            fs->fat_type = FAT_TYPE_16;
     580:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     583:	c7 40 30 00 00 00 00 	mov    DWORD PTR [eax+0x30],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:179
            return FAT_INIT_OK;
     58a:	b8 00 00 00 00       	mov    eax,0x0
     58f:	eb 16                	jmp    5a7 <.L8+0x4a0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:184
        }
        else
        {
            // Volume is FAT32
            fs->fat_type = FAT_TYPE_32;
     591:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     594:	c7 40 30 01 00 00 00 	mov    DWORD PTR [eax+0x30],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:185
            return FAT_INIT_OK;
     59b:	b8 00 00 00 00       	mov    eax,0x0
     5a0:	eb 05                	jmp    5a7 <.L8+0x4a0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:189
        }
    }
    else
        return FAT_INIT_WRONG_FILESYS_TYPE;
     5a2:	b8 fb ff ff ff       	mov    eax,0xfffffffb
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:190
}
     5a7:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
     5aa:	c9                   	leave  
     5ab:	c3                   	ret    

000005ac <fatfs_lba_of_cluster>:
fatfs_lba_of_cluster():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:196
//-----------------------------------------------------------------------------
// fatfs_lba_of_cluster: This function converts a cluster number into a sector /
// LBA number.
//-----------------------------------------------------------------------------
uint32 fatfs_lba_of_cluster(struct fatfs *fs, uint32 Cluster_Number)
{
     5ac:	55                   	push   ebp
     5ad:	89 e5                	mov    ebp,esp
     5af:	e8 42 69 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
     5b4:	05 74 a9 00 00       	add    eax,0xa974
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:197
    if (fs->fat_type == FAT_TYPE_16)
     5b9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     5bc:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
     5bf:	85 c0                	test   eax,eax
     5c1:	75 39                	jne    5fc <fatfs_lba_of_cluster+0x50>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:198
        return (fs->cluster_begin_lba + (fs->root_entry_count * 32 / FAT_SECTOR_SIZE) + ((Cluster_Number-2) * fs->sectors_per_cluster));
     5c3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     5c6:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
     5c9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     5cc:	0f b7 40 28          	movzx  eax,WORD PTR [eax+0x28]
     5d0:	0f b7 c0             	movzx  eax,ax
     5d3:	c1 e0 05             	shl    eax,0x5
     5d6:	8d 88 ff 01 00 00    	lea    ecx,[eax+0x1ff]
     5dc:	85 c0                	test   eax,eax
     5de:	0f 48 c1             	cmovs  eax,ecx
     5e1:	c1 f8 09             	sar    eax,0x9
     5e4:	01 c2                	add    edx,eax
     5e6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
     5e9:	8d 48 fe             	lea    ecx,[eax-0x2]
     5ec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     5ef:	0f b6 00             	movzx  eax,BYTE PTR [eax]
     5f2:	0f b6 c0             	movzx  eax,al
     5f5:	0f af c1             	imul   eax,ecx
     5f8:	01 d0                	add    eax,edx
     5fa:	eb 1a                	jmp    616 <fatfs_lba_of_cluster+0x6a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:200
    else
        return ((fs->cluster_begin_lba + ((Cluster_Number-2)*fs->sectors_per_cluster)));
     5fc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     5ff:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
     602:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
     605:	8d 48 fe             	lea    ecx,[eax-0x2]
     608:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     60b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
     60e:	0f b6 c0             	movzx  eax,al
     611:	0f af c1             	imul   eax,ecx
     614:	01 d0                	add    eax,edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:201
}
     616:	5d                   	pop    ebp
     617:	c3                   	ret    

00000618 <fatfs_sector_read>:
fatfs_sector_read():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:206
//-----------------------------------------------------------------------------
// fatfs_sector_read:
//-----------------------------------------------------------------------------
int fatfs_sector_read(struct fatfs *fs, uint32 lba, uint8 *target, uint32 count)
{
     618:	55                   	push   ebp
     619:	89 e5                	mov    ebp,esp
     61b:	83 ec 08             	sub    esp,0x8
     61e:	e8 d3 68 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
     623:	05 05 a9 00 00       	add    eax,0xa905
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:207
    return fs->disk_io.read_media(lba, target, count);
     628:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     62b:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
     62e:	83 ec 04             	sub    esp,0x4
     631:	ff 75 14             	push   DWORD PTR [ebp+0x14]
     634:	ff 75 10             	push   DWORD PTR [ebp+0x10]
     637:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
     63a:	ff d0                	call   eax
     63c:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:208
}
     63f:	c9                   	leave  
     640:	c3                   	ret    

00000641 <fatfs_sector_write>:
fatfs_sector_write():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:213
//-----------------------------------------------------------------------------
// fatfs_sector_write:
//-----------------------------------------------------------------------------
int fatfs_sector_write(struct fatfs *fs, uint32 lba, uint8 *target, uint32 count)
{
     641:	55                   	push   ebp
     642:	89 e5                	mov    ebp,esp
     644:	83 ec 08             	sub    esp,0x8
     647:	e8 aa 68 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
     64c:	05 dc a8 00 00       	add    eax,0xa8dc
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:214
    return fs->disk_io.write_media(lba, target, count);
     651:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     654:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
     657:	83 ec 04             	sub    esp,0x4
     65a:	ff 75 14             	push   DWORD PTR [ebp+0x14]
     65d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
     660:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
     663:	ff d0                	call   eax
     665:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:215
}
     668:	c9                   	leave  
     669:	c3                   	ret    

0000066a <fatfs_sector_reader>:
fatfs_sector_reader():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:221
//-----------------------------------------------------------------------------
// fatfs_sector_reader: From the provided startcluster and sector offset
// Returns True if success, returns False if not (including if read out of range)
//-----------------------------------------------------------------------------
int fatfs_sector_reader(struct fatfs *fs, uint32 start_cluster, uint32 offset, uint8 *target)
{
     66a:	55                   	push   ebp
     66b:	89 e5                	mov    ebp,esp
     66d:	53                   	push   ebx
     66e:	83 ec 24             	sub    esp,0x24
     671:	e8 84 68 00 00       	call   6efa <__x86.get_pc_thunk.bx>
     676:	81 c3 b2 a8 00 00    	add    ebx,0xa8b2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:222
    uint32 sector_to_read = 0;
     67c:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:223
    uint32 cluster_to_read = 0;
     683:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:224
    uint32 cluster_chain = 0;
     68a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:229
    uint32 i;
    uint32 lba;

    // FAT16 Root directory
    if (fs->fat_type == FAT_TYPE_16 && start_cluster == 0)
     691:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     694:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
     697:	85 c0                	test   eax,eax
     699:	75 36                	jne    6d1 <fatfs_sector_reader+0x67>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:229 (discriminator 1)
     69b:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
     69f:	75 30                	jne    6d1 <fatfs_sector_reader+0x67>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:231
    {
        if (offset < fs->rootdir_sectors)
     6a1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     6a4:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
     6a7:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
     6aa:	76 1b                	jbe    6c7 <fatfs_sector_reader+0x5d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:232
            lba = fs->lba_begin + fs->rootdir_first_sector + offset;
     6ac:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     6af:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
     6b2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     6b5:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
     6b8:	01 c2                	add    edx,eax
     6ba:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
     6bd:	01 d0                	add    eax,edx
     6bf:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:231
    uint32 lba;

    // FAT16 Root directory
    if (fs->fat_type == FAT_TYPE_16 && start_cluster == 0)
    {
        if (offset < fs->rootdir_sectors)
     6c2:	e9 8e 00 00 00       	jmp    755 <fatfs_sector_reader+0xeb>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:234
            lba = fs->lba_begin + fs->rootdir_first_sector + offset;
        else
            return 0;
     6c7:	b8 00 00 00 00       	mov    eax,0x0
     6cc:	e9 e4 00 00 00       	jmp    7b5 <fatfs_sector_reader+0x14b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:240
    }
    // FAT16/32 Other
    else
    {
        // Set start of cluster chain to initial value
        cluster_chain = start_cluster;
     6d1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
     6d4:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:243

        // Find parameters
        cluster_to_read = offset / fs->sectors_per_cluster;
     6d7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     6da:	0f b6 00             	movzx  eax,BYTE PTR [eax]
     6dd:	0f b6 c8             	movzx  ecx,al
     6e0:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
     6e3:	ba 00 00 00 00       	mov    edx,0x0
     6e8:	f7 f1                	div    ecx
     6ea:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:244
        sector_to_read = offset - (cluster_to_read*fs->sectors_per_cluster);
     6ed:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     6f0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
     6f3:	0f b6 c0             	movzx  eax,al
     6f6:	0f af 45 e4          	imul   eax,DWORD PTR [ebp-0x1c]
     6fa:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
     6fd:	29 c2                	sub    edx,eax
     6ff:	89 d0                	mov    eax,edx
     701:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:247

        // Follow chain to find cluster to read
        for (i=0; i<cluster_to_read; i++)
     704:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
     70b:	eb 18                	jmp    725 <fatfs_sector_reader+0xbb>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:248 (discriminator 3)
            cluster_chain = fatfs_find_next_cluster(fs, cluster_chain);
     70d:	83 ec 08             	sub    esp,0x8
     710:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
     713:	ff 75 08             	push   DWORD PTR [ebp+0x8]
     716:	e8 a5 6b 00 00       	call   72c0 <__x86.get_pc_thunk.bx+0x3c6>
     71b:	83 c4 10             	add    esp,0x10
     71e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:247 (discriminator 3)
        // Find parameters
        cluster_to_read = offset / fs->sectors_per_cluster;
        sector_to_read = offset - (cluster_to_read*fs->sectors_per_cluster);

        // Follow chain to find cluster to read
        for (i=0; i<cluster_to_read; i++)
     721:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:247 (discriminator 1)
     725:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
     728:	3b 45 e4             	cmp    eax,DWORD PTR [ebp-0x1c]
     72b:	72 e0                	jb     70d <fatfs_sector_reader+0xa3>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:251
            cluster_chain = fatfs_find_next_cluster(fs, cluster_chain);

        // If end of cluster chain then return false
        if (cluster_chain == FAT32_LAST_CLUSTER)
     72d:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
     731:	75 07                	jne    73a <fatfs_sector_reader+0xd0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:252
            return 0;
     733:	b8 00 00 00 00       	mov    eax,0x0
     738:	eb 7b                	jmp    7b5 <fatfs_sector_reader+0x14b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:255

        // Calculate sector address
        lba = fatfs_lba_of_cluster(fs, cluster_chain)+sector_to_read;
     73a:	83 ec 08             	sub    esp,0x8
     73d:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
     740:	ff 75 08             	push   DWORD PTR [ebp+0x8]
     743:	e8 e8 6b 00 00       	call   7330 <__x86.get_pc_thunk.bx+0x436>
     748:	83 c4 10             	add    esp,0x10
     74b:	89 c2                	mov    edx,eax
     74d:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
     750:	01 d0                	add    eax,edx
     752:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:259
    }

    // User provided target array
    if (target)
     755:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
     759:	74 18                	je     773 <fatfs_sector_reader+0x109>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:260
        return fs->disk_io.read_media(lba, target, 1);
     75b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     75e:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
     761:	83 ec 04             	sub    esp,0x4
     764:	6a 01                	push   0x1
     766:	ff 75 14             	push   DWORD PTR [ebp+0x14]
     769:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
     76c:	ff d0                	call   eax
     76e:	83 c4 10             	add    esp,0x10
     771:	eb 42                	jmp    7b5 <fatfs_sector_reader+0x14b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:262
    // Else read sector if not already loaded
    else if (lba != fs->currentsector.address)
     773:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     776:	8b 80 44 02 00 00    	mov    eax,DWORD PTR [eax+0x244]
     77c:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
     77f:	74 2f                	je     7b0 <fatfs_sector_reader+0x146>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:264
    {
        fs->currentsector.address = lba;
     781:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     784:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
     787:	89 90 44 02 00 00    	mov    DWORD PTR [eax+0x244],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:265
        return fs->disk_io.read_media(fs->currentsector.address, fs->currentsector.sector, 1);
     78d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     790:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
     793:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     796:	8d 4a 44             	lea    ecx,[edx+0x44]
     799:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     79c:	8b 92 44 02 00 00    	mov    edx,DWORD PTR [edx+0x244]
     7a2:	83 ec 04             	sub    esp,0x4
     7a5:	6a 01                	push   0x1
     7a7:	51                   	push   ecx
     7a8:	52                   	push   edx
     7a9:	ff d0                	call   eax
     7ab:	83 c4 10             	add    esp,0x10
     7ae:	eb 05                	jmp    7b5 <fatfs_sector_reader+0x14b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:268
    }
    else
        return 1;
     7b0:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:269
}
     7b5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
     7b8:	c9                   	leave  
     7b9:	c3                   	ret    

000007ba <fatfs_read_sector>:
fatfs_read_sector():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:275
//-----------------------------------------------------------------------------
// fatfs_read_sector: Read from the provided cluster and sector offset
// Returns True if success, returns False if not
//-----------------------------------------------------------------------------
int fatfs_read_sector(struct fatfs *fs, uint32 cluster, uint32 sector, uint8 *target)
{
     7ba:	55                   	push   ebp
     7bb:	89 e5                	mov    ebp,esp
     7bd:	53                   	push   ebx
     7be:	83 ec 14             	sub    esp,0x14
     7c1:	e8 30 67 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
     7c6:	05 62 a7 00 00       	add    eax,0xa762
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:277
    // FAT16 Root directory
    if (fs->fat_type == FAT_TYPE_16 && cluster == 0)
     7cb:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     7ce:	8b 52 30             	mov    edx,DWORD PTR [edx+0x30]
     7d1:	85 d2                	test   edx,edx
     7d3:	0f 85 83 00 00 00    	jne    85c <fatfs_read_sector+0xa2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:277 (discriminator 1)
     7d9:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
     7dd:	75 7d                	jne    85c <fatfs_read_sector+0xa2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:282
    {
        uint32 lba;

        // In FAT16, there are a limited amount of sectors in root dir!
        if (sector < fs->rootdir_sectors)
     7df:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     7e2:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
     7e5:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
     7e8:	76 1e                	jbe    808 <fatfs_read_sector+0x4e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:283
            lba = fs->lba_begin + fs->rootdir_first_sector + sector;
     7ea:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     7ed:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
     7f0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     7f3:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
     7f6:	01 c2                	add    edx,eax
     7f8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
     7fb:	01 d0                	add    eax,edx
     7fd:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:288
        else
            return 0;

        // User target buffer passed in
        if (target)
     800:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
     804:	74 27                	je     82d <fatfs_read_sector+0x73>
     806:	eb 0a                	jmp    812 <fatfs_read_sector+0x58>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:285

        // In FAT16, there are a limited amount of sectors in root dir!
        if (sector < fs->rootdir_sectors)
            lba = fs->lba_begin + fs->rootdir_first_sector + sector;
        else
            return 0;
     808:	b8 00 00 00 00       	mov    eax,0x0
     80d:	e9 c9 00 00 00       	jmp    8db <fatfs_read_sector+0x121>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:291

        // User target buffer passed in
        if (target)
        {
            // Read from disk
            return fs->disk_io.read_media(lba, target, 1);
     812:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     815:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
     818:	83 ec 04             	sub    esp,0x4
     81b:	6a 01                	push   0x1
     81d:	ff 75 14             	push   DWORD PTR [ebp+0x14]
     820:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
     823:	ff d0                	call   eax
     825:	83 c4 10             	add    esp,0x10
     828:	e9 ae 00 00 00       	jmp    8db <fatfs_read_sector+0x121>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:296
        }
        else
        {
            // Calculate read address
            fs->currentsector.address = lba;
     82d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     830:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
     833:	89 90 44 02 00 00    	mov    DWORD PTR [eax+0x244],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:299

            // Read from disk
            return fs->disk_io.read_media(fs->currentsector.address, fs->currentsector.sector, 1);
     839:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     83c:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
     83f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     842:	8d 4a 44             	lea    ecx,[edx+0x44]
     845:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     848:	8b 92 44 02 00 00    	mov    edx,DWORD PTR [edx+0x244]
     84e:	83 ec 04             	sub    esp,0x4
     851:	6a 01                	push   0x1
     853:	51                   	push   ecx
     854:	52                   	push   edx
     855:	ff d0                	call   eax
     857:	83 c4 10             	add    esp,0x10
     85a:	eb 7f                	jmp    8db <fatfs_read_sector+0x121>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:306
    }
    // FAT16/32 Other
    else
    {
        // User target buffer passed in
        if (target)
     85c:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
     860:	74 35                	je     897 <fatfs_read_sector+0xdd>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:309
        {
            // Calculate read address
            uint32 lba = fatfs_lba_of_cluster(fs, cluster) + sector;
     862:	83 ec 08             	sub    esp,0x8
     865:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
     868:	ff 75 08             	push   DWORD PTR [ebp+0x8]
     86b:	89 c3                	mov    ebx,eax
     86d:	e8 be 6a 00 00       	call   7330 <__x86.get_pc_thunk.bx+0x436>
     872:	83 c4 10             	add    esp,0x10
     875:	89 c2                	mov    edx,eax
     877:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
     87a:	01 d0                	add    eax,edx
     87c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:312

            // Read from disk
            return fs->disk_io.read_media(lba, target, 1);
     87f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     882:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
     885:	83 ec 04             	sub    esp,0x4
     888:	6a 01                	push   0x1
     88a:	ff 75 14             	push   DWORD PTR [ebp+0x14]
     88d:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
     890:	ff d0                	call   eax
     892:	83 c4 10             	add    esp,0x10
     895:	eb 44                	jmp    8db <fatfs_read_sector+0x121>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:317
        }
        else
        {
            // Calculate write address
            fs->currentsector.address = fatfs_lba_of_cluster(fs, cluster)+sector;
     897:	83 ec 08             	sub    esp,0x8
     89a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
     89d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
     8a0:	89 c3                	mov    ebx,eax
     8a2:	e8 89 6a 00 00       	call   7330 <__x86.get_pc_thunk.bx+0x436>
     8a7:	83 c4 10             	add    esp,0x10
     8aa:	89 c2                	mov    edx,eax
     8ac:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
     8af:	01 c2                	add    edx,eax
     8b1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     8b4:	89 90 44 02 00 00    	mov    DWORD PTR [eax+0x244],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:320

            // Read from disk
            return fs->disk_io.read_media(fs->currentsector.address, fs->currentsector.sector, 1);
     8ba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     8bd:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
     8c0:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     8c3:	8d 4a 44             	lea    ecx,[edx+0x44]
     8c6:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     8c9:	8b 92 44 02 00 00    	mov    edx,DWORD PTR [edx+0x244]
     8cf:	83 ec 04             	sub    esp,0x4
     8d2:	6a 01                	push   0x1
     8d4:	51                   	push   ecx
     8d5:	52                   	push   edx
     8d6:	ff d0                	call   eax
     8d8:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:323
        }
    }
}
     8db:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
     8de:	c9                   	leave  
     8df:	c3                   	ret    

000008e0 <fatfs_write_sector>:
fatfs_write_sector():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:330
// fatfs_write_sector: Write to the provided cluster and sector offset
// Returns True if success, returns False if not
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fatfs_write_sector(struct fatfs *fs, uint32 cluster, uint32 sector, uint8 *target)
{
     8e0:	55                   	push   ebp
     8e1:	89 e5                	mov    ebp,esp
     8e3:	53                   	push   ebx
     8e4:	83 ec 14             	sub    esp,0x14
     8e7:	e8 0a 66 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
     8ec:	05 3c a6 00 00       	add    eax,0xa63c
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:332
    // No write access?
    if (!fs->disk_io.write_media)
     8f1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     8f4:	8b 52 38             	mov    edx,DWORD PTR [edx+0x38]
     8f7:	85 d2                	test   edx,edx
     8f9:	75 0a                	jne    905 <fatfs_write_sector+0x25>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:333
        return 0;
     8fb:	b8 00 00 00 00       	mov    eax,0x0
     900:	e9 10 01 00 00       	jmp    a15 <fatfs_write_sector+0x135>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:336

    // FAT16 Root directory
    if (fs->fat_type == FAT_TYPE_16 && cluster == 0)
     905:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     908:	8b 52 30             	mov    edx,DWORD PTR [edx+0x30]
     90b:	85 d2                	test   edx,edx
     90d:	0f 85 83 00 00 00    	jne    996 <fatfs_write_sector+0xb6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:336 (discriminator 1)
     913:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
     917:	75 7d                	jne    996 <fatfs_write_sector+0xb6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:341
    {
        uint32 lba;

        // In FAT16 we cannot extend the root dir!
        if (sector < fs->rootdir_sectors)
     919:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     91c:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
     91f:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
     922:	76 1e                	jbe    942 <fatfs_write_sector+0x62>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:342
            lba = fs->lba_begin + fs->rootdir_first_sector + sector;
     924:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     927:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
     92a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     92d:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
     930:	01 c2                	add    edx,eax
     932:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
     935:	01 d0                	add    eax,edx
     937:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:347
        else
            return 0;

        // User target buffer passed in
        if (target)
     93a:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
     93e:	74 27                	je     967 <fatfs_write_sector+0x87>
     940:	eb 0a                	jmp    94c <fatfs_write_sector+0x6c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:344

        // In FAT16 we cannot extend the root dir!
        if (sector < fs->rootdir_sectors)
            lba = fs->lba_begin + fs->rootdir_first_sector + sector;
        else
            return 0;
     942:	b8 00 00 00 00       	mov    eax,0x0
     947:	e9 c9 00 00 00       	jmp    a15 <fatfs_write_sector+0x135>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:350

        // User target buffer passed in
        if (target)
        {
            // Write to disk
            return fs->disk_io.write_media(lba, target, 1);
     94c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     94f:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
     952:	83 ec 04             	sub    esp,0x4
     955:	6a 01                	push   0x1
     957:	ff 75 14             	push   DWORD PTR [ebp+0x14]
     95a:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
     95d:	ff d0                	call   eax
     95f:	83 c4 10             	add    esp,0x10
     962:	e9 ae 00 00 00       	jmp    a15 <fatfs_write_sector+0x135>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:355
        }
        else
        {
            // Calculate write address
            fs->currentsector.address = lba;
     967:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     96a:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
     96d:	89 90 44 02 00 00    	mov    DWORD PTR [eax+0x244],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:358

            // Write to disk
            return fs->disk_io.write_media(fs->currentsector.address, fs->currentsector.sector, 1);
     973:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     976:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
     979:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     97c:	8d 4a 44             	lea    ecx,[edx+0x44]
     97f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     982:	8b 92 44 02 00 00    	mov    edx,DWORD PTR [edx+0x244]
     988:	83 ec 04             	sub    esp,0x4
     98b:	6a 01                	push   0x1
     98d:	51                   	push   ecx
     98e:	52                   	push   edx
     98f:	ff d0                	call   eax
     991:	83 c4 10             	add    esp,0x10
     994:	eb 7f                	jmp    a15 <fatfs_write_sector+0x135>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:365
    }
    // FAT16/32 Other
    else
    {
        // User target buffer passed in
        if (target)
     996:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
     99a:	74 35                	je     9d1 <fatfs_write_sector+0xf1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:368
        {
            // Calculate write address
            uint32 lba = fatfs_lba_of_cluster(fs, cluster) + sector;
     99c:	83 ec 08             	sub    esp,0x8
     99f:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
     9a2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
     9a5:	89 c3                	mov    ebx,eax
     9a7:	e8 84 69 00 00       	call   7330 <__x86.get_pc_thunk.bx+0x436>
     9ac:	83 c4 10             	add    esp,0x10
     9af:	89 c2                	mov    edx,eax
     9b1:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
     9b4:	01 d0                	add    eax,edx
     9b6:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:371

            // Write to disk
            return fs->disk_io.write_media(lba, target, 1);
     9b9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     9bc:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
     9bf:	83 ec 04             	sub    esp,0x4
     9c2:	6a 01                	push   0x1
     9c4:	ff 75 14             	push   DWORD PTR [ebp+0x14]
     9c7:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
     9ca:	ff d0                	call   eax
     9cc:	83 c4 10             	add    esp,0x10
     9cf:	eb 44                	jmp    a15 <fatfs_write_sector+0x135>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:376
        }
        else
        {
            // Calculate write address
            fs->currentsector.address = fatfs_lba_of_cluster(fs, cluster)+sector;
     9d1:	83 ec 08             	sub    esp,0x8
     9d4:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
     9d7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
     9da:	89 c3                	mov    ebx,eax
     9dc:	e8 4f 69 00 00       	call   7330 <__x86.get_pc_thunk.bx+0x436>
     9e1:	83 c4 10             	add    esp,0x10
     9e4:	89 c2                	mov    edx,eax
     9e6:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
     9e9:	01 c2                	add    edx,eax
     9eb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     9ee:	89 90 44 02 00 00    	mov    DWORD PTR [eax+0x244],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:379

            // Write to disk
            return fs->disk_io.write_media(fs->currentsector.address, fs->currentsector.sector, 1);
     9f4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     9f7:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
     9fa:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     9fd:	8d 4a 44             	lea    ecx,[edx+0x44]
     a00:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
     a03:	8b 92 44 02 00 00    	mov    edx,DWORD PTR [edx+0x244]
     a09:	83 ec 04             	sub    esp,0x4
     a0c:	6a 01                	push   0x1
     a0e:	51                   	push   ecx
     a0f:	52                   	push   edx
     a10:	ff d0                	call   eax
     a12:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:382
        }
    }
}
     a15:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
     a18:	c9                   	leave  
     a19:	c3                   	ret    

00000a1a <fatfs_show_details>:
fatfs_show_details():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:388
#endif
//-----------------------------------------------------------------------------
// fatfs_show_details: Show the details about the filesystem
//-----------------------------------------------------------------------------
void fatfs_show_details(struct fatfs *fs)
{
     a1a:	55                   	push   ebp
     a1b:	89 e5                	mov    ebp,esp
     a1d:	53                   	push   ebx
     a1e:	83 ec 04             	sub    esp,0x4
     a21:	e8 d4 64 00 00       	call   6efa <__x86.get_pc_thunk.bx>
     a26:	81 c3 02 a5 00 00    	add    ebx,0xa502
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:389
    FAT_PRINTF(("FAT details:\r\n"));
     a2c:	83 ec 0c             	sub    esp,0xc
     a2f:	8d 83 b8 c4 ff ff    	lea    eax,[ebx-0x3b48]
     a35:	50                   	push   eax
     a36:	e8 95 67 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
     a3b:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:390
    FAT_PRINTF((" Type =%s", (fs->fat_type == FAT_TYPE_32) ? "FAT32": "FAT16"));
     a3e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     a41:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
     a44:	83 f8 01             	cmp    eax,0x1
     a47:	75 08                	jne    a51 <fatfs_show_details+0x37>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:390 (discriminator 1)
     a49:	8d 83 c7 c4 ff ff    	lea    eax,[ebx-0x3b39]
     a4f:	eb 06                	jmp    a57 <fatfs_show_details+0x3d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:390 (discriminator 2)
     a51:	8d 83 cd c4 ff ff    	lea    eax,[ebx-0x3b33]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:390 (discriminator 4)
     a57:	83 ec 08             	sub    esp,0x8
     a5a:	50                   	push   eax
     a5b:	8d 83 d3 c4 ff ff    	lea    eax,[ebx-0x3b2d]
     a61:	50                   	push   eax
     a62:	e8 69 67 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
     a67:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:391 (discriminator 4)
    FAT_PRINTF((" Root Dir First Cluster = %x\r\n", fs->rootdir_first_cluster));
     a6a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     a6d:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
     a70:	83 ec 08             	sub    esp,0x8
     a73:	50                   	push   eax
     a74:	8d 83 e0 c4 ff ff    	lea    eax,[ebx-0x3b20]
     a7a:	50                   	push   eax
     a7b:	e8 50 67 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
     a80:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:392 (discriminator 4)
    FAT_PRINTF((" FAT Begin LBA = 0x%x\r\n",fs->fat_begin_lba));
     a83:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     a86:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
     a89:	83 ec 08             	sub    esp,0x8
     a8c:	50                   	push   eax
     a8d:	8d 83 ff c4 ff ff    	lea    eax,[ebx-0x3b01]
     a93:	50                   	push   eax
     a94:	e8 37 67 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
     a99:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:393 (discriminator 4)
    FAT_PRINTF((" Cluster Begin LBA = 0x%x\r\n",fs->cluster_begin_lba));
     a9c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     a9f:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
     aa2:	83 ec 08             	sub    esp,0x8
     aa5:	50                   	push   eax
     aa6:	8d 83 17 c5 ff ff    	lea    eax,[ebx-0x3ae9]
     aac:	50                   	push   eax
     aad:	e8 1e 67 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
     ab2:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:394 (discriminator 4)
    FAT_PRINTF((" Sectors Per Cluster = %d\r\n", fs->sectors_per_cluster));
     ab5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     ab8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
     abb:	0f b6 c0             	movzx  eax,al
     abe:	83 ec 08             	sub    esp,0x8
     ac1:	50                   	push   eax
     ac2:	8d 83 33 c5 ff ff    	lea    eax,[ebx-0x3acd]
     ac8:	50                   	push   eax
     ac9:	e8 02 67 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
     ace:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:395 (discriminator 4)
}
     ad1:	90                   	nop
     ad2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
     ad5:	c9                   	leave  
     ad6:	c3                   	ret    

00000ad7 <fatfs_get_root_cluster>:
fatfs_get_root_cluster():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:400
//-----------------------------------------------------------------------------
// fatfs_get_root_cluster: Get the root dir cluster
//-----------------------------------------------------------------------------
uint32 fatfs_get_root_cluster(struct fatfs *fs)
{
     ad7:	55                   	push   ebp
     ad8:	89 e5                	mov    ebp,esp
     ada:	e8 17 64 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
     adf:	05 49 a4 00 00       	add    eax,0xa449
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:402
    // NOTE: On FAT16 this will be 0 which has a special meaning...
    return fs->rootdir_first_cluster;
     ae4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     ae7:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:403
}
     aea:	5d                   	pop    ebp
     aeb:	c3                   	ret    

00000aec <fatfs_get_file_entry>:
fatfs_get_file_entry():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:408
//-------------------------------------------------------------
// fatfs_get_file_entry: Find the file entry for a filename
//-------------------------------------------------------------
uint32 fatfs_get_file_entry(struct fatfs *fs, uint32 Cluster, char *name_to_find, struct fat_dir_entry *sfEntry)
{
     aec:	55                   	push   ebp
     aed:	89 e5                	mov    ebp,esp
     aef:	53                   	push   ebx
     af0:	81 ec 34 01 00 00    	sub    esp,0x134
     af6:	e8 ff 63 00 00       	call   6efa <__x86.get_pc_thunk.bx>
     afb:	81 c3 2d a4 00 00    	add    ebx,0xa42d
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:409
    uint8 item=0;
     b01:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:410
    uint16 recordoffset = 0;
     b05:	66 c7 45 ea 00 00    	mov    WORD PTR [ebp-0x16],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:411
    uint8 i=0;
     b0b:	c6 45 f6 00          	mov    BYTE PTR [ebp-0xa],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:412
    int x=0;
     b0f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:413
    char *long_filename = NULL;
     b16:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:416
    char short_filename[13];
    struct lfn_cache lfn;
    int dotRequired = 0;
     b1d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:419
    struct fat_dir_entry *directoryEntry;

    fatfs_lfn_cache_init(&lfn, 1);
     b24:	83 ec 08             	sub    esp,0x8
     b27:	6a 01                	push   0x1
     b29:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
     b2f:	50                   	push   eax
     b30:	e8 ab 67 00 00       	call   72e0 <__x86.get_pc_thunk.bx+0x3e6>
     b35:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:425

    // Main cluster following loop
    while (1)
    {
        // Read sector
        if (fatfs_sector_reader(fs, Cluster, x++, 0)) // If sector read was successfull
     b38:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
     b3b:	8d 50 01             	lea    edx,[eax+0x1]
     b3e:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
     b41:	6a 00                	push   0x0
     b43:	50                   	push   eax
     b44:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
     b47:	ff 75 08             	push   DWORD PTR [ebp+0x8]
     b4a:	e8 41 67 00 00       	call   7290 <__x86.get_pc_thunk.bx+0x396>
     b4f:	83 c4 10             	add    esp,0x10
     b52:	85 c0                	test   eax,eax
     b54:	0f 84 13 02 00 00    	je     d6d <fatfs_get_file_entry+0x281>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:428
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
     b5a:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
     b5e:	e9 fb 01 00 00       	jmp    d5e <fatfs_get_file_entry+0x272>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:431
            {
                // Create the multiplier for sector access
                recordoffset = FAT_DIR_ENTRY_SIZE * item;
     b63:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
     b67:	c1 e0 05             	shl    eax,0x5
     b6a:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:434

                // Overlay directory entry over buffer
                directoryEntry = (struct fat_dir_entry*)(fs->currentsector.sector+recordoffset);
     b6e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     b71:	8d 50 44             	lea    edx,[eax+0x44]
     b74:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
     b78:	01 d0                	add    eax,edx
     b7a:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:438

#if FATFS_INC_LFN_SUPPORT
                // Long File Name Text Found
                if (fatfs_entry_lfn_text(directoryEntry) )
     b7d:	83 ec 0c             	sub    esp,0xc
     b80:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
     b83:	e8 28 67 00 00       	call   72b0 <__x86.get_pc_thunk.bx+0x3b6>
     b88:	83 c4 10             	add    esp,0x10
     b8b:	85 c0                	test   eax,eax
     b8d:	74 24                	je     bb3 <fatfs_get_file_entry+0xc7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:439
                    fatfs_lfn_cache_entry(&lfn, fs->currentsector.sector+recordoffset);
     b8f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     b92:	8d 50 44             	lea    edx,[eax+0x44]
     b95:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
     b99:	01 d0                	add    eax,edx
     b9b:	83 ec 08             	sub    esp,0x8
     b9e:	50                   	push   eax
     b9f:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
     ba5:	50                   	push   eax
     ba6:	e8 25 65 00 00       	call   70d0 <__x86.get_pc_thunk.bx+0x1d6>
     bab:	83 c4 10             	add    esp,0x10
     bae:	e9 a1 01 00 00       	jmp    d54 <fatfs_get_file_entry+0x268>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:442

                // If Invalid record found delete any long file name information collated
                else if (fatfs_entry_lfn_invalid(directoryEntry) )
     bb3:	83 ec 0c             	sub    esp,0xc
     bb6:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
     bb9:	e8 02 66 00 00       	call   71c0 <__x86.get_pc_thunk.bx+0x2c6>
     bbe:	83 c4 10             	add    esp,0x10
     bc1:	85 c0                	test   eax,eax
     bc3:	74 19                	je     bde <fatfs_get_file_entry+0xf2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:443
                    fatfs_lfn_cache_init(&lfn, 0);
     bc5:	83 ec 08             	sub    esp,0x8
     bc8:	6a 00                	push   0x0
     bca:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
     bd0:	50                   	push   eax
     bd1:	e8 0a 67 00 00       	call   72e0 <__x86.get_pc_thunk.bx+0x3e6>
     bd6:	83 c4 10             	add    esp,0x10
     bd9:	e9 76 01 00 00       	jmp    d54 <fatfs_get_file_entry+0x268>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:446

                // Normal SFN Entry and Long text exists
                else if (fatfs_entry_lfn_exists(&lfn, directoryEntry) )
     bde:	83 ec 08             	sub    esp,0x8
     be1:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
     be4:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
     bea:	50                   	push   eax
     beb:	e8 30 66 00 00       	call   7220 <__x86.get_pc_thunk.bx+0x326>
     bf0:	83 c4 10             	add    esp,0x10
     bf3:	85 c0                	test   eax,eax
     bf5:	74 60                	je     c57 <fatfs_get_file_entry+0x16b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:448
                {
                    long_filename = fatfs_lfn_cache_get(&lfn);
     bf7:	83 ec 0c             	sub    esp,0xc
     bfa:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
     c00:	50                   	push   eax
     c01:	e8 7a 65 00 00       	call   7180 <__x86.get_pc_thunk.bx+0x286>
     c06:	83 c4 10             	add    esp,0x10
     c09:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:451

                    // Compare names to see if they match
                    if (fatfs_compare_names(long_filename, name_to_find))
     c0c:	83 ec 08             	sub    esp,0x8
     c0f:	ff 75 10             	push   DWORD PTR [ebp+0x10]
     c12:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
     c15:	e8 e6 63 00 00       	call   7000 <__x86.get_pc_thunk.bx+0x106>
     c1a:	83 c4 10             	add    esp,0x10
     c1d:	85 c0                	test   eax,eax
     c1f:	74 1d                	je     c3e <fatfs_get_file_entry+0x152>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:453
                    {
                        memcpy(sfEntry,directoryEntry,sizeof(struct fat_dir_entry));
     c21:	83 ec 04             	sub    esp,0x4
     c24:	6a 20                	push   0x20
     c26:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
     c29:	ff 75 14             	push   DWORD PTR [ebp+0x14]
     c2c:	e8 8f 63 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
     c31:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:454
                        return 1;
     c34:	b8 01 00 00 00       	mov    eax,0x1
     c39:	e9 35 01 00 00       	jmp    d73 <fatfs_get_file_entry+0x287>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:457
                    }

                    fatfs_lfn_cache_init(&lfn, 0);
     c3e:	83 ec 08             	sub    esp,0x8
     c41:	6a 00                	push   0x0
     c43:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
     c49:	50                   	push   eax
     c4a:	e8 91 66 00 00       	call   72e0 <__x86.get_pc_thunk.bx+0x3e6>
     c4f:	83 c4 10             	add    esp,0x10
     c52:	e9 fd 00 00 00       	jmp    d54 <fatfs_get_file_entry+0x268>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:462
                }
                else
#endif
                // Normal Entry, only 8.3 Text
                if (fatfs_entry_sfn_only(directoryEntry) )
     c57:	83 ec 0c             	sub    esp,0xc
     c5a:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
     c5d:	e8 de 66 00 00       	call   7340 <__x86.get_pc_thunk.bx+0x446>
     c62:	83 c4 10             	add    esp,0x10
     c65:	85 c0                	test   eax,eax
     c67:	0f 84 e7 00 00 00    	je     d54 <fatfs_get_file_entry+0x268>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:464
                {
                    memset(short_filename, 0, sizeof(short_filename));
     c6d:	83 ec 04             	sub    esp,0x4
     c70:	6a 0d                	push   0xd
     c72:	6a 00                	push   0x0
     c74:	8d 45 d3             	lea    eax,[ebp-0x2d]
     c77:	50                   	push   eax
     c78:	e8 c3 65 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
     c7d:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:467

                    // Copy name to string
                    for (i=0; i<8; i++)
     c80:	c6 45 f6 00          	mov    BYTE PTR [ebp-0xa],0x0
     c84:	eb 1d                	jmp    ca3 <fatfs_get_file_entry+0x1b7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:468 (discriminator 3)
                        short_filename[i] = directoryEntry->Name[i];
     c86:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
     c8a:	0f b6 55 f6          	movzx  edx,BYTE PTR [ebp-0xa]
     c8e:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
     c91:	0f b6 14 11          	movzx  edx,BYTE PTR [ecx+edx*1]
     c95:	88 54 05 d3          	mov    BYTE PTR [ebp+eax*1-0x2d],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:467 (discriminator 3)
                if (fatfs_entry_sfn_only(directoryEntry) )
                {
                    memset(short_filename, 0, sizeof(short_filename));

                    // Copy name to string
                    for (i=0; i<8; i++)
     c99:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
     c9d:	83 c0 01             	add    eax,0x1
     ca0:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:467 (discriminator 1)
     ca3:	80 7d f6 07          	cmp    BYTE PTR [ebp-0xa],0x7
     ca7:	76 dd                	jbe    c86 <fatfs_get_file_entry+0x19a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:471
                        short_filename[i] = directoryEntry->Name[i];

                    // Extension
                    dotRequired = 0;
     ca9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:472
                    for (i=8; i<11; i++)
     cb0:	c6 45 f6 08          	mov    BYTE PTR [ebp-0xa],0x8
     cb4:	eb 36                	jmp    cec <fatfs_get_file_entry+0x200>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:474
                    {
                        short_filename[i+1] = directoryEntry->Name[i];
     cb6:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
     cba:	8d 48 01             	lea    ecx,[eax+0x1]
     cbd:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
     cc1:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
     cc4:	0f b6 04 02          	movzx  eax,BYTE PTR [edx+eax*1]
     cc8:	88 44 0d d3          	mov    BYTE PTR [ebp+ecx*1-0x2d],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:475
                        if (directoryEntry->Name[i] != ' ')
     ccc:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
     cd0:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
     cd3:	0f b6 04 02          	movzx  eax,BYTE PTR [edx+eax*1]
     cd7:	3c 20                	cmp    al,0x20
     cd9:	74 07                	je     ce2 <fatfs_get_file_entry+0x1f6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:476
                            dotRequired = 1;
     cdb:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:472 (discriminator 2)
                    for (i=0; i<8; i++)
                        short_filename[i] = directoryEntry->Name[i];

                    // Extension
                    dotRequired = 0;
                    for (i=8; i<11; i++)
     ce2:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
     ce6:	83 c0 01             	add    eax,0x1
     ce9:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:472 (discriminator 1)
     cec:	80 7d f6 0a          	cmp    BYTE PTR [ebp-0xa],0xa
     cf0:	76 c4                	jbe    cb6 <fatfs_get_file_entry+0x1ca>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:480
                        if (directoryEntry->Name[i] != ' ')
                            dotRequired = 1;
                    }

                    // Dot only required if extension present
                    if (dotRequired)
     cf2:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
     cf6:	74 14                	je     d0c <fatfs_get_file_entry+0x220>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:483
                    {
                        // If not . or .. entry
                        if (short_filename[0]!='.')
     cf8:	0f b6 45 d3          	movzx  eax,BYTE PTR [ebp-0x2d]
     cfc:	3c 2e                	cmp    al,0x2e
     cfe:	74 06                	je     d06 <fatfs_get_file_entry+0x21a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:484
                            short_filename[8] = '.';
     d00:	c6 45 db 2e          	mov    BYTE PTR [ebp-0x25],0x2e
     d04:	eb 0a                	jmp    d10 <fatfs_get_file_entry+0x224>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:486
                        else
                            short_filename[8] = ' ';
     d06:	c6 45 db 20          	mov    BYTE PTR [ebp-0x25],0x20
     d0a:	eb 04                	jmp    d10 <fatfs_get_file_entry+0x224>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:489
                    }
                    else
                        short_filename[8] = ' ';
     d0c:	c6 45 db 20          	mov    BYTE PTR [ebp-0x25],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:492

                    // Compare names to see if they match
                    if (fatfs_compare_names(short_filename, name_to_find))
     d10:	83 ec 08             	sub    esp,0x8
     d13:	ff 75 10             	push   DWORD PTR [ebp+0x10]
     d16:	8d 45 d3             	lea    eax,[ebp-0x2d]
     d19:	50                   	push   eax
     d1a:	e8 e1 62 00 00       	call   7000 <__x86.get_pc_thunk.bx+0x106>
     d1f:	83 c4 10             	add    esp,0x10
     d22:	85 c0                	test   eax,eax
     d24:	74 1a                	je     d40 <fatfs_get_file_entry+0x254>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:494
                    {
                        memcpy(sfEntry,directoryEntry,sizeof(struct fat_dir_entry));
     d26:	83 ec 04             	sub    esp,0x4
     d29:	6a 20                	push   0x20
     d2b:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
     d2e:	ff 75 14             	push   DWORD PTR [ebp+0x14]
     d31:	e8 8a 62 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
     d36:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:495
                        return 1;
     d39:	b8 01 00 00 00       	mov    eax,0x1
     d3e:	eb 33                	jmp    d73 <fatfs_get_file_entry+0x287>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:498
                    }

                    fatfs_lfn_cache_init(&lfn, 0);
     d40:	83 ec 08             	sub    esp,0x8
     d43:	6a 00                	push   0x0
     d45:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
     d4b:	50                   	push   eax
     d4c:	e8 8f 65 00 00       	call   72e0 <__x86.get_pc_thunk.bx+0x3e6>
     d51:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:428 (discriminator 2)
    {
        // Read sector
        if (fatfs_sector_reader(fs, Cluster, x++, 0)) // If sector read was successfull
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
     d54:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
     d58:	83 c0 01             	add    eax,0x1
     d5b:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:428 (discriminator 1)
     d5e:	80 7d f7 0f          	cmp    BYTE PTR [ebp-0x9],0xf
     d62:	0f 86 fb fd ff ff    	jbe    b63 <fatfs_get_file_entry+0x77>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:504 (discriminator 1)
                }
            } // End of if
        }
        else
            break;
    } // End of while loop
     d68:	e9 cb fd ff ff       	jmp    b38 <fatfs_get_file_entry+0x4c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:503
                    fatfs_lfn_cache_init(&lfn, 0);
                }
            } // End of if
        }
        else
            break;
     d6d:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:506
    } // End of while loop

    return 0;
     d6e:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:507 (discriminator 2)
}
     d73:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
     d76:	c9                   	leave  
     d77:	c3                   	ret    

00000d78 <fatfs_sfn_exists>:
fatfs_sfn_exists():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:514
// fatfs_sfn_exists: Check if a short filename exists.
// NOTE: shortname is XXXXXXXXYYY not XXXXXXXX.YYY
//-------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fatfs_sfn_exists(struct fatfs *fs, uint32 Cluster, char *shortname)
{
     d78:	55                   	push   ebp
     d79:	89 e5                	mov    ebp,esp
     d7b:	53                   	push   ebx
     d7c:	83 ec 14             	sub    esp,0x14
     d7f:	e8 76 61 00 00       	call   6efa <__x86.get_pc_thunk.bx>
     d84:	81 c3 a4 a1 00 00    	add    ebx,0xa1a4
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:515
    uint8 item=0;
     d8a:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:516
    uint16 recordoffset = 0;
     d8e:	66 c7 45 ee 00 00    	mov    WORD PTR [ebp-0x12],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:517
    int x=0;
     d94:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:524

    // Main cluster following loop
    while (1)
    {
        // Read sector
        if (fatfs_sector_reader(fs, Cluster, x++, 0)) // If sector read was successfull
     d9b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
     d9e:	8d 50 01             	lea    edx,[eax+0x1]
     da1:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
     da4:	6a 00                	push   0x0
     da6:	50                   	push   eax
     da7:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
     daa:	ff 75 08             	push   DWORD PTR [ebp+0x8]
     dad:	e8 de 64 00 00       	call   7290 <__x86.get_pc_thunk.bx+0x396>
     db2:	83 c4 10             	add    esp,0x10
     db5:	85 c0                	test   eax,eax
     db7:	0f 84 8a 00 00 00    	je     e47 <fatfs_sfn_exists+0xcf>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:527
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
     dbd:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
     dc1:	eb 79                	jmp    e3c <fatfs_sfn_exists+0xc4>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:530
            {
                // Create the multiplier for sector access
                recordoffset = FAT_DIR_ENTRY_SIZE * item;
     dc3:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
     dc7:	c1 e0 05             	shl    eax,0x5
     dca:	66 89 45 ee          	mov    WORD PTR [ebp-0x12],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:533

                // Overlay directory entry over buffer
                directoryEntry = (struct fat_dir_entry*)(fs->currentsector.sector+recordoffset);
     dce:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     dd1:	8d 50 44             	lea    edx,[eax+0x44]
     dd4:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
     dd8:	01 d0                	add    eax,edx
     dda:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:537

#if FATFS_INC_LFN_SUPPORT
                // Long File Name Text Found
                if (fatfs_entry_lfn_text(directoryEntry) )
     ddd:	83 ec 0c             	sub    esp,0xc
     de0:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
     de3:	e8 c8 64 00 00       	call   72b0 <__x86.get_pc_thunk.bx+0x3b6>
     de8:	83 c4 10             	add    esp,0x10
     deb:	85 c0                	test   eax,eax
     ded:	75 43                	jne    e32 <fatfs_sfn_exists+0xba>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:541
                    ;

                // If Invalid record found delete any long file name information collated
                else if (fatfs_entry_lfn_invalid(directoryEntry) )
     def:	83 ec 0c             	sub    esp,0xc
     df2:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
     df5:	e8 c6 63 00 00       	call   71c0 <__x86.get_pc_thunk.bx+0x2c6>
     dfa:	83 c4 10             	add    esp,0x10
     dfd:	85 c0                	test   eax,eax
     dff:	75 31                	jne    e32 <fatfs_sfn_exists+0xba>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:546
                    ;
                else
#endif
                // Normal Entry, only 8.3 Text
                if (fatfs_entry_sfn_only(directoryEntry) )
     e01:	83 ec 0c             	sub    esp,0xc
     e04:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
     e07:	e8 34 65 00 00       	call   7340 <__x86.get_pc_thunk.bx+0x446>
     e0c:	83 c4 10             	add    esp,0x10
     e0f:	85 c0                	test   eax,eax
     e11:	74 1f                	je     e32 <fatfs_sfn_exists+0xba>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:548
                {
                    if (strncmp((const char*)directoryEntry->Name, shortname, 11)==0)
     e13:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
     e16:	83 ec 04             	sub    esp,0x4
     e19:	6a 0b                	push   0xb
     e1b:	ff 75 10             	push   DWORD PTR [ebp+0x10]
     e1e:	50                   	push   eax
     e1f:	e8 3c 63 00 00       	call   7160 <__x86.get_pc_thunk.bx+0x266>
     e24:	83 c4 10             	add    esp,0x10
     e27:	85 c0                	test   eax,eax
     e29:	75 07                	jne    e32 <fatfs_sfn_exists+0xba>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:549
                        return 1;
     e2b:	b8 01 00 00 00       	mov    eax,0x1
     e30:	eb 1b                	jmp    e4d <fatfs_sfn_exists+0xd5>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:527 (discriminator 2)
    {
        // Read sector
        if (fatfs_sector_reader(fs, Cluster, x++, 0)) // If sector read was successfull
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
     e32:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
     e36:	83 c0 01             	add    eax,0x1
     e39:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:527 (discriminator 1)
     e3c:	80 7d f7 0f          	cmp    BYTE PTR [ebp-0x9],0xf
     e40:	76 81                	jbe    dc3 <fatfs_sfn_exists+0x4b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:555 (discriminator 1)
                }
            } // End of if
        }
        else
            break;
    } // End of while loop
     e42:	e9 54 ff ff ff       	jmp    d9b <fatfs_sfn_exists+0x23>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:554
                        return 1;
                }
            } // End of if
        }
        else
            break;
     e47:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:557
    } // End of while loop

    return 0;
     e48:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:558
}
     e4d:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
     e50:	c9                   	leave  
     e51:	c3                   	ret    

00000e52 <fatfs_update_timestamps>:
fatfs_update_timestamps():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:565
//-------------------------------------------------------------
// fatfs_update_timestamps: Update date/time details
//-------------------------------------------------------------
#if FATFS_INC_TIME_DATE_SUPPORT
int fatfs_update_timestamps(struct fat_dir_entry *directoryEntry, int create, int modify, int access)
{
     e52:	55                   	push   ebp
     e53:	89 e5                	mov    ebp,esp
     e55:	53                   	push   ebx
     e56:	83 ec 14             	sub    esp,0x14
     e59:	e8 9c 60 00 00       	call   6efa <__x86.get_pc_thunk.bx>
     e5e:	81 c3 ca a0 00 00    	add    ebx,0xa0ca
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:572
    struct tm * time_info;
    uint16 fat_time;
    uint16 fat_date;

    // Get system time
    time(&time_now);
     e64:	83 ec 0c             	sub    esp,0xc
     e67:	8d 45 ec             	lea    eax,[ebp-0x14]
     e6a:	50                   	push   eax
     e6b:	e8 e0 63 00 00       	call   7250 <__x86.get_pc_thunk.bx+0x356>
     e70:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:575

    // Convert to local time
    time_info = localtime(&time_now);
     e73:	83 ec 0c             	sub    esp,0xc
     e76:	8d 45 ec             	lea    eax,[ebp-0x14]
     e79:	50                   	push   eax
     e7a:	e8 b1 63 00 00       	call   7230 <__x86.get_pc_thunk.bx+0x336>
     e7f:	83 c4 10             	add    esp,0x10
     e82:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:578

    // Convert time to FAT format
    fat_time = fatfs_convert_to_fat_time(time_info->tm_hour, time_info->tm_min, time_info->tm_sec);
     e85:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
     e88:	8b 08                	mov    ecx,DWORD PTR [eax]
     e8a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
     e8d:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
     e90:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
     e93:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
     e96:	83 ec 04             	sub    esp,0x4
     e99:	51                   	push   ecx
     e9a:	52                   	push   edx
     e9b:	50                   	push   eax
     e9c:	e8 3f 61 00 00       	call   6fe0 <__x86.get_pc_thunk.bx+0xe6>
     ea1:	83 c4 10             	add    esp,0x10
     ea4:	66 89 45 f2          	mov    WORD PTR [ebp-0xe],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:581

    // Convert date to FAT format
    fat_date = fatfs_convert_to_fat_date(time_info->tm_mday, time_info->tm_mon + 1, time_info->tm_year + 1900);
     ea8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
     eab:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
     eae:	8d 88 6c 07 00 00    	lea    ecx,[eax+0x76c]
     eb4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
     eb7:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
     eba:	8d 50 01             	lea    edx,[eax+0x1]
     ebd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
     ec0:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
     ec3:	83 ec 04             	sub    esp,0x4
     ec6:	51                   	push   ecx
     ec7:	52                   	push   edx
     ec8:	50                   	push   eax
     ec9:	e8 72 60 00 00       	call   6f40 <__x86.get_pc_thunk.bx+0x46>
     ece:	83 c4 10             	add    esp,0x10
     ed1:	66 89 45 f0          	mov    WORD PTR [ebp-0x10],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:584

    // Update requested fields
    if (create)
     ed5:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
     ed9:	74 38                	je     f13 <fatfs_update_timestamps+0xc1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:586
    {
        directoryEntry->CrtTime[1] = fat_time >> 8;
     edb:	0f b7 45 f2          	movzx  eax,WORD PTR [ebp-0xe]
     edf:	66 c1 e8 08          	shr    ax,0x8
     ee3:	89 c2                	mov    edx,eax
     ee5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     ee8:	88 50 0f             	mov    BYTE PTR [eax+0xf],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:587
        directoryEntry->CrtTime[0] = fat_time >> 0;
     eeb:	0f b7 45 f2          	movzx  eax,WORD PTR [ebp-0xe]
     eef:	89 c2                	mov    edx,eax
     ef1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     ef4:	88 50 0e             	mov    BYTE PTR [eax+0xe],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:588
        directoryEntry->CrtDate[1] = fat_date >> 8;
     ef7:	0f b7 45 f0          	movzx  eax,WORD PTR [ebp-0x10]
     efb:	66 c1 e8 08          	shr    ax,0x8
     eff:	89 c2                	mov    edx,eax
     f01:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     f04:	88 50 11             	mov    BYTE PTR [eax+0x11],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:589
        directoryEntry->CrtDate[0] = fat_date >> 0;
     f07:	0f b7 45 f0          	movzx  eax,WORD PTR [ebp-0x10]
     f0b:	89 c2                	mov    edx,eax
     f0d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     f10:	88 50 10             	mov    BYTE PTR [eax+0x10],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:592
    }

    if (modify)
     f13:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
     f17:	74 38                	je     f51 <fatfs_update_timestamps+0xff>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:594
    {
        directoryEntry->WrtTime[1] = fat_time >> 8;
     f19:	0f b7 45 f2          	movzx  eax,WORD PTR [ebp-0xe]
     f1d:	66 c1 e8 08          	shr    ax,0x8
     f21:	89 c2                	mov    edx,eax
     f23:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     f26:	88 50 17             	mov    BYTE PTR [eax+0x17],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:595
        directoryEntry->WrtTime[0] = fat_time >> 0;
     f29:	0f b7 45 f2          	movzx  eax,WORD PTR [ebp-0xe]
     f2d:	89 c2                	mov    edx,eax
     f2f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     f32:	88 50 16             	mov    BYTE PTR [eax+0x16],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:596
        directoryEntry->WrtDate[1] = fat_date >> 8;
     f35:	0f b7 45 f0          	movzx  eax,WORD PTR [ebp-0x10]
     f39:	66 c1 e8 08          	shr    ax,0x8
     f3d:	89 c2                	mov    edx,eax
     f3f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     f42:	88 50 19             	mov    BYTE PTR [eax+0x19],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:597
        directoryEntry->WrtDate[0] = fat_date >> 0;
     f45:	0f b7 45 f0          	movzx  eax,WORD PTR [ebp-0x10]
     f49:	89 c2                	mov    edx,eax
     f4b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     f4e:	88 50 18             	mov    BYTE PTR [eax+0x18],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:600
    }

    if (access)
     f51:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
     f55:	74 38                	je     f8f <fatfs_update_timestamps+0x13d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:602
    {
        directoryEntry->LstAccDate[1] = fat_time >> 8;
     f57:	0f b7 45 f2          	movzx  eax,WORD PTR [ebp-0xe]
     f5b:	66 c1 e8 08          	shr    ax,0x8
     f5f:	89 c2                	mov    edx,eax
     f61:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     f64:	88 50 13             	mov    BYTE PTR [eax+0x13],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:603
        directoryEntry->LstAccDate[0] = fat_time >> 0;
     f67:	0f b7 45 f2          	movzx  eax,WORD PTR [ebp-0xe]
     f6b:	89 c2                	mov    edx,eax
     f6d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     f70:	88 50 12             	mov    BYTE PTR [eax+0x12],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:604
        directoryEntry->LstAccDate[1] = fat_date >> 8;
     f73:	0f b7 45 f0          	movzx  eax,WORD PTR [ebp-0x10]
     f77:	66 c1 e8 08          	shr    ax,0x8
     f7b:	89 c2                	mov    edx,eax
     f7d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     f80:	88 50 13             	mov    BYTE PTR [eax+0x13],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:605
        directoryEntry->LstAccDate[0] = fat_date >> 0;
     f83:	0f b7 45 f0          	movzx  eax,WORD PTR [ebp-0x10]
     f87:	89 c2                	mov    edx,eax
     f89:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     f8c:	88 50 12             	mov    BYTE PTR [eax+0x12],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:608
    }

    return 1;
     f8f:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:609
}
     f94:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
     f97:	c9                   	leave  
     f98:	c3                   	ret    

00000f99 <fatfs_update_file_length>:
fatfs_update_file_length():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:617
// fatfs_update_file_length: Find a SFN entry and update it
// NOTE: shortname is XXXXXXXXYYY not XXXXXXXX.YYY
//-------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fatfs_update_file_length(struct fatfs *fs, uint32 Cluster, char *shortname, uint32 fileLength)
{
     f99:	55                   	push   ebp
     f9a:	89 e5                	mov    ebp,esp
     f9c:	53                   	push   ebx
     f9d:	83 ec 14             	sub    esp,0x14
     fa0:	e8 55 5f 00 00       	call   6efa <__x86.get_pc_thunk.bx>
     fa5:	81 c3 83 9f 00 00    	add    ebx,0x9f83
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:618
    uint8 item=0;
     fab:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:619
    uint16 recordoffset = 0;
     faf:	66 c7 45 ee 00 00    	mov    WORD PTR [ebp-0x12],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:620
    int x=0;
     fb5:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:624
    struct fat_dir_entry *directoryEntry;

    // No write access?
    if (!fs->disk_io.write_media)
     fbc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     fbf:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
     fc2:	85 c0                	test   eax,eax
     fc4:	75 0a                	jne    fd0 <fatfs_update_file_length+0x37>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:625
        return 0;
     fc6:	b8 00 00 00 00       	mov    eax,0x0
     fcb:	e9 14 01 00 00       	jmp    10e4 <fatfs_update_file_length+0x14b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:631

    // Main cluster following loop
    while (1)
    {
        // Read sector
        if (fatfs_sector_reader(fs, Cluster, x++, 0)) // If sector read was successfull
     fd0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
     fd3:	8d 50 01             	lea    edx,[eax+0x1]
     fd6:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
     fd9:	6a 00                	push   0x0
     fdb:	50                   	push   eax
     fdc:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
     fdf:	ff 75 08             	push   DWORD PTR [ebp+0x8]
     fe2:	e8 a9 62 00 00       	call   7290 <__x86.get_pc_thunk.bx+0x396>
     fe7:	83 c4 10             	add    esp,0x10
     fea:	85 c0                	test   eax,eax
     fec:	0f 84 ec 00 00 00    	je     10de <fatfs_update_file_length+0x145>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:634
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
     ff2:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
     ff6:	e9 d4 00 00 00       	jmp    10cf <fatfs_update_file_length+0x136>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:637
            {
                // Create the multiplier for sector access
                recordoffset = FAT_DIR_ENTRY_SIZE * item;
     ffb:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
     fff:	c1 e0 05             	shl    eax,0x5
    1002:	66 89 45 ee          	mov    WORD PTR [ebp-0x12],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:640

                // Overlay directory entry over buffer
                directoryEntry = (struct fat_dir_entry*)(fs->currentsector.sector+recordoffset);
    1006:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1009:	8d 50 44             	lea    edx,[eax+0x44]
    100c:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
    1010:	01 d0                	add    eax,edx
    1012:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:644

#if FATFS_INC_LFN_SUPPORT
                // Long File Name Text Found
                if (fatfs_entry_lfn_text(directoryEntry) )
    1015:	83 ec 0c             	sub    esp,0xc
    1018:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    101b:	e8 90 62 00 00       	call   72b0 <__x86.get_pc_thunk.bx+0x3b6>
    1020:	83 c4 10             	add    esp,0x10
    1023:	85 c0                	test   eax,eax
    1025:	0f 85 9a 00 00 00    	jne    10c5 <fatfs_update_file_length+0x12c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:648
                    ;

                // If Invalid record found delete any long file name information collated
                else if (fatfs_entry_lfn_invalid(directoryEntry) )
    102b:	83 ec 0c             	sub    esp,0xc
    102e:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    1031:	e8 8a 61 00 00       	call   71c0 <__x86.get_pc_thunk.bx+0x2c6>
    1036:	83 c4 10             	add    esp,0x10
    1039:	85 c0                	test   eax,eax
    103b:	0f 85 84 00 00 00    	jne    10c5 <fatfs_update_file_length+0x12c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:654
                    ;

                // Normal Entry, only 8.3 Text
                else
#endif
                if (fatfs_entry_sfn_only(directoryEntry) )
    1041:	83 ec 0c             	sub    esp,0xc
    1044:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    1047:	e8 f4 62 00 00       	call   7340 <__x86.get_pc_thunk.bx+0x446>
    104c:	83 c4 10             	add    esp,0x10
    104f:	85 c0                	test   eax,eax
    1051:	74 72                	je     10c5 <fatfs_update_file_length+0x12c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:656
                {
                    if (strncmp((const char*)directoryEntry->Name, shortname, 11)==0)
    1053:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    1056:	83 ec 04             	sub    esp,0x4
    1059:	6a 0b                	push   0xb
    105b:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    105e:	50                   	push   eax
    105f:	e8 fc 60 00 00       	call   7160 <__x86.get_pc_thunk.bx+0x266>
    1064:	83 c4 10             	add    esp,0x10
    1067:	85 c0                	test   eax,eax
    1069:	75 5a                	jne    10c5 <fatfs_update_file_length+0x12c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:658
                    {
                        directoryEntry->FileSize = FAT_HTONL(fileLength);
    106b:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    106e:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
    1071:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:662

#if FATFS_INC_TIME_DATE_SUPPORT
                        // Update access / modify time & date
                        fatfs_update_timestamps(directoryEntry, 0, 1, 1);
    1074:	6a 01                	push   0x1
    1076:	6a 01                	push   0x1
    1078:	6a 00                	push   0x0
    107a:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    107d:	e8 be 5f 00 00       	call   7040 <__x86.get_pc_thunk.bx+0x146>
    1082:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:666
#endif

                        // Update sfn entry
                        memcpy((uint8*)(fs->currentsector.sector+recordoffset), (uint8*)directoryEntry, sizeof(struct fat_dir_entry));
    1085:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1088:	8d 50 44             	lea    edx,[eax+0x44]
    108b:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
    108f:	01 d0                	add    eax,edx
    1091:	83 ec 04             	sub    esp,0x4
    1094:	6a 20                	push   0x20
    1096:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    1099:	50                   	push   eax
    109a:	e8 21 5f 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
    109f:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:669

                        // Write sector back
                        return fs->disk_io.write_media(fs->currentsector.address, fs->currentsector.sector, 1);
    10a2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    10a5:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    10a8:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    10ab:	8d 4a 44             	lea    ecx,[edx+0x44]
    10ae:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    10b1:	8b 92 44 02 00 00    	mov    edx,DWORD PTR [edx+0x244]
    10b7:	83 ec 04             	sub    esp,0x4
    10ba:	6a 01                	push   0x1
    10bc:	51                   	push   ecx
    10bd:	52                   	push   edx
    10be:	ff d0                	call   eax
    10c0:	83 c4 10             	add    esp,0x10
    10c3:	eb 1f                	jmp    10e4 <fatfs_update_file_length+0x14b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:634 (discriminator 2)
    {
        // Read sector
        if (fatfs_sector_reader(fs, Cluster, x++, 0)) // If sector read was successfull
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
    10c5:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    10c9:	83 c0 01             	add    eax,0x1
    10cc:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:634 (discriminator 1)
    10cf:	80 7d f7 0f          	cmp    BYTE PTR [ebp-0x9],0xf
    10d3:	0f 86 22 ff ff ff    	jbe    ffb <fatfs_update_file_length+0x62>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:676 (discriminator 1)
                }
            } // End of if
        }
        else
            break;
    } // End of while loop
    10d9:	e9 f2 fe ff ff       	jmp    fd0 <fatfs_update_file_length+0x37>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:675
                    }
                }
            } // End of if
        }
        else
            break;
    10de:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:678
    } // End of while loop

    return 0;
    10df:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:679
}
    10e4:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    10e7:	c9                   	leave  
    10e8:	c3                   	ret    

000010e9 <fatfs_mark_file_deleted>:
fatfs_mark_file_deleted():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:687
// fatfs_mark_file_deleted: Find a SFN entry and mark if as deleted
// NOTE: shortname is XXXXXXXXYYY not XXXXXXXX.YYY
//-------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fatfs_mark_file_deleted(struct fatfs *fs, uint32 Cluster, char *shortname)
{
    10e9:	55                   	push   ebp
    10ea:	89 e5                	mov    ebp,esp
    10ec:	53                   	push   ebx
    10ed:	83 ec 14             	sub    esp,0x14
    10f0:	e8 05 5e 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    10f5:	81 c3 33 9e 00 00    	add    ebx,0x9e33
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:688
    uint8 item=0;
    10fb:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:689
    uint16 recordoffset = 0;
    10ff:	66 c7 45 ee 00 00    	mov    WORD PTR [ebp-0x12],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:690
    int x=0;
    1105:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:694
    struct fat_dir_entry *directoryEntry;

    // No write access?
    if (!fs->disk_io.write_media)
    110c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    110f:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    1112:	85 c0                	test   eax,eax
    1114:	75 0a                	jne    1120 <fatfs_mark_file_deleted+0x37>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:695
        return 0;
    1116:	b8 00 00 00 00       	mov    eax,0x0
    111b:	e9 11 01 00 00       	jmp    1231 <fatfs_mark_file_deleted+0x148>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:701

    // Main cluster following loop
    while (1)
    {
        // Read sector
        if (fatfs_sector_reader(fs, Cluster, x++, 0)) // If sector read was successfull
    1120:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    1123:	8d 50 01             	lea    edx,[eax+0x1]
    1126:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
    1129:	6a 00                	push   0x0
    112b:	50                   	push   eax
    112c:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    112f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1132:	e8 59 61 00 00       	call   7290 <__x86.get_pc_thunk.bx+0x396>
    1137:	83 c4 10             	add    esp,0x10
    113a:	85 c0                	test   eax,eax
    113c:	0f 84 e9 00 00 00    	je     122b <fatfs_mark_file_deleted+0x142>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:704
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
    1142:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
    1146:	e9 d1 00 00 00       	jmp    121c <fatfs_mark_file_deleted+0x133>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:707
            {
                // Create the multiplier for sector access
                recordoffset = FAT_DIR_ENTRY_SIZE * item;
    114b:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    114f:	c1 e0 05             	shl    eax,0x5
    1152:	66 89 45 ee          	mov    WORD PTR [ebp-0x12],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:710

                // Overlay directory entry over buffer
                directoryEntry = (struct fat_dir_entry*)(fs->currentsector.sector+recordoffset);
    1156:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1159:	8d 50 44             	lea    edx,[eax+0x44]
    115c:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
    1160:	01 d0                	add    eax,edx
    1162:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:714

#if FATFS_INC_LFN_SUPPORT
                // Long File Name Text Found
                if (fatfs_entry_lfn_text(directoryEntry) )
    1165:	83 ec 0c             	sub    esp,0xc
    1168:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    116b:	e8 40 61 00 00       	call   72b0 <__x86.get_pc_thunk.bx+0x3b6>
    1170:	83 c4 10             	add    esp,0x10
    1173:	85 c0                	test   eax,eax
    1175:	0f 85 97 00 00 00    	jne    1212 <fatfs_mark_file_deleted+0x129>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:718
                    ;

                // If Invalid record found delete any long file name information collated
                else if (fatfs_entry_lfn_invalid(directoryEntry) )
    117b:	83 ec 0c             	sub    esp,0xc
    117e:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    1181:	e8 3a 60 00 00       	call   71c0 <__x86.get_pc_thunk.bx+0x2c6>
    1186:	83 c4 10             	add    esp,0x10
    1189:	85 c0                	test   eax,eax
    118b:	0f 85 81 00 00 00    	jne    1212 <fatfs_mark_file_deleted+0x129>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:724
                    ;

                // Normal Entry, only 8.3 Text
                else
#endif
                if (fatfs_entry_sfn_only(directoryEntry) )
    1191:	83 ec 0c             	sub    esp,0xc
    1194:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    1197:	e8 a4 61 00 00       	call   7340 <__x86.get_pc_thunk.bx+0x446>
    119c:	83 c4 10             	add    esp,0x10
    119f:	85 c0                	test   eax,eax
    11a1:	74 6f                	je     1212 <fatfs_mark_file_deleted+0x129>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:726
                {
                    if (strncmp((const char *)directoryEntry->Name, shortname, 11)==0)
    11a3:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    11a6:	83 ec 04             	sub    esp,0x4
    11a9:	6a 0b                	push   0xb
    11ab:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    11ae:	50                   	push   eax
    11af:	e8 ac 5f 00 00       	call   7160 <__x86.get_pc_thunk.bx+0x266>
    11b4:	83 c4 10             	add    esp,0x10
    11b7:	85 c0                	test   eax,eax
    11b9:	75 57                	jne    1212 <fatfs_mark_file_deleted+0x129>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:729
                    {
                        // Mark as deleted
                        directoryEntry->Name[0] = FILE_HEADER_DELETED;
    11bb:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    11be:	c6 00 e5             	mov    BYTE PTR [eax],0xe5
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:733

#if FATFS_INC_TIME_DATE_SUPPORT
                        // Update access / modify time & date
                        fatfs_update_timestamps(directoryEntry, 0, 1, 1);
    11c1:	6a 01                	push   0x1
    11c3:	6a 01                	push   0x1
    11c5:	6a 00                	push   0x0
    11c7:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    11ca:	e8 71 5e 00 00       	call   7040 <__x86.get_pc_thunk.bx+0x146>
    11cf:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:737
#endif

                        // Update sfn entry
                        memcpy((uint8*)(fs->currentsector.sector+recordoffset), (uint8*)directoryEntry, sizeof(struct fat_dir_entry));
    11d2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    11d5:	8d 50 44             	lea    edx,[eax+0x44]
    11d8:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
    11dc:	01 d0                	add    eax,edx
    11de:	83 ec 04             	sub    esp,0x4
    11e1:	6a 20                	push   0x20
    11e3:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    11e6:	50                   	push   eax
    11e7:	e8 d4 5d 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
    11ec:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:740

                        // Write sector back
                        return fs->disk_io.write_media(fs->currentsector.address, fs->currentsector.sector, 1);
    11ef:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    11f2:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    11f5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    11f8:	8d 4a 44             	lea    ecx,[edx+0x44]
    11fb:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    11fe:	8b 92 44 02 00 00    	mov    edx,DWORD PTR [edx+0x244]
    1204:	83 ec 04             	sub    esp,0x4
    1207:	6a 01                	push   0x1
    1209:	51                   	push   ecx
    120a:	52                   	push   edx
    120b:	ff d0                	call   eax
    120d:	83 c4 10             	add    esp,0x10
    1210:	eb 1f                	jmp    1231 <fatfs_mark_file_deleted+0x148>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:704 (discriminator 2)
    {
        // Read sector
        if (fatfs_sector_reader(fs, Cluster, x++, 0)) // If sector read was successfull
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
    1212:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    1216:	83 c0 01             	add    eax,0x1
    1219:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:704 (discriminator 1)
    121c:	80 7d f7 0f          	cmp    BYTE PTR [ebp-0x9],0xf
    1220:	0f 86 25 ff ff ff    	jbe    114b <fatfs_mark_file_deleted+0x62>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:747 (discriminator 1)
                }
            } // End of if
        }
        else
            break;
    } // End of while loop
    1226:	e9 f5 fe ff ff       	jmp    1120 <fatfs_mark_file_deleted+0x37>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:746
                    }
                }
            } // End of if
        }
        else
            break;
    122b:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:749
    } // End of while loop

    return 0;
    122c:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:750
}
    1231:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1234:	c9                   	leave  
    1235:	c3                   	ret    

00001236 <fatfs_list_directory_start>:
fatfs_list_directory_start():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:757
//-----------------------------------------------------------------------------
// fatfs_list_directory_start: Initialise a directory listing procedure
//-----------------------------------------------------------------------------
#if FATFS_DIR_LIST_SUPPORT
void fatfs_list_directory_start(struct fatfs *fs, struct fs_dir_list_status *dirls, uint32 StartCluster)
{
    1236:	55                   	push   ebp
    1237:	89 e5                	mov    ebp,esp
    1239:	e8 b8 5c 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    123e:	05 ea 9c 00 00       	add    eax,0x9cea
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:758
    dirls->cluster = StartCluster;
    1243:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1246:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    1249:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:759
    dirls->sector = 0;
    124c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    124f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:760
    dirls->offset = 0;
    1255:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1258:	c6 40 08 00          	mov    BYTE PTR [eax+0x8],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:761
}
    125c:	90                   	nop
    125d:	5d                   	pop    ebp
    125e:	c3                   	ret    

0000125f <fatfs_list_directory_next>:
fatfs_list_directory_next():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:769
// fatfs_list_directory_next: Get the next entry in the directory.
// Returns: 1 = found, 0 = end of listing
//-----------------------------------------------------------------------------
#if FATFS_DIR_LIST_SUPPORT
int fatfs_list_directory_next(struct fatfs *fs, struct fs_dir_list_status *dirls, struct fs_dir_ent *entry)
{
    125f:	55                   	push   ebp
    1260:	89 e5                	mov    ebp,esp
    1262:	53                   	push   ebx
    1263:	81 ec 34 01 00 00    	sub    esp,0x134
    1269:	e8 8c 5c 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    126e:	81 c3 ba 9c 00 00    	add    ebx,0x9cba
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:773
    uint8 i,item;
    uint16 recordoffset;
    struct fat_dir_entry *directoryEntry;
    char *long_filename = NULL;
    1274:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:776
    char short_filename[13];
    struct lfn_cache lfn;
    int dotRequired = 0;
    127b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:777
    int result = 0;
    1282:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:780

    // Initialise LFN cache first
    fatfs_lfn_cache_init(&lfn, 0);
    1289:	83 ec 08             	sub    esp,0x8
    128c:	6a 00                	push   0x0
    128e:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
    1294:	50                   	push   eax
    1295:	e8 46 60 00 00       	call   72e0 <__x86.get_pc_thunk.bx+0x3e6>
    129a:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:785

    while (1)
    {
        // If data read OK
        if (fatfs_sector_reader(fs, dirls->cluster, dirls->sector, 0))
    129d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    12a0:	8b 10                	mov    edx,DWORD PTR [eax]
    12a2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    12a5:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    12a8:	6a 00                	push   0x0
    12aa:	52                   	push   edx
    12ab:	50                   	push   eax
    12ac:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    12af:	e8 dc 5f 00 00       	call   7290 <__x86.get_pc_thunk.bx+0x396>
    12b4:	83 c4 10             	add    esp,0x10
    12b7:	85 c0                	test   eax,eax
    12b9:	0f 84 56 04 00 00    	je     1715 <fatfs_list_directory_next+0x4b6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:788
        {
            // Maximum of 16 directory entries
            for (item = dirls->offset; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
    12bf:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    12c2:	0f b6 40 08          	movzx  eax,BYTE PTR [eax+0x8]
    12c6:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
    12c9:	e9 24 04 00 00       	jmp    16f2 <fatfs_list_directory_next+0x493>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:791
            {
                // Increase directory offset
                recordoffset = FAT_DIR_ENTRY_SIZE * item;
    12ce:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
    12d2:	c1 e0 05             	shl    eax,0x5
    12d5:	66 89 45 e6          	mov    WORD PTR [ebp-0x1a],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:794

                // Overlay directory entry over buffer
                directoryEntry = (struct fat_dir_entry*)(fs->currentsector.sector+recordoffset);
    12d9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    12dc:	8d 50 44             	lea    edx,[eax+0x44]
    12df:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
    12e3:	01 d0                	add    eax,edx
    12e5:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:798

#if FATFS_INC_LFN_SUPPORT
                // Long File Name Text Found
                if ( fatfs_entry_lfn_text(directoryEntry) )
    12e8:	83 ec 0c             	sub    esp,0xc
    12eb:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    12ee:	e8 bd 5f 00 00       	call   72b0 <__x86.get_pc_thunk.bx+0x3b6>
    12f3:	83 c4 10             	add    esp,0x10
    12f6:	85 c0                	test   eax,eax
    12f8:	74 24                	je     131e <fatfs_list_directory_next+0xbf>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:799
                    fatfs_lfn_cache_entry(&lfn, fs->currentsector.sector+recordoffset);
    12fa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    12fd:	8d 50 44             	lea    edx,[eax+0x44]
    1300:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
    1304:	01 d0                	add    eax,edx
    1306:	83 ec 08             	sub    esp,0x8
    1309:	50                   	push   eax
    130a:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
    1310:	50                   	push   eax
    1311:	e8 ba 5d 00 00       	call   70d0 <__x86.get_pc_thunk.bx+0x1d6>
    1316:	83 c4 10             	add    esp,0x10
    1319:	e9 ca 03 00 00       	jmp    16e8 <fatfs_list_directory_next+0x489>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:802

                // If Invalid record found delete any long file name information collated
                else if ( fatfs_entry_lfn_invalid(directoryEntry) )
    131e:	83 ec 0c             	sub    esp,0xc
    1321:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    1324:	e8 97 5e 00 00       	call   71c0 <__x86.get_pc_thunk.bx+0x2c6>
    1329:	83 c4 10             	add    esp,0x10
    132c:	85 c0                	test   eax,eax
    132e:	74 19                	je     1349 <fatfs_list_directory_next+0xea>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:803
                    fatfs_lfn_cache_init(&lfn, 0);
    1330:	83 ec 08             	sub    esp,0x8
    1333:	6a 00                	push   0x0
    1335:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
    133b:	50                   	push   eax
    133c:	e8 9f 5f 00 00       	call   72e0 <__x86.get_pc_thunk.bx+0x3e6>
    1341:	83 c4 10             	add    esp,0x10
    1344:	e9 9f 03 00 00       	jmp    16e8 <fatfs_list_directory_next+0x489>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:806

                // Normal SFN Entry and Long text exists
                else if (fatfs_entry_lfn_exists(&lfn, directoryEntry) )
    1349:	83 ec 08             	sub    esp,0x8
    134c:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    134f:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
    1355:	50                   	push   eax
    1356:	e8 c5 5e 00 00       	call   7220 <__x86.get_pc_thunk.bx+0x326>
    135b:	83 c4 10             	add    esp,0x10
    135e:	85 c0                	test   eax,eax
    1360:	0f 84 67 01 00 00    	je     14cd <fatfs_list_directory_next+0x26e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:809
                {
                    // Get text
                    long_filename = fatfs_lfn_cache_get(&lfn);
    1366:	83 ec 0c             	sub    esp,0xc
    1369:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
    136f:	50                   	push   eax
    1370:	e8 0b 5e 00 00       	call   7180 <__x86.get_pc_thunk.bx+0x286>
    1375:	83 c4 10             	add    esp,0x10
    1378:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:810
                    strncpy(entry->filename, long_filename, FATFS_MAX_LONG_FILENAME-1);
    137b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    137e:	83 ec 04             	sub    esp,0x4
    1381:	6a 7f                	push   0x7f
    1383:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    1386:	50                   	push   eax
    1387:	e8 04 5e 00 00       	call   7190 <__x86.get_pc_thunk.bx+0x296>
    138c:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:812

                    if (fatfs_entry_is_dir(directoryEntry))
    138f:	83 ec 0c             	sub    esp,0xc
    1392:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    1395:	e8 56 5d 00 00       	call   70f0 <__x86.get_pc_thunk.bx+0x1f6>
    139a:	83 c4 10             	add    esp,0x10
    139d:	85 c0                	test   eax,eax
    139f:	74 0c                	je     13ad <fatfs_list_directory_next+0x14e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:813
                        entry->is_dir = 1;
    13a1:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    13a4:	c6 80 80 00 00 00 01 	mov    BYTE PTR [eax+0x80],0x1
    13ab:	eb 0a                	jmp    13b7 <fatfs_list_directory_next+0x158>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:815
                    else
                        entry->is_dir = 0;
    13ad:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    13b0:	c6 80 80 00 00 00 00 	mov    BYTE PTR [eax+0x80],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:819

#if FATFS_INC_TIME_DATE_SUPPORT
                    // Get time / dates
                    entry->create_time = ((uint16)directoryEntry->CrtTime[1] << 8) | directoryEntry->CrtTime[0];
    13b7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    13ba:	0f b6 40 0f          	movzx  eax,BYTE PTR [eax+0xf]
    13be:	0f b6 c0             	movzx  eax,al
    13c1:	c1 e0 08             	shl    eax,0x8
    13c4:	89 c2                	mov    edx,eax
    13c6:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    13c9:	0f b6 40 0e          	movzx  eax,BYTE PTR [eax+0xe]
    13cd:	0f b6 c0             	movzx  eax,al
    13d0:	09 d0                	or     eax,edx
    13d2:	89 c2                	mov    edx,eax
    13d4:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    13d7:	66 89 90 94 00 00 00 	mov    WORD PTR [eax+0x94],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:820
                    entry->create_date = ((uint16)directoryEntry->CrtDate[1] << 8) | directoryEntry->CrtDate[0];
    13de:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    13e1:	0f b6 40 11          	movzx  eax,BYTE PTR [eax+0x11]
    13e5:	0f b6 c0             	movzx  eax,al
    13e8:	c1 e0 08             	shl    eax,0x8
    13eb:	89 c2                	mov    edx,eax
    13ed:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    13f0:	0f b6 40 10          	movzx  eax,BYTE PTR [eax+0x10]
    13f4:	0f b6 c0             	movzx  eax,al
    13f7:	09 d0                	or     eax,edx
    13f9:	89 c2                	mov    edx,eax
    13fb:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    13fe:	66 89 90 92 00 00 00 	mov    WORD PTR [eax+0x92],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:821
                    entry->access_date = ((uint16)directoryEntry->LstAccDate[1] << 8) | directoryEntry->LstAccDate[0];
    1405:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1408:	0f b6 40 13          	movzx  eax,BYTE PTR [eax+0x13]
    140c:	0f b6 c0             	movzx  eax,al
    140f:	c1 e0 08             	shl    eax,0x8
    1412:	89 c2                	mov    edx,eax
    1414:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1417:	0f b6 40 12          	movzx  eax,BYTE PTR [eax+0x12]
    141b:	0f b6 c0             	movzx  eax,al
    141e:	09 d0                	or     eax,edx
    1420:	89 c2                	mov    edx,eax
    1422:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    1425:	66 89 90 8c 00 00 00 	mov    WORD PTR [eax+0x8c],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:822
                    entry->write_time  = ((uint16)directoryEntry->WrtTime[1] << 8) | directoryEntry->WrtTime[0];
    142c:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    142f:	0f b6 40 17          	movzx  eax,BYTE PTR [eax+0x17]
    1433:	0f b6 c0             	movzx  eax,al
    1436:	c1 e0 08             	shl    eax,0x8
    1439:	89 c2                	mov    edx,eax
    143b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    143e:	0f b6 40 16          	movzx  eax,BYTE PTR [eax+0x16]
    1442:	0f b6 c0             	movzx  eax,al
    1445:	09 d0                	or     eax,edx
    1447:	89 c2                	mov    edx,eax
    1449:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    144c:	66 89 90 8e 00 00 00 	mov    WORD PTR [eax+0x8e],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:823
                    entry->write_date  = ((uint16)directoryEntry->WrtDate[1] << 8) | directoryEntry->WrtDate[0];
    1453:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1456:	0f b6 40 19          	movzx  eax,BYTE PTR [eax+0x19]
    145a:	0f b6 c0             	movzx  eax,al
    145d:	c1 e0 08             	shl    eax,0x8
    1460:	89 c2                	mov    edx,eax
    1462:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1465:	0f b6 40 18          	movzx  eax,BYTE PTR [eax+0x18]
    1469:	0f b6 c0             	movzx  eax,al
    146c:	09 d0                	or     eax,edx
    146e:	89 c2                	mov    edx,eax
    1470:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    1473:	66 89 90 90 00 00 00 	mov    WORD PTR [eax+0x90],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:826
#endif

                    entry->size = FAT_HTONL(directoryEntry->FileSize);
    147a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    147d:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
    1480:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    1483:	89 90 88 00 00 00    	mov    DWORD PTR [eax+0x88],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:827
                    entry->cluster = (FAT_HTONS(directoryEntry->FstClusHI)<<16) | FAT_HTONS(directoryEntry->FstClusLO);
    1489:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    148c:	0f b7 40 14          	movzx  eax,WORD PTR [eax+0x14]
    1490:	0f b7 c0             	movzx  eax,ax
    1493:	c1 e0 10             	shl    eax,0x10
    1496:	89 c2                	mov    edx,eax
    1498:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    149b:	0f b7 40 1a          	movzx  eax,WORD PTR [eax+0x1a]
    149f:	0f b7 c0             	movzx  eax,ax
    14a2:	09 d0                	or     eax,edx
    14a4:	89 c2                	mov    edx,eax
    14a6:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    14a9:	89 90 84 00 00 00    	mov    DWORD PTR [eax+0x84],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:830

                    // Next starting position
                    dirls->offset = item + 1;
    14af:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
    14b3:	8d 50 01             	lea    edx,[eax+0x1]
    14b6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    14b9:	88 50 08             	mov    BYTE PTR [eax+0x8],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:831
                    result = 1;
    14bc:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:832
                    return 1;
    14c3:	b8 01 00 00 00       	mov    eax,0x1
    14c8:	e9 4c 02 00 00       	jmp    1719 <fatfs_list_directory_next+0x4ba>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:837
                }
                // Normal Entry, only 8.3 Text
                else
#endif
                if ( fatfs_entry_sfn_only(directoryEntry) )
    14cd:	83 ec 0c             	sub    esp,0xc
    14d0:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    14d3:	e8 68 5e 00 00       	call   7340 <__x86.get_pc_thunk.bx+0x446>
    14d8:	83 c4 10             	add    esp,0x10
    14db:	85 c0                	test   eax,eax
    14dd:	0f 84 05 02 00 00    	je     16e8 <fatfs_list_directory_next+0x489>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:839
                {
                    fatfs_lfn_cache_init(&lfn, 0);
    14e3:	83 ec 08             	sub    esp,0x8
    14e6:	6a 00                	push   0x0
    14e8:	8d 85 cd fe ff ff    	lea    eax,[ebp-0x133]
    14ee:	50                   	push   eax
    14ef:	e8 ec 5d 00 00       	call   72e0 <__x86.get_pc_thunk.bx+0x3e6>
    14f4:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:841

                    memset(short_filename, 0, sizeof(short_filename));
    14f7:	83 ec 04             	sub    esp,0x4
    14fa:	6a 0d                	push   0xd
    14fc:	6a 00                	push   0x0
    14fe:	8d 45 d3             	lea    eax,[ebp-0x2d]
    1501:	50                   	push   eax
    1502:	e8 39 5d 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    1507:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:844

                    // Copy name to string
                    for (i=0; i<8; i++)
    150a:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
    150e:	eb 1d                	jmp    152d <fatfs_list_directory_next+0x2ce>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:845 (discriminator 3)
                        short_filename[i] = directoryEntry->Name[i];
    1510:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    1514:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
    1518:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
    151b:	0f b6 14 11          	movzx  edx,BYTE PTR [ecx+edx*1]
    151f:	88 54 05 d3          	mov    BYTE PTR [ebp+eax*1-0x2d],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:844 (discriminator 3)
                    fatfs_lfn_cache_init(&lfn, 0);

                    memset(short_filename, 0, sizeof(short_filename));

                    // Copy name to string
                    for (i=0; i<8; i++)
    1523:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    1527:	83 c0 01             	add    eax,0x1
    152a:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:844 (discriminator 1)
    152d:	80 7d f7 07          	cmp    BYTE PTR [ebp-0x9],0x7
    1531:	76 dd                	jbe    1510 <fatfs_list_directory_next+0x2b1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:848
                        short_filename[i] = directoryEntry->Name[i];

                    // Extension
                    dotRequired = 0;
    1533:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:849
                    for (i=8; i<11; i++)
    153a:	c6 45 f7 08          	mov    BYTE PTR [ebp-0x9],0x8
    153e:	eb 36                	jmp    1576 <fatfs_list_directory_next+0x317>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:851
                    {
                        short_filename[i+1] = directoryEntry->Name[i];
    1540:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    1544:	8d 48 01             	lea    ecx,[eax+0x1]
    1547:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    154b:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
    154e:	0f b6 04 02          	movzx  eax,BYTE PTR [edx+eax*1]
    1552:	88 44 0d d3          	mov    BYTE PTR [ebp+ecx*1-0x2d],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:852
                        if (directoryEntry->Name[i] != ' ')
    1556:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    155a:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
    155d:	0f b6 04 02          	movzx  eax,BYTE PTR [edx+eax*1]
    1561:	3c 20                	cmp    al,0x20
    1563:	74 07                	je     156c <fatfs_list_directory_next+0x30d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:853
                            dotRequired = 1;
    1565:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:849 (discriminator 2)
                    for (i=0; i<8; i++)
                        short_filename[i] = directoryEntry->Name[i];

                    // Extension
                    dotRequired = 0;
                    for (i=8; i<11; i++)
    156c:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    1570:	83 c0 01             	add    eax,0x1
    1573:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:849 (discriminator 1)
    1576:	80 7d f7 0a          	cmp    BYTE PTR [ebp-0x9],0xa
    157a:	76 c4                	jbe    1540 <fatfs_list_directory_next+0x2e1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:857
                        if (directoryEntry->Name[i] != ' ')
                            dotRequired = 1;
                    }

                    // Dot only required if extension present
                    if (dotRequired)
    157c:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    1580:	74 14                	je     1596 <fatfs_list_directory_next+0x337>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:860
                    {
                        // If not . or .. entry
                        if (short_filename[0]!='.')
    1582:	0f b6 45 d3          	movzx  eax,BYTE PTR [ebp-0x2d]
    1586:	3c 2e                	cmp    al,0x2e
    1588:	74 06                	je     1590 <fatfs_list_directory_next+0x331>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:861
                            short_filename[8] = '.';
    158a:	c6 45 db 2e          	mov    BYTE PTR [ebp-0x25],0x2e
    158e:	eb 0a                	jmp    159a <fatfs_list_directory_next+0x33b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:863
                        else
                            short_filename[8] = ' ';
    1590:	c6 45 db 20          	mov    BYTE PTR [ebp-0x25],0x20
    1594:	eb 04                	jmp    159a <fatfs_list_directory_next+0x33b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:866
                    }
                    else
                        short_filename[8] = ' ';
    1596:	c6 45 db 20          	mov    BYTE PTR [ebp-0x25],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:868

                    fatfs_get_sfn_display_name(entry->filename, short_filename);
    159a:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    159d:	83 ec 08             	sub    esp,0x8
    15a0:	8d 55 d3             	lea    edx,[ebp-0x2d]
    15a3:	52                   	push   edx
    15a4:	50                   	push   eax
    15a5:	e8 86 5b 00 00       	call   7130 <__x86.get_pc_thunk.bx+0x236>
    15aa:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:870

                    if (fatfs_entry_is_dir(directoryEntry))
    15ad:	83 ec 0c             	sub    esp,0xc
    15b0:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    15b3:	e8 38 5b 00 00       	call   70f0 <__x86.get_pc_thunk.bx+0x1f6>
    15b8:	83 c4 10             	add    esp,0x10
    15bb:	85 c0                	test   eax,eax
    15bd:	74 0c                	je     15cb <fatfs_list_directory_next+0x36c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:871
                        entry->is_dir = 1;
    15bf:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    15c2:	c6 80 80 00 00 00 01 	mov    BYTE PTR [eax+0x80],0x1
    15c9:	eb 0a                	jmp    15d5 <fatfs_list_directory_next+0x376>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:873
                    else
                        entry->is_dir = 0;
    15cb:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    15ce:	c6 80 80 00 00 00 00 	mov    BYTE PTR [eax+0x80],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:877

#if FATFS_INC_TIME_DATE_SUPPORT
                    // Get time / dates
                    entry->create_time = ((uint16)directoryEntry->CrtTime[1] << 8) | directoryEntry->CrtTime[0];
    15d5:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    15d8:	0f b6 40 0f          	movzx  eax,BYTE PTR [eax+0xf]
    15dc:	0f b6 c0             	movzx  eax,al
    15df:	c1 e0 08             	shl    eax,0x8
    15e2:	89 c2                	mov    edx,eax
    15e4:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    15e7:	0f b6 40 0e          	movzx  eax,BYTE PTR [eax+0xe]
    15eb:	0f b6 c0             	movzx  eax,al
    15ee:	09 d0                	or     eax,edx
    15f0:	89 c2                	mov    edx,eax
    15f2:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    15f5:	66 89 90 94 00 00 00 	mov    WORD PTR [eax+0x94],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:878
                    entry->create_date = ((uint16)directoryEntry->CrtDate[1] << 8) | directoryEntry->CrtDate[0];
    15fc:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    15ff:	0f b6 40 11          	movzx  eax,BYTE PTR [eax+0x11]
    1603:	0f b6 c0             	movzx  eax,al
    1606:	c1 e0 08             	shl    eax,0x8
    1609:	89 c2                	mov    edx,eax
    160b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    160e:	0f b6 40 10          	movzx  eax,BYTE PTR [eax+0x10]
    1612:	0f b6 c0             	movzx  eax,al
    1615:	09 d0                	or     eax,edx
    1617:	89 c2                	mov    edx,eax
    1619:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    161c:	66 89 90 92 00 00 00 	mov    WORD PTR [eax+0x92],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:879
                    entry->access_date = ((uint16)directoryEntry->LstAccDate[1] << 8) | directoryEntry->LstAccDate[0];
    1623:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1626:	0f b6 40 13          	movzx  eax,BYTE PTR [eax+0x13]
    162a:	0f b6 c0             	movzx  eax,al
    162d:	c1 e0 08             	shl    eax,0x8
    1630:	89 c2                	mov    edx,eax
    1632:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1635:	0f b6 40 12          	movzx  eax,BYTE PTR [eax+0x12]
    1639:	0f b6 c0             	movzx  eax,al
    163c:	09 d0                	or     eax,edx
    163e:	89 c2                	mov    edx,eax
    1640:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    1643:	66 89 90 8c 00 00 00 	mov    WORD PTR [eax+0x8c],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:880
                    entry->write_time  = ((uint16)directoryEntry->WrtTime[1] << 8) | directoryEntry->WrtTime[0];
    164a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    164d:	0f b6 40 17          	movzx  eax,BYTE PTR [eax+0x17]
    1651:	0f b6 c0             	movzx  eax,al
    1654:	c1 e0 08             	shl    eax,0x8
    1657:	89 c2                	mov    edx,eax
    1659:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    165c:	0f b6 40 16          	movzx  eax,BYTE PTR [eax+0x16]
    1660:	0f b6 c0             	movzx  eax,al
    1663:	09 d0                	or     eax,edx
    1665:	89 c2                	mov    edx,eax
    1667:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    166a:	66 89 90 8e 00 00 00 	mov    WORD PTR [eax+0x8e],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:881
                    entry->write_date  = ((uint16)directoryEntry->WrtDate[1] << 8) | directoryEntry->WrtDate[0];
    1671:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1674:	0f b6 40 19          	movzx  eax,BYTE PTR [eax+0x19]
    1678:	0f b6 c0             	movzx  eax,al
    167b:	c1 e0 08             	shl    eax,0x8
    167e:	89 c2                	mov    edx,eax
    1680:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1683:	0f b6 40 18          	movzx  eax,BYTE PTR [eax+0x18]
    1687:	0f b6 c0             	movzx  eax,al
    168a:	09 d0                	or     eax,edx
    168c:	89 c2                	mov    edx,eax
    168e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    1691:	66 89 90 90 00 00 00 	mov    WORD PTR [eax+0x90],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:884
#endif

                    entry->size = FAT_HTONL(directoryEntry->FileSize);
    1698:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    169b:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
    169e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    16a1:	89 90 88 00 00 00    	mov    DWORD PTR [eax+0x88],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:885
                    entry->cluster = (FAT_HTONS(directoryEntry->FstClusHI)<<16) | FAT_HTONS(directoryEntry->FstClusLO);
    16a7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    16aa:	0f b7 40 14          	movzx  eax,WORD PTR [eax+0x14]
    16ae:	0f b7 c0             	movzx  eax,ax
    16b1:	c1 e0 10             	shl    eax,0x10
    16b4:	89 c2                	mov    edx,eax
    16b6:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    16b9:	0f b7 40 1a          	movzx  eax,WORD PTR [eax+0x1a]
    16bd:	0f b7 c0             	movzx  eax,ax
    16c0:	09 d0                	or     eax,edx
    16c2:	89 c2                	mov    edx,eax
    16c4:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    16c7:	89 90 84 00 00 00    	mov    DWORD PTR [eax+0x84],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:888

                    // Next starting position
                    dirls->offset = item + 1;
    16cd:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
    16d1:	8d 50 01             	lea    edx,[eax+0x1]
    16d4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    16d7:	88 50 08             	mov    BYTE PTR [eax+0x8],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:889
                    result = 1;
    16da:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:890
                    return 1;
    16e1:	b8 01 00 00 00       	mov    eax,0x1
    16e6:	eb 31                	jmp    1719 <fatfs_list_directory_next+0x4ba>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:788 (discriminator 2)
    {
        // If data read OK
        if (fatfs_sector_reader(fs, dirls->cluster, dirls->sector, 0))
        {
            // Maximum of 16 directory entries
            for (item = dirls->offset; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
    16e8:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
    16ec:	83 c0 01             	add    eax,0x1
    16ef:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:788 (discriminator 1)
    16f2:	80 7d f6 0f          	cmp    BYTE PTR [ebp-0xa],0xf
    16f6:	0f 86 d2 fb ff ff    	jbe    12ce <fatfs_list_directory_next+0x6f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:895
                    return 1;
                }
            }// end of for

            // If reached end of the dir move onto next sector
            dirls->sector++;
    16fc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    16ff:	8b 00                	mov    eax,DWORD PTR [eax]
    1701:	8d 50 01             	lea    edx,[eax+0x1]
    1704:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1707:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:896
            dirls->offset = 0;
    1709:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    170c:	c6 40 08 00          	mov    BYTE PTR [eax+0x8],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:900
        }
        else
            break;
    }
    1710:	e9 88 fb ff ff       	jmp    129d <fatfs_list_directory_next+0x3e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:899
            // If reached end of the dir move onto next sector
            dirls->sector++;
            dirls->offset = 0;
        }
        else
            break;
    1715:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:902
    }

    return result;
    1716:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_access.c:903 (discriminator 1)
}
    1719:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    171c:	c9                   	leave  
    171d:	c3                   	ret    
    171e:	66 90                	xchg   ax,ax

00001720 <fat_list_init>:
fat_list_init():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:47

//-----------------------------------------------------------------
// fat_list_init:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_init(struct fat_list *list)
{
    1720:	55                   	push   ebp
    1721:	89 e5                	mov    ebp,esp
    1723:	e8 ce 57 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    1728:	05 00 98 00 00       	add    eax,0x9800
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:50
    FAT_ASSERT(list);

    list->head = list->tail = 0;
    172d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1730:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
    1737:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    173a:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    173d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1740:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:51
}
    1742:	90                   	nop
    1743:	5d                   	pop    ebp
    1744:	c3                   	ret    

00001745 <fat_list_remove>:
fat_list_remove():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:56
//-----------------------------------------------------------------
// fat_list_remove:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_remove(struct fat_list *list, struct fat_node *node)
{
    1745:	55                   	push   ebp
    1746:	89 e5                	mov    ebp,esp
    1748:	e8 a9 57 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    174d:	05 db 97 00 00       	add    eax,0x97db
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:60
    FAT_ASSERT(list);
    FAT_ASSERT(node);

    if(!node->previous)
    1752:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1755:	8b 00                	mov    eax,DWORD PTR [eax]
    1757:	85 c0                	test   eax,eax
    1759:	75 0d                	jne    1768 <fat_list_remove+0x23>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:61
        list->head = node->next;
    175b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    175e:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    1761:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1764:	89 10                	mov    DWORD PTR [eax],edx
    1766:	eb 0e                	jmp    1776 <fat_list_remove+0x31>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:63
    else
        node->previous->next = node->next;
    1768:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    176b:	8b 00                	mov    eax,DWORD PTR [eax]
    176d:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    1770:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
    1773:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:65

    if(!node->next)
    1776:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1779:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    177c:	85 c0                	test   eax,eax
    177e:	75 0d                	jne    178d <fat_list_remove+0x48>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:66
        list->tail = node->previous;
    1780:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1783:	8b 10                	mov    edx,DWORD PTR [eax]
    1785:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1788:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:69
    else
        node->next->previous = node->previous;
}
    178b:	eb 0d                	jmp    179a <fat_list_remove+0x55>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:68
        node->previous->next = node->next;

    if(!node->next)
        list->tail = node->previous;
    else
        node->next->previous = node->previous;
    178d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1790:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    1793:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    1796:	8b 12                	mov    edx,DWORD PTR [edx]
    1798:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:69
}
    179a:	90                   	nop
    179b:	5d                   	pop    ebp
    179c:	c3                   	ret    

0000179d <fat_list_insert_after>:
fat_list_insert_after():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:74
//-----------------------------------------------------------------
// fat_list_insert_after:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_insert_after(struct fat_list *list, struct fat_node *node, struct fat_node *new_node)
{
    179d:	55                   	push   ebp
    179e:	89 e5                	mov    ebp,esp
    17a0:	e8 51 57 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    17a5:	05 83 97 00 00       	add    eax,0x9783
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:79
    FAT_ASSERT(list);
    FAT_ASSERT(node);
    FAT_ASSERT(new_node);

    new_node->previous = node;
    17aa:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    17ad:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    17b0:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:80
    new_node->next = node->next;
    17b2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    17b5:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    17b8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    17bb:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:81
    if (!node->next)
    17be:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    17c1:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    17c4:	85 c0                	test   eax,eax
    17c6:	75 0b                	jne    17d3 <fat_list_insert_after+0x36>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:82
        list->tail = new_node;
    17c8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    17cb:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    17ce:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
    17d1:	eb 0b                	jmp    17de <fat_list_insert_after+0x41>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:84
    else
        node->next->previous = new_node;
    17d3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    17d6:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    17d9:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    17dc:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:85
    node->next = new_node;
    17de:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    17e1:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    17e4:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:86
}
    17e7:	90                   	nop
    17e8:	5d                   	pop    ebp
    17e9:	c3                   	ret    

000017ea <fat_list_insert_before>:
fat_list_insert_before():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:91
//-----------------------------------------------------------------
// fat_list_insert_before:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_insert_before(struct fat_list *list, struct fat_node *node, struct fat_node *new_node)
{
    17ea:	55                   	push   ebp
    17eb:	89 e5                	mov    ebp,esp
    17ed:	e8 04 57 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    17f2:	05 36 97 00 00       	add    eax,0x9736
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:96
    FAT_ASSERT(list);
    FAT_ASSERT(node);
    FAT_ASSERT(new_node);

    new_node->previous = node->previous;
    17f7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    17fa:	8b 10                	mov    edx,DWORD PTR [eax]
    17fc:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    17ff:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:97
    new_node->next = node;
    1801:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    1804:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    1807:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:98
    if (!node->previous)
    180a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    180d:	8b 00                	mov    eax,DWORD PTR [eax]
    180f:	85 c0                	test   eax,eax
    1811:	75 0a                	jne    181d <fat_list_insert_before+0x33>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:99
        list->head = new_node;
    1813:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1816:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    1819:	89 10                	mov    DWORD PTR [eax],edx
    181b:	eb 0b                	jmp    1828 <fat_list_insert_before+0x3e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:101
    else
        node->previous->next = new_node;
    181d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1820:	8b 00                	mov    eax,DWORD PTR [eax]
    1822:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    1825:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:102
    node->previous = new_node;
    1828:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    182b:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    182e:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:103
}
    1830:	90                   	nop
    1831:	5d                   	pop    ebp
    1832:	c3                   	ret    

00001833 <fat_list_insert_first>:
fat_list_insert_first():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:108
//-----------------------------------------------------------------
// fat_list_insert_first:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_insert_first(struct fat_list *list, struct fat_node *node)
{
    1833:	55                   	push   ebp
    1834:	89 e5                	mov    ebp,esp
    1836:	e8 bb 56 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    183b:	05 ed 96 00 00       	add    eax,0x96ed
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:112
    FAT_ASSERT(list);
    FAT_ASSERT(node);

    if (!list->head)
    1840:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1843:	8b 00                	mov    eax,DWORD PTR [eax]
    1845:	85 c0                	test   eax,eax
    1847:	75 26                	jne    186f <fat_list_insert_first+0x3c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:114
    {
        list->head = node;
    1849:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    184c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    184f:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:115
        list->tail = node;
    1851:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1854:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    1857:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:116
        node->previous = 0;
    185a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    185d:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:117
        node->next = 0;
    1863:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1866:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:121
    }
    else
        fat_list_insert_before(list, list->head, node);
}
    186d:	eb 14                	jmp    1883 <fat_list_insert_first+0x50>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:120
        list->tail = node;
        node->previous = 0;
        node->next = 0;
    }
    else
        fat_list_insert_before(list, list->head, node);
    186f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1872:	8b 00                	mov    eax,DWORD PTR [eax]
    1874:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    1877:	50                   	push   eax
    1878:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    187b:	e8 6a ff ff ff       	call   17ea <fat_list_insert_before>
    1880:	83 c4 0c             	add    esp,0xc
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:121
}
    1883:	90                   	nop
    1884:	c9                   	leave  
    1885:	c3                   	ret    

00001886 <fat_list_insert_last>:
fat_list_insert_last():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:126
//-----------------------------------------------------------------
// fat_list_insert_last:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_insert_last(struct fat_list *list, struct fat_node *node)
{
    1886:	55                   	push   ebp
    1887:	89 e5                	mov    ebp,esp
    1889:	e8 68 56 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    188e:	05 9a 96 00 00       	add    eax,0x969a
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:130
    FAT_ASSERT(list);
    FAT_ASSERT(node);

    if (!list->tail)
    1893:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1896:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    1899:	85 c0                	test   eax,eax
    189b:	75 10                	jne    18ad <fat_list_insert_last+0x27>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:131
        fat_list_insert_first(list, node);
    189d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    18a0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    18a3:	e8 8b ff ff ff       	call   1833 <fat_list_insert_first>
    18a8:	83 c4 08             	add    esp,0x8
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:134
     else
        fat_list_insert_after(list, list->tail, node);
}
    18ab:	eb 15                	jmp    18c2 <fat_list_insert_last+0x3c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:133
    FAT_ASSERT(node);

    if (!list->tail)
        fat_list_insert_first(list, node);
     else
        fat_list_insert_after(list, list->tail, node);
    18ad:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    18b0:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    18b3:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    18b6:	50                   	push   eax
    18b7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    18ba:	e8 de fe ff ff       	call   179d <fat_list_insert_after>
    18bf:	83 c4 0c             	add    esp,0xc
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:134
}
    18c2:	90                   	nop
    18c3:	c9                   	leave  
    18c4:	c3                   	ret    

000018c5 <fat_list_is_empty>:
fat_list_is_empty():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:139
//-----------------------------------------------------------------
// fat_list_is_empty:
//-----------------------------------------------------------------
static FAT_INLINE int fat_list_is_empty(struct fat_list *list)
{
    18c5:	55                   	push   ebp
    18c6:	89 e5                	mov    ebp,esp
    18c8:	e8 29 56 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    18cd:	05 5b 96 00 00       	add    eax,0x965b
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:142
    FAT_ASSERT(list);

    return !list->head;
    18d2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    18d5:	8b 00                	mov    eax,DWORD PTR [eax]
    18d7:	85 c0                	test   eax,eax
    18d9:	0f 94 c0             	sete   al
    18dc:	0f b6 c0             	movzx  eax,al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:143
}
    18df:	5d                   	pop    ebp
    18e0:	c3                   	ret    

000018e1 <fat_list_pop_head>:
fat_list_pop_head():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:148
//-----------------------------------------------------------------
// fat_list_pop_head:
//-----------------------------------------------------------------
static FAT_INLINE struct fat_node * fat_list_pop_head(struct fat_list *list)
{
    18e1:	55                   	push   ebp
    18e2:	89 e5                	mov    ebp,esp
    18e4:	83 ec 10             	sub    esp,0x10
    18e7:	e8 0a 56 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    18ec:	05 3c 96 00 00       	add    eax,0x963c
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:153
    struct fat_node * node;

    FAT_ASSERT(list);

    node = fat_list_first(list);
    18f1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    18f4:	8b 00                	mov    eax,DWORD PTR [eax]
    18f6:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:154
    if (node)
    18f9:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
    18fd:	74 0e                	je     190d <fat_list_pop_head+0x2c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:155
        fat_list_remove(list, node);
    18ff:	ff 75 fc             	push   DWORD PTR [ebp-0x4]
    1902:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1905:	e8 3b fe ff ff       	call   1745 <fat_list_remove>
    190a:	83 c4 08             	add    esp,0x8
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:157

    return node;
    190d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:158
}
    1910:	c9                   	leave  
    1911:	c3                   	ret    

00001912 <fatfs_cache_init>:
fatfs_cache_init():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_cache.c:43

//-----------------------------------------------------------------------------
// fatfs_cache_init:
//-----------------------------------------------------------------------------
int fatfs_cache_init(struct fatfs *fs, FL_FILE *file)
{
    1912:	55                   	push   ebp
    1913:	89 e5                	mov    ebp,esp
    1915:	e8 dc 55 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    191a:	05 0e 96 00 00       	add    eax,0x960e
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_cache.c:54
        file->cluster_cache_idx[i] = 0xFFFFFFFF; // Not used
        file->cluster_cache_data[i] = 0;
    }
#endif

    return 1;
    191f:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_cache.c:55
}
    1924:	5d                   	pop    ebp
    1925:	c3                   	ret    

00001926 <fatfs_cache_get_next_cluster>:
fatfs_cache_get_next_cluster():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_cache.c:60
//-----------------------------------------------------------------------------
// fatfs_cache_get_next_cluster:
//-----------------------------------------------------------------------------
int fatfs_cache_get_next_cluster(struct fatfs *fs, FL_FILE *file, uint32 clusterIdx, uint32 *pNextCluster)
{
    1926:	55                   	push   ebp
    1927:	89 e5                	mov    ebp,esp
    1929:	e8 c8 55 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    192e:	05 fa 95 00 00       	add    eax,0x95fa
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_cache.c:71
        *pNextCluster = file->cluster_cache_data[slot];
        return 1;
    }
#endif

    return 0;
    1933:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_cache.c:72
}
    1938:	5d                   	pop    ebp
    1939:	c3                   	ret    

0000193a <fatfs_cache_set_next_cluster>:
fatfs_cache_set_next_cluster():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_cache.c:77
//-----------------------------------------------------------------------------
// fatfs_cache_set_next_cluster:
//-----------------------------------------------------------------------------
int fatfs_cache_set_next_cluster(struct fatfs *fs, FL_FILE *file, uint32 clusterIdx, uint32 nextCluster)
{
    193a:	55                   	push   ebp
    193b:	89 e5                	mov    ebp,esp
    193d:	e8 b4 55 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    1942:	05 e6 95 00 00       	add    eax,0x95e6
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_cache.c:90
        file->cluster_cache_idx[slot] = clusterIdx;
        file->cluster_cache_data[slot] = nextCluster;
    }
#endif

    return 1;
    1947:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_cache.c:91
}
    194c:	5d                   	pop    ebp
    194d:	c3                   	ret    
    194e:	66 90                	xchg   ax,ax

00001950 <fat_list_init>:
fat_list_init():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:47

//-----------------------------------------------------------------
// fat_list_init:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_init(struct fat_list *list)
{
    1950:	55                   	push   ebp
    1951:	89 e5                	mov    ebp,esp
    1953:	e8 9e 55 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    1958:	05 d0 95 00 00       	add    eax,0x95d0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:50
    FAT_ASSERT(list);

    list->head = list->tail = 0;
    195d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1960:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
    1967:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    196a:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    196d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1970:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:51
}
    1972:	90                   	nop
    1973:	5d                   	pop    ebp
    1974:	c3                   	ret    

00001975 <fat_list_remove>:
fat_list_remove():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:56
//-----------------------------------------------------------------
// fat_list_remove:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_remove(struct fat_list *list, struct fat_node *node)
{
    1975:	55                   	push   ebp
    1976:	89 e5                	mov    ebp,esp
    1978:	e8 79 55 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    197d:	05 ab 95 00 00       	add    eax,0x95ab
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:60
    FAT_ASSERT(list);
    FAT_ASSERT(node);

    if(!node->previous)
    1982:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1985:	8b 00                	mov    eax,DWORD PTR [eax]
    1987:	85 c0                	test   eax,eax
    1989:	75 0d                	jne    1998 <fat_list_remove+0x23>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:61
        list->head = node->next;
    198b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    198e:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    1991:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1994:	89 10                	mov    DWORD PTR [eax],edx
    1996:	eb 0e                	jmp    19a6 <fat_list_remove+0x31>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:63
    else
        node->previous->next = node->next;
    1998:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    199b:	8b 00                	mov    eax,DWORD PTR [eax]
    199d:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    19a0:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
    19a3:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:65

    if(!node->next)
    19a6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    19a9:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    19ac:	85 c0                	test   eax,eax
    19ae:	75 0d                	jne    19bd <fat_list_remove+0x48>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:66
        list->tail = node->previous;
    19b0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    19b3:	8b 10                	mov    edx,DWORD PTR [eax]
    19b5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    19b8:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:69
    else
        node->next->previous = node->previous;
}
    19bb:	eb 0d                	jmp    19ca <fat_list_remove+0x55>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:68
        node->previous->next = node->next;

    if(!node->next)
        list->tail = node->previous;
    else
        node->next->previous = node->previous;
    19bd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    19c0:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    19c3:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    19c6:	8b 12                	mov    edx,DWORD PTR [edx]
    19c8:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:69
}
    19ca:	90                   	nop
    19cb:	5d                   	pop    ebp
    19cc:	c3                   	ret    

000019cd <fat_list_insert_after>:
fat_list_insert_after():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:74
//-----------------------------------------------------------------
// fat_list_insert_after:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_insert_after(struct fat_list *list, struct fat_node *node, struct fat_node *new_node)
{
    19cd:	55                   	push   ebp
    19ce:	89 e5                	mov    ebp,esp
    19d0:	e8 21 55 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    19d5:	05 53 95 00 00       	add    eax,0x9553
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:79
    FAT_ASSERT(list);
    FAT_ASSERT(node);
    FAT_ASSERT(new_node);

    new_node->previous = node;
    19da:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    19dd:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    19e0:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:80
    new_node->next = node->next;
    19e2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    19e5:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    19e8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    19eb:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:81
    if (!node->next)
    19ee:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    19f1:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    19f4:	85 c0                	test   eax,eax
    19f6:	75 0b                	jne    1a03 <fat_list_insert_after+0x36>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:82
        list->tail = new_node;
    19f8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    19fb:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    19fe:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
    1a01:	eb 0b                	jmp    1a0e <fat_list_insert_after+0x41>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:84
    else
        node->next->previous = new_node;
    1a03:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1a06:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    1a09:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    1a0c:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:85
    node->next = new_node;
    1a0e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1a11:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    1a14:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:86
}
    1a17:	90                   	nop
    1a18:	5d                   	pop    ebp
    1a19:	c3                   	ret    

00001a1a <fat_list_insert_before>:
fat_list_insert_before():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:91
//-----------------------------------------------------------------
// fat_list_insert_before:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_insert_before(struct fat_list *list, struct fat_node *node, struct fat_node *new_node)
{
    1a1a:	55                   	push   ebp
    1a1b:	89 e5                	mov    ebp,esp
    1a1d:	e8 d4 54 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    1a22:	05 06 95 00 00       	add    eax,0x9506
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:96
    FAT_ASSERT(list);
    FAT_ASSERT(node);
    FAT_ASSERT(new_node);

    new_node->previous = node->previous;
    1a27:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1a2a:	8b 10                	mov    edx,DWORD PTR [eax]
    1a2c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    1a2f:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:97
    new_node->next = node;
    1a31:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    1a34:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    1a37:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:98
    if (!node->previous)
    1a3a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1a3d:	8b 00                	mov    eax,DWORD PTR [eax]
    1a3f:	85 c0                	test   eax,eax
    1a41:	75 0a                	jne    1a4d <fat_list_insert_before+0x33>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:99
        list->head = new_node;
    1a43:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1a46:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    1a49:	89 10                	mov    DWORD PTR [eax],edx
    1a4b:	eb 0b                	jmp    1a58 <fat_list_insert_before+0x3e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:101
    else
        node->previous->next = new_node;
    1a4d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1a50:	8b 00                	mov    eax,DWORD PTR [eax]
    1a52:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    1a55:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:102
    node->previous = new_node;
    1a58:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1a5b:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    1a5e:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:103
}
    1a60:	90                   	nop
    1a61:	5d                   	pop    ebp
    1a62:	c3                   	ret    

00001a63 <fat_list_insert_first>:
fat_list_insert_first():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:108
//-----------------------------------------------------------------
// fat_list_insert_first:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_insert_first(struct fat_list *list, struct fat_node *node)
{
    1a63:	55                   	push   ebp
    1a64:	89 e5                	mov    ebp,esp
    1a66:	e8 8b 54 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    1a6b:	05 bd 94 00 00       	add    eax,0x94bd
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:112
    FAT_ASSERT(list);
    FAT_ASSERT(node);

    if (!list->head)
    1a70:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1a73:	8b 00                	mov    eax,DWORD PTR [eax]
    1a75:	85 c0                	test   eax,eax
    1a77:	75 26                	jne    1a9f <fat_list_insert_first+0x3c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:114
    {
        list->head = node;
    1a79:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1a7c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    1a7f:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:115
        list->tail = node;
    1a81:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1a84:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    1a87:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:116
        node->previous = 0;
    1a8a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1a8d:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:117
        node->next = 0;
    1a93:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1a96:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:121
    }
    else
        fat_list_insert_before(list, list->head, node);
}
    1a9d:	eb 14                	jmp    1ab3 <fat_list_insert_first+0x50>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:120
        list->tail = node;
        node->previous = 0;
        node->next = 0;
    }
    else
        fat_list_insert_before(list, list->head, node);
    1a9f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1aa2:	8b 00                	mov    eax,DWORD PTR [eax]
    1aa4:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    1aa7:	50                   	push   eax
    1aa8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1aab:	e8 6a ff ff ff       	call   1a1a <fat_list_insert_before>
    1ab0:	83 c4 0c             	add    esp,0xc
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:121
}
    1ab3:	90                   	nop
    1ab4:	c9                   	leave  
    1ab5:	c3                   	ret    

00001ab6 <fat_list_insert_last>:
fat_list_insert_last():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:126
//-----------------------------------------------------------------
// fat_list_insert_last:
//-----------------------------------------------------------------
static FAT_INLINE void fat_list_insert_last(struct fat_list *list, struct fat_node *node)
{
    1ab6:	55                   	push   ebp
    1ab7:	89 e5                	mov    ebp,esp
    1ab9:	e8 38 54 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    1abe:	05 6a 94 00 00       	add    eax,0x946a
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:130
    FAT_ASSERT(list);
    FAT_ASSERT(node);

    if (!list->tail)
    1ac3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1ac6:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    1ac9:	85 c0                	test   eax,eax
    1acb:	75 10                	jne    1add <fat_list_insert_last+0x27>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:131
        fat_list_insert_first(list, node);
    1acd:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    1ad0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1ad3:	e8 8b ff ff ff       	call   1a63 <fat_list_insert_first>
    1ad8:	83 c4 08             	add    esp,0x8
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:134
     else
        fat_list_insert_after(list, list->tail, node);
}
    1adb:	eb 15                	jmp    1af2 <fat_list_insert_last+0x3c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:133
    FAT_ASSERT(node);

    if (!list->tail)
        fat_list_insert_first(list, node);
     else
        fat_list_insert_after(list, list->tail, node);
    1add:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1ae0:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    1ae3:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    1ae6:	50                   	push   eax
    1ae7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1aea:	e8 de fe ff ff       	call   19cd <fat_list_insert_after>
    1aef:	83 c4 0c             	add    esp,0xc
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:134
}
    1af2:	90                   	nop
    1af3:	c9                   	leave  
    1af4:	c3                   	ret    

00001af5 <fat_list_is_empty>:
fat_list_is_empty():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:139
//-----------------------------------------------------------------
// fat_list_is_empty:
//-----------------------------------------------------------------
static FAT_INLINE int fat_list_is_empty(struct fat_list *list)
{
    1af5:	55                   	push   ebp
    1af6:	89 e5                	mov    ebp,esp
    1af8:	e8 f9 53 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    1afd:	05 2b 94 00 00       	add    eax,0x942b
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:142
    FAT_ASSERT(list);

    return !list->head;
    1b02:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1b05:	8b 00                	mov    eax,DWORD PTR [eax]
    1b07:	85 c0                	test   eax,eax
    1b09:	0f 94 c0             	sete   al
    1b0c:	0f b6 c0             	movzx  eax,al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:143
}
    1b0f:	5d                   	pop    ebp
    1b10:	c3                   	ret    

00001b11 <fat_list_pop_head>:
fat_list_pop_head():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:148
//-----------------------------------------------------------------
// fat_list_pop_head:
//-----------------------------------------------------------------
static FAT_INLINE struct fat_node * fat_list_pop_head(struct fat_list *list)
{
    1b11:	55                   	push   ebp
    1b12:	89 e5                	mov    ebp,esp
    1b14:	83 ec 10             	sub    esp,0x10
    1b17:	e8 da 53 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    1b1c:	05 0c 94 00 00       	add    eax,0x940c
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:153
    struct fat_node * node;

    FAT_ASSERT(list);

    node = fat_list_first(list);
    1b21:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1b24:	8b 00                	mov    eax,DWORD PTR [eax]
    1b26:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:154
    if (node)
    1b29:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
    1b2d:	74 0e                	je     1b3d <fat_list_pop_head+0x2c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:155
        fat_list_remove(list, node);
    1b2f:	ff 75 fc             	push   DWORD PTR [ebp-0x4]
    1b32:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1b35:	e8 3b fe ff ff       	call   1975 <fat_list_remove>
    1b3a:	83 c4 08             	add    esp,0x8
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:157

    return node;
    1b3d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_list.h:158
}
    1b40:	c9                   	leave  
    1b41:	c3                   	ret    

00001b42 <_allocate_file>:
_allocate_file():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:72

//-----------------------------------------------------------------------------
// _allocate_file: Find a slot in the open files buffer for a new file
//-----------------------------------------------------------------------------
static FL_FILE* _allocate_file(void)
{
    1b42:	55                   	push   ebp
    1b43:	89 e5                	mov    ebp,esp
    1b45:	53                   	push   ebx
    1b46:	83 ec 10             	sub    esp,0x10
    1b49:	e8 ac 53 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    1b4e:	81 c3 da 93 00 00    	add    ebx,0x93da
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:74
    // Allocate free file
    struct fat_node *node = fat_list_pop_head(&_free_file_list);
    1b54:	8d 83 68 46 00 00    	lea    eax,[ebx+0x4668]
    1b5a:	50                   	push   eax
    1b5b:	e8 b1 ff ff ff       	call   1b11 <fat_list_pop_head>
    1b60:	83 c4 04             	add    esp,0x4
    1b63:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:77

    // Add to open list
    if (node)
    1b66:	83 7d f8 00          	cmp    DWORD PTR [ebp-0x8],0x0
    1b6a:	74 12                	je     1b7e <_allocate_file+0x3c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:78
        fat_list_insert_last(&_open_file_list, node);
    1b6c:	ff 75 f8             	push   DWORD PTR [ebp-0x8]
    1b6f:	8d 83 60 46 00 00    	lea    eax,[ebx+0x4660]
    1b75:	50                   	push   eax
    1b76:	e8 3b ff ff ff       	call   1ab6 <fat_list_insert_last>
    1b7b:	83 c4 08             	add    esp,0x8
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:80

    return fat_list_entry(node, FL_FILE, list_node);
    1b7e:	83 7d f8 00          	cmp    DWORD PTR [ebp-0x8],0x0
    1b82:	74 0a                	je     1b8e <_allocate_file+0x4c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:80 (discriminator 1)
    1b84:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    1b87:	2d 34 03 00 00       	sub    eax,0x334
    1b8c:	eb 05                	jmp    1b93 <_allocate_file+0x51>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:80 (discriminator 2)
    1b8e:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:81 (discriminator 5)
}
    1b93:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1b96:	c9                   	leave  
    1b97:	c3                   	ret    

00001b98 <_check_file_open>:
_check_file_open():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:86
//-----------------------------------------------------------------------------
// _check_file_open: Returns true if the file is already open
//-----------------------------------------------------------------------------
static int _check_file_open(FL_FILE* file)
{
    1b98:	55                   	push   ebp
    1b99:	89 e5                	mov    ebp,esp
    1b9b:	53                   	push   ebx
    1b9c:	83 ec 14             	sub    esp,0x14
    1b9f:	e8 56 53 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    1ba4:	81 c3 84 93 00 00    	add    ebx,0x9384
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:90
    struct fat_node *node;

    // Compare open files
    fat_list_for_each(&_open_file_list, node)
    1baa:	8b 83 60 46 00 00    	mov    eax,DWORD PTR [ebx+0x4660]
    1bb0:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    1bb3:	eb 6f                	jmp    1c24 <_check_file_open+0x8c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:92
    {
        FL_FILE* openFile = fat_list_entry(node, FL_FILE, list_node);
    1bb5:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    1bb9:	74 0a                	je     1bc5 <_check_file_open+0x2d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:92 (discriminator 1)
    1bbb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    1bbe:	2d 34 03 00 00       	sub    eax,0x334
    1bc3:	eb 05                	jmp    1bca <_check_file_open+0x32>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:92 (discriminator 2)
    1bc5:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:92 (discriminator 4)
    1bca:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:95 (discriminator 4)

        // If not the current file
        if (openFile != file)
    1bcd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    1bd0:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
    1bd3:	74 46                	je     1c1b <_check_file_open+0x83>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:98
        {
            // Compare path and name
            if ( (fatfs_compare_names(openFile->path,file->path)) && (fatfs_compare_names(openFile->filename,file->filename)) )
    1bd5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1bd8:	8d 50 14             	lea    edx,[eax+0x14]
    1bdb:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    1bde:	83 c0 14             	add    eax,0x14
    1be1:	83 ec 08             	sub    esp,0x8
    1be4:	52                   	push   edx
    1be5:	50                   	push   eax
    1be6:	e8 15 54 00 00       	call   7000 <__x86.get_pc_thunk.bx+0x106>
    1beb:	83 c4 10             	add    esp,0x10
    1bee:	85 c0                	test   eax,eax
    1bf0:	74 29                	je     1c1b <_check_file_open+0x83>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:98 (discriminator 1)
    1bf2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1bf5:	8d 90 94 00 00 00    	lea    edx,[eax+0x94]
    1bfb:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    1bfe:	05 94 00 00 00       	add    eax,0x94
    1c03:	83 ec 08             	sub    esp,0x8
    1c06:	52                   	push   edx
    1c07:	50                   	push   eax
    1c08:	e8 f3 53 00 00       	call   7000 <__x86.get_pc_thunk.bx+0x106>
    1c0d:	83 c4 10             	add    esp,0x10
    1c10:	85 c0                	test   eax,eax
    1c12:	74 07                	je     1c1b <_check_file_open+0x83>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:99
                return 1;
    1c14:	b8 01 00 00 00       	mov    eax,0x1
    1c19:	eb 14                	jmp    1c2f <_check_file_open+0x97>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:90 (discriminator 2)
static int _check_file_open(FL_FILE* file)
{
    struct fat_node *node;

    // Compare open files
    fat_list_for_each(&_open_file_list, node)
    1c1b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    1c1e:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    1c21:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:90 (discriminator 1)
    1c24:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    1c28:	75 8b                	jne    1bb5 <_check_file_open+0x1d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:103
            if ( (fatfs_compare_names(openFile->path,file->path)) && (fatfs_compare_names(openFile->filename,file->filename)) )
                return 1;
        }
    }

    return 0;
    1c2a:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:104
}
    1c2f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1c32:	c9                   	leave  
    1c33:	c3                   	ret    

00001c34 <_free_file>:
_free_file():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:109
//-----------------------------------------------------------------------------
// _free_file: Free open file handle
//-----------------------------------------------------------------------------
static void _free_file(FL_FILE* file)
{
    1c34:	55                   	push   ebp
    1c35:	89 e5                	mov    ebp,esp
    1c37:	53                   	push   ebx
    1c38:	e8 bd 52 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    1c3d:	81 c3 eb 92 00 00    	add    ebx,0x92eb
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:111
    // Remove from open list
    fat_list_remove(&_open_file_list, &file->list_node);
    1c43:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1c46:	05 34 03 00 00       	add    eax,0x334
    1c4b:	50                   	push   eax
    1c4c:	8d 83 60 46 00 00    	lea    eax,[ebx+0x4660]
    1c52:	50                   	push   eax
    1c53:	e8 1d fd ff ff       	call   1975 <fat_list_remove>
    1c58:	83 c4 08             	add    esp,0x8
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:114

    // Add to free list
    fat_list_insert_last(&_free_file_list, &file->list_node);
    1c5b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1c5e:	05 34 03 00 00       	add    eax,0x334
    1c63:	50                   	push   eax
    1c64:	8d 83 68 46 00 00    	lea    eax,[ebx+0x4668]
    1c6a:	50                   	push   eax
    1c6b:	e8 46 fe ff ff       	call   1ab6 <fat_list_insert_last>
    1c70:	83 c4 08             	add    esp,0x8
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:115
}
    1c73:	90                   	nop
    1c74:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1c77:	c9                   	leave  
    1c78:	c3                   	ret    

00001c79 <_open_directory>:
_open_directory():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:126
//-----------------------------------------------------------------------------
// _open_directory: Cycle through path string to find the start cluster
// address of the highest subdir.
//-----------------------------------------------------------------------------
static int _open_directory(char *path, uint32 *pathCluster)
{
    1c79:	55                   	push   ebp
    1c7a:	89 e5                	mov    ebp,esp
    1c7c:	53                   	push   ebx
    1c7d:	81 ec b4 00 00 00    	sub    esp,0xb4
    1c83:	e8 72 52 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    1c88:	81 c3 a0 92 00 00    	add    ebx,0x92a0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:134
    char currentfolder[FATFS_MAX_LONG_FILENAME];
    struct fat_dir_entry sfEntry;
    uint32 startcluster;

    // Set starting cluster to root cluster
    startcluster = fatfs_get_root_cluster(&_fs);
    1c8e:	83 ec 0c             	sub    esp,0xc
    1c91:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    1c97:	50                   	push   eax
    1c98:	e8 53 55 00 00       	call   71f0 <__x86.get_pc_thunk.bx+0x2f6>
    1c9d:	83 c4 10             	add    esp,0x10
    1ca0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:137

    // Find number of levels
    levels = fatfs_total_path_levels(path);
    1ca3:	83 ec 0c             	sub    esp,0xc
    1ca6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1ca9:	e8 72 53 00 00       	call   7020 <__x86.get_pc_thunk.bx+0x126>
    1cae:	83 c4 10             	add    esp,0x10
    1cb1:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:140

    // Cycle through each level and get the start sector
    for (sublevel=0;sublevel<(levels+1);sublevel++)
    1cb4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    1cbb:	e9 95 00 00 00       	jmp    1d55 <_open_directory+0xdc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:142
    {
        if (fatfs_get_substring(path, sublevel, currentfolder, sizeof(currentfolder)) == -1)
    1cc0:	68 80 00 00 00       	push   0x80
    1cc5:	8d 85 6c ff ff ff    	lea    eax,[ebp-0x94]
    1ccb:	50                   	push   eax
    1ccc:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    1ccf:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1cd2:	e8 39 56 00 00       	call   7310 <__x86.get_pc_thunk.bx+0x416>
    1cd7:	83 c4 10             	add    esp,0x10
    1cda:	83 f8 ff             	cmp    eax,0xffffffff
    1cdd:	75 0a                	jne    1ce9 <_open_directory+0x70>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:143
            return 0;
    1cdf:	b8 00 00 00 00       	mov    eax,0x0
    1ce4:	e9 88 00 00 00       	jmp    1d71 <_open_directory+0xf8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:146

        // Find clusteraddress for folder (currentfolder)
        if (fatfs_get_file_entry(&_fs, startcluster, currentfolder,&sfEntry))
    1ce9:	8d 85 4c ff ff ff    	lea    eax,[ebp-0xb4]
    1cef:	50                   	push   eax
    1cf0:	8d 85 6c ff ff ff    	lea    eax,[ebp-0x94]
    1cf6:	50                   	push   eax
    1cf7:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    1cfa:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    1d00:	50                   	push   eax
    1d01:	e8 9a 55 00 00       	call   72a0 <__x86.get_pc_thunk.bx+0x3a6>
    1d06:	83 c4 10             	add    esp,0x10
    1d09:	85 c0                	test   eax,eax
    1d0b:	74 3d                	je     1d4a <_open_directory+0xd1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:149
        {
            // Check entry is folder
            if (fatfs_entry_is_dir(&sfEntry))
    1d0d:	83 ec 0c             	sub    esp,0xc
    1d10:	8d 85 4c ff ff ff    	lea    eax,[ebp-0xb4]
    1d16:	50                   	push   eax
    1d17:	e8 d4 53 00 00       	call   70f0 <__x86.get_pc_thunk.bx+0x1f6>
    1d1c:	83 c4 10             	add    esp,0x10
    1d1f:	85 c0                	test   eax,eax
    1d21:	74 20                	je     1d43 <_open_directory+0xca>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:150
                startcluster = ((FAT_HTONS((uint32)sfEntry.FstClusHI))<<16) + FAT_HTONS(sfEntry.FstClusLO);
    1d23:	0f b7 85 60 ff ff ff 	movzx  eax,WORD PTR [ebp-0xa0]
    1d2a:	0f b7 c0             	movzx  eax,ax
    1d2d:	c1 e0 10             	shl    eax,0x10
    1d30:	89 c2                	mov    edx,eax
    1d32:	0f b7 85 66 ff ff ff 	movzx  eax,WORD PTR [ebp-0x9a]
    1d39:	0f b7 c0             	movzx  eax,ax
    1d3c:	01 d0                	add    eax,edx
    1d3e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
    1d41:	eb 0e                	jmp    1d51 <_open_directory+0xd8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:152
            else
                return 0;
    1d43:	b8 00 00 00 00       	mov    eax,0x0
    1d48:	eb 27                	jmp    1d71 <_open_directory+0xf8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:155
        }
        else
            return 0;
    1d4a:	b8 00 00 00 00       	mov    eax,0x0
    1d4f:	eb 20                	jmp    1d71 <_open_directory+0xf8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:140 (discriminator 2)

    // Find number of levels
    levels = fatfs_total_path_levels(path);

    // Cycle through each level and get the start sector
    for (sublevel=0;sublevel<(levels+1);sublevel++)
    1d51:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:140 (discriminator 1)
    1d55:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1d58:	83 c0 01             	add    eax,0x1
    1d5b:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    1d5e:	0f 8f 5c ff ff ff    	jg     1cc0 <_open_directory+0x47>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:158
        }
        else
            return 0;
    }

    *pathCluster = startcluster;
    1d64:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1d67:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    1d6a:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:159
    return 1;
    1d6c:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:160 (discriminator 1)
}
    1d71:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1d74:	c9                   	leave  
    1d75:	c3                   	ret    

00001d76 <_create_directory>:
_create_directory():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:166
//-----------------------------------------------------------------------------
// _create_directory: Cycle through path string and create the end directory
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
static int _create_directory(char *path)
{
    1d76:	55                   	push   ebp
    1d77:	89 e5                	mov    ebp,esp
    1d79:	56                   	push   esi
    1d7a:	53                   	push   ebx
    1d7b:	83 ec 40             	sub    esp,0x40
    1d7e:	e8 77 51 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    1d83:	81 c3 a5 91 00 00    	add    ebx,0x91a5
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:170
    FL_FILE* file;
    struct fat_dir_entry sfEntry;
    char shortFilename[FAT_SFN_SIZE_FULL];
    int tailNum = 0;
    1d89:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:174
    int i;

    // Allocate a new file handle
    file = _allocate_file();
    1d90:	e8 ad fd ff ff       	call   1b42 <_allocate_file>
    1d95:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:175
    if (!file)
    1d98:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
    1d9c:	75 0a                	jne    1da8 <_create_directory+0x32>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:176
        return 0;
    1d9e:	b8 00 00 00 00       	mov    eax,0x0
    1da3:	e9 a6 03 00 00       	jmp    214e <_create_directory+0x3d8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:179

    // Clear filename
    memset(file->path, '\0', sizeof(file->path));
    1da8:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1dab:	83 c0 14             	add    eax,0x14
    1dae:	83 ec 04             	sub    esp,0x4
    1db1:	68 80 00 00 00       	push   0x80
    1db6:	6a 00                	push   0x0
    1db8:	50                   	push   eax
    1db9:	e8 82 54 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    1dbe:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:180
    memset(file->filename, '\0', sizeof(file->filename));
    1dc1:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1dc4:	05 94 00 00 00       	add    eax,0x94
    1dc9:	83 ec 04             	sub    esp,0x4
    1dcc:	68 80 00 00 00       	push   0x80
    1dd1:	6a 00                	push   0x0
    1dd3:	50                   	push   eax
    1dd4:	e8 67 54 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    1dd9:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:183

    // Split full path into filename and directory path
    if (fatfs_split_path((char*)path, file->path, sizeof(file->path), file->filename, sizeof(file->filename)) == -1)
    1ddc:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1ddf:	8d 90 94 00 00 00    	lea    edx,[eax+0x94]
    1de5:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1de8:	83 c0 14             	add    eax,0x14
    1deb:	83 ec 0c             	sub    esp,0xc
    1dee:	68 80 00 00 00       	push   0x80
    1df3:	52                   	push   edx
    1df4:	68 80 00 00 00       	push   0x80
    1df9:	50                   	push   eax
    1dfa:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1dfd:	e8 5e 52 00 00       	call   7060 <__x86.get_pc_thunk.bx+0x166>
    1e02:	83 c4 20             	add    esp,0x20
    1e05:	83 f8 ff             	cmp    eax,0xffffffff
    1e08:	75 18                	jne    1e22 <_create_directory+0xac>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:185
    {
        _free_file(file);
    1e0a:	83 ec 0c             	sub    esp,0xc
    1e0d:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    1e10:	e8 1f fe ff ff       	call   1c34 <_free_file>
    1e15:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:186
        return 0;
    1e18:	b8 00 00 00 00       	mov    eax,0x0
    1e1d:	e9 2c 03 00 00       	jmp    214e <_create_directory+0x3d8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:190
    }

    // Check if file already open
    if (_check_file_open(file))
    1e22:	83 ec 0c             	sub    esp,0xc
    1e25:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    1e28:	e8 6b fd ff ff       	call   1b98 <_check_file_open>
    1e2d:	83 c4 10             	add    esp,0x10
    1e30:	85 c0                	test   eax,eax
    1e32:	74 18                	je     1e4c <_create_directory+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:192
    {
        _free_file(file);
    1e34:	83 ec 0c             	sub    esp,0xc
    1e37:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    1e3a:	e8 f5 fd ff ff       	call   1c34 <_free_file>
    1e3f:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:193
        return 0;
    1e42:	b8 00 00 00 00       	mov    eax,0x0
    1e47:	e9 02 03 00 00       	jmp    214e <_create_directory+0x3d8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:197
    }

    // If file is in the root dir
    if (file->path[0] == 0)
    1e4c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1e4f:	0f b6 40 14          	movzx  eax,BYTE PTR [eax+0x14]
    1e53:	84 c0                	test   al,al
    1e55:	75 1b                	jne    1e72 <_create_directory+0xfc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:198
        file->parentcluster = fatfs_get_root_cluster(&_fs);
    1e57:	83 ec 0c             	sub    esp,0xc
    1e5a:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    1e60:	50                   	push   eax
    1e61:	e8 8a 53 00 00       	call   71f0 <__x86.get_pc_thunk.bx+0x2f6>
    1e66:	83 c4 10             	add    esp,0x10
    1e69:	89 c2                	mov    edx,eax
    1e6b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1e6e:	89 10                	mov    DWORD PTR [eax],edx
    1e70:	eb 32                	jmp    1ea4 <_create_directory+0x12e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:202
    else
    {
        // Find parent directory start cluster
        if (!_open_directory(file->path, &file->parentcluster))
    1e72:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1e75:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    1e78:	83 c2 14             	add    edx,0x14
    1e7b:	83 ec 08             	sub    esp,0x8
    1e7e:	50                   	push   eax
    1e7f:	52                   	push   edx
    1e80:	e8 f4 fd ff ff       	call   1c79 <_open_directory>
    1e85:	83 c4 10             	add    esp,0x10
    1e88:	85 c0                	test   eax,eax
    1e8a:	75 18                	jne    1ea4 <_create_directory+0x12e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:204
        {
            _free_file(file);
    1e8c:	83 ec 0c             	sub    esp,0xc
    1e8f:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    1e92:	e8 9d fd ff ff       	call   1c34 <_free_file>
    1e97:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:205
            return 0;
    1e9a:	b8 00 00 00 00       	mov    eax,0x0
    1e9f:	e9 aa 02 00 00       	jmp    214e <_create_directory+0x3d8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:210
        }
    }

    // Check if same filename exists in directory
    if (fatfs_get_file_entry(&_fs, file->parentcluster, file->filename,&sfEntry) == 1)
    1ea4:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1ea7:	8d 88 94 00 00 00    	lea    ecx,[eax+0x94]
    1ead:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1eb0:	8b 00                	mov    eax,DWORD PTR [eax]
    1eb2:	8d 55 cc             	lea    edx,[ebp-0x34]
    1eb5:	52                   	push   edx
    1eb6:	51                   	push   ecx
    1eb7:	50                   	push   eax
    1eb8:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    1ebe:	50                   	push   eax
    1ebf:	e8 dc 53 00 00       	call   72a0 <__x86.get_pc_thunk.bx+0x3a6>
    1ec4:	83 c4 10             	add    esp,0x10
    1ec7:	83 f8 01             	cmp    eax,0x1
    1eca:	75 18                	jne    1ee4 <_create_directory+0x16e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:212
    {
        _free_file(file);
    1ecc:	83 ec 0c             	sub    esp,0xc
    1ecf:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    1ed2:	e8 5d fd ff ff       	call   1c34 <_free_file>
    1ed7:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:213
        return 0;
    1eda:	b8 00 00 00 00       	mov    eax,0x0
    1edf:	e9 6a 02 00 00       	jmp    214e <_create_directory+0x3d8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:216
    }

    file->startcluster = 0;
    1ee4:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1ee7:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:219

    // Create the file space for the folder (at least one clusters worth!)
    if (!fatfs_allocate_free_space(&_fs, 1, &file->startcluster, 1))
    1eee:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1ef1:	83 c0 04             	add    eax,0x4
    1ef4:	6a 01                	push   0x1
    1ef6:	50                   	push   eax
    1ef7:	6a 01                	push   0x1
    1ef9:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    1eff:	50                   	push   eax
    1f00:	e8 6b 54 00 00       	call   7370 <__x86.get_pc_thunk.bx+0x476>
    1f05:	83 c4 10             	add    esp,0x10
    1f08:	85 c0                	test   eax,eax
    1f0a:	75 18                	jne    1f24 <_create_directory+0x1ae>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:221
    {
        _free_file(file);
    1f0c:	83 ec 0c             	sub    esp,0xc
    1f0f:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    1f12:	e8 1d fd ff ff       	call   1c34 <_free_file>
    1f17:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:222
        return 0;
    1f1a:	b8 00 00 00 00       	mov    eax,0x0
    1f1f:	e9 2a 02 00 00       	jmp    214e <_create_directory+0x3d8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:226
    }

    // Erase new directory cluster
    memset(file->file_data_sector, 0x00, FAT_SECTOR_SIZE);
    1f24:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1f27:	05 28 01 00 00       	add    eax,0x128
    1f2c:	83 ec 04             	sub    esp,0x4
    1f2f:	68 00 02 00 00       	push   0x200
    1f34:	6a 00                	push   0x0
    1f36:	50                   	push   eax
    1f37:	e8 04 53 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    1f3c:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:227
    for (i=0;i<_fs.sectors_per_cluster;i++)
    1f3f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
    1f46:	eb 44                	jmp    1f8c <_create_directory+0x216>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:229
    {
        if (!fatfs_write_sector(&_fs, file->startcluster, i, file->file_data_sector))
    1f48:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1f4b:	8d 88 28 01 00 00    	lea    ecx,[eax+0x128]
    1f51:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    1f54:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1f57:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    1f5a:	51                   	push   ecx
    1f5b:	52                   	push   edx
    1f5c:	50                   	push   eax
    1f5d:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    1f63:	50                   	push   eax
    1f64:	e8 17 54 00 00       	call   7380 <__x86.get_pc_thunk.bx+0x486>
    1f69:	83 c4 10             	add    esp,0x10
    1f6c:	85 c0                	test   eax,eax
    1f6e:	75 18                	jne    1f88 <_create_directory+0x212>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:231
        {
            _free_file(file);
    1f70:	83 ec 0c             	sub    esp,0xc
    1f73:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    1f76:	e8 b9 fc ff ff       	call   1c34 <_free_file>
    1f7b:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:232
            return 0;
    1f7e:	b8 00 00 00 00       	mov    eax,0x0
    1f83:	e9 c6 01 00 00       	jmp    214e <_create_directory+0x3d8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:227 (discriminator 2)
        return 0;
    }

    // Erase new directory cluster
    memset(file->file_data_sector, 0x00, FAT_SECTOR_SIZE);
    for (i=0;i<_fs.sectors_per_cluster;i++)
    1f88:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:227 (discriminator 1)
    1f8c:	0f b6 83 f8 41 00 00 	movzx  eax,BYTE PTR [ebx+0x41f8]
    1f93:	0f b6 c0             	movzx  eax,al
    1f96:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
    1f99:	7f ad                	jg     1f48 <_create_directory+0x1d2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:239
    }

#if FATFS_INC_LFN_SUPPORT

    // Generate a short filename & tail
    tailNum = 0;
    1f9b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:243
    do
    {
        // Create a standard short filename (without tail)
        fatfs_lfn_create_sfn(shortFilename, file->filename);
    1fa2:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1fa5:	05 94 00 00 00       	add    eax,0x94
    1faa:	83 ec 08             	sub    esp,0x8
    1fad:	50                   	push   eax
    1fae:	8d 45 c1             	lea    eax,[ebp-0x3f]
    1fb1:	50                   	push   eax
    1fb2:	e8 49 53 00 00       	call   7300 <__x86.get_pc_thunk.bx+0x406>
    1fb7:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:246

        // If second hit or more, generate a ~n tail
        if (tailNum != 0)
    1fba:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    1fbe:	74 1f                	je     1fdf <_create_directory+0x269>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:247
            fatfs_lfn_generate_tail((char*)file->shortfilename, shortFilename, tailNum);
    1fc0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    1fc3:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    1fc6:	81 c2 14 01 00 00    	add    edx,0x114
    1fcc:	83 ec 04             	sub    esp,0x4
    1fcf:	50                   	push   eax
    1fd0:	8d 45 c1             	lea    eax,[ebp-0x3f]
    1fd3:	50                   	push   eax
    1fd4:	52                   	push   edx
    1fd5:	e8 d6 50 00 00       	call   70b0 <__x86.get_pc_thunk.bx+0x1b6>
    1fda:	83 c4 10             	add    esp,0x10
    1fdd:	eb 1b                	jmp    1ffa <_create_directory+0x284>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:250
        // Try with no tail if first entry
        else
            memcpy(file->shortfilename, shortFilename, FAT_SFN_SIZE_FULL);
    1fdf:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1fe2:	8d 90 14 01 00 00    	lea    edx,[eax+0x114]
    1fe8:	83 ec 04             	sub    esp,0x4
    1feb:	6a 0b                	push   0xb
    1fed:	8d 45 c1             	lea    eax,[ebp-0x3f]
    1ff0:	50                   	push   eax
    1ff1:	52                   	push   edx
    1ff2:	e8 c9 4f 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
    1ff7:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:253

        // Check if entry exists already or not
        if (fatfs_sfn_exists(&_fs, file->parentcluster, (char*)file->shortfilename) == 0)
    1ffa:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1ffd:	8d 90 14 01 00 00    	lea    edx,[eax+0x114]
    2003:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    2006:	8b 00                	mov    eax,DWORD PTR [eax]
    2008:	83 ec 04             	sub    esp,0x4
    200b:	52                   	push   edx
    200c:	50                   	push   eax
    200d:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2013:	50                   	push   eax
    2014:	e8 37 50 00 00       	call   7050 <__x86.get_pc_thunk.bx+0x156>
    2019:	83 c4 10             	add    esp,0x10
    201c:	85 c0                	test   eax,eax
    201e:	74 13                	je     2033 <_create_directory+0x2bd>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:256
            break;

        tailNum++;
    2020:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:258
    }
    while (tailNum < 9999);
    2024:	81 7d f4 0e 27 00 00 	cmp    DWORD PTR [ebp-0xc],0x270e
    202b:	0f 8e 71 ff ff ff    	jle    1fa2 <_create_directory+0x22c>
    2031:	eb 01                	jmp    2034 <_create_directory+0x2be>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:254
        else
            memcpy(file->shortfilename, shortFilename, FAT_SFN_SIZE_FULL);

        // Check if entry exists already or not
        if (fatfs_sfn_exists(&_fs, file->parentcluster, (char*)file->shortfilename) == 0)
            break;
    2033:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:261
        tailNum++;
    }
    while (tailNum < 9999);

    // We reached the max number of duplicate short file names (unlikely!)
    if (tailNum == 9999)
    2034:	81 7d f4 0f 27 00 00 	cmp    DWORD PTR [ebp-0xc],0x270f
    203b:	75 31                	jne    206e <_create_directory+0x2f8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:264
    {
        // Delete allocated space
        fatfs_free_cluster_chain(&_fs, file->startcluster);
    203d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    2040:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    2043:	83 ec 08             	sub    esp,0x8
    2046:	50                   	push   eax
    2047:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    204d:	50                   	push   eax
    204e:	e8 cd 52 00 00       	call   7320 <__x86.get_pc_thunk.bx+0x426>
    2053:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:266

        _free_file(file);
    2056:	83 ec 0c             	sub    esp,0xc
    2059:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    205c:	e8 d3 fb ff ff       	call   1c34 <_free_file>
    2061:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:267
        return 0;
    2064:	b8 00 00 00 00       	mov    eax,0x0
    2069:	e9 e0 00 00 00       	jmp    214e <_create_directory+0x3d8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:295
        return 0;
    }
#endif

    // Add file to disk
    if (!fatfs_add_file_entry(&_fs, file->parentcluster, (char*)file->filename, (char*)file->shortfilename, file->startcluster, 0, 1))
    206e:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    2071:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    2074:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    2077:	8d b0 14 01 00 00    	lea    esi,[eax+0x114]
    207d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    2080:	8d 88 94 00 00 00    	lea    ecx,[eax+0x94]
    2086:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    2089:	8b 00                	mov    eax,DWORD PTR [eax]
    208b:	83 ec 04             	sub    esp,0x4
    208e:	6a 01                	push   0x1
    2090:	6a 00                	push   0x0
    2092:	52                   	push   edx
    2093:	56                   	push   esi
    2094:	51                   	push   ecx
    2095:	50                   	push   eax
    2096:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    209c:	50                   	push   eax
    209d:	e8 3e 50 00 00       	call   70e0 <__x86.get_pc_thunk.bx+0x1e6>
    20a2:	83 c4 20             	add    esp,0x20
    20a5:	85 c0                	test   eax,eax
    20a7:	75 2e                	jne    20d7 <_create_directory+0x361>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:298
    {
        // Delete allocated space
        fatfs_free_cluster_chain(&_fs, file->startcluster);
    20a9:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    20ac:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    20af:	83 ec 08             	sub    esp,0x8
    20b2:	50                   	push   eax
    20b3:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    20b9:	50                   	push   eax
    20ba:	e8 61 52 00 00       	call   7320 <__x86.get_pc_thunk.bx+0x426>
    20bf:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:300

        _free_file(file);
    20c2:	83 ec 0c             	sub    esp,0xc
    20c5:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    20c8:	e8 67 fb ff ff       	call   1c34 <_free_file>
    20cd:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:301
        return 0;
    20d0:	b8 00 00 00 00       	mov    eax,0x0
    20d5:	eb 77                	jmp    214e <_create_directory+0x3d8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:305
    }

    // General
    file->filelength = 0;
    20d7:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    20da:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:306
    file->bytenum = 0;
    20e1:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    20e4:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:307
    file->file_data_address = 0xFFFFFFFF;
    20eb:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    20ee:	c7 80 28 03 00 00 ff 	mov    DWORD PTR [eax+0x328],0xffffffff
    20f5:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:308
    file->file_data_dirty = 0;
    20f8:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    20fb:	c7 80 2c 03 00 00 00 	mov    DWORD PTR [eax+0x32c],0x0
    2102:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:309
    file->filelength_changed = 0;
    2105:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    2108:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:312

    // Quick lookup for next link in the chain
    file->last_fat_lookup.ClusterIdx = 0xFFFFFFFF;
    210f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    2112:	c7 80 20 01 00 00 ff 	mov    DWORD PTR [eax+0x120],0xffffffff
    2119:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:313
    file->last_fat_lookup.CurrentCluster = 0xFFFFFFFF;
    211c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    211f:	c7 80 24 01 00 00 ff 	mov    DWORD PTR [eax+0x124],0xffffffff
    2126:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:315

    fatfs_fat_purge(&_fs);
    2129:	83 ec 0c             	sub    esp,0xc
    212c:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2132:	50                   	push   eax
    2133:	e8 68 4e 00 00       	call   6fa0 <__x86.get_pc_thunk.bx+0xa6>
    2138:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:317

    _free_file(file);
    213b:	83 ec 0c             	sub    esp,0xc
    213e:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    2141:	e8 ee fa ff ff       	call   1c34 <_free_file>
    2146:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:318
    return 1;
    2149:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:319 (discriminator 1)
}
    214e:	8d 65 f8             	lea    esp,[ebp-0x8]
    2151:	5b                   	pop    ebx
    2152:	5e                   	pop    esi
    2153:	5d                   	pop    ebp
    2154:	c3                   	ret    

00002155 <_open_file>:
_open_file():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:325
#endif
//-----------------------------------------------------------------------------
// _open_file: Open a file for reading
//-----------------------------------------------------------------------------
static FL_FILE* _open_file(const char *path)
{
    2155:	55                   	push   ebp
    2156:	89 e5                	mov    ebp,esp
    2158:	53                   	push   ebx
    2159:	83 ec 34             	sub    esp,0x34
    215c:	e8 99 4d 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    2161:	81 c3 c7 8d 00 00    	add    ebx,0x8dc7
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:330
    FL_FILE* file;
    struct fat_dir_entry sfEntry;

    // Allocate a new file handle
    file = _allocate_file();
    2167:	e8 d6 f9 ff ff       	call   1b42 <_allocate_file>
    216c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:331
    if (!file)
    216f:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    2173:	75 0a                	jne    217f <_open_file+0x2a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:332
        return NULL;
    2175:	b8 00 00 00 00       	mov    eax,0x0
    217a:	e9 04 02 00 00       	jmp    2383 <_open_file+0x22e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:335

    // Clear filename
    memset(file->path, '\0', sizeof(file->path));
    217f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2182:	83 c0 14             	add    eax,0x14
    2185:	83 ec 04             	sub    esp,0x4
    2188:	68 80 00 00 00       	push   0x80
    218d:	6a 00                	push   0x0
    218f:	50                   	push   eax
    2190:	e8 ab 50 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    2195:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:336
    memset(file->filename, '\0', sizeof(file->filename));
    2198:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    219b:	05 94 00 00 00       	add    eax,0x94
    21a0:	83 ec 04             	sub    esp,0x4
    21a3:	68 80 00 00 00       	push   0x80
    21a8:	6a 00                	push   0x0
    21aa:	50                   	push   eax
    21ab:	e8 90 50 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    21b0:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:339

    // Split full path into filename and directory path
    if (fatfs_split_path((char*)path, file->path, sizeof(file->path), file->filename, sizeof(file->filename)) == -1)
    21b3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    21b6:	8d 90 94 00 00 00    	lea    edx,[eax+0x94]
    21bc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    21bf:	83 c0 14             	add    eax,0x14
    21c2:	83 ec 0c             	sub    esp,0xc
    21c5:	68 80 00 00 00       	push   0x80
    21ca:	52                   	push   edx
    21cb:	68 80 00 00 00       	push   0x80
    21d0:	50                   	push   eax
    21d1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    21d4:	e8 87 4e 00 00       	call   7060 <__x86.get_pc_thunk.bx+0x166>
    21d9:	83 c4 20             	add    esp,0x20
    21dc:	83 f8 ff             	cmp    eax,0xffffffff
    21df:	75 18                	jne    21f9 <_open_file+0xa4>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:341
    {
        _free_file(file);
    21e1:	83 ec 0c             	sub    esp,0xc
    21e4:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    21e7:	e8 48 fa ff ff       	call   1c34 <_free_file>
    21ec:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:342
        return NULL;
    21ef:	b8 00 00 00 00       	mov    eax,0x0
    21f4:	e9 8a 01 00 00       	jmp    2383 <_open_file+0x22e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:346
    }

    // Check if file already open
    if (_check_file_open(file))
    21f9:	83 ec 0c             	sub    esp,0xc
    21fc:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    21ff:	e8 94 f9 ff ff       	call   1b98 <_check_file_open>
    2204:	83 c4 10             	add    esp,0x10
    2207:	85 c0                	test   eax,eax
    2209:	74 18                	je     2223 <_open_file+0xce>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:348
    {
        _free_file(file);
    220b:	83 ec 0c             	sub    esp,0xc
    220e:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    2211:	e8 1e fa ff ff       	call   1c34 <_free_file>
    2216:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:349
        return NULL;
    2219:	b8 00 00 00 00       	mov    eax,0x0
    221e:	e9 60 01 00 00       	jmp    2383 <_open_file+0x22e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:353
    }

    // If file is in the root dir
    if (file->path[0]==0)
    2223:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2226:	0f b6 40 14          	movzx  eax,BYTE PTR [eax+0x14]
    222a:	84 c0                	test   al,al
    222c:	75 1b                	jne    2249 <_open_file+0xf4>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:354
        file->parentcluster = fatfs_get_root_cluster(&_fs);
    222e:	83 ec 0c             	sub    esp,0xc
    2231:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2237:	50                   	push   eax
    2238:	e8 b3 4f 00 00       	call   71f0 <__x86.get_pc_thunk.bx+0x2f6>
    223d:	83 c4 10             	add    esp,0x10
    2240:	89 c2                	mov    edx,eax
    2242:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2245:	89 10                	mov    DWORD PTR [eax],edx
    2247:	eb 32                	jmp    227b <_open_file+0x126>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:358
    else
    {
        // Find parent directory start cluster
        if (!_open_directory(file->path, &file->parentcluster))
    2249:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    224c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    224f:	83 c2 14             	add    edx,0x14
    2252:	83 ec 08             	sub    esp,0x8
    2255:	50                   	push   eax
    2256:	52                   	push   edx
    2257:	e8 1d fa ff ff       	call   1c79 <_open_directory>
    225c:	83 c4 10             	add    esp,0x10
    225f:	85 c0                	test   eax,eax
    2261:	75 18                	jne    227b <_open_file+0x126>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:360
        {
            _free_file(file);
    2263:	83 ec 0c             	sub    esp,0xc
    2266:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    2269:	e8 c6 f9 ff ff       	call   1c34 <_free_file>
    226e:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:361
            return NULL;
    2271:	b8 00 00 00 00       	mov    eax,0x0
    2276:	e9 08 01 00 00       	jmp    2383 <_open_file+0x22e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:366
        }
    }

    // Using dir cluster address search for filename
    if (fatfs_get_file_entry(&_fs, file->parentcluster, file->filename,&sfEntry))
    227b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    227e:	8d 88 94 00 00 00    	lea    ecx,[eax+0x94]
    2284:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2287:	8b 00                	mov    eax,DWORD PTR [eax]
    2289:	8d 55 d4             	lea    edx,[ebp-0x2c]
    228c:	52                   	push   edx
    228d:	51                   	push   ecx
    228e:	50                   	push   eax
    228f:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2295:	50                   	push   eax
    2296:	e8 05 50 00 00       	call   72a0 <__x86.get_pc_thunk.bx+0x3a6>
    229b:	83 c4 10             	add    esp,0x10
    229e:	85 c0                	test   eax,eax
    22a0:	0f 84 ca 00 00 00    	je     2370 <_open_file+0x21b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:368
        // Make sure entry is file not dir!
        if (fatfs_entry_is_file(&sfEntry))
    22a6:	83 ec 0c             	sub    esp,0xc
    22a9:	8d 45 d4             	lea    eax,[ebp-0x2c]
    22ac:	50                   	push   eax
    22ad:	e8 fe 4c 00 00       	call   6fb0 <__x86.get_pc_thunk.bx+0xb6>
    22b2:	83 c4 10             	add    esp,0x10
    22b5:	85 c0                	test   eax,eax
    22b7:	0f 84 b3 00 00 00    	je     2370 <_open_file+0x21b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:371
        {
            // Initialise file details
            memcpy(file->shortfilename, sfEntry.Name, FAT_SFN_SIZE_FULL);
    22bd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    22c0:	8d 90 14 01 00 00    	lea    edx,[eax+0x114]
    22c6:	83 ec 04             	sub    esp,0x4
    22c9:	6a 0b                	push   0xb
    22cb:	8d 45 d4             	lea    eax,[ebp-0x2c]
    22ce:	50                   	push   eax
    22cf:	52                   	push   edx
    22d0:	e8 eb 4c 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
    22d5:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:372
            file->filelength = FAT_HTONL(sfEntry.FileSize);
    22d8:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    22db:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    22de:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:373
            file->bytenum = 0;
    22e1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    22e4:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:374
            file->startcluster = ((FAT_HTONS((uint32)sfEntry.FstClusHI))<<16) + FAT_HTONS(sfEntry.FstClusLO);
    22eb:	0f b7 45 e8          	movzx  eax,WORD PTR [ebp-0x18]
    22ef:	0f b7 c0             	movzx  eax,ax
    22f2:	c1 e0 10             	shl    eax,0x10
    22f5:	89 c2                	mov    edx,eax
    22f7:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
    22fb:	0f b7 c0             	movzx  eax,ax
    22fe:	01 c2                	add    edx,eax
    2300:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2303:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:375
            file->file_data_address = 0xFFFFFFFF;
    2306:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2309:	c7 80 28 03 00 00 ff 	mov    DWORD PTR [eax+0x328],0xffffffff
    2310:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:376
            file->file_data_dirty = 0;
    2313:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2316:	c7 80 2c 03 00 00 00 	mov    DWORD PTR [eax+0x32c],0x0
    231d:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:377
            file->filelength_changed = 0;
    2320:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2323:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:380

            // Quick lookup for next link in the chain
            file->last_fat_lookup.ClusterIdx = 0xFFFFFFFF;
    232a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    232d:	c7 80 20 01 00 00 ff 	mov    DWORD PTR [eax+0x120],0xffffffff
    2334:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:381
            file->last_fat_lookup.CurrentCluster = 0xFFFFFFFF;
    2337:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    233a:	c7 80 24 01 00 00 ff 	mov    DWORD PTR [eax+0x124],0xffffffff
    2341:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:383

            fatfs_cache_init(&_fs, file);
    2344:	83 ec 08             	sub    esp,0x8
    2347:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    234a:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2350:	50                   	push   eax
    2351:	e8 7a 4f 00 00       	call   72d0 <__x86.get_pc_thunk.bx+0x3d6>
    2356:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:385

            fatfs_fat_purge(&_fs);
    2359:	83 ec 0c             	sub    esp,0xc
    235c:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2362:	50                   	push   eax
    2363:	e8 38 4c 00 00       	call   6fa0 <__x86.get_pc_thunk.bx+0xa6>
    2368:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:387

            return file;
    236b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    236e:	eb 13                	jmp    2383 <_open_file+0x22e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:390
        }

    _free_file(file);
    2370:	83 ec 0c             	sub    esp,0xc
    2373:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    2376:	e8 b9 f8 ff ff       	call   1c34 <_free_file>
    237b:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:391
    return NULL;
    237e:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:392 (discriminator 1)
}
    2383:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    2386:	c9                   	leave  
    2387:	c3                   	ret    

00002388 <_create_file>:
_create_file():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:398
//-----------------------------------------------------------------------------
// _create_file: Create a new file
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
static FL_FILE* _create_file(const char *filename)
{
    2388:	55                   	push   ebp
    2389:	89 e5                	mov    ebp,esp
    238b:	56                   	push   esi
    238c:	53                   	push   ebx
    238d:	83 ec 40             	sub    esp,0x40
    2390:	e8 65 4b 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    2395:	81 c3 93 8b 00 00    	add    ebx,0x8b93
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:402
    FL_FILE* file;
    struct fat_dir_entry sfEntry;
    char shortFilename[FAT_SFN_SIZE_FULL];
    int tailNum = 0;
    239b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:405

    // No write access?
    if (!_fs.disk_io.write_media)
    23a2:	8b 83 30 42 00 00    	mov    eax,DWORD PTR [ebx+0x4230]
    23a8:	85 c0                	test   eax,eax
    23aa:	75 0a                	jne    23b6 <_create_file+0x2e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:406
        return NULL;
    23ac:	b8 00 00 00 00       	mov    eax,0x0
    23b1:	e9 4c 03 00 00       	jmp    2702 <_create_file+0x37a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:409

    // Allocate a new file handle
    file = _allocate_file();
    23b6:	e8 87 f7 ff ff       	call   1b42 <_allocate_file>
    23bb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:410
    if (!file)
    23be:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    23c2:	75 0a                	jne    23ce <_create_file+0x46>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:411
        return NULL;
    23c4:	b8 00 00 00 00       	mov    eax,0x0
    23c9:	e9 34 03 00 00       	jmp    2702 <_create_file+0x37a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:414

    // Clear filename
    memset(file->path, '\0', sizeof(file->path));
    23ce:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    23d1:	83 c0 14             	add    eax,0x14
    23d4:	83 ec 04             	sub    esp,0x4
    23d7:	68 80 00 00 00       	push   0x80
    23dc:	6a 00                	push   0x0
    23de:	50                   	push   eax
    23df:	e8 5c 4e 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    23e4:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:415
    memset(file->filename, '\0', sizeof(file->filename));
    23e7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    23ea:	05 94 00 00 00       	add    eax,0x94
    23ef:	83 ec 04             	sub    esp,0x4
    23f2:	68 80 00 00 00       	push   0x80
    23f7:	6a 00                	push   0x0
    23f9:	50                   	push   eax
    23fa:	e8 41 4e 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    23ff:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:418

    // Split full path into filename and directory path
    if (fatfs_split_path((char*)filename, file->path, sizeof(file->path), file->filename, sizeof(file->filename)) == -1)
    2402:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2405:	8d 90 94 00 00 00    	lea    edx,[eax+0x94]
    240b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    240e:	83 c0 14             	add    eax,0x14
    2411:	83 ec 0c             	sub    esp,0xc
    2414:	68 80 00 00 00       	push   0x80
    2419:	52                   	push   edx
    241a:	68 80 00 00 00       	push   0x80
    241f:	50                   	push   eax
    2420:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2423:	e8 38 4c 00 00       	call   7060 <__x86.get_pc_thunk.bx+0x166>
    2428:	83 c4 20             	add    esp,0x20
    242b:	83 f8 ff             	cmp    eax,0xffffffff
    242e:	75 18                	jne    2448 <_create_file+0xc0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:420
    {
        _free_file(file);
    2430:	83 ec 0c             	sub    esp,0xc
    2433:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    2436:	e8 f9 f7 ff ff       	call   1c34 <_free_file>
    243b:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:421
        return NULL;
    243e:	b8 00 00 00 00       	mov    eax,0x0
    2443:	e9 ba 02 00 00       	jmp    2702 <_create_file+0x37a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:425
    }

    // Check if file already open
    if (_check_file_open(file))
    2448:	83 ec 0c             	sub    esp,0xc
    244b:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    244e:	e8 45 f7 ff ff       	call   1b98 <_check_file_open>
    2453:	83 c4 10             	add    esp,0x10
    2456:	85 c0                	test   eax,eax
    2458:	74 18                	je     2472 <_create_file+0xea>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:427
    {
        _free_file(file);
    245a:	83 ec 0c             	sub    esp,0xc
    245d:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    2460:	e8 cf f7 ff ff       	call   1c34 <_free_file>
    2465:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:428
        return NULL;
    2468:	b8 00 00 00 00       	mov    eax,0x0
    246d:	e9 90 02 00 00       	jmp    2702 <_create_file+0x37a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:432
    }

    // If file is in the root dir
    if (file->path[0] == 0)
    2472:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2475:	0f b6 40 14          	movzx  eax,BYTE PTR [eax+0x14]
    2479:	84 c0                	test   al,al
    247b:	75 1b                	jne    2498 <_create_file+0x110>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:433
        file->parentcluster = fatfs_get_root_cluster(&_fs);
    247d:	83 ec 0c             	sub    esp,0xc
    2480:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2486:	50                   	push   eax
    2487:	e8 64 4d 00 00       	call   71f0 <__x86.get_pc_thunk.bx+0x2f6>
    248c:	83 c4 10             	add    esp,0x10
    248f:	89 c2                	mov    edx,eax
    2491:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2494:	89 10                	mov    DWORD PTR [eax],edx
    2496:	eb 32                	jmp    24ca <_create_file+0x142>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:437
    else
    {
        // Find parent directory start cluster
        if (!_open_directory(file->path, &file->parentcluster))
    2498:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    249b:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    249e:	83 c2 14             	add    edx,0x14
    24a1:	83 ec 08             	sub    esp,0x8
    24a4:	50                   	push   eax
    24a5:	52                   	push   edx
    24a6:	e8 ce f7 ff ff       	call   1c79 <_open_directory>
    24ab:	83 c4 10             	add    esp,0x10
    24ae:	85 c0                	test   eax,eax
    24b0:	75 18                	jne    24ca <_create_file+0x142>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:439
        {
            _free_file(file);
    24b2:	83 ec 0c             	sub    esp,0xc
    24b5:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    24b8:	e8 77 f7 ff ff       	call   1c34 <_free_file>
    24bd:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:440
            return NULL;
    24c0:	b8 00 00 00 00       	mov    eax,0x0
    24c5:	e9 38 02 00 00       	jmp    2702 <_create_file+0x37a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:445
        }
    }

    // Check if same filename exists in directory
    if (fatfs_get_file_entry(&_fs, file->parentcluster, file->filename,&sfEntry) == 1)
    24ca:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    24cd:	8d 88 94 00 00 00    	lea    ecx,[eax+0x94]
    24d3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    24d6:	8b 00                	mov    eax,DWORD PTR [eax]
    24d8:	8d 55 d0             	lea    edx,[ebp-0x30]
    24db:	52                   	push   edx
    24dc:	51                   	push   ecx
    24dd:	50                   	push   eax
    24de:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    24e4:	50                   	push   eax
    24e5:	e8 b6 4d 00 00       	call   72a0 <__x86.get_pc_thunk.bx+0x3a6>
    24ea:	83 c4 10             	add    esp,0x10
    24ed:	83 f8 01             	cmp    eax,0x1
    24f0:	75 18                	jne    250a <_create_file+0x182>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:447
    {
        _free_file(file);
    24f2:	83 ec 0c             	sub    esp,0xc
    24f5:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    24f8:	e8 37 f7 ff ff       	call   1c34 <_free_file>
    24fd:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:448
        return NULL;
    2500:	b8 00 00 00 00       	mov    eax,0x0
    2505:	e9 f8 01 00 00       	jmp    2702 <_create_file+0x37a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:451
    }

    file->startcluster = 0;
    250a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    250d:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:454

    // Create the file space for the file (at least one clusters worth!)
    if (!fatfs_allocate_free_space(&_fs, 1, &file->startcluster, 1))
    2514:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2517:	83 c0 04             	add    eax,0x4
    251a:	6a 01                	push   0x1
    251c:	50                   	push   eax
    251d:	6a 01                	push   0x1
    251f:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2525:	50                   	push   eax
    2526:	e8 45 4e 00 00       	call   7370 <__x86.get_pc_thunk.bx+0x476>
    252b:	83 c4 10             	add    esp,0x10
    252e:	85 c0                	test   eax,eax
    2530:	75 18                	jne    254a <_create_file+0x1c2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:456
    {
        _free_file(file);
    2532:	83 ec 0c             	sub    esp,0xc
    2535:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    2538:	e8 f7 f6 ff ff       	call   1c34 <_free_file>
    253d:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:457
        return NULL;
    2540:	b8 00 00 00 00       	mov    eax,0x0
    2545:	e9 b8 01 00 00       	jmp    2702 <_create_file+0x37a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:462
    }

#if FATFS_INC_LFN_SUPPORT
    // Generate a short filename & tail
    tailNum = 0;
    254a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:466
    do
    {
        // Create a standard short filename (without tail)
        fatfs_lfn_create_sfn(shortFilename, file->filename);
    2551:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2554:	05 94 00 00 00       	add    eax,0x94
    2559:	83 ec 08             	sub    esp,0x8
    255c:	50                   	push   eax
    255d:	8d 45 c5             	lea    eax,[ebp-0x3b]
    2560:	50                   	push   eax
    2561:	e8 9a 4d 00 00       	call   7300 <__x86.get_pc_thunk.bx+0x406>
    2566:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:469

        // If second hit or more, generate a ~n tail
        if (tailNum != 0)
    2569:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    256d:	74 1f                	je     258e <_create_file+0x206>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:470
            fatfs_lfn_generate_tail((char*)file->shortfilename, shortFilename, tailNum);
    256f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2572:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    2575:	81 c2 14 01 00 00    	add    edx,0x114
    257b:	83 ec 04             	sub    esp,0x4
    257e:	50                   	push   eax
    257f:	8d 45 c5             	lea    eax,[ebp-0x3b]
    2582:	50                   	push   eax
    2583:	52                   	push   edx
    2584:	e8 27 4b 00 00       	call   70b0 <__x86.get_pc_thunk.bx+0x1b6>
    2589:	83 c4 10             	add    esp,0x10
    258c:	eb 1b                	jmp    25a9 <_create_file+0x221>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:473
        // Try with no tail if first entry
        else
            memcpy(file->shortfilename, shortFilename, FAT_SFN_SIZE_FULL);
    258e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2591:	8d 90 14 01 00 00    	lea    edx,[eax+0x114]
    2597:	83 ec 04             	sub    esp,0x4
    259a:	6a 0b                	push   0xb
    259c:	8d 45 c5             	lea    eax,[ebp-0x3b]
    259f:	50                   	push   eax
    25a0:	52                   	push   edx
    25a1:	e8 1a 4a 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
    25a6:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:476

        // Check if entry exists already or not
        if (fatfs_sfn_exists(&_fs, file->parentcluster, (char*)file->shortfilename) == 0)
    25a9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    25ac:	8d 90 14 01 00 00    	lea    edx,[eax+0x114]
    25b2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    25b5:	8b 00                	mov    eax,DWORD PTR [eax]
    25b7:	83 ec 04             	sub    esp,0x4
    25ba:	52                   	push   edx
    25bb:	50                   	push   eax
    25bc:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    25c2:	50                   	push   eax
    25c3:	e8 88 4a 00 00       	call   7050 <__x86.get_pc_thunk.bx+0x156>
    25c8:	83 c4 10             	add    esp,0x10
    25cb:	85 c0                	test   eax,eax
    25cd:	74 13                	je     25e2 <_create_file+0x25a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:479
            break;

        tailNum++;
    25cf:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:481
    }
    while (tailNum < 9999);
    25d3:	81 7d f4 0e 27 00 00 	cmp    DWORD PTR [ebp-0xc],0x270e
    25da:	0f 8e 71 ff ff ff    	jle    2551 <_create_file+0x1c9>
    25e0:	eb 01                	jmp    25e3 <_create_file+0x25b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:477
        else
            memcpy(file->shortfilename, shortFilename, FAT_SFN_SIZE_FULL);

        // Check if entry exists already or not
        if (fatfs_sfn_exists(&_fs, file->parentcluster, (char*)file->shortfilename) == 0)
            break;
    25e2:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:484
        tailNum++;
    }
    while (tailNum < 9999);

    // We reached the max number of duplicate short file names (unlikely!)
    if (tailNum == 9999)
    25e3:	81 7d f4 0f 27 00 00 	cmp    DWORD PTR [ebp-0xc],0x270f
    25ea:	75 31                	jne    261d <_create_file+0x295>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:487
    {
        // Delete allocated space
        fatfs_free_cluster_chain(&_fs, file->startcluster);
    25ec:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    25ef:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    25f2:	83 ec 08             	sub    esp,0x8
    25f5:	50                   	push   eax
    25f6:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    25fc:	50                   	push   eax
    25fd:	e8 1e 4d 00 00       	call   7320 <__x86.get_pc_thunk.bx+0x426>
    2602:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:489

        _free_file(file);
    2605:	83 ec 0c             	sub    esp,0xc
    2608:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    260b:	e8 24 f6 ff ff       	call   1c34 <_free_file>
    2610:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:490
        return NULL;
    2613:	b8 00 00 00 00       	mov    eax,0x0
    2618:	e9 e5 00 00 00       	jmp    2702 <_create_file+0x37a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:518
        return NULL;
    }
#endif

    // Add file to disk
    if (!fatfs_add_file_entry(&_fs, file->parentcluster, (char*)file->filename, (char*)file->shortfilename, file->startcluster, 0, 0))
    261d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2620:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    2623:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2626:	8d b0 14 01 00 00    	lea    esi,[eax+0x114]
    262c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    262f:	8d 88 94 00 00 00    	lea    ecx,[eax+0x94]
    2635:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2638:	8b 00                	mov    eax,DWORD PTR [eax]
    263a:	83 ec 04             	sub    esp,0x4
    263d:	6a 00                	push   0x0
    263f:	6a 00                	push   0x0
    2641:	52                   	push   edx
    2642:	56                   	push   esi
    2643:	51                   	push   ecx
    2644:	50                   	push   eax
    2645:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    264b:	50                   	push   eax
    264c:	e8 8f 4a 00 00       	call   70e0 <__x86.get_pc_thunk.bx+0x1e6>
    2651:	83 c4 20             	add    esp,0x20
    2654:	85 c0                	test   eax,eax
    2656:	75 2e                	jne    2686 <_create_file+0x2fe>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:521
    {
        // Delete allocated space
        fatfs_free_cluster_chain(&_fs, file->startcluster);
    2658:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    265b:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    265e:	83 ec 08             	sub    esp,0x8
    2661:	50                   	push   eax
    2662:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2668:	50                   	push   eax
    2669:	e8 b2 4c 00 00       	call   7320 <__x86.get_pc_thunk.bx+0x426>
    266e:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:523

        _free_file(file);
    2671:	83 ec 0c             	sub    esp,0xc
    2674:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    2677:	e8 b8 f5 ff ff       	call   1c34 <_free_file>
    267c:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:524
        return NULL;
    267f:	b8 00 00 00 00       	mov    eax,0x0
    2684:	eb 7c                	jmp    2702 <_create_file+0x37a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:528
    }

    // General
    file->filelength = 0;
    2686:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2689:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:529
    file->bytenum = 0;
    2690:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2693:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:530
    file->file_data_address = 0xFFFFFFFF;
    269a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    269d:	c7 80 28 03 00 00 ff 	mov    DWORD PTR [eax+0x328],0xffffffff
    26a4:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:531
    file->file_data_dirty = 0;
    26a7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    26aa:	c7 80 2c 03 00 00 00 	mov    DWORD PTR [eax+0x32c],0x0
    26b1:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:532
    file->filelength_changed = 0;
    26b4:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    26b7:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:535

    // Quick lookup for next link in the chain
    file->last_fat_lookup.ClusterIdx = 0xFFFFFFFF;
    26be:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    26c1:	c7 80 20 01 00 00 ff 	mov    DWORD PTR [eax+0x120],0xffffffff
    26c8:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:536
    file->last_fat_lookup.CurrentCluster = 0xFFFFFFFF;
    26cb:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    26ce:	c7 80 24 01 00 00 ff 	mov    DWORD PTR [eax+0x124],0xffffffff
    26d5:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:538

    fatfs_cache_init(&_fs, file);
    26d8:	83 ec 08             	sub    esp,0x8
    26db:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    26de:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    26e4:	50                   	push   eax
    26e5:	e8 e6 4b 00 00       	call   72d0 <__x86.get_pc_thunk.bx+0x3d6>
    26ea:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:540

    fatfs_fat_purge(&_fs);
    26ed:	83 ec 0c             	sub    esp,0xc
    26f0:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    26f6:	50                   	push   eax
    26f7:	e8 a4 48 00 00       	call   6fa0 <__x86.get_pc_thunk.bx+0xa6>
    26fc:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:542

    return file;
    26ff:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:543 (discriminator 1)
}
    2702:	8d 65 f8             	lea    esp,[ebp-0x8]
    2705:	5b                   	pop    ebx
    2706:	5e                   	pop    esi
    2707:	5d                   	pop    ebp
    2708:	c3                   	ret    

00002709 <_read_sectors>:
_read_sectors():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:549
#endif
//-----------------------------------------------------------------------------
// _read_sectors: Read sector(s) from disk to file
//-----------------------------------------------------------------------------
static uint32 _read_sectors(FL_FILE* file, uint32 offset, uint8 *buffer, uint32 count)
{
    2709:	55                   	push   ebp
    270a:	89 e5                	mov    ebp,esp
    270c:	53                   	push   ebx
    270d:	83 ec 24             	sub    esp,0x24
    2710:	e8 e5 47 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    2715:	81 c3 13 88 00 00    	add    ebx,0x8813
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:550
    uint32 Sector = 0;
    271b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:551
    uint32 ClusterIdx = 0;
    2722:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:552
    uint32 Cluster = 0;
    2729:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:557
    uint32 i;
    uint32 lba;

    // Find cluster index within file & sector with cluster
    ClusterIdx = offset / _fs.sectors_per_cluster;
    2730:	0f b6 83 f8 41 00 00 	movzx  eax,BYTE PTR [ebx+0x41f8]
    2737:	0f b6 c8             	movzx  ecx,al
    273a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    273d:	ba 00 00 00 00       	mov    edx,0x0
    2742:	f7 f1                	div    ecx
    2744:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:558
    Sector = offset - (ClusterIdx * _fs.sectors_per_cluster);
    2747:	0f b6 83 f8 41 00 00 	movzx  eax,BYTE PTR [ebx+0x41f8]
    274e:	0f b6 c0             	movzx  eax,al
    2751:	0f af 45 e8          	imul   eax,DWORD PTR [ebp-0x18]
    2755:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    2758:	29 c2                	sub    edx,eax
    275a:	89 d0                	mov    eax,edx
    275c:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:561

    // Limit number of sectors read to the number remaining in this cluster
    if ((Sector + count) > _fs.sectors_per_cluster)
    275f:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    2762:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    2765:	01 c2                	add    edx,eax
    2767:	0f b6 83 f8 41 00 00 	movzx  eax,BYTE PTR [ebx+0x41f8]
    276e:	0f b6 c0             	movzx  eax,al
    2771:	39 c2                	cmp    edx,eax
    2773:	76 10                	jbe    2785 <_read_sectors+0x7c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:562
        count = _fs.sectors_per_cluster - Sector;
    2775:	0f b6 83 f8 41 00 00 	movzx  eax,BYTE PTR [ebx+0x41f8]
    277c:	0f b6 c0             	movzx  eax,al
    277f:	2b 45 ec             	sub    eax,DWORD PTR [ebp-0x14]
    2782:	89 45 14             	mov    DWORD PTR [ebp+0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:565

    // Quick lookup for next link in the chain
    if (ClusterIdx == file->last_fat_lookup.ClusterIdx)
    2785:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2788:	8b 80 20 01 00 00    	mov    eax,DWORD PTR [eax+0x120]
    278e:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
    2791:	75 11                	jne    27a4 <_read_sectors+0x9b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:566
        Cluster = file->last_fat_lookup.CurrentCluster;
    2793:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2796:	8b 80 24 01 00 00    	mov    eax,DWORD PTR [eax+0x124]
    279c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    279f:	e9 c1 00 00 00       	jmp    2865 <_read_sectors+0x15c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:571
    // Else walk the chain
    else
    {
        // Starting from last recorded cluster?
        if (ClusterIdx && ClusterIdx == file->last_fat_lookup.ClusterIdx + 1)
    27a4:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
    27a8:	74 2b                	je     27d5 <_read_sectors+0xcc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:571 (discriminator 1)
    27aa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    27ad:	8b 80 20 01 00 00    	mov    eax,DWORD PTR [eax+0x120]
    27b3:	83 c0 01             	add    eax,0x1
    27b6:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
    27b9:	75 1a                	jne    27d5 <_read_sectors+0xcc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:573
        {
            i = file->last_fat_lookup.ClusterIdx;
    27bb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    27be:	8b 80 20 01 00 00    	mov    eax,DWORD PTR [eax+0x120]
    27c4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:574
            Cluster = file->last_fat_lookup.CurrentCluster;
    27c7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    27ca:	8b 80 24 01 00 00    	mov    eax,DWORD PTR [eax+0x124]
    27d0:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    27d3:	eb 10                	jmp    27e5 <_read_sectors+0xdc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:580
        }
        // Start searching from the beginning..
        else
        {
            // Set start of cluster chain to initial value
            i = 0;
    27d5:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:581
            Cluster = file->startcluster;
    27dc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    27df:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    27e2:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:585
        }

        // Follow chain to find cluster to read
        for ( ;i<ClusterIdx; i++)
    27e5:	eb 58                	jmp    283f <_read_sectors+0x136>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:590
        {
            uint32 nextCluster;

            // Does the entry exist in the cache?
            if (!fatfs_cache_get_next_cluster(&_fs, file, i, &nextCluster))
    27e7:	8d 45 e0             	lea    eax,[ebp-0x20]
    27ea:	50                   	push   eax
    27eb:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    27ee:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    27f1:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    27f7:	50                   	push   eax
    27f8:	e8 f3 4a 00 00       	call   72f0 <__x86.get_pc_thunk.bx+0x3f6>
    27fd:	83 c4 10             	add    esp,0x10
    2800:	85 c0                	test   eax,eax
    2802:	75 31                	jne    2835 <_read_sectors+0x12c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:593
            {
                // Scan file linked list to find next entry
                nextCluster = fatfs_find_next_cluster(&_fs, Cluster);
    2804:	83 ec 08             	sub    esp,0x8
    2807:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    280a:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2810:	50                   	push   eax
    2811:	e8 aa 4a 00 00       	call   72c0 <__x86.get_pc_thunk.bx+0x3c6>
    2816:	83 c4 10             	add    esp,0x10
    2819:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:596

                // Push entry into cache
                fatfs_cache_set_next_cluster(&_fs, file, i, nextCluster);
    281c:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    281f:	50                   	push   eax
    2820:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    2823:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2826:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    282c:	50                   	push   eax
    282d:	e8 3e 47 00 00       	call   6f70 <__x86.get_pc_thunk.bx+0x76>
    2832:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:599
            }

            Cluster = nextCluster;
    2835:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    2838:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:585
            i = 0;
            Cluster = file->startcluster;
        }

        // Follow chain to find cluster to read
        for ( ;i<ClusterIdx; i++)
    283b:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:585 (discriminator 1)
    283f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2842:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
    2845:	72 a0                	jb     27e7 <_read_sectors+0xde>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:603

            Cluster = nextCluster;
        }

        // Record current cluster lookup details (if valid)
        if (Cluster != FAT32_LAST_CLUSTER)
    2847:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
    284b:	74 18                	je     2865 <_read_sectors+0x15c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:605
        {
            file->last_fat_lookup.CurrentCluster = Cluster;
    284d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2850:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    2853:	89 90 24 01 00 00    	mov    DWORD PTR [eax+0x124],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:606
            file->last_fat_lookup.ClusterIdx = ClusterIdx;
    2859:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    285c:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    285f:	89 90 20 01 00 00    	mov    DWORD PTR [eax+0x120],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:611
        }
    }

    // If end of cluster chain then return false
    if (Cluster == FAT32_LAST_CLUSTER)
    2865:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
    2869:	75 07                	jne    2872 <_read_sectors+0x169>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:612
        return 0;
    286b:	b8 00 00 00 00       	mov    eax,0x0
    2870:	eb 45                	jmp    28b7 <_read_sectors+0x1ae>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:615

    // Calculate sector address
    lba = fatfs_lba_of_cluster(&_fs, Cluster) + Sector;
    2872:	83 ec 08             	sub    esp,0x8
    2875:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    2878:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    287e:	50                   	push   eax
    287f:	e8 ac 4a 00 00       	call   7330 <__x86.get_pc_thunk.bx+0x436>
    2884:	83 c4 10             	add    esp,0x10
    2887:	89 c2                	mov    edx,eax
    2889:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    288c:	01 d0                	add    eax,edx
    288e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:618

    // Read sector of file
    if (fatfs_sector_read(&_fs, lba, buffer, count))
    2891:	ff 75 14             	push   DWORD PTR [ebp+0x14]
    2894:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    2897:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
    289a:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    28a0:	50                   	push   eax
    28a1:	e8 7a 48 00 00       	call   7120 <__x86.get_pc_thunk.bx+0x226>
    28a6:	83 c4 10             	add    esp,0x10
    28a9:	85 c0                	test   eax,eax
    28ab:	74 05                	je     28b2 <_read_sectors+0x1a9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:619
        return count;
    28ad:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    28b0:	eb 05                	jmp    28b7 <_read_sectors+0x1ae>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:621
    else
        return 0;
    28b2:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:622
}
    28b7:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    28ba:	c9                   	leave  
    28bb:	c3                   	ret    

000028bc <fl_init>:
fl_init():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:632

//-----------------------------------------------------------------------------
// fl_init: Initialise library
//-----------------------------------------------------------------------------
void __attribute__ ((constructor)) fl_init(void)
{
    28bc:	55                   	push   ebp
    28bd:	89 e5                	mov    ebp,esp
    28bf:	53                   	push   ebx
    28c0:	83 ec 14             	sub    esp,0x14
    28c3:	e8 32 46 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    28c8:	81 c3 60 86 00 00    	add    ebx,0x8660
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:635
    int i;

    printk("fl_init: Entered\n");
    28ce:	83 ec 0c             	sub    esp,0xc
    28d1:	8d 83 50 c5 ff ff    	lea    eax,[ebx-0x3ab0]
    28d7:	50                   	push   eax
    28d8:	e8 f3 48 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    28dd:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:637
    
    printk("fl_init: About to initialize free file list\n");
    28e0:	83 ec 0c             	sub    esp,0xc
    28e3:	8d 83 64 c5 ff ff    	lea    eax,[ebx-0x3a9c]
    28e9:	50                   	push   eax
    28ea:	e8 e1 48 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    28ef:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:638
    fat_list_init(&_free_file_list);
    28f2:	83 ec 0c             	sub    esp,0xc
    28f5:	8d 83 68 46 00 00    	lea    eax,[ebx+0x4668]
    28fb:	50                   	push   eax
    28fc:	e8 4f f0 ff ff       	call   1950 <fat_list_init>
    2901:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:639
    printk("fl_init: Initialized free file list\n");
    2904:	83 ec 0c             	sub    esp,0xc
    2907:	8d 83 94 c5 ff ff    	lea    eax,[ebx-0x3a6c]
    290d:	50                   	push   eax
    290e:	e8 bd 48 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    2913:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:640
    printk("fl_init: About to initialize open file list\n");
    2916:	83 ec 0c             	sub    esp,0xc
    2919:	8d 83 bc c5 ff ff    	lea    eax,[ebx-0x3a44]
    291f:	50                   	push   eax
    2920:	e8 ab 48 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    2925:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:641
    fat_list_init(&_open_file_list);
    2928:	83 ec 0c             	sub    esp,0xc
    292b:	8d 83 60 46 00 00    	lea    eax,[ebx+0x4660]
    2931:	50                   	push   eax
    2932:	e8 19 f0 ff ff       	call   1950 <fat_list_init>
    2937:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:642
    printk("fl_init: Initialized open file list\n");
    293a:	83 ec 0c             	sub    esp,0xc
    293d:	8d 83 ec c5 ff ff    	lea    eax,[ebx-0x3a14]
    2943:	50                   	push   eax
    2944:	e8 87 48 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    2949:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:644

    printk("fl_init: Adding all objects to free list\n");
    294c:	83 ec 0c             	sub    esp,0xc
    294f:	8d 83 14 c6 ff ff    	lea    eax,[ebx-0x39ec]
    2955:	50                   	push   eax
    2956:	e8 75 48 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    295b:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:646
    // Add all file objects to free list
    for (i=0;i<FATFS_MAX_OPEN_FILES;i++)
    295e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    2965:	eb 31                	jmp    2998 <fl_init+0xdc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:647 (discriminator 3)
        fat_list_insert_last(&_free_file_list, &_files[i].list_node);
    2967:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    296a:	69 c0 3c 03 00 00    	imul   eax,eax,0x33c
    2970:	8d 90 30 03 00 00    	lea    edx,[eax+0x330]
    2976:	8d 83 38 01 00 00    	lea    eax,[ebx+0x138]
    297c:	01 d0                	add    eax,edx
    297e:	83 c0 04             	add    eax,0x4
    2981:	83 ec 08             	sub    esp,0x8
    2984:	50                   	push   eax
    2985:	8d 83 68 46 00 00    	lea    eax,[ebx+0x4668]
    298b:	50                   	push   eax
    298c:	e8 25 f1 ff ff       	call   1ab6 <fat_list_insert_last>
    2991:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:646 (discriminator 3)
    fat_list_init(&_open_file_list);
    printk("fl_init: Initialized open file list\n");

    printk("fl_init: Adding all objects to free list\n");
    // Add all file objects to free list
    for (i=0;i<FATFS_MAX_OPEN_FILES;i++)
    2994:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:646 (discriminator 1)
    2998:	83 7d f4 13          	cmp    DWORD PTR [ebp-0xc],0x13
    299c:	7e c9                	jle    2967 <fl_init+0xab>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:649
        fat_list_insert_last(&_free_file_list, &_files[i].list_node);

    printk("fl_init: Returning\n");
    299e:	83 ec 0c             	sub    esp,0xc
    29a1:	8d 83 3e c6 ff ff    	lea    eax,[ebx-0x39c2]
    29a7:	50                   	push   eax
    29a8:	e8 23 48 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    29ad:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:650
    _filelib_init = 1;
    29b0:	c7 83 e8 41 00 00 01 	mov    DWORD PTR [ebx+0x41e8],0x1
    29b7:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:651
}
    29ba:	90                   	nop
    29bb:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    29be:	c9                   	leave  
    29bf:	c3                   	ret    

000029c0 <fl_attach_locks>:
fl_attach_locks():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:656
//-----------------------------------------------------------------------------
// fl_attach_locks:
//-----------------------------------------------------------------------------
void fl_attach_locks(void (*lock)(void), void (*unlock)(void))
{
    29c0:	55                   	push   ebp
    29c1:	89 e5                	mov    ebp,esp
    29c3:	e8 2e 45 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    29c8:	05 60 85 00 00       	add    eax,0x8560
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:657
    _fs.fl_lock = lock;
    29cd:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    29d0:	89 90 34 42 00 00    	mov    DWORD PTR [eax+0x4234],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:658
    _fs.fl_unlock = unlock;
    29d6:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    29d9:	89 90 38 42 00 00    	mov    DWORD PTR [eax+0x4238],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:659
}
    29df:	90                   	nop
    29e0:	5d                   	pop    ebp
    29e1:	c3                   	ret    

000029e2 <fl_attach_media>:
fl_attach_media():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:664
//-----------------------------------------------------------------------------
// fl_attach_media:
//-----------------------------------------------------------------------------
int fl_attach_media(fn_diskio_read rd, fn_diskio_write wr)
{
    29e2:	55                   	push   ebp
    29e3:	89 e5                	mov    ebp,esp
    29e5:	53                   	push   ebx
    29e6:	83 ec 14             	sub    esp,0x14
    29e9:	e8 0c 45 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    29ee:	81 c3 3a 85 00 00    	add    ebx,0x853a
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:667
    int res;

    printk("fl_attach_media: Entered\n");
    29f4:	83 ec 0c             	sub    esp,0xc
    29f7:	8d 83 52 c6 ff ff    	lea    eax,[ebx-0x39ae]
    29fd:	50                   	push   eax
    29fe:	e8 cd 47 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    2a03:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:669
    // If first call to library, initialise
    CHECK_FL_INIT();
    2a06:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    2a0c:	85 c0                	test   eax,eax
    2a0e:	75 05                	jne    2a15 <fl_attach_media+0x33>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:669 (discriminator 1)
    2a10:	e8 bb 45 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:670
    printk("fl_attach_media: CHEKC_FL_INIT returned\n");
    2a15:	83 ec 0c             	sub    esp,0xc
    2a18:	8d 83 6c c6 ff ff    	lea    eax,[ebx-0x3994]
    2a1e:	50                   	push   eax
    2a1f:	e8 ac 47 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    2a24:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:671
    _fs.disk_io.read_media = rd;
    2a27:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2a2a:	89 83 2c 42 00 00    	mov    DWORD PTR [ebx+0x422c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:672
    _fs.disk_io.write_media = wr;
    2a30:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    2a33:	89 83 30 42 00 00    	mov    DWORD PTR [ebx+0x4230],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:675

    // Initialise FAT parameters
    if ((res = fatfs_init(&_fs)) != FAT_INIT_OK)
    2a39:	83 ec 0c             	sub    esp,0xc
    2a3c:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2a42:	50                   	push   eax
    2a43:	e8 a8 45 00 00       	call   6ff0 <__x86.get_pc_thunk.bx+0xf6>
    2a48:	83 c4 10             	add    esp,0x10
    2a4b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    2a4e:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    2a52:	74 1a                	je     2a6e <fl_attach_media+0x8c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:677
    {
        FAT_PRINTF(("FAT_FS: Error could not load FAT details (%d)!\r\n", res));
    2a54:	83 ec 08             	sub    esp,0x8
    2a57:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    2a5a:	8d 83 98 c6 ff ff    	lea    eax,[ebx-0x3968]
    2a60:	50                   	push   eax
    2a61:	e8 6a 47 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    2a66:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:678
        return res;
    2a69:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2a6c:	eb 21                	jmp    2a8f <fl_attach_media+0xad>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:681
    }

    printk("fl_attach_media: returning valid=1\n");
    2a6e:	83 ec 0c             	sub    esp,0xc
    2a71:	8d 83 cc c6 ff ff    	lea    eax,[ebx-0x3934]
    2a77:	50                   	push   eax
    2a78:	e8 53 47 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    2a7d:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:682
    _filelib_valid = 1;
    2a80:	c7 83 ec 41 00 00 01 	mov    DWORD PTR [ebx+0x41ec],0x1
    2a87:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:683
    return FAT_INIT_OK;
    2a8a:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:684
}
    2a8f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    2a92:	c9                   	leave  
    2a93:	c3                   	ret    

00002a94 <fl_shutdown>:
fl_shutdown():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:689
//-----------------------------------------------------------------------------
// fl_shutdown: Call before shutting down system
//-----------------------------------------------------------------------------
 void __attribute__ ((destructor))fl_shutdown(void)
{
    2a94:	55                   	push   ebp
    2a95:	89 e5                	mov    ebp,esp
    2a97:	53                   	push   ebx
    2a98:	83 ec 04             	sub    esp,0x4
    2a9b:	e8 5a 44 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    2aa0:	81 c3 88 84 00 00    	add    ebx,0x8488
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:691
    // If first call to library, initialise
    CHECK_FL_INIT();
    2aa6:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    2aac:	85 c0                	test   eax,eax
    2aae:	75 05                	jne    2ab5 <fl_shutdown+0x21>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:691 (discriminator 1)
    2ab0:	e8 1b 45 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:693

    FL_LOCK(&_fs);
    2ab5:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    2abb:	85 c0                	test   eax,eax
    2abd:	74 08                	je     2ac7 <fl_shutdown+0x33>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:693 (discriminator 1)
    2abf:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    2ac5:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:694
    fatfs_fat_purge(&_fs);
    2ac7:	83 ec 0c             	sub    esp,0xc
    2aca:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2ad0:	50                   	push   eax
    2ad1:	e8 ca 44 00 00       	call   6fa0 <__x86.get_pc_thunk.bx+0xa6>
    2ad6:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:695
    FL_UNLOCK(&_fs);
    2ad9:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    2adf:	85 c0                	test   eax,eax
    2ae1:	74 08                	je     2aeb <fl_shutdown+0x57>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:695 (discriminator 1)
    2ae3:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    2ae9:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:696
}
    2aeb:	90                   	nop
    2aec:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    2aef:	c9                   	leave  
    2af0:	c3                   	ret    

00002af1 <fl_fopen>:
fl_fopen():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:701
//-----------------------------------------------------------------------------
// fopen: Open or Create a file for reading or writing
//-----------------------------------------------------------------------------
void* fl_fopen(const char *path, const char *mode)
{
    2af1:	55                   	push   ebp
    2af2:	89 e5                	mov    ebp,esp
    2af4:	53                   	push   ebx
    2af5:	83 ec 14             	sub    esp,0x14
    2af8:	e8 fd 43 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    2afd:	81 c3 2b 84 00 00    	add    ebx,0x842b
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:704
    int i;
    FL_FILE* file;
    uint8 flags = 0;
    2b03:	c6 45 ef 00          	mov    BYTE PTR [ebp-0x11],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:707

    // If first call to library, initialise
    CHECK_FL_INIT();
    2b07:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    2b0d:	85 c0                	test   eax,eax
    2b0f:	75 05                	jne    2b16 <fl_fopen+0x25>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:707 (discriminator 1)
    2b11:	e8 ba 44 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:709

    if (!_filelib_valid)
    2b16:	8b 83 ec 41 00 00    	mov    eax,DWORD PTR [ebx+0x41ec]
    2b1c:	85 c0                	test   eax,eax
    2b1e:	75 0a                	jne    2b2a <fl_fopen+0x39>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:710
        return NULL;
    2b20:	b8 00 00 00 00       	mov    eax,0x0
    2b25:	e9 96 01 00 00       	jmp    2cc0 <.L131+0xe0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:712

    if (!path || !mode)
    2b2a:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
    2b2e:	74 06                	je     2b36 <fl_fopen+0x45>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:712 (discriminator 1)
    2b30:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    2b34:	75 0a                	jne    2b40 <fl_fopen+0x4f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:713
        return NULL;
    2b36:	b8 00 00 00 00       	mov    eax,0x0
    2b3b:	e9 80 01 00 00       	jmp    2cc0 <.L131+0xe0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:733
    //        All writing operations are performed at the end of the file, protecting the previous content to be overwritten.
    //        You can reposition (fseek, rewind) the internal pointer to anywhere in the file for reading, but writing operations
    //        will move it back to the end of file.
    //        The file is created if it does not exist.

    for (i=0;i<(int)strlen(mode);i++)
    2b40:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    2b47:	e9 98 00 00 00       	jmp    2be4 <.L131+0x4>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:735
    {
        switch (mode[i])
    2b4c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    2b4f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    2b52:	01 d0                	add    eax,edx
    2b54:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    2b57:	0f be c0             	movsx  eax,al
    2b5a:	83 e8 2b             	sub    eax,0x2b
    2b5d:	83 f8 4c             	cmp    eax,0x4c
    2b60:	77 7e                	ja     2be0 <.L131>
    2b62:	c1 e0 02             	shl    eax,0x2
    2b65:	8b 84 18 f0 c6 ff ff 	mov    eax,DWORD PTR [eax+ebx*1-0x3910]
    2b6c:	01 d8                	add    eax,ebx
    2b6e:	ff e0                	jmp    eax

00002b70 <.L136>:
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:739
        {
        case 'r':
        case 'R':
            flags |= FILE_READ;
    2b70:	80 4d ef 01          	or     BYTE PTR [ebp-0x11],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:740
            break;
    2b74:	eb 6a                	jmp    2be0 <.L131>

00002b76 <.L137>:
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:743
        case 'w':
        case 'W':
            flags |= FILE_WRITE;
    2b76:	80 4d ef 02          	or     BYTE PTR [ebp-0x11],0x2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:744
            flags |= FILE_ERASE;
    2b7a:	80 4d ef 10          	or     BYTE PTR [ebp-0x11],0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:745
            flags |= FILE_CREATE;
    2b7e:	80 4d ef 20          	or     BYTE PTR [ebp-0x11],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:746
            break;
    2b82:	eb 5c                	jmp    2be0 <.L131>

00002b84 <.L134>:
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:749
        case 'a':
        case 'A':
            flags |= FILE_WRITE;
    2b84:	80 4d ef 02          	or     BYTE PTR [ebp-0x11],0x2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:750
            flags |= FILE_APPEND;
    2b88:	80 4d ef 04          	or     BYTE PTR [ebp-0x11],0x4
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:751
            flags |= FILE_CREATE;
    2b8c:	80 4d ef 20          	or     BYTE PTR [ebp-0x11],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:752
            break;
    2b90:	eb 4e                	jmp    2be0 <.L131>

00002b92 <.L132>:
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:754
        case '+':
            if (flags & FILE_READ)
    2b92:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
    2b96:	83 e0 01             	and    eax,0x1
    2b99:	85 c0                	test   eax,eax
    2b9b:	74 06                	je     2ba3 <.L132+0x11>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:755
                flags |= FILE_WRITE;
    2b9d:	80 4d ef 02          	or     BYTE PTR [ebp-0x11],0x2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:769
                flags |= FILE_READ;
                flags |= FILE_WRITE;
                flags |= FILE_APPEND;
                flags |= FILE_CREATE;
            }
            break;
    2ba1:	eb 3c                	jmp    2bdf <.L135+0x6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:756
            flags |= FILE_CREATE;
            break;
        case '+':
            if (flags & FILE_READ)
                flags |= FILE_WRITE;
            else if (flags & FILE_WRITE)
    2ba3:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
    2ba7:	83 e0 02             	and    eax,0x2
    2baa:	85 c0                	test   eax,eax
    2bac:	74 0e                	je     2bbc <.L132+0x2a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:758
            {
                flags |= FILE_READ;
    2bae:	80 4d ef 01          	or     BYTE PTR [ebp-0x11],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:759
                flags |= FILE_ERASE;
    2bb2:	80 4d ef 10          	or     BYTE PTR [ebp-0x11],0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:760
                flags |= FILE_CREATE;
    2bb6:	80 4d ef 20          	or     BYTE PTR [ebp-0x11],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:769
                flags |= FILE_READ;
                flags |= FILE_WRITE;
                flags |= FILE_APPEND;
                flags |= FILE_CREATE;
            }
            break;
    2bba:	eb 23                	jmp    2bdf <.L135+0x6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:762
            {
                flags |= FILE_READ;
                flags |= FILE_ERASE;
                flags |= FILE_CREATE;
            }
            else if (flags & FILE_APPEND)
    2bbc:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
    2bc0:	83 e0 04             	and    eax,0x4
    2bc3:	85 c0                	test   eax,eax
    2bc5:	74 18                	je     2bdf <.L135+0x6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:764
            {
                flags |= FILE_READ;
    2bc7:	80 4d ef 01          	or     BYTE PTR [ebp-0x11],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:765
                flags |= FILE_WRITE;
    2bcb:	80 4d ef 02          	or     BYTE PTR [ebp-0x11],0x2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:766
                flags |= FILE_APPEND;
    2bcf:	80 4d ef 04          	or     BYTE PTR [ebp-0x11],0x4
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:767
                flags |= FILE_CREATE;
    2bd3:	80 4d ef 20          	or     BYTE PTR [ebp-0x11],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:769
            }
            break;
    2bd7:	eb 06                	jmp    2bdf <.L135+0x6>

00002bd9 <.L135>:
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:772
        case 'b':
        case 'B':
            flags |= FILE_BINARY;
    2bd9:	80 4d ef 08          	or     BYTE PTR [ebp-0x11],0x8
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:773
            break;
    2bdd:	eb 01                	jmp    2be0 <.L131>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:769
                flags |= FILE_READ;
                flags |= FILE_WRITE;
                flags |= FILE_APPEND;
                flags |= FILE_CREATE;
            }
            break;
    2bdf:	90                   	nop

00002be0 <.L131>:
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:733 (discriminator 2)
    //        All writing operations are performed at the end of the file, protecting the previous content to be overwritten.
    //        You can reposition (fseek, rewind) the internal pointer to anywhere in the file for reading, but writing operations
    //        will move it back to the end of file.
    //        The file is created if it does not exist.

    for (i=0;i<(int)strlen(mode);i++)
    2be0:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:733 (discriminator 1)
    2be4:	83 ec 0c             	sub    esp,0xc
    2be7:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    2bea:	e8 71 47 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    2bef:	83 c4 10             	add    esp,0x10
    2bf2:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    2bf5:	0f 8f 51 ff ff ff    	jg     2b4c <fl_fopen+0x5b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:777
            flags |= FILE_BINARY;
            break;
        }
    }

    file = NULL;
    2bfb:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:785
    // No write support!
    flags &= ~(FILE_CREATE | FILE_WRITE | FILE_APPEND);
#endif

    // No write access - remove write/modify flags
    if (!_fs.disk_io.write_media)
    2c02:	8b 83 30 42 00 00    	mov    eax,DWORD PTR [ebx+0x4230]
    2c08:	85 c0                	test   eax,eax
    2c0a:	75 04                	jne    2c10 <.L131+0x30>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:786
        flags &= ~(FILE_CREATE | FILE_WRITE | FILE_APPEND);
    2c0c:	80 65 ef d9          	and    BYTE PTR [ebp-0x11],0xd9
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:788

    FL_LOCK(&_fs);
    2c10:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    2c16:	85 c0                	test   eax,eax
    2c18:	74 08                	je     2c22 <.L131+0x42>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:788 (discriminator 1)
    2c1a:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    2c20:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:791

    // Read
    if (flags & FILE_READ)
    2c22:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
    2c26:	83 e0 01             	and    eax,0x1
    2c29:	85 c0                	test   eax,eax
    2c2b:	74 11                	je     2c3e <.L131+0x5e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:792
        file = _open_file(path);
    2c2d:	83 ec 0c             	sub    esp,0xc
    2c30:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2c33:	e8 1d f5 ff ff       	call   2155 <_open_file>
    2c38:	83 c4 10             	add    esp,0x10
    2c3b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:796

    // Create New
#if FATFS_INC_WRITE_SUPPORT
    if (!file && (flags & FILE_CREATE))
    2c3e:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    2c42:	75 1c                	jne    2c60 <.L131+0x80>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:796 (discriminator 1)
    2c44:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
    2c48:	83 e0 20             	and    eax,0x20
    2c4b:	85 c0                	test   eax,eax
    2c4d:	74 11                	je     2c60 <.L131+0x80>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:797
        file = _create_file(path);
    2c4f:	83 ec 0c             	sub    esp,0xc
    2c52:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2c55:	e8 2e f7 ff ff       	call   2388 <_create_file>
    2c5a:	83 c4 10             	add    esp,0x10
    2c5d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:801
#endif

    // Write Existing (and not open due to read or create)
    if (!(flags & FILE_READ))
    2c60:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
    2c64:	83 e0 01             	and    eax,0x1
    2c67:	85 c0                	test   eax,eax
    2c69:	75 2d                	jne    2c98 <.L131+0xb8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:802
        if ((flags & FILE_CREATE) && !file)
    2c6b:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
    2c6f:	83 e0 20             	and    eax,0x20
    2c72:	85 c0                	test   eax,eax
    2c74:	74 22                	je     2c98 <.L131+0xb8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:802 (discriminator 1)
    2c76:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    2c7a:	75 1c                	jne    2c98 <.L131+0xb8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:803
            if (flags & (FILE_WRITE | FILE_APPEND))
    2c7c:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
    2c80:	83 e0 06             	and    eax,0x6
    2c83:	85 c0                	test   eax,eax
    2c85:	74 11                	je     2c98 <.L131+0xb8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:804
                file = _open_file(path);
    2c87:	83 ec 0c             	sub    esp,0xc
    2c8a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2c8d:	e8 c3 f4 ff ff       	call   2155 <_open_file>
    2c92:	83 c4 10             	add    esp,0x10
    2c95:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:806

    if (file)
    2c98:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    2c9c:	74 0d                	je     2cab <.L131+0xcb>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:807
        file->flags = flags;
    2c9e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2ca1:	0f b6 55 ef          	movzx  edx,BYTE PTR [ebp-0x11]
    2ca5:	88 90 30 03 00 00    	mov    BYTE PTR [eax+0x330],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:809

    FL_UNLOCK(&_fs);
    2cab:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    2cb1:	85 c0                	test   eax,eax
    2cb3:	74 08                	je     2cbd <.L131+0xdd>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:809 (discriminator 1)
    2cb5:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    2cbb:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:810
    return file;
    2cbd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:811
}
    2cc0:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    2cc3:	c9                   	leave  
    2cc4:	c3                   	ret    

00002cc5 <_write_sectors>:
_write_sectors():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:817
//-----------------------------------------------------------------------------
// _write_sectors: Write sector(s) to disk
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
static uint32 _write_sectors(FL_FILE* file, uint32 offset, uint8 *buf, uint32 count)
{
    2cc5:	55                   	push   ebp
    2cc6:	89 e5                	mov    ebp,esp
    2cc8:	53                   	push   ebx
    2cc9:	83 ec 24             	sub    esp,0x24
    2ccc:	e8 29 42 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    2cd1:	81 c3 57 82 00 00    	add    ebx,0x8257
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:818
    uint32 SectorNumber = 0;
    2cd7:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:819
    uint32 ClusterIdx = 0;
    2cde:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:820
    uint32 Cluster = 0;
    2ce5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:821
    uint32 LastCluster = FAT32_LAST_CLUSTER;
    2cec:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [ebp-0x24],0xffffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:824
    uint32 i;
    uint32 lba;
    uint32 TotalWriteCount = count;
    2cf3:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    2cf6:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:827

    // Find values for Cluster index & sector within cluster
    ClusterIdx = offset / _fs.sectors_per_cluster;
    2cf9:	0f b6 83 f8 41 00 00 	movzx  eax,BYTE PTR [ebx+0x41f8]
    2d00:	0f b6 c8             	movzx  ecx,al
    2d03:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    2d06:	ba 00 00 00 00       	mov    edx,0x0
    2d0b:	f7 f1                	div    ecx
    2d0d:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:828
    SectorNumber = offset - (ClusterIdx * _fs.sectors_per_cluster);
    2d10:	0f b6 83 f8 41 00 00 	movzx  eax,BYTE PTR [ebx+0x41f8]
    2d17:	0f b6 c0             	movzx  eax,al
    2d1a:	0f af 45 e8          	imul   eax,DWORD PTR [ebp-0x18]
    2d1e:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    2d21:	29 c2                	sub    edx,eax
    2d23:	89 d0                	mov    eax,edx
    2d25:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:831

    // Limit number of sectors written to the number remaining in this cluster
    if ((SectorNumber + count) > _fs.sectors_per_cluster)
    2d28:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    2d2b:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    2d2e:	01 c2                	add    edx,eax
    2d30:	0f b6 83 f8 41 00 00 	movzx  eax,BYTE PTR [ebx+0x41f8]
    2d37:	0f b6 c0             	movzx  eax,al
    2d3a:	39 c2                	cmp    edx,eax
    2d3c:	76 10                	jbe    2d4e <_write_sectors+0x89>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:832
        count = _fs.sectors_per_cluster - SectorNumber;
    2d3e:	0f b6 83 f8 41 00 00 	movzx  eax,BYTE PTR [ebx+0x41f8]
    2d45:	0f b6 c0             	movzx  eax,al
    2d48:	2b 45 ec             	sub    eax,DWORD PTR [ebp-0x14]
    2d4b:	89 45 14             	mov    DWORD PTR [ebp+0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:835

    // Quick lookup for next link in the chain
    if (ClusterIdx == file->last_fat_lookup.ClusterIdx)
    2d4e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2d51:	8b 80 20 01 00 00    	mov    eax,DWORD PTR [eax+0x120]
    2d57:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
    2d5a:	75 11                	jne    2d6d <_write_sectors+0xa8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:836
        Cluster = file->last_fat_lookup.CurrentCluster;
    2d5c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2d5f:	8b 80 24 01 00 00    	mov    eax,DWORD PTR [eax+0x124]
    2d65:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    2d68:	e9 1b 01 00 00       	jmp    2e88 <_write_sectors+0x1c3>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:841
    // Else walk the chain
    else
    {
        // Starting from last recorded cluster?
        if (ClusterIdx && ClusterIdx == file->last_fat_lookup.ClusterIdx + 1)
    2d6d:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
    2d71:	74 2b                	je     2d9e <_write_sectors+0xd9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:841 (discriminator 1)
    2d73:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2d76:	8b 80 20 01 00 00    	mov    eax,DWORD PTR [eax+0x120]
    2d7c:	83 c0 01             	add    eax,0x1
    2d7f:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
    2d82:	75 1a                	jne    2d9e <_write_sectors+0xd9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:843
        {
            i = file->last_fat_lookup.ClusterIdx;
    2d84:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2d87:	8b 80 20 01 00 00    	mov    eax,DWORD PTR [eax+0x120]
    2d8d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:844
            Cluster = file->last_fat_lookup.CurrentCluster;
    2d90:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2d93:	8b 80 24 01 00 00    	mov    eax,DWORD PTR [eax+0x124]
    2d99:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    2d9c:	eb 10                	jmp    2dae <_write_sectors+0xe9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:850
        }
        // Start searching from the beginning..
        else
        {
            // Set start of cluster chain to initial value
            i = 0;
    2d9e:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:851
            Cluster = file->startcluster;
    2da5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2da8:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    2dab:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:855
        }

        // Follow chain to find cluster to read
        for ( ;i<ClusterIdx; i++)
    2dae:	eb 64                	jmp    2e14 <_write_sectors+0x14f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:860
        {
            uint32 nextCluster;

            // Does the entry exist in the cache?
            if (!fatfs_cache_get_next_cluster(&_fs, file, i, &nextCluster))
    2db0:	8d 45 d8             	lea    eax,[ebp-0x28]
    2db3:	50                   	push   eax
    2db4:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    2db7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2dba:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2dc0:	50                   	push   eax
    2dc1:	e8 2a 45 00 00       	call   72f0 <__x86.get_pc_thunk.bx+0x3f6>
    2dc6:	83 c4 10             	add    esp,0x10
    2dc9:	85 c0                	test   eax,eax
    2dcb:	75 31                	jne    2dfe <_write_sectors+0x139>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:863
            {
                // Scan file linked list to find next entry
                nextCluster = fatfs_find_next_cluster(&_fs, Cluster);
    2dcd:	83 ec 08             	sub    esp,0x8
    2dd0:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    2dd3:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2dd9:	50                   	push   eax
    2dda:	e8 e1 44 00 00       	call   72c0 <__x86.get_pc_thunk.bx+0x3c6>
    2ddf:	83 c4 10             	add    esp,0x10
    2de2:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:866

                // Push entry into cache
                fatfs_cache_set_next_cluster(&_fs, file, i, nextCluster);
    2de5:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
    2de8:	50                   	push   eax
    2de9:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    2dec:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2def:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2df5:	50                   	push   eax
    2df6:	e8 75 41 00 00       	call   6f70 <__x86.get_pc_thunk.bx+0x76>
    2dfb:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:869
            }

            LastCluster = Cluster;
    2dfe:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2e01:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:870
            Cluster = nextCluster;
    2e04:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
    2e07:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:873

            // Dont keep following a dead end
            if (Cluster == FAT32_LAST_CLUSTER)
    2e0a:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
    2e0e:	74 0e                	je     2e1e <_write_sectors+0x159>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:855
            i = 0;
            Cluster = file->startcluster;
        }

        // Follow chain to find cluster to read
        for ( ;i<ClusterIdx; i++)
    2e10:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:855 (discriminator 1)
    2e14:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    2e17:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
    2e1a:	72 94                	jb     2db0 <_write_sectors+0xeb>
    2e1c:	eb 01                	jmp    2e1f <_write_sectors+0x15a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:874
            LastCluster = Cluster;
            Cluster = nextCluster;

            // Dont keep following a dead end
            if (Cluster == FAT32_LAST_CLUSTER)
                break;
    2e1e:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:878
        }

        // If we have reached the end of the chain, allocate more!
        if (Cluster == FAT32_LAST_CLUSTER)
    2e1f:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
    2e23:	75 4b                	jne    2e70 <_write_sectors+0x1ab>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:881
        {
            // Add some more cluster(s) to the last good cluster chain
            if (!fatfs_add_free_space(&_fs, &LastCluster,  (TotalWriteCount + _fs.sectors_per_cluster -1) / _fs.sectors_per_cluster))
    2e25:	0f b6 83 f8 41 00 00 	movzx  eax,BYTE PTR [ebx+0x41f8]
    2e2c:	0f b6 d0             	movzx  edx,al
    2e2f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    2e32:	01 d0                	add    eax,edx
    2e34:	83 e8 01             	sub    eax,0x1
    2e37:	0f b6 93 f8 41 00 00 	movzx  edx,BYTE PTR [ebx+0x41f8]
    2e3e:	0f b6 ca             	movzx  ecx,dl
    2e41:	ba 00 00 00 00       	mov    edx,0x0
    2e46:	f7 f1                	div    ecx
    2e48:	83 ec 04             	sub    esp,0x4
    2e4b:	50                   	push   eax
    2e4c:	8d 45 dc             	lea    eax,[ebp-0x24]
    2e4f:	50                   	push   eax
    2e50:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2e56:	50                   	push   eax
    2e57:	e8 44 42 00 00       	call   70a0 <__x86.get_pc_thunk.bx+0x1a6>
    2e5c:	83 c4 10             	add    esp,0x10
    2e5f:	85 c0                	test   eax,eax
    2e61:	75 07                	jne    2e6a <_write_sectors+0x1a5>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:882
                return 0;
    2e63:	b8 00 00 00 00       	mov    eax,0x0
    2e68:	eb 63                	jmp    2ecd <_write_sectors+0x208>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:884

            Cluster = LastCluster;
    2e6a:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
    2e6d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:888
        }

        // Record current cluster lookup details
        file->last_fat_lookup.CurrentCluster = Cluster;
    2e70:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2e73:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    2e76:	89 90 24 01 00 00    	mov    DWORD PTR [eax+0x124],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:889
        file->last_fat_lookup.ClusterIdx = ClusterIdx;
    2e7c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2e7f:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    2e82:	89 90 20 01 00 00    	mov    DWORD PTR [eax+0x120],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:893
    }

    // Calculate write address
    lba = fatfs_lba_of_cluster(&_fs, Cluster) + SectorNumber;
    2e88:	83 ec 08             	sub    esp,0x8
    2e8b:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    2e8e:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2e94:	50                   	push   eax
    2e95:	e8 96 44 00 00       	call   7330 <__x86.get_pc_thunk.bx+0x436>
    2e9a:	83 c4 10             	add    esp,0x10
    2e9d:	89 c2                	mov    edx,eax
    2e9f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    2ea2:	01 d0                	add    eax,edx
    2ea4:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:895

    if (fatfs_sector_write(&_fs, lba, buf, count))
    2ea7:	ff 75 14             	push   DWORD PTR [ebp+0x14]
    2eaa:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    2ead:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    2eb0:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2eb6:	50                   	push   eax
    2eb7:	e8 b4 41 00 00       	call   7070 <__x86.get_pc_thunk.bx+0x176>
    2ebc:	83 c4 10             	add    esp,0x10
    2ebf:	85 c0                	test   eax,eax
    2ec1:	74 05                	je     2ec8 <_write_sectors+0x203>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:896
        return count;
    2ec3:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    2ec6:	eb 05                	jmp    2ecd <_write_sectors+0x208>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:898
    else
        return 0;
    2ec8:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:899 (discriminator 1)
}
    2ecd:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    2ed0:	c9                   	leave  
    2ed1:	c3                   	ret    

00002ed2 <fl_fflush>:
fl_fflush():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:905
#endif
//-----------------------------------------------------------------------------
// fl_fflush: Flush un-written data to the file
//-----------------------------------------------------------------------------
int fl_fflush(void *f)
{
    2ed2:	55                   	push   ebp
    2ed3:	89 e5                	mov    ebp,esp
    2ed5:	53                   	push   ebx
    2ed6:	83 ec 14             	sub    esp,0x14
    2ed9:	e8 1c 40 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    2ede:	81 c3 4a 80 00 00    	add    ebx,0x804a
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:907
#if FATFS_INC_WRITE_SUPPORT
    FL_FILE *file = (FL_FILE *)f;
    2ee4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2ee7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:910

    // If first call to library, initialise
    CHECK_FL_INIT();
    2eea:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    2ef0:	85 c0                	test   eax,eax
    2ef2:	75 05                	jne    2ef9 <fl_fflush+0x27>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:910 (discriminator 1)
    2ef4:	e8 d7 40 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:912

    if (file)
    2ef9:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    2efd:	74 63                	je     2f62 <fl_fflush+0x90>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:914
    {
        FL_LOCK(&_fs);
    2eff:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    2f05:	85 c0                	test   eax,eax
    2f07:	74 08                	je     2f11 <fl_fflush+0x3f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:914 (discriminator 1)
    2f09:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    2f0f:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:917

        // If some write data still in buffer
        if (file->file_data_dirty)
    2f11:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2f14:	8b 80 2c 03 00 00    	mov    eax,DWORD PTR [eax+0x32c]
    2f1a:	85 c0                	test   eax,eax
    2f1c:	74 32                	je     2f50 <fl_fflush+0x7e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:920
        {
            // Write back current sector before loading next
            if (_write_sectors(file, file->file_data_address, file->file_data_sector, 1))
    2f1e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2f21:	8d 90 28 01 00 00    	lea    edx,[eax+0x128]
    2f27:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2f2a:	8b 80 28 03 00 00    	mov    eax,DWORD PTR [eax+0x328]
    2f30:	6a 01                	push   0x1
    2f32:	52                   	push   edx
    2f33:	50                   	push   eax
    2f34:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    2f37:	e8 89 fd ff ff       	call   2cc5 <_write_sectors>
    2f3c:	83 c4 10             	add    esp,0x10
    2f3f:	85 c0                	test   eax,eax
    2f41:	74 0d                	je     2f50 <fl_fflush+0x7e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:921
                file->file_data_dirty = 0;
    2f43:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2f46:	c7 80 2c 03 00 00 00 	mov    DWORD PTR [eax+0x32c],0x0
    2f4d:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:924
        }

        FL_UNLOCK(&_fs);
    2f50:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    2f56:	85 c0                	test   eax,eax
    2f58:	74 08                	je     2f62 <fl_fflush+0x90>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:924 (discriminator 1)
    2f5a:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    2f60:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:927
    }
#endif
    return 0;
    2f62:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:928
}
    2f67:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    2f6a:	c9                   	leave  
    2f6b:	c3                   	ret    

00002f6c <fl_fclose>:
fl_fclose():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:933
//-----------------------------------------------------------------------------
// fl_fclose: Close an open file
//-----------------------------------------------------------------------------
void fl_fclose(void *f)
{
    2f6c:	55                   	push   ebp
    2f6d:	89 e5                	mov    ebp,esp
    2f6f:	53                   	push   ebx
    2f70:	83 ec 14             	sub    esp,0x14
    2f73:	e8 82 3f 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    2f78:	81 c3 b0 7f 00 00    	add    ebx,0x7fb0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:934
    FL_FILE *file = (FL_FILE *)f;
    2f7e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2f81:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:937

    // If first call to library, initialise
    CHECK_FL_INIT();
    2f84:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    2f8a:	85 c0                	test   eax,eax
    2f8c:	75 05                	jne    2f93 <fl_fclose+0x27>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:937 (discriminator 1)
    2f8e:	e8 3d 40 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:939

    if (file)
    2f93:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    2f97:	0f 84 ce 00 00 00    	je     306b <fl_fclose+0xff>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:941
    {
        FL_LOCK(&_fs);
    2f9d:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    2fa3:	85 c0                	test   eax,eax
    2fa5:	74 08                	je     2faf <fl_fclose+0x43>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:941 (discriminator 1)
    2fa7:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    2fad:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:944

        // Flush un-written data to file
        fl_fflush(f);
    2faf:	83 ec 0c             	sub    esp,0xc
    2fb2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2fb5:	e8 c6 42 00 00       	call   7280 <__x86.get_pc_thunk.bx+0x386>
    2fba:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:947

        // File size changed?
        if (file->filelength_changed)
    2fbd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2fc0:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
    2fc3:	85 c0                	test   eax,eax
    2fc5:	74 30                	je     2ff7 <fl_fclose+0x8b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:951
        {
#if FATFS_INC_WRITE_SUPPORT
            // Update filesize in directory
            fatfs_update_file_length(&_fs, file->parentcluster, (char*)file->shortfilename, file->filelength);
    2fc7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2fca:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    2fcd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2fd0:	8d 88 14 01 00 00    	lea    ecx,[eax+0x114]
    2fd6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2fd9:	8b 00                	mov    eax,DWORD PTR [eax]
    2fdb:	52                   	push   edx
    2fdc:	51                   	push   ecx
    2fdd:	50                   	push   eax
    2fde:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    2fe4:	50                   	push   eax
    2fe5:	e8 b6 41 00 00       	call   71a0 <__x86.get_pc_thunk.bx+0x2a6>
    2fea:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:953
#endif
            file->filelength_changed = 0;
    2fed:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2ff0:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:956
        }

        file->bytenum = 0;
    2ff7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    2ffa:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:957
        file->filelength = 0;
    3001:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    3004:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:958
        file->startcluster = 0;
    300b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    300e:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:959
        file->file_data_address = 0xFFFFFFFF;
    3015:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    3018:	c7 80 28 03 00 00 ff 	mov    DWORD PTR [eax+0x328],0xffffffff
    301f:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:960
        file->file_data_dirty = 0;
    3022:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    3025:	c7 80 2c 03 00 00 00 	mov    DWORD PTR [eax+0x32c],0x0
    302c:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:961
        file->filelength_changed = 0;
    302f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    3032:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:964

        // Free file handle
        _free_file(file);
    3039:	83 ec 0c             	sub    esp,0xc
    303c:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    303f:	e8 f0 eb ff ff       	call   1c34 <_free_file>
    3044:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:966

        fatfs_fat_purge(&_fs);
    3047:	83 ec 0c             	sub    esp,0xc
    304a:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    3050:	50                   	push   eax
    3051:	e8 4a 3f 00 00       	call   6fa0 <__x86.get_pc_thunk.bx+0xa6>
    3056:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:968

        FL_UNLOCK(&_fs);
    3059:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    305f:	85 c0                	test   eax,eax
    3061:	74 08                	je     306b <fl_fclose+0xff>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:968 (discriminator 1)
    3063:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    3069:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:970
    }
}
    306b:	90                   	nop
    306c:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    306f:	c9                   	leave  
    3070:	c3                   	ret    

00003071 <fl_fgetc>:
fl_fgetc():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:975
//-----------------------------------------------------------------------------
// fl_fgetc: Get a character in the stream
//-----------------------------------------------------------------------------
int fl_fgetc(void *f)
{
    3071:	55                   	push   ebp
    3072:	89 e5                	mov    ebp,esp
    3074:	53                   	push   ebx
    3075:	83 ec 14             	sub    esp,0x14
    3078:	e8 79 3e 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    307d:	05 ab 7e 00 00       	add    eax,0x7eab
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:977
    int res;
    uint8 data = 0;
    3082:	c6 45 f3 00          	mov    BYTE PTR [ebp-0xd],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:979

    res = fl_fread(&data, 1, 1, f);
    3086:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3089:	6a 01                	push   0x1
    308b:	6a 01                	push   0x1
    308d:	8d 55 f3             	lea    edx,[ebp-0xd]
    3090:	52                   	push   edx
    3091:	89 c3                	mov    ebx,eax
    3093:	e8 a8 40 00 00       	call   7140 <__x86.get_pc_thunk.bx+0x246>
    3098:	83 c4 10             	add    esp,0x10
    309b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:980
    if (res == 1)
    309e:	83 7d f4 01          	cmp    DWORD PTR [ebp-0xc],0x1
    30a2:	75 09                	jne    30ad <fl_fgetc+0x3c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:981
        return (int)data;
    30a4:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
    30a8:	0f b6 c0             	movzx  eax,al
    30ab:	eb 03                	jmp    30b0 <fl_fgetc+0x3f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:983
    else
        return res;
    30ad:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:984 (discriminator 1)
}
    30b0:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    30b3:	c9                   	leave  
    30b4:	c3                   	ret    

000030b5 <fl_fgets>:
fl_fgets():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:989
//-----------------------------------------------------------------------------
// fl_fgets: Get a string from a stream
//-----------------------------------------------------------------------------
char *fl_fgets(char *s, int n, void *f)
{
    30b5:	55                   	push   ebp
    30b6:	89 e5                	mov    ebp,esp
    30b8:	53                   	push   ebx
    30b9:	83 ec 14             	sub    esp,0x14
    30bc:	e8 39 3e 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    30c1:	81 c3 67 7e 00 00    	add    ebx,0x7e67
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:990
    int idx = 0;
    30c7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:993

    // Space for null terminator?
    if (n > 0)
    30ce:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    30d2:	7e 56                	jle    312a <fl_fgets+0x75>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:996
    {
        // While space (+space for null terminator)
        while (idx < (n-1))
    30d4:	eb 32                	jmp    3108 <fl_fgets+0x53>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:998
        {
            int ch = fl_fgetc(f);
    30d6:	83 ec 0c             	sub    esp,0xc
    30d9:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    30dc:	e8 1f 40 00 00       	call   7100 <__x86.get_pc_thunk.bx+0x206>
    30e1:	83 c4 10             	add    esp,0x10
    30e4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1001

            // EOF / Error?
            if (ch < 0)
    30e7:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    30eb:	78 28                	js     3115 <fl_fgets+0x60>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1005
                break;

            // Store character read from stream
            s[idx++] = (char)ch;
    30ed:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    30f0:	8d 50 01             	lea    edx,[eax+0x1]
    30f3:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
    30f6:	89 c2                	mov    edx,eax
    30f8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    30fb:	01 d0                	add    eax,edx
    30fd:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    3100:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1008

            // End of line?
            if (ch == '\n')
    3102:	83 7d f0 0a          	cmp    DWORD PTR [ebp-0x10],0xa
    3106:	74 10                	je     3118 <fl_fgets+0x63>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:996

    // Space for null terminator?
    if (n > 0)
    {
        // While space (+space for null terminator)
        while (idx < (n-1))
    3108:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    310b:	83 e8 01             	sub    eax,0x1
    310e:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    3111:	7f c3                	jg     30d6 <fl_fgets+0x21>
    3113:	eb 04                	jmp    3119 <fl_fgets+0x64>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1002
        {
            int ch = fl_fgetc(f);

            // EOF / Error?
            if (ch < 0)
                break;
    3115:	90                   	nop
    3116:	eb 01                	jmp    3119 <fl_fgets+0x64>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1009
            // Store character read from stream
            s[idx++] = (char)ch;

            // End of line?
            if (ch == '\n')
                break;
    3118:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1012
        }

        if (idx > 0)
    3119:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    311d:	7e 0b                	jle    312a <fl_fgets+0x75>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1013
            s[idx] = '\0';
    311f:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    3122:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3125:	01 d0                	add    eax,edx
    3127:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1016
    }

    return (idx > 0) ? s : 0;
    312a:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    312e:	7e 05                	jle    3135 <fl_fgets+0x80>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1016 (discriminator 1)
    3130:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3133:	eb 05                	jmp    313a <fl_fgets+0x85>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1016 (discriminator 2)
    3135:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1017 (discriminator 5)
}
    313a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    313d:	c9                   	leave  
    313e:	c3                   	ret    

0000313f <fl_fread>:
fl_fread():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1022
//-----------------------------------------------------------------------------
// fl_fread: Read a block of data from the file
//-----------------------------------------------------------------------------
int fl_fread(void * buffer, int size, int length, void *f )
{
    313f:	55                   	push   ebp
    3140:	89 e5                	mov    ebp,esp
    3142:	56                   	push   esi
    3143:	53                   	push   ebx
    3144:	83 ec 20             	sub    esp,0x20
    3147:	e8 ae 3d 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    314c:	81 c3 dc 7d 00 00    	add    ebx,0x7ddc
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1026
    uint32 sector;
    uint32 offset;
    int copyCount;
    int count = size * length;
    3152:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    3155:	0f af 45 10          	imul   eax,DWORD PTR [ebp+0x10]
    3159:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1027
    int bytesRead = 0;
    315c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1029

    FL_FILE *file = (FL_FILE *)f;
    3163:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    3166:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1032

    // If first call to library, initialise
    CHECK_FL_INIT();
    3169:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    316f:	85 c0                	test   eax,eax
    3171:	75 05                	jne    3178 <fl_fread+0x39>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1032 (discriminator 1)
    3173:	e8 58 3e 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1034

    if (buffer==NULL || file==NULL)
    3178:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
    317c:	74 06                	je     3184 <fl_fread+0x45>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1034 (discriminator 1)
    317e:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
    3182:	75 0a                	jne    318e <fl_fread+0x4f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1035
        return -1;
    3184:	b8 ff ff ff ff       	mov    eax,0xffffffff
    3189:	e9 d8 01 00 00       	jmp    3366 <fl_fread+0x227>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1038

    // No read permissions
    if (!(file->flags & FILE_READ))
    318e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    3191:	0f b6 80 30 03 00 00 	movzx  eax,BYTE PTR [eax+0x330]
    3198:	0f b6 c0             	movzx  eax,al
    319b:	83 e0 01             	and    eax,0x1
    319e:	85 c0                	test   eax,eax
    31a0:	75 0a                	jne    31ac <fl_fread+0x6d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1039
        return -1;
    31a2:	b8 ff ff ff ff       	mov    eax,0xffffffff
    31a7:	e9 ba 01 00 00       	jmp    3366 <fl_fread+0x227>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1042

    // Nothing to be done
    if (!count)
    31ac:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
    31b0:	75 0a                	jne    31bc <fl_fread+0x7d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1043
        return 0;
    31b2:	b8 00 00 00 00       	mov    eax,0x0
    31b7:	e9 aa 01 00 00       	jmp    3366 <fl_fread+0x227>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1046

    // Check if read starts past end of file
    if (file->bytenum >= file->filelength)
    31bc:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    31bf:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    31c2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    31c5:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
    31c8:	39 c2                	cmp    edx,eax
    31ca:	72 0a                	jb     31d6 <fl_fread+0x97>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1047
        return -1;
    31cc:	b8 ff ff ff ff       	mov    eax,0xffffffff
    31d1:	e9 90 01 00 00       	jmp    3366 <fl_fread+0x227>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1050

    // Limit to file size
    if ( (file->bytenum + count) > file->filelength )
    31d6:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    31d9:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    31dc:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    31df:	01 c2                	add    edx,eax
    31e1:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    31e4:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
    31e7:	39 c2                	cmp    edx,eax
    31e9:	76 13                	jbe    31fe <fl_fread+0xbf>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1051
        count = file->filelength - file->bytenum;
    31eb:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    31ee:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    31f1:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    31f4:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    31f7:	29 c2                	sub    edx,eax
    31f9:	89 d0                	mov    eax,edx
    31fb:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1054

    // Calculate start sector
    sector = file->bytenum / FAT_SECTOR_SIZE;
    31fe:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    3201:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    3204:	c1 e8 09             	shr    eax,0x9
    3207:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1057

    // Offset to start copying data from first sector
    offset = file->bytenum % FAT_SECTOR_SIZE;
    320a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    320d:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    3210:	25 ff 01 00 00       	and    eax,0x1ff
    3215:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1059

    while (bytesRead < count)
    3218:	e9 34 01 00 00       	jmp    3351 <fl_fread+0x212>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1062
    {
        // Read whole sector, read from media directly into target buffer
        if ((offset == 0) && ((count - bytesRead) >= FAT_SECTOR_SIZE))
    321d:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    3221:	75 63                	jne    3286 <fl_fread+0x147>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1062 (discriminator 1)
    3223:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    3226:	2b 45 e4             	sub    eax,DWORD PTR [ebp-0x1c]
    3229:	3d ff 01 00 00       	cmp    eax,0x1ff
    322e:	7e 56                	jle    3286 <fl_fread+0x147>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1065
        {
            // Read as many sectors as possible into target buffer
            uint32 sectorsRead = _read_sectors(file, sector, (uint8*)((uint8*)buffer + bytesRead), (count - bytesRead) / FAT_SECTOR_SIZE);
    3230:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    3233:	2b 45 e4             	sub    eax,DWORD PTR [ebp-0x1c]
    3236:	8d 90 ff 01 00 00    	lea    edx,[eax+0x1ff]
    323c:	85 c0                	test   eax,eax
    323e:	0f 48 c2             	cmovs  eax,edx
    3241:	c1 f8 09             	sar    eax,0x9
    3244:	89 c1                	mov    ecx,eax
    3246:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
    3249:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    324c:	01 d0                	add    eax,edx
    324e:	51                   	push   ecx
    324f:	50                   	push   eax
    3250:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    3253:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    3256:	e8 ae f4 ff ff       	call   2709 <_read_sectors>
    325b:	83 c4 10             	add    esp,0x10
    325e:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1066
            if (sectorsRead)
    3261:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
    3265:	0f 84 f4 00 00 00    	je     335f <fl_fread+0x220>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1069
            {
                // We have upto one sector to copy
                copyCount = FAT_SECTOR_SIZE * sectorsRead;
    326b:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
    326e:	c1 e0 09             	shl    eax,0x9
    3271:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1072

                // Move onto next sector and reset copy offset
                sector+= sectorsRead;
    3274:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
    3277:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1073
                offset = 0;
    327a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1063

    while (bytesRead < count)
    {
        // Read whole sector, read from media directly into target buffer
        if ((offset == 0) && ((count - bytesRead) >= FAT_SECTOR_SIZE))
        {
    3281:	e9 b4 00 00 00       	jmp    333a <fl_fread+0x1fb>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1081
                break;
        }
        else
        {
            // Do we need to re-read the sector?
            if (file->file_data_address != sector)
    3286:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    3289:	8b 80 28 03 00 00    	mov    eax,DWORD PTR [eax+0x328]
    328f:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    3292:	74 55                	je     32e9 <fl_fread+0x1aa>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1084
            {
                // Flush un-written data to file
                if (file->file_data_dirty)
    3294:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    3297:	8b 80 2c 03 00 00    	mov    eax,DWORD PTR [eax+0x32c]
    329d:	85 c0                	test   eax,eax
    329f:	74 0e                	je     32af <fl_fread+0x170>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1085
                    fl_fflush(file);
    32a1:	83 ec 0c             	sub    esp,0xc
    32a4:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    32a7:	e8 d4 3f 00 00       	call   7280 <__x86.get_pc_thunk.bx+0x386>
    32ac:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1088

                // Get LBA of sector offset within file
                if (!_read_sectors(file, sector, file->file_data_sector, 1))
    32af:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    32b2:	05 28 01 00 00       	add    eax,0x128
    32b7:	6a 01                	push   0x1
    32b9:	50                   	push   eax
    32ba:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    32bd:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    32c0:	e8 44 f4 ff ff       	call   2709 <_read_sectors>
    32c5:	83 c4 10             	add    esp,0x10
    32c8:	85 c0                	test   eax,eax
    32ca:	0f 84 92 00 00 00    	je     3362 <fl_fread+0x223>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1092
                    // Read failed - out of range (probably)
                    break;

                file->file_data_address = sector;
    32d0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    32d3:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    32d6:	89 90 28 03 00 00    	mov    DWORD PTR [eax+0x328],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1093
                file->file_data_dirty = 0;
    32dc:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    32df:	c7 80 2c 03 00 00 00 	mov    DWORD PTR [eax+0x32c],0x0
    32e6:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1097
            }

            // We have upto one sector to copy
            copyCount = FAT_SECTOR_SIZE - offset;
    32e9:	b8 00 02 00 00       	mov    eax,0x200
    32ee:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
    32f1:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1100

            // Only require some of this sector?
            if (copyCount > (count - bytesRead))
    32f4:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    32f7:	2b 45 e4             	sub    eax,DWORD PTR [ebp-0x1c]
    32fa:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
    32fd:	7d 09                	jge    3308 <fl_fread+0x1c9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1101
                copyCount = (count - bytesRead);
    32ff:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    3302:	2b 45 e4             	sub    eax,DWORD PTR [ebp-0x1c]
    3305:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1104

            // Copy to application buffer
            memcpy( (uint8*)((uint8*)buffer + bytesRead), (uint8*)(file->file_data_sector + offset), copyCount);
    3308:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    330b:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
    330e:	8d 8a 28 01 00 00    	lea    ecx,[edx+0x128]
    3314:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    3317:	01 d1                	add    ecx,edx
    3319:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
    331c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    331f:	01 f2                	add    edx,esi
    3321:	83 ec 04             	sub    esp,0x4
    3324:	50                   	push   eax
    3325:	51                   	push   ecx
    3326:	52                   	push   edx
    3327:	e8 94 3c 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
    332c:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1107

            // Move onto next sector and reset copy offset
            sector++;
    332f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1108
            offset = 0;
    3333:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1112
        }

        // Increase total read count
        bytesRead += copyCount;
    333a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    333d:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1115

        // Increment file pointer
        file->bytenum += copyCount;
    3340:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    3343:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    3346:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    3349:	01 c2                	add    edx,eax
    334b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    334e:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1059
    sector = file->bytenum / FAT_SECTOR_SIZE;

    // Offset to start copying data from first sector
    offset = file->bytenum % FAT_SECTOR_SIZE;

    while (bytesRead < count)
    3351:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    3354:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
    3357:	0f 8c c0 fe ff ff    	jl     321d <fl_fread+0xde>
    335d:	eb 04                	jmp    3363 <fl_fread+0x224>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1076
                // Move onto next sector and reset copy offset
                sector+= sectorsRead;
                offset = 0;
            }
            else
                break;
    335f:	90                   	nop
    3360:	eb 01                	jmp    3363 <fl_fread+0x224>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1090
                    fl_fflush(file);

                // Get LBA of sector offset within file
                if (!_read_sectors(file, sector, file->file_data_sector, 1))
                    // Read failed - out of range (probably)
                    break;
    3362:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1118

        // Increment file pointer
        file->bytenum += copyCount;
    }

    return bytesRead;
    3363:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1119
}
    3366:	8d 65 f8             	lea    esp,[ebp-0x8]
    3369:	5b                   	pop    ebx
    336a:	5e                   	pop    esi
    336b:	5d                   	pop    ebp
    336c:	c3                   	ret    

0000336d <fl_fseek>:
fl_fseek():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1124
//-----------------------------------------------------------------------------
// fl_fseek: Seek to a specific place in the file
//-----------------------------------------------------------------------------
int fl_fseek( void *f, long offset, int origin )
{
    336d:	55                   	push   ebp
    336e:	89 e5                	mov    ebp,esp
    3370:	53                   	push   ebx
    3371:	83 ec 14             	sub    esp,0x14
    3374:	e8 81 3b 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    3379:	81 c3 af 7b 00 00    	add    ebx,0x7baf
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1125
    FL_FILE *file = (FL_FILE *)f;
    337f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3382:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1126
    int res = -1;
    3385:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1129

    // If first call to library, initialise
    CHECK_FL_INIT();
    338c:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    3392:	85 c0                	test   eax,eax
    3394:	75 05                	jne    339b <fl_fseek+0x2e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1129 (discriminator 1)
    3396:	e8 35 3c 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1131

    if (!file)
    339b:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    339f:	75 0a                	jne    33ab <fl_fseek+0x3e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1132
        return -1;
    33a1:	b8 ff ff ff ff       	mov    eax,0xffffffff
    33a6:	e9 21 01 00 00       	jmp    34cc <fl_fseek+0x15f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1134

    if (origin == SEEK_END && offset != 0)
    33ab:	83 7d 10 02          	cmp    DWORD PTR [ebp+0x10],0x2
    33af:	75 10                	jne    33c1 <fl_fseek+0x54>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1134 (discriminator 1)
    33b1:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    33b5:	74 0a                	je     33c1 <fl_fseek+0x54>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1135
        return -1;
    33b7:	b8 ff ff ff ff       	mov    eax,0xffffffff
    33bc:	e9 0b 01 00 00       	jmp    34cc <fl_fseek+0x15f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1137

    FL_LOCK(&_fs);
    33c1:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    33c7:	85 c0                	test   eax,eax
    33c9:	74 08                	je     33d3 <fl_fseek+0x66>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1137 (discriminator 1)
    33cb:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    33d1:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1140

    // Invalidate file buffer
    file->file_data_address = 0xFFFFFFFF;
    33d3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    33d6:	c7 80 28 03 00 00 ff 	mov    DWORD PTR [eax+0x328],0xffffffff
    33dd:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1141
    file->file_data_dirty = 0;
    33e0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    33e3:	c7 80 2c 03 00 00 00 	mov    DWORD PTR [eax+0x32c],0x0
    33ea:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1143

    if (origin == SEEK_SET)
    33ed:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
    33f1:	75 31                	jne    3424 <fl_fseek+0xb7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1145
    {
        file->bytenum = (uint32)offset;
    33f3:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    33f6:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    33f9:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1147

        if (file->bytenum > file->filelength)
    33fc:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    33ff:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    3402:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    3405:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
    3408:	39 c2                	cmp    edx,eax
    340a:	76 0c                	jbe    3418 <fl_fseek+0xab>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1148
            file->bytenum = file->filelength;
    340c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    340f:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    3412:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    3415:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1150

        res = 0;
    3418:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    341f:	e9 93 00 00 00       	jmp    34b7 <fl_fseek+0x14a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1152
    }
    else if (origin == SEEK_CUR)
    3424:	83 7d 10 01          	cmp    DWORD PTR [ebp+0x10],0x1
    3428:	75 6b                	jne    3495 <fl_fseek+0x128>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1155
    {
        // Positive shift
        if (offset >= 0)
    342a:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    342e:	78 2f                	js     345f <fl_fseek+0xf2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1157
        {
            file->bytenum += offset;
    3430:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    3433:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    3436:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    3439:	01 c2                	add    edx,eax
    343b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    343e:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1159

            if (file->bytenum > file->filelength)
    3441:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    3444:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    3447:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    344a:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
    344d:	39 c2                	cmp    edx,eax
    344f:	76 3b                	jbe    348c <fl_fseek+0x11f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1160
                file->bytenum = file->filelength;
    3451:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    3454:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    3457:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    345a:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
    345d:	eb 2d                	jmp    348c <fl_fseek+0x11f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1166
        }
        // Negative shift
        else
        {
            // Make shift positive
            offset = -offset;
    345f:	f7 5d 0c             	neg    DWORD PTR [ebp+0xc]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1169

            // Limit to negative shift to start of file
            if ((uint32)offset > file->bytenum)
    3462:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    3465:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    3468:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    346b:	39 c2                	cmp    edx,eax
    346d:	73 0c                	jae    347b <fl_fseek+0x10e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1170
                file->bytenum = 0;
    346f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    3472:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
    3479:	eb 11                	jmp    348c <fl_fseek+0x11f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1172
            else
                file->bytenum-= offset;
    347b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    347e:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    3481:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    3484:	29 c2                	sub    edx,eax
    3486:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    3489:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1175
        }

        res = 0;
    348c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    3493:	eb 22                	jmp    34b7 <fl_fseek+0x14a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1177
    }
    else if (origin == SEEK_END)
    3495:	83 7d 10 02          	cmp    DWORD PTR [ebp+0x10],0x2
    3499:	75 15                	jne    34b0 <fl_fseek+0x143>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1179
    {
        file->bytenum = file->filelength;
    349b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    349e:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    34a1:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    34a4:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1180
        res = 0;
    34a7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    34ae:	eb 07                	jmp    34b7 <fl_fseek+0x14a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1183
    }
    else
        res = -1;
    34b0:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1185

    FL_UNLOCK(&_fs);
    34b7:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    34bd:	85 c0                	test   eax,eax
    34bf:	74 08                	je     34c9 <fl_fseek+0x15c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1185 (discriminator 1)
    34c1:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    34c7:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1187

    return res;
    34c9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1188
}
    34cc:	83 c4 14             	add    esp,0x14
    34cf:	5b                   	pop    ebx
    34d0:	5d                   	pop    ebp
    34d1:	c3                   	ret    

000034d2 <fl_fgetpos>:
fl_fgetpos():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1193
//-----------------------------------------------------------------------------
// fl_fgetpos: Get the current file position
//-----------------------------------------------------------------------------
int fl_fgetpos(void *f , uint32 * position)
{
    34d2:	55                   	push   ebp
    34d3:	89 e5                	mov    ebp,esp
    34d5:	53                   	push   ebx
    34d6:	83 ec 14             	sub    esp,0x14
    34d9:	e8 1c 3a 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    34de:	81 c3 4a 7a 00 00    	add    ebx,0x7a4a
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1194
    FL_FILE *file = (FL_FILE *)f;
    34e4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    34e7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1196

    if (!file)
    34ea:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    34ee:	75 07                	jne    34f7 <fl_fgetpos+0x25>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1197
        return -1;
    34f0:	b8 ff ff ff ff       	mov    eax,0xffffffff
    34f5:	eb 34                	jmp    352b <fl_fgetpos+0x59>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1199

    FL_LOCK(&_fs);
    34f7:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    34fd:	85 c0                	test   eax,eax
    34ff:	74 08                	je     3509 <fl_fgetpos+0x37>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1199 (discriminator 1)
    3501:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3507:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1202

    // Get position
    *position = file->bytenum;
    3509:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    350c:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    350f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    3512:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1204

    FL_UNLOCK(&_fs);
    3514:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    351a:	85 c0                	test   eax,eax
    351c:	74 08                	je     3526 <fl_fgetpos+0x54>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1204 (discriminator 1)
    351e:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    3524:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1206

    return 0;
    3526:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1207
}
    352b:	83 c4 14             	add    esp,0x14
    352e:	5b                   	pop    ebx
    352f:	5d                   	pop    ebp
    3530:	c3                   	ret    

00003531 <fl_ftell>:
fl_ftell():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1212
//-----------------------------------------------------------------------------
// fl_ftell: Get the current file position
//-----------------------------------------------------------------------------
long fl_ftell(void *f)
{
    3531:	55                   	push   ebp
    3532:	89 e5                	mov    ebp,esp
    3534:	53                   	push   ebx
    3535:	83 ec 14             	sub    esp,0x14
    3538:	e8 b9 39 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    353d:	05 eb 79 00 00       	add    eax,0x79eb
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1213
    uint32 pos = 0;
    3542:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1215

    fl_fgetpos(f, &pos);
    3549:	83 ec 08             	sub    esp,0x8
    354c:	8d 55 f4             	lea    edx,[ebp-0xc]
    354f:	52                   	push   edx
    3550:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3553:	89 c3                	mov    ebx,eax
    3555:	e8 b6 3b 00 00       	call   7110 <__x86.get_pc_thunk.bx+0x216>
    355a:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1217

    return (long)pos;
    355d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1218
}
    3560:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    3563:	c9                   	leave  
    3564:	c3                   	ret    

00003565 <fl_feof>:
fl_feof():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1223
//-----------------------------------------------------------------------------
// fl_feof: Is the file pointer at the end of the stream?
//-----------------------------------------------------------------------------
int fl_feof(void *f)
{
    3565:	55                   	push   ebp
    3566:	89 e5                	mov    ebp,esp
    3568:	53                   	push   ebx
    3569:	83 ec 14             	sub    esp,0x14
    356c:	e8 89 39 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    3571:	81 c3 b7 79 00 00    	add    ebx,0x79b7
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1224
    FL_FILE *file = (FL_FILE *)f;
    3577:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    357a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1227
    int res;

    if (!file)
    357d:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    3581:	75 07                	jne    358a <fl_feof+0x25>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1228
        return -1;
    3583:	b8 ff ff ff ff       	mov    eax,0xffffffff
    3588:	eb 47                	jmp    35d1 <fl_feof+0x6c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1230

    FL_LOCK(&_fs);
    358a:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3590:	85 c0                	test   eax,eax
    3592:	74 08                	je     359c <fl_feof+0x37>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1230 (discriminator 1)
    3594:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    359a:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1232

    if (file->bytenum == file->filelength)
    359c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    359f:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    35a2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    35a5:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
    35a8:	39 c2                	cmp    edx,eax
    35aa:	75 09                	jne    35b5 <fl_feof+0x50>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1233
        res = EOF;
    35ac:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
    35b3:	eb 07                	jmp    35bc <fl_feof+0x57>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1235
    else
        res = 0;
    35b5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1237

    FL_UNLOCK(&_fs);
    35bc:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    35c2:	85 c0                	test   eax,eax
    35c4:	74 08                	je     35ce <fl_feof+0x69>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1237 (discriminator 1)
    35c6:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    35cc:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1239

    return res;
    35ce:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1240
}
    35d1:	83 c4 14             	add    esp,0x14
    35d4:	5b                   	pop    ebx
    35d5:	5d                   	pop    ebp
    35d6:	c3                   	ret    

000035d7 <fl_fputc>:
fl_fputc():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1246
//-----------------------------------------------------------------------------
// fl_fputc: Write a character to the stream
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fl_fputc(int c, void *f)
{
    35d7:	55                   	push   ebp
    35d8:	89 e5                	mov    ebp,esp
    35da:	53                   	push   ebx
    35db:	83 ec 14             	sub    esp,0x14
    35de:	e8 13 39 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    35e3:	05 45 79 00 00       	add    eax,0x7945
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1247
    uint8 data = (uint8)c;
    35e8:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    35eb:	88 55 f3             	mov    BYTE PTR [ebp-0xd],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1250
    int res;

    res = fl_fwrite(&data, 1, 1, f);
    35ee:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    35f1:	6a 01                	push   0x1
    35f3:	6a 01                	push   0x1
    35f5:	8d 55 f3             	lea    edx,[ebp-0xd]
    35f8:	52                   	push   edx
    35f9:	89 c3                	mov    ebx,eax
    35fb:	e8 50 39 00 00       	call   6f50 <__x86.get_pc_thunk.bx+0x56>
    3600:	83 c4 10             	add    esp,0x10
    3603:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1251
    if (res == 1)
    3606:	83 7d f4 01          	cmp    DWORD PTR [ebp-0xc],0x1
    360a:	75 05                	jne    3611 <fl_fputc+0x3a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1252
        return c;
    360c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    360f:	eb 03                	jmp    3614 <fl_fputc+0x3d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1254
    else
        return res;
    3611:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1255 (discriminator 1)
}
    3614:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    3617:	c9                   	leave  
    3618:	c3                   	ret    

00003619 <fl_fwrite>:
fl_fwrite():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1262
//-----------------------------------------------------------------------------
// fl_fwrite: Write a block of data to the stream
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fl_fwrite(const void * data, int size, int count, void *f )
{
    3619:	55                   	push   ebp
    361a:	89 e5                	mov    ebp,esp
    361c:	53                   	push   ebx
    361d:	83 ec 24             	sub    esp,0x24
    3620:	e8 d5 38 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    3625:	81 c3 03 79 00 00    	add    ebx,0x7903
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1263
    FL_FILE *file = (FL_FILE *)f;
    362b:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    362e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1266
    uint32 sector;
    uint32 offset;
    uint32 length = (size*count);
    3631:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    3634:	0f af 45 10          	imul   eax,DWORD PTR [ebp+0x10]
    3638:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1267
    uint8 *buffer = (uint8 *)data;
    363b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    363e:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1268
    uint32 bytesWritten = 0;
    3641:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1272
    uint32 copyCount;

    // If first call to library, initialise
    CHECK_FL_INIT();
    3648:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    364e:	85 c0                	test   eax,eax
    3650:	75 05                	jne    3657 <fl_fwrite+0x3e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1272 (discriminator 1)
    3652:	e8 79 39 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1274

    if (!file)
    3657:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
    365b:	75 0a                	jne    3667 <fl_fwrite+0x4e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1275
        return -1;
    365d:	b8 ff ff ff ff       	mov    eax,0xffffffff
    3662:	e9 90 02 00 00       	jmp    38f7 <fl_fwrite+0x2de>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1277

    FL_LOCK(&_fs);
    3667:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    366d:	85 c0                	test   eax,eax
    366f:	74 08                	je     3679 <fl_fwrite+0x60>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1277 (discriminator 1)
    3671:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3677:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1280

    // No write permissions
    if (!(file->flags & FILE_WRITE))
    3679:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    367c:	0f b6 80 30 03 00 00 	movzx  eax,BYTE PTR [eax+0x330]
    3683:	0f b6 c0             	movzx  eax,al
    3686:	83 e0 02             	and    eax,0x2
    3689:	85 c0                	test   eax,eax
    368b:	75 1c                	jne    36a9 <fl_fwrite+0x90>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1282
    {
        FL_UNLOCK(&_fs);
    368d:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    3693:	85 c0                	test   eax,eax
    3695:	74 08                	je     369f <fl_fwrite+0x86>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1282 (discriminator 1)
    3697:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    369d:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1283
        return -1;
    369f:	b8 ff ff ff ff       	mov    eax,0xffffffff
    36a4:	e9 4e 02 00 00       	jmp    38f7 <fl_fwrite+0x2de>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1287
    }

    // Append writes to end of file
    if (file->flags & FILE_APPEND)
    36a9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    36ac:	0f b6 80 30 03 00 00 	movzx  eax,BYTE PTR [eax+0x330]
    36b3:	0f b6 c0             	movzx  eax,al
    36b6:	83 e0 04             	and    eax,0x4
    36b9:	85 c0                	test   eax,eax
    36bb:	74 0c                	je     36c9 <fl_fwrite+0xb0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1288
        file->bytenum = file->filelength;
    36bd:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    36c0:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    36c3:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    36c6:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1292
    // Else write to current position

    // Calculate start sector
    sector = file->bytenum / FAT_SECTOR_SIZE;
    36c9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    36cc:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    36cf:	c1 e8 09             	shr    eax,0x9
    36d2:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1295

    // Offset to start copying data from first sector
    offset = file->bytenum % FAT_SECTOR_SIZE;
    36d5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    36d8:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    36db:	25 ff 01 00 00       	and    eax,0x1ff
    36e0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1297

    while (bytesWritten < length)
    36e3:	e9 b7 01 00 00       	jmp    389f <fl_fwrite+0x286>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1300
    {
        // Whole sector or more to be written?
        if ((offset == 0) && ((length - bytesWritten) >= FAT_SECTOR_SIZE))
    36e8:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    36ec:	0f 85 b6 00 00 00    	jne    37a8 <fl_fwrite+0x18f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1300 (discriminator 1)
    36f2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    36f5:	2b 45 ec             	sub    eax,DWORD PTR [ebp-0x14]
    36f8:	3d ff 01 00 00       	cmp    eax,0x1ff
    36fd:	0f 86 a5 00 00 00    	jbe    37a8 <fl_fwrite+0x18f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1305
        {
            uint32 sectorsWrote;

            // Buffered sector, flush back to disk
            if (file->file_data_address != 0xFFFFFFFF)
    3703:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    3706:	8b 80 28 03 00 00    	mov    eax,DWORD PTR [eax+0x328]
    370c:	83 f8 ff             	cmp    eax,0xffffffff
    370f:	74 35                	je     3746 <fl_fwrite+0x12d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1308
            {
                // Flush un-written data to file
                if (file->file_data_dirty)
    3711:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    3714:	8b 80 2c 03 00 00    	mov    eax,DWORD PTR [eax+0x32c]
    371a:	85 c0                	test   eax,eax
    371c:	74 0e                	je     372c <fl_fwrite+0x113>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1309
                    fl_fflush(file);
    371e:	83 ec 0c             	sub    esp,0xc
    3721:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
    3724:	e8 57 3b 00 00       	call   7280 <__x86.get_pc_thunk.bx+0x386>
    3729:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1311

                file->file_data_address = 0xFFFFFFFF;
    372c:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    372f:	c7 80 28 03 00 00 ff 	mov    DWORD PTR [eax+0x328],0xffffffff
    3736:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1312
                file->file_data_dirty = 0;
    3739:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    373c:	c7 80 2c 03 00 00 00 	mov    DWORD PTR [eax+0x32c],0x0
    3743:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1316
            }

            // Write as many sectors as possible
            sectorsWrote = _write_sectors(file, sector, (uint8*)(buffer + bytesWritten), (length - bytesWritten) / FAT_SECTOR_SIZE);
    3746:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    3749:	2b 45 ec             	sub    eax,DWORD PTR [ebp-0x14]
    374c:	c1 e8 09             	shr    eax,0x9
    374f:	89 c2                	mov    edx,eax
    3751:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
    3754:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    3757:	01 c8                	add    eax,ecx
    3759:	52                   	push   edx
    375a:	50                   	push   eax
    375b:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    375e:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
    3761:	e8 5f f5 ff ff       	call   2cc5 <_write_sectors>
    3766:	83 c4 10             	add    esp,0x10
    3769:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1317
            copyCount = FAT_SECTOR_SIZE * sectorsWrote;
    376c:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
    376f:	c1 e0 09             	shl    eax,0x9
    3772:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1320

            // Increase total read count
            bytesWritten += copyCount;
    3775:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    3778:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1323

            // Increment file pointer
            file->bytenum += copyCount;
    377b:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    377e:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    3781:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    3784:	01 c2                	add    edx,eax
    3786:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    3789:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1326

            // Move onto next sector and reset copy offset
            sector+= sectorsWrote;
    378c:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
    378f:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1327
            offset = 0;
    3792:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1329

            if (!sectorsWrote)
    3799:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
    379d:	0f 84 0a 01 00 00    	je     38ad <fl_fwrite+0x294>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1301

    while (bytesWritten < length)
    {
        // Whole sector or more to be written?
        if ((offset == 0) && ((length - bytesWritten) >= FAT_SECTOR_SIZE))
        {
    37a3:	e9 f7 00 00 00       	jmp    389f <fl_fwrite+0x286>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1335
                break;
        }
        else
        {
            // We have upto one sector to copy
            copyCount = FAT_SECTOR_SIZE - offset;
    37a8:	b8 00 02 00 00       	mov    eax,0x200
    37ad:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
    37b0:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1338

            // Only require some of this sector?
            if (copyCount > (length - bytesWritten))
    37b3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    37b6:	2b 45 ec             	sub    eax,DWORD PTR [ebp-0x14]
    37b9:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
    37bc:	73 09                	jae    37c7 <fl_fwrite+0x1ae>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1339
                copyCount = (length - bytesWritten);
    37be:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    37c1:	2b 45 ec             	sub    eax,DWORD PTR [ebp-0x14]
    37c4:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1342

            // Do we need to read a new sector?
            if (file->file_data_address != sector)
    37c7:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    37ca:	8b 80 28 03 00 00    	mov    eax,DWORD PTR [eax+0x328]
    37d0:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    37d3:	74 75                	je     384a <fl_fwrite+0x231>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1345
            {
                // Flush un-written data to file
                if (file->file_data_dirty)
    37d5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    37d8:	8b 80 2c 03 00 00    	mov    eax,DWORD PTR [eax+0x32c]
    37de:	85 c0                	test   eax,eax
    37e0:	74 0e                	je     37f0 <fl_fwrite+0x1d7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1346
                    fl_fflush(file);
    37e2:	83 ec 0c             	sub    esp,0xc
    37e5:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
    37e8:	e8 93 3a 00 00       	call   7280 <__x86.get_pc_thunk.bx+0x386>
    37ed:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1349

                // If we plan to overwrite the whole sector, we don't need to read it first!
                if (copyCount != FAT_SECTOR_SIZE)
    37f0:	81 7d e8 00 02 00 00 	cmp    DWORD PTR [ebp-0x18],0x200
    37f7:	74 38                	je     3831 <fl_fwrite+0x218>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1356
                    // NOTE: This does not have succeed; if last sector of file
                    // reached, no valid data will be read in, but write will
                    // allocate some more space for new data.

                    // Get LBA of sector offset within file
                    if (!_read_sectors(file, sector, file->file_data_sector, 1))
    37f9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    37fc:	05 28 01 00 00       	add    eax,0x128
    3801:	6a 01                	push   0x1
    3803:	50                   	push   eax
    3804:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    3807:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
    380a:	e8 fa ee ff ff       	call   2709 <_read_sectors>
    380f:	83 c4 10             	add    esp,0x10
    3812:	85 c0                	test   eax,eax
    3814:	75 1b                	jne    3831 <fl_fwrite+0x218>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1357
                        memset(file->file_data_sector, 0x00, FAT_SECTOR_SIZE);
    3816:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    3819:	05 28 01 00 00       	add    eax,0x128
    381e:	83 ec 04             	sub    esp,0x4
    3821:	68 00 02 00 00       	push   0x200
    3826:	6a 00                	push   0x0
    3828:	50                   	push   eax
    3829:	e8 12 3a 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    382e:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1360
                }

                file->file_data_address = sector;
    3831:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    3834:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    3837:	89 90 28 03 00 00    	mov    DWORD PTR [eax+0x328],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1361
                file->file_data_dirty = 0;
    383d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    3840:	c7 80 2c 03 00 00 00 	mov    DWORD PTR [eax+0x32c],0x0
    3847:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1365
            }

            // Copy from application buffer into sector buffer
            memcpy((uint8*)(file->file_data_sector + offset), (uint8*)(buffer + bytesWritten), copyCount);
    384a:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
    384d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    3850:	01 c2                	add    edx,eax
    3852:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    3855:	8d 88 28 01 00 00    	lea    ecx,[eax+0x128]
    385b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    385e:	01 c8                	add    eax,ecx
    3860:	83 ec 04             	sub    esp,0x4
    3863:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    3866:	52                   	push   edx
    3867:	50                   	push   eax
    3868:	e8 53 37 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
    386d:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1368

            // Mark buffer as dirty
            file->file_data_dirty = 1;
    3870:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    3873:	c7 80 2c 03 00 00 01 	mov    DWORD PTR [eax+0x32c],0x1
    387a:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1371

            // Increase total read count
            bytesWritten += copyCount;
    387d:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    3880:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1374

            // Increment file pointer
            file->bytenum += copyCount;
    3883:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    3886:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    3889:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    388c:	01 c2                	add    edx,eax
    388e:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    3891:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1377

            // Move onto next sector and reset copy offset
            sector++;
    3894:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1378
            offset = 0;
    3898:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1297
    sector = file->bytenum / FAT_SECTOR_SIZE;

    // Offset to start copying data from first sector
    offset = file->bytenum % FAT_SECTOR_SIZE;

    while (bytesWritten < length)
    389f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    38a2:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
    38a5:	0f 82 3d fe ff ff    	jb     36e8 <fl_fwrite+0xcf>
    38ab:	eb 01                	jmp    38ae <fl_fwrite+0x295>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1330
            // Move onto next sector and reset copy offset
            sector+= sectorsWrote;
            offset = 0;

            if (!sectorsWrote)
                break;
    38ad:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1383
            offset = 0;
        }
    }

    // Write increased extent of the file?
    if (file->bytenum > file->filelength)
    38ae:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    38b1:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    38b4:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    38b7:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
    38ba:	39 c2                	cmp    edx,eax
    38bc:	76 16                	jbe    38d4 <fl_fwrite+0x2bb>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1386
    {
        // Increase file size to new point
        file->filelength = file->bytenum;
    38be:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    38c1:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
    38c4:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    38c7:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1390

        // We are changing the file length and this
        // will need to be writen back at some point
        file->filelength_changed = 1;
    38ca:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    38cd:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1396
    }

#if FATFS_INC_TIME_DATE_SUPPORT
    // If time & date support is enabled, always force directory entry to be
    // written in-order to update file modify / access time & date.
    file->filelength_changed = 1;
    38d4:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    38d7:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1399
#endif

    FL_UNLOCK(&_fs);
    38de:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    38e4:	85 c0                	test   eax,eax
    38e6:	74 08                	je     38f0 <fl_fwrite+0x2d7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1399 (discriminator 1)
    38e8:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    38ee:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1401

    return (size*count);
    38f0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    38f3:	0f af 45 10          	imul   eax,DWORD PTR [ebp+0x10]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1402
}
    38f7:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    38fa:	c9                   	leave  
    38fb:	c3                   	ret    

000038fc <fl_fputs>:
fl_fputs():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1409
//-----------------------------------------------------------------------------
// fl_fputs: Write a character string to the stream
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fl_fputs(const char * str, void *f)
{
    38fc:	55                   	push   ebp
    38fd:	89 e5                	mov    ebp,esp
    38ff:	53                   	push   ebx
    3900:	83 ec 14             	sub    esp,0x14
    3903:	e8 f2 35 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    3908:	81 c3 20 76 00 00    	add    ebx,0x7620
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1410
    int len = (int)strlen(str);
    390e:	83 ec 0c             	sub    esp,0xc
    3911:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3914:	e8 47 3a 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    3919:	83 c4 10             	add    esp,0x10
    391c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1411
    int res = fl_fwrite(str, 1, len, f);
    391f:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    3922:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    3925:	6a 01                	push   0x1
    3927:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    392a:	e8 21 36 00 00       	call   6f50 <__x86.get_pc_thunk.bx+0x56>
    392f:	83 c4 10             	add    esp,0x10
    3932:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1413

    if (res == len)
    3935:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    3938:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    393b:	75 05                	jne    3942 <fl_fputs+0x46>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1414
        return len;
    393d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    3940:	eb 03                	jmp    3945 <fl_fputs+0x49>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1416
    else
        return res;
    3942:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1417
}
    3945:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    3948:	c9                   	leave  
    3949:	c3                   	ret    

0000394a <fl_remove>:
fl_remove():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1424
//-----------------------------------------------------------------------------
// fl_remove: Remove a file from the filesystem
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fl_remove( const char * filename )
{
    394a:	55                   	push   ebp
    394b:	89 e5                	mov    ebp,esp
    394d:	53                   	push   ebx
    394e:	83 ec 14             	sub    esp,0x14
    3951:	e8 a4 35 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    3956:	81 c3 d2 75 00 00    	add    ebx,0x75d2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1426
    FL_FILE* file;
    int res = -1;
    395c:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1428

    FL_LOCK(&_fs);
    3963:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3969:	85 c0                	test   eax,eax
    396b:	74 08                	je     3975 <fl_remove+0x2b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1428 (discriminator 1)
    396d:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3973:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1431

    // Use read_file as this will check if the file is already open!
    file = fl_fopen((char*)filename, "r");
    3975:	83 ec 08             	sub    esp,0x8
    3978:	8d 83 24 c8 ff ff    	lea    eax,[ebx-0x37dc]
    397e:	50                   	push   eax
    397f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3982:	e8 79 38 00 00       	call   7200 <__x86.get_pc_thunk.bx+0x306>
    3987:	83 c4 10             	add    esp,0x10
    398a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1432
    if (file)
    398d:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    3991:	74 58                	je     39eb <fl_remove+0xa1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1435
    {
        // Delete allocated space
        if (fatfs_free_cluster_chain(&_fs, file->startcluster))
    3993:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    3996:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    3999:	83 ec 08             	sub    esp,0x8
    399c:	50                   	push   eax
    399d:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    39a3:	50                   	push   eax
    39a4:	e8 77 39 00 00       	call   7320 <__x86.get_pc_thunk.bx+0x426>
    39a9:	83 c4 10             	add    esp,0x10
    39ac:	85 c0                	test   eax,eax
    39ae:	74 3b                	je     39eb <fl_remove+0xa1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1438
        {
            // Remove directory entries
            if (fatfs_mark_file_deleted(&_fs, file->parentcluster, (char*)file->shortfilename))
    39b0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    39b3:	8d 90 14 01 00 00    	lea    edx,[eax+0x114]
    39b9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    39bc:	8b 00                	mov    eax,DWORD PTR [eax]
    39be:	83 ec 04             	sub    esp,0x4
    39c1:	52                   	push   edx
    39c2:	50                   	push   eax
    39c3:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    39c9:	50                   	push   eax
    39ca:	e8 41 35 00 00       	call   6f10 <__x86.get_pc_thunk.bx+0x16>
    39cf:	83 c4 10             	add    esp,0x10
    39d2:	85 c0                	test   eax,eax
    39d4:	74 15                	je     39eb <fl_remove+0xa1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1442
            {
                // Close the file handle (this should not write anything to the file
                // as we have not changed the file since opening it!)
                fl_fclose(file);
    39d6:	83 ec 0c             	sub    esp,0xc
    39d9:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    39dc:	e8 8f 37 00 00       	call   7170 <__x86.get_pc_thunk.bx+0x276>
    39e1:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1444

                res = 0;
    39e4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1449
            }
        }
    }

    FL_UNLOCK(&_fs);
    39eb:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    39f1:	85 c0                	test   eax,eax
    39f3:	74 08                	je     39fd <fl_remove+0xb3>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1449 (discriminator 1)
    39f5:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    39fb:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1451

    return res;
    39fd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1452
}
    3a00:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    3a03:	c9                   	leave  
    3a04:	c3                   	ret    

00003a05 <fl_createdirectory>:
fl_createdirectory():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1459
//-----------------------------------------------------------------------------
// fl_createdirectory: Create a directory based on a path
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fl_createdirectory(const char *path)
{
    3a05:	55                   	push   ebp
    3a06:	89 e5                	mov    ebp,esp
    3a08:	53                   	push   ebx
    3a09:	83 ec 14             	sub    esp,0x14
    3a0c:	e8 e9 34 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    3a11:	81 c3 17 75 00 00    	add    ebx,0x7517
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1463
    int res;

    // If first call to library, initialise
    CHECK_FL_INIT();
    3a17:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    3a1d:	85 c0                	test   eax,eax
    3a1f:	75 05                	jne    3a26 <fl_createdirectory+0x21>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1463 (discriminator 1)
    3a21:	e8 aa 35 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1465

    FL_LOCK(&_fs);
    3a26:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3a2c:	85 c0                	test   eax,eax
    3a2e:	74 08                	je     3a38 <fl_createdirectory+0x33>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1465 (discriminator 1)
    3a30:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3a36:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1466
    res =_create_directory((char*)path);
    3a38:	83 ec 0c             	sub    esp,0xc
    3a3b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3a3e:	e8 33 e3 ff ff       	call   1d76 <_create_directory>
    3a43:	83 c4 10             	add    esp,0x10
    3a46:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1467
    FL_UNLOCK(&_fs);
    3a49:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    3a4f:	85 c0                	test   eax,eax
    3a51:	74 08                	je     3a5b <fl_createdirectory+0x56>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1467 (discriminator 1)
    3a53:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    3a59:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1469

    return res;
    3a5b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1470
}
    3a5e:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    3a61:	c9                   	leave  
    3a62:	c3                   	ret    

00003a63 <fl_listdirectory>:
fl_listdirectory():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1477
//-----------------------------------------------------------------------------
// fl_listdirectory: List a directory based on a path
//-----------------------------------------------------------------------------
#if FATFS_DIR_LIST_SUPPORT
void fl_listdirectory(const char *path)
{
    3a63:	55                   	push   ebp
    3a64:	89 e5                	mov    ebp,esp
    3a66:	57                   	push   edi
    3a67:	56                   	push   esi
    3a68:	53                   	push   ebx
    3a69:	81 ec cc 00 00 00    	sub    esp,0xcc
    3a6f:	e8 86 34 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    3a74:	81 c3 b4 74 00 00    	add    ebx,0x74b4
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1481
    FL_DIR dirstat;

    // If first call to library, initialise
    CHECK_FL_INIT();
    3a7a:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    3a80:	85 c0                	test   eax,eax
    3a82:	75 05                	jne    3a89 <fl_listdirectory+0x26>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1481 (discriminator 1)
    3a84:	e8 47 35 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1483

    FL_LOCK(&_fs);
    3a89:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3a8f:	85 c0                	test   eax,eax
    3a91:	74 08                	je     3a9b <fl_listdirectory+0x38>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1483 (discriminator 1)
    3a93:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3a99:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1485

    FAT_PRINTF(("\r\nDirectory %s\r\n", path));
    3a9b:	83 ec 08             	sub    esp,0x8
    3a9e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3aa1:	8d 83 26 c8 ff ff    	lea    eax,[ebx-0x37da]
    3aa7:	50                   	push   eax
    3aa8:	e8 23 37 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    3aad:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1487

    if (fl_opendir(path, &dirstat))
    3ab0:	83 ec 08             	sub    esp,0x8
    3ab3:	8d 45 dc             	lea    eax,[ebp-0x24]
    3ab6:	50                   	push   eax
    3ab7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3aba:	e8 51 35 00 00       	call   7010 <__x86.get_pc_thunk.bx+0x116>
    3abf:	83 c4 10             	add    esp,0x10
    3ac2:	85 c0                	test   eax,eax
    3ac4:	0f 84 d0 00 00 00    	je     3b9a <fl_listdirectory+0x137>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1491
    {
        struct fs_dir_ent dirent;

        while (fl_readdir(&dirstat, &dirent) == 0)
    3aca:	e9 9e 00 00 00       	jmp    3b6d <fl_listdirectory+0x10a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1495
        {
#if FATFS_INC_TIME_DATE_SUPPORT
            int d,m,y,h,mn,s;
            fatfs_convert_from_fat_time(dirent.write_time, &h,&m,&s);
    3acf:	0f b7 45 ba          	movzx  eax,WORD PTR [ebp-0x46]
    3ad3:	0f b7 c0             	movzx  eax,ax
    3ad6:	8d 55 c4             	lea    edx,[ebp-0x3c]
    3ad9:	52                   	push   edx
    3ada:	8d 55 d4             	lea    edx,[ebp-0x2c]
    3add:	52                   	push   edx
    3ade:	8d 55 cc             	lea    edx,[ebp-0x34]
    3ae1:	52                   	push   edx
    3ae2:	50                   	push   eax
    3ae3:	e8 28 37 00 00       	call   7210 <__x86.get_pc_thunk.bx+0x316>
    3ae8:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1496
            fatfs_convert_from_fat_date(dirent.write_date, &d,&mn,&y);
    3aeb:	0f b7 45 bc          	movzx  eax,WORD PTR [ebp-0x44]
    3aef:	0f b7 c0             	movzx  eax,ax
    3af2:	8d 55 d0             	lea    edx,[ebp-0x30]
    3af5:	52                   	push   edx
    3af6:	8d 55 c8             	lea    edx,[ebp-0x38]
    3af9:	52                   	push   edx
    3afa:	8d 55 d8             	lea    edx,[ebp-0x28]
    3afd:	52                   	push   edx
    3afe:	50                   	push   eax
    3aff:	e8 1c 34 00 00       	call   6f20 <__x86.get_pc_thunk.bx+0x26>
    3b04:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1497
            FAT_PRINTF(("%02d/%02d/%04d  %02d:%02d      ", mn,d,y,h,m));
    3b07:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
    3b0a:	8b 75 cc             	mov    esi,DWORD PTR [ebp-0x34]
    3b0d:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
    3b10:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    3b13:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
    3b16:	83 ec 08             	sub    esp,0x8
    3b19:	57                   	push   edi
    3b1a:	56                   	push   esi
    3b1b:	51                   	push   ecx
    3b1c:	52                   	push   edx
    3b1d:	50                   	push   eax
    3b1e:	8d 83 38 c8 ff ff    	lea    eax,[ebx-0x37c8]
    3b24:	50                   	push   eax
    3b25:	e8 a6 36 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    3b2a:	83 c4 20             	add    esp,0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1500
#endif

            if (dirent.is_dir)
    3b2d:	0f b6 45 ac          	movzx  eax,BYTE PTR [ebp-0x54]
    3b31:	84 c0                	test   al,al
    3b33:	74 1b                	je     3b50 <fl_listdirectory+0xed>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1502
            {
                FAT_PRINTF(("%s <DIR>\r\n", dirent.filename));
    3b35:	83 ec 08             	sub    esp,0x8
    3b38:	8d 85 2c ff ff ff    	lea    eax,[ebp-0xd4]
    3b3e:	50                   	push   eax
    3b3f:	8d 83 58 c8 ff ff    	lea    eax,[ebx-0x37a8]
    3b45:	50                   	push   eax
    3b46:	e8 85 36 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    3b4b:	83 c4 10             	add    esp,0x10
    3b4e:	eb 1d                	jmp    3b6d <fl_listdirectory+0x10a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1506
            }
            else
            {
                FAT_PRINTF(("%s [%d bytes]\r\n", dirent.filename, dirent.size));
    3b50:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
    3b53:	83 ec 04             	sub    esp,0x4
    3b56:	50                   	push   eax
    3b57:	8d 85 2c ff ff ff    	lea    eax,[ebp-0xd4]
    3b5d:	50                   	push   eax
    3b5e:	8d 83 63 c8 ff ff    	lea    eax,[ebx-0x379d]
    3b64:	50                   	push   eax
    3b65:	e8 66 36 00 00       	call   71d0 <__x86.get_pc_thunk.bx+0x2d6>
    3b6a:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1491

    if (fl_opendir(path, &dirstat))
    {
        struct fs_dir_ent dirent;

        while (fl_readdir(&dirstat, &dirent) == 0)
    3b6d:	83 ec 08             	sub    esp,0x8
    3b70:	8d 85 2c ff ff ff    	lea    eax,[ebp-0xd4]
    3b76:	50                   	push   eax
    3b77:	8d 45 dc             	lea    eax,[ebp-0x24]
    3b7a:	50                   	push   eax
    3b7b:	e8 10 35 00 00       	call   7090 <__x86.get_pc_thunk.bx+0x196>
    3b80:	83 c4 10             	add    esp,0x10
    3b83:	85 c0                	test   eax,eax
    3b85:	0f 84 44 ff ff ff    	je     3acf <fl_listdirectory+0x6c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1510
            {
                FAT_PRINTF(("%s [%d bytes]\r\n", dirent.filename, dirent.size));
            }
        }

        fl_closedir(&dirstat);
    3b8b:	83 ec 0c             	sub    esp,0xc
    3b8e:	8d 45 dc             	lea    eax,[ebp-0x24]
    3b91:	50                   	push   eax
    3b92:	e8 b9 35 00 00       	call   7150 <__x86.get_pc_thunk.bx+0x256>
    3b97:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1513
    }

    FL_UNLOCK(&_fs);
    3b9a:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    3ba0:	85 c0                	test   eax,eax
    3ba2:	74 08                	je     3bac <fl_listdirectory+0x149>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1513 (discriminator 1)
    3ba4:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    3baa:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1514
}
    3bac:	90                   	nop
    3bad:	8d 65 f4             	lea    esp,[ebp-0xc]
    3bb0:	5b                   	pop    ebx
    3bb1:	5e                   	pop    esi
    3bb2:	5f                   	pop    edi
    3bb3:	5d                   	pop    ebp
    3bb4:	c3                   	ret    

00003bb5 <fl_opendir>:
fl_opendir():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1521
//-----------------------------------------------------------------------------
// fl_opendir: Opens a directory for listing
//-----------------------------------------------------------------------------
#if FATFS_DIR_LIST_SUPPORT
FL_DIR* fl_opendir(const char* path, FL_DIR *dir)
{
    3bb5:	55                   	push   ebp
    3bb6:	89 e5                	mov    ebp,esp
    3bb8:	53                   	push   ebx
    3bb9:	83 ec 14             	sub    esp,0x14
    3bbc:	e8 39 33 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    3bc1:	81 c3 67 73 00 00    	add    ebx,0x7367
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1523
    int levels;
    int res = 1;
    3bc7:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1524
    uint32 cluster = FAT32_INVALID_CLUSTER;
    3bce:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [ebp-0x14],0xffffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1527

    // If first call to library, initialise
    CHECK_FL_INIT();
    3bd5:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    3bdb:	85 c0                	test   eax,eax
    3bdd:	75 05                	jne    3be4 <fl_opendir+0x2f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1527 (discriminator 1)
    3bdf:	e8 ec 33 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1529

    FL_LOCK(&_fs);
    3be4:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3bea:	85 c0                	test   eax,eax
    3bec:	74 08                	je     3bf6 <fl_opendir+0x41>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1529 (discriminator 1)
    3bee:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3bf4:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1531

    levels = fatfs_total_path_levels((char*)path) + 1;
    3bf6:	83 ec 0c             	sub    esp,0xc
    3bf9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3bfc:	e8 1f 34 00 00       	call   7020 <__x86.get_pc_thunk.bx+0x126>
    3c01:	83 c4 10             	add    esp,0x10
    3c04:	83 c0 01             	add    eax,0x1
    3c07:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1534

    // If path is in the root dir
    if (levels == 0)
    3c0a:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    3c0e:	75 17                	jne    3c27 <fl_opendir+0x72>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1535
        cluster = fatfs_get_root_cluster(&_fs);
    3c10:	83 ec 0c             	sub    esp,0xc
    3c13:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    3c19:	50                   	push   eax
    3c1a:	e8 d1 35 00 00       	call   71f0 <__x86.get_pc_thunk.bx+0x2f6>
    3c1f:	83 c4 10             	add    esp,0x10
    3c22:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
    3c25:	eb 15                	jmp    3c3c <fl_opendir+0x87>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1538
    // Find parent directory start cluster
    else
        res = _open_directory((char*)path, &cluster);
    3c27:	83 ec 08             	sub    esp,0x8
    3c2a:	8d 45 ec             	lea    eax,[ebp-0x14]
    3c2d:	50                   	push   eax
    3c2e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3c31:	e8 43 e0 ff ff       	call   1c79 <_open_directory>
    3c36:	83 c4 10             	add    esp,0x10
    3c39:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1540

    if (res)
    3c3c:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    3c40:	74 19                	je     3c5b <fl_opendir+0xa6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1541
        fatfs_list_directory_start(&_fs, dir, cluster);
    3c42:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    3c45:	83 ec 04             	sub    esp,0x4
    3c48:	50                   	push   eax
    3c49:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    3c4c:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    3c52:	50                   	push   eax
    3c53:	e8 08 36 00 00       	call   7260 <__x86.get_pc_thunk.bx+0x366>
    3c58:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1543

    FL_UNLOCK(&_fs);
    3c5b:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    3c61:	85 c0                	test   eax,eax
    3c63:	74 08                	je     3c6d <fl_opendir+0xb8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1543 (discriminator 1)
    3c65:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    3c6b:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1545

    return cluster != FAT32_INVALID_CLUSTER ? dir : 0;
    3c6d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    3c70:	83 f8 ff             	cmp    eax,0xffffffff
    3c73:	74 05                	je     3c7a <fl_opendir+0xc5>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1545 (discriminator 1)
    3c75:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    3c78:	eb 05                	jmp    3c7f <fl_opendir+0xca>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1545 (discriminator 2)
    3c7a:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1546
}
    3c7f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    3c82:	c9                   	leave  
    3c83:	c3                   	ret    

00003c84 <fl_readdir>:
fl_readdir():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1553
//-----------------------------------------------------------------------------
// fl_readdir: Get next item in directory
//-----------------------------------------------------------------------------
#if FATFS_DIR_LIST_SUPPORT
int fl_readdir(FL_DIR *dirls, fl_dirent *entry)
{
    3c84:	55                   	push   ebp
    3c85:	89 e5                	mov    ebp,esp
    3c87:	53                   	push   ebx
    3c88:	83 ec 14             	sub    esp,0x14
    3c8b:	e8 6a 32 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    3c90:	81 c3 98 72 00 00    	add    ebx,0x7298
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1554
    int res = 0;
    3c96:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1557

    // If first call to library, initialise
    CHECK_FL_INIT();
    3c9d:	8b 83 e8 41 00 00    	mov    eax,DWORD PTR [ebx+0x41e8]
    3ca3:	85 c0                	test   eax,eax
    3ca5:	75 05                	jne    3cac <fl_readdir+0x28>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1557 (discriminator 1)
    3ca7:	e8 24 33 00 00       	call   6fd0 <__x86.get_pc_thunk.bx+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1559

    FL_LOCK(&_fs);
    3cac:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3cb2:	85 c0                	test   eax,eax
    3cb4:	74 08                	je     3cbe <fl_readdir+0x3a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1559 (discriminator 1)
    3cb6:	8b 83 34 42 00 00    	mov    eax,DWORD PTR [ebx+0x4234]
    3cbc:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1561

    res = fatfs_list_directory_next(&_fs, dirls, entry);
    3cbe:	83 ec 04             	sub    esp,0x4
    3cc1:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    3cc4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3cc7:	8d 83 f8 41 00 00    	lea    eax,[ebx+0x41f8]
    3ccd:	50                   	push   eax
    3cce:	e8 5d 33 00 00       	call   7030 <__x86.get_pc_thunk.bx+0x136>
    3cd3:	83 c4 10             	add    esp,0x10
    3cd6:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1563

    FL_UNLOCK(&_fs);
    3cd9:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    3cdf:	85 c0                	test   eax,eax
    3ce1:	74 08                	je     3ceb <fl_readdir+0x67>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1563 (discriminator 1)
    3ce3:	8b 83 38 42 00 00    	mov    eax,DWORD PTR [ebx+0x4238]
    3ce9:	ff d0                	call   eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1565

    return res ? 0 : -1;
    3ceb:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    3cef:	74 07                	je     3cf8 <fl_readdir+0x74>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1565 (discriminator 1)
    3cf1:	b8 00 00 00 00       	mov    eax,0x0
    3cf6:	eb 05                	jmp    3cfd <fl_readdir+0x79>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1565 (discriminator 2)
    3cf8:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1566 (discriminator 5)
}
    3cfd:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    3d00:	c9                   	leave  
    3d01:	c3                   	ret    

00003d02 <fl_closedir>:
fl_closedir():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1573
//-----------------------------------------------------------------------------
// fl_closedir: Close directory after listing
//-----------------------------------------------------------------------------
#if FATFS_DIR_LIST_SUPPORT
int fl_closedir(FL_DIR* dir)
{
    3d02:	55                   	push   ebp
    3d03:	89 e5                	mov    ebp,esp
    3d05:	e8 ec 31 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    3d0a:	05 1e 72 00 00       	add    eax,0x721e
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1575
    // Not used
    return 0;
    3d0f:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1576
}
    3d14:	5d                   	pop    ebp
    3d15:	c3                   	ret    

00003d16 <fl_is_dir>:
fl_is_dir():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1583
//-----------------------------------------------------------------------------
// fl_is_dir: Is this a directory?
//-----------------------------------------------------------------------------
#if FATFS_DIR_LIST_SUPPORT
int fl_is_dir(const char *path)
{
    3d16:	55                   	push   ebp
    3d17:	89 e5                	mov    ebp,esp
    3d19:	53                   	push   ebx
    3d1a:	83 ec 14             	sub    esp,0x14
    3d1d:	e8 d8 31 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    3d22:	81 c3 06 72 00 00    	add    ebx,0x7206
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1584
    int res = 0;
    3d28:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1587
    FL_DIR dir;

    if (fl_opendir(path, &dir))
    3d2f:	83 ec 08             	sub    esp,0x8
    3d32:	8d 45 e8             	lea    eax,[ebp-0x18]
    3d35:	50                   	push   eax
    3d36:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3d39:	e8 d2 32 00 00       	call   7010 <__x86.get_pc_thunk.bx+0x116>
    3d3e:	83 c4 10             	add    esp,0x10
    3d41:	85 c0                	test   eax,eax
    3d43:	74 16                	je     3d5b <fl_is_dir+0x45>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1589
    {
        res = 1;
    3d45:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1590
        fl_closedir(&dir);
    3d4c:	83 ec 0c             	sub    esp,0xc
    3d4f:	8d 45 e8             	lea    eax,[ebp-0x18]
    3d52:	50                   	push   eax
    3d53:	e8 f8 33 00 00       	call   7150 <__x86.get_pc_thunk.bx+0x256>
    3d58:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1593
    }

    return res;
    3d5b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1594
}
    3d5e:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    3d61:	c9                   	leave  
    3d62:	c3                   	ret    

00003d63 <fl_format>:
fl_format():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1601
//-----------------------------------------------------------------------------
// fl_format: Format a partition with either FAT16 or FAT32 based on size
//-----------------------------------------------------------------------------
#if FATFS_INC_FORMAT_SUPPORT
int fl_format(uint32 volume_sectors, const char *name)
{
    3d63:	55                   	push   ebp
    3d64:	89 e5                	mov    ebp,esp
    3d66:	53                   	push   ebx
    3d67:	83 ec 04             	sub    esp,0x4
    3d6a:	e8 87 31 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    3d6f:	05 b9 71 00 00       	add    eax,0x71b9
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1602
    return fatfs_format(&_fs, volume_sectors, name);
    3d74:	83 ec 04             	sub    esp,0x4
    3d77:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    3d7a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    3d7d:	8d 90 f8 41 00 00    	lea    edx,[eax+0x41f8]
    3d83:	52                   	push   edx
    3d84:	89 c3                	mov    ebx,eax
    3d86:	e8 f5 31 00 00       	call   6f80 <__x86.get_pc_thunk.bx+0x86>
    3d8b:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_filelib.c:1603
}
    3d8e:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    3d91:	c9                   	leave  
    3d92:	c3                   	ret    
    3d93:	90                   	nop

00003d94 <fatfs_calc_cluster_size>:
fatfs_calc_cluster_size():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:78

//-----------------------------------------------------------------------------
// fatfs_calc_cluster_size: Calculate what cluster size should be used
//-----------------------------------------------------------------------------
static uint8 fatfs_calc_cluster_size(uint32 sectors, int is_fat32)
{
    3d94:	55                   	push   ebp
    3d95:	89 e5                	mov    ebp,esp
    3d97:	83 ec 10             	sub    esp,0x10
    3d9a:	e8 57 31 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    3d9f:	05 89 71 00 00       	add    eax,0x7189
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:81
    int i;

    if (!is_fat32)
    3da4:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    3da8:	75 42                	jne    3dec <fatfs_calc_cluster_size+0x58>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:83
    {
        for (i=0; _cluster_size_table16[i].sectors_per_cluster != 0;i++)
    3daa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
    3db1:	eb 25                	jmp    3dd8 <fatfs_calc_cluster_size+0x44>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:84
            if (sectors <= _cluster_size_table16[i].sectors)
    3db3:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
    3db9:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
    3dbc:	8b 14 ca             	mov    edx,DWORD PTR [edx+ecx*8]
    3dbf:	3b 55 08             	cmp    edx,DWORD PTR [ebp+0x8]
    3dc2:	72 10                	jb     3dd4 <fatfs_calc_cluster_size+0x40>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:85
                return _cluster_size_table16[i].sectors_per_cluster;
    3dc4:	8b 80 fc ff ff ff    	mov    eax,DWORD PTR [eax-0x4]
    3dca:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
    3dcd:	0f b6 44 d0 04       	movzx  eax,BYTE PTR [eax+edx*8+0x4]
    3dd2:	eb 5d                	jmp    3e31 <fatfs_calc_cluster_size+0x9d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:83 (discriminator 2)
{
    int i;

    if (!is_fat32)
    {
        for (i=0; _cluster_size_table16[i].sectors_per_cluster != 0;i++)
    3dd4:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:83 (discriminator 1)
    3dd8:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
    3dde:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
    3de1:	0f b6 54 ca 04       	movzx  edx,BYTE PTR [edx+ecx*8+0x4]
    3de6:	84 d2                	test   dl,dl
    3de8:	75 c9                	jne    3db3 <fatfs_calc_cluster_size+0x1f>
    3dea:	eb 40                	jmp    3e2c <fatfs_calc_cluster_size+0x98>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:89
            if (sectors <= _cluster_size_table16[i].sectors)
                return _cluster_size_table16[i].sectors_per_cluster;
    }
    else
    {
        for (i=0; _cluster_size_table32[i].sectors_per_cluster != 0;i++)
    3dec:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
    3df3:	eb 25                	jmp    3e1a <fatfs_calc_cluster_size+0x86>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:90
            if (sectors <= _cluster_size_table32[i].sectors)
    3df5:	8b 90 f8 ff ff ff    	mov    edx,DWORD PTR [eax-0x8]
    3dfb:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
    3dfe:	8b 14 ca             	mov    edx,DWORD PTR [edx+ecx*8]
    3e01:	3b 55 08             	cmp    edx,DWORD PTR [ebp+0x8]
    3e04:	72 10                	jb     3e16 <fatfs_calc_cluster_size+0x82>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:91
                return _cluster_size_table32[i].sectors_per_cluster;
    3e06:	8b 80 f8 ff ff ff    	mov    eax,DWORD PTR [eax-0x8]
    3e0c:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
    3e0f:	0f b6 44 d0 04       	movzx  eax,BYTE PTR [eax+edx*8+0x4]
    3e14:	eb 1b                	jmp    3e31 <fatfs_calc_cluster_size+0x9d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:89 (discriminator 2)
            if (sectors <= _cluster_size_table16[i].sectors)
                return _cluster_size_table16[i].sectors_per_cluster;
    }
    else
    {
        for (i=0; _cluster_size_table32[i].sectors_per_cluster != 0;i++)
    3e16:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:89 (discriminator 1)
    3e1a:	8b 90 f8 ff ff ff    	mov    edx,DWORD PTR [eax-0x8]
    3e20:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
    3e23:	0f b6 54 ca 04       	movzx  edx,BYTE PTR [edx+ecx*8+0x4]
    3e28:	84 d2                	test   dl,dl
    3e2a:	75 c9                	jne    3df5 <fatfs_calc_cluster_size+0x61>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:94
            if (sectors <= _cluster_size_table32[i].sectors)
                return _cluster_size_table32[i].sectors_per_cluster;
    }

    return 0;
    3e2c:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:95
}
    3e31:	c9                   	leave  
    3e32:	c3                   	ret    

00003e33 <fatfs_erase_sectors>:
fatfs_erase_sectors():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:100
//-----------------------------------------------------------------------------
// fatfs_erase_sectors: Erase a number of sectors
//-----------------------------------------------------------------------------
static int fatfs_erase_sectors(struct fatfs *fs, uint32 lba, int count)
{
    3e33:	55                   	push   ebp
    3e34:	89 e5                	mov    ebp,esp
    3e36:	53                   	push   ebx
    3e37:	83 ec 14             	sub    esp,0x14
    3e3a:	e8 b7 30 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    3e3f:	05 e9 70 00 00       	add    eax,0x70e9
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:104
    int i;

    // Zero sector first
    memset(fs->currentsector.sector, 0, FAT_SECTOR_SIZE);
    3e44:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    3e47:	83 c2 44             	add    edx,0x44
    3e4a:	83 ec 04             	sub    esp,0x4
    3e4d:	68 00 02 00 00       	push   0x200
    3e52:	6a 00                	push   0x0
    3e54:	52                   	push   edx
    3e55:	89 c3                	mov    ebx,eax
    3e57:	e8 e4 33 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    3e5c:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:106

    for (i=0;i<count;i++)
    3e5f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    3e66:	eb 2f                	jmp    3e97 <fatfs_erase_sectors+0x64>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:107
        if (!fs->disk_io.write_media(lba + i, fs->currentsector.sector, 1))
    3e68:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3e6b:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    3e6e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    3e71:	8d 4a 44             	lea    ecx,[edx+0x44]
    3e74:	8b 5d f4             	mov    ebx,DWORD PTR [ebp-0xc]
    3e77:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    3e7a:	01 da                	add    edx,ebx
    3e7c:	83 ec 04             	sub    esp,0x4
    3e7f:	6a 01                	push   0x1
    3e81:	51                   	push   ecx
    3e82:	52                   	push   edx
    3e83:	ff d0                	call   eax
    3e85:	83 c4 10             	add    esp,0x10
    3e88:	85 c0                	test   eax,eax
    3e8a:	75 07                	jne    3e93 <fatfs_erase_sectors+0x60>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:108
            return 0;
    3e8c:	b8 00 00 00 00       	mov    eax,0x0
    3e91:	eb 11                	jmp    3ea4 <fatfs_erase_sectors+0x71>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:106 (discriminator 2)
    int i;

    // Zero sector first
    memset(fs->currentsector.sector, 0, FAT_SECTOR_SIZE);

    for (i=0;i<count;i++)
    3e93:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:106 (discriminator 1)
    3e97:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    3e9a:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
    3e9d:	7c c9                	jl     3e68 <fatfs_erase_sectors+0x35>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:110
        if (!fs->disk_io.write_media(lba + i, fs->currentsector.sector, 1))
            return 0;

    return 1;
    3e9f:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:111
}
    3ea4:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    3ea7:	c9                   	leave  
    3ea8:	c3                   	ret    

00003ea9 <fatfs_create_boot_sector>:
fatfs_create_boot_sector():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:116
//-----------------------------------------------------------------------------
// fatfs_create_boot_sector: Create the boot sector
//-----------------------------------------------------------------------------
static int fatfs_create_boot_sector(struct fatfs *fs, uint32 boot_sector_lba, uint32 vol_sectors, const char *name, int is_fat32)
{
    3ea9:	55                   	push   ebp
    3eaa:	89 e5                	mov    ebp,esp
    3eac:	53                   	push   ebx
    3ead:	83 ec 14             	sub    esp,0x14
    3eb0:	e8 45 30 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    3eb5:	81 c3 73 70 00 00    	add    ebx,0x7073
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:121
    uint32 total_clusters;
    int i;

    // Zero sector initially
    memset(fs->currentsector.sector, 0, FAT_SECTOR_SIZE);
    3ebb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3ebe:	83 c0 44             	add    eax,0x44
    3ec1:	83 ec 04             	sub    esp,0x4
    3ec4:	68 00 02 00 00       	push   0x200
    3ec9:	6a 00                	push   0x0
    3ecb:	50                   	push   eax
    3ecc:	e8 6f 33 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    3ed1:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:124

    // OEM Name & Jump Code
    fs->currentsector.sector[0] = 0xEB;
    3ed4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3ed7:	c6 40 44 eb          	mov    BYTE PTR [eax+0x44],0xeb
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:125
    fs->currentsector.sector[1] = 0x3C;
    3edb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3ede:	c6 40 45 3c          	mov    BYTE PTR [eax+0x45],0x3c
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:126
    fs->currentsector.sector[2] = 0x90;
    3ee2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3ee5:	c6 40 46 90          	mov    BYTE PTR [eax+0x46],0x90
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:127
    fs->currentsector.sector[3] = 0x4D;
    3ee9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3eec:	c6 40 47 4d          	mov    BYTE PTR [eax+0x47],0x4d
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:128
    fs->currentsector.sector[4] = 0x53;
    3ef0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3ef3:	c6 40 48 53          	mov    BYTE PTR [eax+0x48],0x53
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:129
    fs->currentsector.sector[5] = 0x44;
    3ef7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3efa:	c6 40 49 44          	mov    BYTE PTR [eax+0x49],0x44
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:130
    fs->currentsector.sector[6] = 0x4F;
    3efe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f01:	c6 40 4a 4f          	mov    BYTE PTR [eax+0x4a],0x4f
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:131
    fs->currentsector.sector[7] = 0x53;
    3f05:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f08:	c6 40 4b 53          	mov    BYTE PTR [eax+0x4b],0x53
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:132
    fs->currentsector.sector[8] = 0x35;
    3f0c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f0f:	c6 40 4c 35          	mov    BYTE PTR [eax+0x4c],0x35
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:133
    fs->currentsector.sector[9] = 0x2E;
    3f13:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f16:	c6 40 4d 2e          	mov    BYTE PTR [eax+0x4d],0x2e
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:134
    fs->currentsector.sector[10] = 0x30;
    3f1a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f1d:	c6 40 4e 30          	mov    BYTE PTR [eax+0x4e],0x30
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:137

    // Bytes per sector
    fs->currentsector.sector[11] = (FAT_SECTOR_SIZE >> 0) & 0xFF;
    3f21:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f24:	c6 40 4f 00          	mov    BYTE PTR [eax+0x4f],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:138
    fs->currentsector.sector[12] = (FAT_SECTOR_SIZE >> 8) & 0xFF;
    3f28:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f2b:	c6 40 50 02          	mov    BYTE PTR [eax+0x50],0x2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:141

    // Get sectors per cluster size for the disk
    fs->sectors_per_cluster = fatfs_calc_cluster_size(vol_sectors, is_fat32);
    3f2f:	83 ec 08             	sub    esp,0x8
    3f32:	ff 75 18             	push   DWORD PTR [ebp+0x18]
    3f35:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    3f38:	e8 57 fe ff ff       	call   3d94 <fatfs_calc_cluster_size>
    3f3d:	83 c4 10             	add    esp,0x10
    3f40:	89 c2                	mov    edx,eax
    3f42:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f45:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:142
    if (!fs->sectors_per_cluster)
    3f47:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f4a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    3f4d:	84 c0                	test   al,al
    3f4f:	75 0a                	jne    3f5b <fatfs_create_boot_sector+0xb2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:143
        return 0; // Invalid disk size
    3f51:	b8 00 00 00 00       	mov    eax,0x0
    3f56:	e9 dc 04 00 00       	jmp    4437 <fatfs_create_boot_sector+0x58e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:146

    // Sectors per cluster
    fs->currentsector.sector[13] = fs->sectors_per_cluster;
    3f5b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f5e:	0f b6 10             	movzx  edx,BYTE PTR [eax]
    3f61:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f64:	88 50 51             	mov    BYTE PTR [eax+0x51],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:149

    // Reserved Sectors
    if (!is_fat32)
    3f67:	83 7d 18 00          	cmp    DWORD PTR [ebp+0x18],0x0
    3f6b:	75 0b                	jne    3f78 <fatfs_create_boot_sector+0xcf>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:150
        fs->reserved_sectors = 8;
    3f6d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f70:	66 c7 40 2a 08 00    	mov    WORD PTR [eax+0x2a],0x8
    3f76:	eb 09                	jmp    3f81 <fatfs_create_boot_sector+0xd8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:152
    else
        fs->reserved_sectors = 32;
    3f78:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f7b:	66 c7 40 2a 20 00    	mov    WORD PTR [eax+0x2a],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:153
    fs->currentsector.sector[14] = (fs->reserved_sectors >> 0) & 0xFF;
    3f81:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f84:	0f b7 40 2a          	movzx  eax,WORD PTR [eax+0x2a]
    3f88:	89 c2                	mov    edx,eax
    3f8a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f8d:	88 50 52             	mov    BYTE PTR [eax+0x52],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:154
    fs->currentsector.sector[15] = (fs->reserved_sectors >> 8) & 0xFF;
    3f90:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3f93:	0f b7 40 2a          	movzx  eax,WORD PTR [eax+0x2a]
    3f97:	66 c1 e8 08          	shr    ax,0x8
    3f9b:	89 c2                	mov    edx,eax
    3f9d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3fa0:	88 50 53             	mov    BYTE PTR [eax+0x53],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:157

    // Number of FATS
    fs->num_of_fats = 2;
    3fa3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3fa6:	c6 40 2c 02          	mov    BYTE PTR [eax+0x2c],0x2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:158
    fs->currentsector.sector[16] = fs->num_of_fats;
    3faa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3fad:	0f b6 50 2c          	movzx  edx,BYTE PTR [eax+0x2c]
    3fb1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3fb4:	88 50 54             	mov    BYTE PTR [eax+0x54],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:161

    // Max entries in root dir (FAT16 only)
    if (!is_fat32)
    3fb7:	83 7d 18 00          	cmp    DWORD PTR [ebp+0x18],0x0
    3fbb:	75 2d                	jne    3fea <fatfs_create_boot_sector+0x141>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:163
    {
        fs->root_entry_count = 512;
    3fbd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3fc0:	66 c7 40 28 00 02    	mov    WORD PTR [eax+0x28],0x200
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:164
        fs->currentsector.sector[17] = (fs->root_entry_count >> 0) & 0xFF;
    3fc6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3fc9:	0f b7 40 28          	movzx  eax,WORD PTR [eax+0x28]
    3fcd:	89 c2                	mov    edx,eax
    3fcf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3fd2:	88 50 55             	mov    BYTE PTR [eax+0x55],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:165
        fs->currentsector.sector[18] = (fs->root_entry_count >> 8) & 0xFF;
    3fd5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3fd8:	0f b7 40 28          	movzx  eax,WORD PTR [eax+0x28]
    3fdc:	66 c1 e8 08          	shr    ax,0x8
    3fe0:	89 c2                	mov    edx,eax
    3fe2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3fe5:	88 50 56             	mov    BYTE PTR [eax+0x56],dl
    3fe8:	eb 17                	jmp    4001 <fatfs_create_boot_sector+0x158>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:169
    }
    else
    {
        fs->root_entry_count = 0;
    3fea:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3fed:	66 c7 40 28 00 00    	mov    WORD PTR [eax+0x28],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:170
        fs->currentsector.sector[17] = 0;
    3ff3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3ff6:	c6 40 55 00          	mov    BYTE PTR [eax+0x55],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:171
        fs->currentsector.sector[18] = 0;
    3ffa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3ffd:	c6 40 56 00          	mov    BYTE PTR [eax+0x56],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:175
    }

    // [FAT16] Total sectors (use FAT32 count instead)
    fs->currentsector.sector[19] = 0x00;
    4001:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4004:	c6 40 57 00          	mov    BYTE PTR [eax+0x57],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:176
    fs->currentsector.sector[20] = 0x00;
    4008:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    400b:	c6 40 58 00          	mov    BYTE PTR [eax+0x58],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:179

    // Media type
    fs->currentsector.sector[21] = 0xF8;
    400f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4012:	c6 40 59 f8          	mov    BYTE PTR [eax+0x59],0xf8
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:183


    // FAT16 BS Details
    if (!is_fat32)
    4016:	83 7d 18 00          	cmp    DWORD PTR [ebp+0x18],0x0
    401a:	0f 85 8c 01 00 00    	jne    41ac <fatfs_create_boot_sector+0x303>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:186
    {
        // Count of sectors used by the FAT table (FAT16 only)
        total_clusters = (vol_sectors / fs->sectors_per_cluster) + 1;
    4020:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4023:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    4026:	0f b6 c8             	movzx  ecx,al
    4029:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    402c:	ba 00 00 00 00       	mov    edx,0x0
    4031:	f7 f1                	div    ecx
    4033:	83 c0 01             	add    eax,0x1
    4036:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:187
        fs->fat_sectors = (total_clusters/(FAT_SECTOR_SIZE/2)) + 1;
    4039:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    403c:	c1 e8 08             	shr    eax,0x8
    403f:	8d 50 01             	lea    edx,[eax+0x1]
    4042:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4045:	89 50 20             	mov    DWORD PTR [eax+0x20],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:188
        fs->currentsector.sector[22] = (uint8)((fs->fat_sectors >> 0) & 0xFF);
    4048:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    404b:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    404e:	89 c2                	mov    edx,eax
    4050:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4053:	88 50 5a             	mov    BYTE PTR [eax+0x5a],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:189
        fs->currentsector.sector[23] = (uint8)((fs->fat_sectors >> 8) & 0xFF);
    4056:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4059:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    405c:	c1 e8 08             	shr    eax,0x8
    405f:	89 c2                	mov    edx,eax
    4061:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4064:	88 50 5b             	mov    BYTE PTR [eax+0x5b],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:192

        // Sectors per track
        fs->currentsector.sector[24] = 0x00;
    4067:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    406a:	c6 40 5c 00          	mov    BYTE PTR [eax+0x5c],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:193
        fs->currentsector.sector[25] = 0x00;
    406e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4071:	c6 40 5d 00          	mov    BYTE PTR [eax+0x5d],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:196

        // Heads
        fs->currentsector.sector[26] = 0x00;
    4075:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4078:	c6 40 5e 00          	mov    BYTE PTR [eax+0x5e],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:197
        fs->currentsector.sector[27] = 0x00;
    407c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    407f:	c6 40 5f 00          	mov    BYTE PTR [eax+0x5f],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:200

        // Hidden sectors
        fs->currentsector.sector[28] = 0x20;
    4083:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4086:	c6 40 60 20          	mov    BYTE PTR [eax+0x60],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:201
        fs->currentsector.sector[29] = 0x00;
    408a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    408d:	c6 40 61 00          	mov    BYTE PTR [eax+0x61],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:202
        fs->currentsector.sector[30] = 0x00;
    4091:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4094:	c6 40 62 00          	mov    BYTE PTR [eax+0x62],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:203
        fs->currentsector.sector[31] = 0x00;
    4098:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    409b:	c6 40 63 00          	mov    BYTE PTR [eax+0x63],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:206

        // Total sectors for this volume
        fs->currentsector.sector[32] = (uint8)((vol_sectors>>0)&0xFF);
    409f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    40a2:	89 c2                	mov    edx,eax
    40a4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    40a7:	88 50 64             	mov    BYTE PTR [eax+0x64],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:207
        fs->currentsector.sector[33] = (uint8)((vol_sectors>>8)&0xFF);
    40aa:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    40ad:	c1 e8 08             	shr    eax,0x8
    40b0:	89 c2                	mov    edx,eax
    40b2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    40b5:	88 50 65             	mov    BYTE PTR [eax+0x65],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:208
        fs->currentsector.sector[34] = (uint8)((vol_sectors>>16)&0xFF);
    40b8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    40bb:	c1 e8 10             	shr    eax,0x10
    40be:	89 c2                	mov    edx,eax
    40c0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    40c3:	88 50 66             	mov    BYTE PTR [eax+0x66],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:209
        fs->currentsector.sector[35] = (uint8)((vol_sectors>>24)&0xFF);
    40c6:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    40c9:	c1 e8 18             	shr    eax,0x18
    40cc:	89 c2                	mov    edx,eax
    40ce:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    40d1:	88 50 67             	mov    BYTE PTR [eax+0x67],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:212

        // Drive number
        fs->currentsector.sector[36] = 0x00;
    40d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    40d7:	c6 40 68 00          	mov    BYTE PTR [eax+0x68],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:215

        // Reserved
        fs->currentsector.sector[37] = 0x00;
    40db:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    40de:	c6 40 69 00          	mov    BYTE PTR [eax+0x69],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:218

        // Boot signature
        fs->currentsector.sector[38] = 0x29;
    40e2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    40e5:	c6 40 6a 29          	mov    BYTE PTR [eax+0x6a],0x29
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:221

        // Volume ID
        fs->currentsector.sector[39] = 0x12;
    40e9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    40ec:	c6 40 6b 12          	mov    BYTE PTR [eax+0x6b],0x12
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:222
        fs->currentsector.sector[40] = 0x34;
    40f0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    40f3:	c6 40 6c 34          	mov    BYTE PTR [eax+0x6c],0x34
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:223
        fs->currentsector.sector[41] = 0x56;
    40f7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    40fa:	c6 40 6d 56          	mov    BYTE PTR [eax+0x6d],0x56
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:224
        fs->currentsector.sector[42] = 0x78;
    40fe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4101:	c6 40 6e 78          	mov    BYTE PTR [eax+0x6e],0x78
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:227

        // Volume name
        for (i=0;i<11;i++)
    4105:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    410c:	eb 41                	jmp    414f <fatfs_create_boot_sector+0x2a6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:229
        {
            if (i < (int)strlen(name))
    410e:	83 ec 0c             	sub    esp,0xc
    4111:	ff 75 14             	push   DWORD PTR [ebp+0x14]
    4114:	e8 47 32 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    4119:	83 c4 10             	add    esp,0x10
    411c:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    411f:	7e 1c                	jle    413d <fatfs_create_boot_sector+0x294>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:230
                fs->currentsector.sector[i+43] = name[i];
    4121:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    4124:	8d 50 2b             	lea    edx,[eax+0x2b]
    4127:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
    412a:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    412d:	01 c8                	add    eax,ecx
    412f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    4132:	89 c1                	mov    ecx,eax
    4134:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4137:	88 4c 10 44          	mov    BYTE PTR [eax+edx*1+0x44],cl
    413b:	eb 0e                	jmp    414b <fatfs_create_boot_sector+0x2a2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:232
            else
                fs->currentsector.sector[i+43] = ' ';
    413d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    4140:	8d 50 2b             	lea    edx,[eax+0x2b]
    4143:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4146:	c6 44 10 44 20       	mov    BYTE PTR [eax+edx*1+0x44],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:227 (discriminator 2)
        fs->currentsector.sector[40] = 0x34;
        fs->currentsector.sector[41] = 0x56;
        fs->currentsector.sector[42] = 0x78;

        // Volume name
        for (i=0;i<11;i++)
    414b:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:227 (discriminator 1)
    414f:	83 7d f4 0a          	cmp    DWORD PTR [ebp-0xc],0xa
    4153:	7e b9                	jle    410e <fatfs_create_boot_sector+0x265>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:236
            else
                fs->currentsector.sector[i+43] = ' ';
        }

        // File sys type
        fs->currentsector.sector[54] = 'F';
    4155:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4158:	c6 40 7a 46          	mov    BYTE PTR [eax+0x7a],0x46
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:237
        fs->currentsector.sector[55] = 'A';
    415c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    415f:	c6 40 7b 41          	mov    BYTE PTR [eax+0x7b],0x41
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:238
        fs->currentsector.sector[56] = 'T';
    4163:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4166:	c6 40 7c 54          	mov    BYTE PTR [eax+0x7c],0x54
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:239
        fs->currentsector.sector[57] = '1';
    416a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    416d:	c6 40 7d 31          	mov    BYTE PTR [eax+0x7d],0x31
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:240
        fs->currentsector.sector[58] = '6';
    4171:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4174:	c6 40 7e 36          	mov    BYTE PTR [eax+0x7e],0x36
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:241
        fs->currentsector.sector[59] = ' ';
    4178:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    417b:	c6 40 7f 20          	mov    BYTE PTR [eax+0x7f],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:242
        fs->currentsector.sector[60] = ' ';
    417f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4182:	c6 80 80 00 00 00 20 	mov    BYTE PTR [eax+0x80],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:243
        fs->currentsector.sector[61] = ' ';
    4189:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    418c:	c6 80 81 00 00 00 20 	mov    BYTE PTR [eax+0x81],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:246

        // Signature
        fs->currentsector.sector[510] = 0x55;
    4193:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4196:	c6 80 42 02 00 00 55 	mov    BYTE PTR [eax+0x242],0x55
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:247
        fs->currentsector.sector[511] = 0xAA;
    419d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41a0:	c6 80 43 02 00 00 aa 	mov    BYTE PTR [eax+0x243],0xaa
    41a7:	e9 61 02 00 00       	jmp    440d <fatfs_create_boot_sector+0x564>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:253
    }
    // FAT32 BS Details
    else
    {
        // Count of sectors used by the FAT table (FAT16 only)
        fs->currentsector.sector[22] = 0;
    41ac:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41af:	c6 40 5a 00          	mov    BYTE PTR [eax+0x5a],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:254
        fs->currentsector.sector[23] = 0;
    41b3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41b6:	c6 40 5b 00          	mov    BYTE PTR [eax+0x5b],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:257

        // Sectors per track (default)
        fs->currentsector.sector[24] = 0x3F;
    41ba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41bd:	c6 40 5c 3f          	mov    BYTE PTR [eax+0x5c],0x3f
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:258
        fs->currentsector.sector[25] = 0x00;
    41c1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41c4:	c6 40 5d 00          	mov    BYTE PTR [eax+0x5d],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:261

        // Heads (default)
        fs->currentsector.sector[26] = 0xFF;
    41c8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41cb:	c6 40 5e ff          	mov    BYTE PTR [eax+0x5e],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:262
        fs->currentsector.sector[27] = 0x00;
    41cf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41d2:	c6 40 5f 00          	mov    BYTE PTR [eax+0x5f],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:265

        // Hidden sectors
        fs->currentsector.sector[28] = 0x00;
    41d6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41d9:	c6 40 60 00          	mov    BYTE PTR [eax+0x60],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:266
        fs->currentsector.sector[29] = 0x00;
    41dd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41e0:	c6 40 61 00          	mov    BYTE PTR [eax+0x61],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:267
        fs->currentsector.sector[30] = 0x00;
    41e4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41e7:	c6 40 62 00          	mov    BYTE PTR [eax+0x62],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:268
        fs->currentsector.sector[31] = 0x00;
    41eb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41ee:	c6 40 63 00          	mov    BYTE PTR [eax+0x63],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:271

        // Total sectors for this volume
        fs->currentsector.sector[32] = (uint8)((vol_sectors>>0)&0xFF);
    41f2:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    41f5:	89 c2                	mov    edx,eax
    41f7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    41fa:	88 50 64             	mov    BYTE PTR [eax+0x64],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:272
        fs->currentsector.sector[33] = (uint8)((vol_sectors>>8)&0xFF);
    41fd:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    4200:	c1 e8 08             	shr    eax,0x8
    4203:	89 c2                	mov    edx,eax
    4205:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4208:	88 50 65             	mov    BYTE PTR [eax+0x65],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:273
        fs->currentsector.sector[34] = (uint8)((vol_sectors>>16)&0xFF);
    420b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    420e:	c1 e8 10             	shr    eax,0x10
    4211:	89 c2                	mov    edx,eax
    4213:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4216:	88 50 66             	mov    BYTE PTR [eax+0x66],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:274
        fs->currentsector.sector[35] = (uint8)((vol_sectors>>24)&0xFF);
    4219:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    421c:	c1 e8 18             	shr    eax,0x18
    421f:	89 c2                	mov    edx,eax
    4221:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4224:	88 50 67             	mov    BYTE PTR [eax+0x67],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:276

        total_clusters = (vol_sectors / fs->sectors_per_cluster) + 1;
    4227:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    422a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    422d:	0f b6 c8             	movzx  ecx,al
    4230:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    4233:	ba 00 00 00 00       	mov    edx,0x0
    4238:	f7 f1                	div    ecx
    423a:	83 c0 01             	add    eax,0x1
    423d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:277
        fs->fat_sectors = (total_clusters/(FAT_SECTOR_SIZE/4)) + 1;
    4240:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    4243:	c1 e8 07             	shr    eax,0x7
    4246:	8d 50 01             	lea    edx,[eax+0x1]
    4249:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    424c:	89 50 20             	mov    DWORD PTR [eax+0x20],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:280

        // BPB_FATSz32
        fs->currentsector.sector[36] = (uint8)((fs->fat_sectors>>0)&0xFF);
    424f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4252:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    4255:	89 c2                	mov    edx,eax
    4257:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    425a:	88 50 68             	mov    BYTE PTR [eax+0x68],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:281
        fs->currentsector.sector[37] = (uint8)((fs->fat_sectors>>8)&0xFF);
    425d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4260:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    4263:	c1 e8 08             	shr    eax,0x8
    4266:	89 c2                	mov    edx,eax
    4268:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    426b:	88 50 69             	mov    BYTE PTR [eax+0x69],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:282
        fs->currentsector.sector[38] = (uint8)((fs->fat_sectors>>16)&0xFF);
    426e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4271:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    4274:	c1 e8 10             	shr    eax,0x10
    4277:	89 c2                	mov    edx,eax
    4279:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    427c:	88 50 6a             	mov    BYTE PTR [eax+0x6a],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:283
        fs->currentsector.sector[39] = (uint8)((fs->fat_sectors>>24)&0xFF);
    427f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4282:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    4285:	c1 e8 18             	shr    eax,0x18
    4288:	89 c2                	mov    edx,eax
    428a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    428d:	88 50 6b             	mov    BYTE PTR [eax+0x6b],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:286

        // BPB_ExtFlags
        fs->currentsector.sector[40] = 0;
    4290:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4293:	c6 40 6c 00          	mov    BYTE PTR [eax+0x6c],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:287
        fs->currentsector.sector[41] = 0;
    4297:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    429a:	c6 40 6d 00          	mov    BYTE PTR [eax+0x6d],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:290

        // BPB_FSVer
        fs->currentsector.sector[42] = 0;
    429e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42a1:	c6 40 6e 00          	mov    BYTE PTR [eax+0x6e],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:291
        fs->currentsector.sector[43] = 0;
    42a5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42a8:	c6 40 6f 00          	mov    BYTE PTR [eax+0x6f],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:294

        // BPB_RootClus
        fs->currentsector.sector[44] = (uint8)((fs->rootdir_first_cluster>>0)&0xFF);
    42ac:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42af:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    42b2:	89 c2                	mov    edx,eax
    42b4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42b7:	88 50 70             	mov    BYTE PTR [eax+0x70],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:295
        fs->currentsector.sector[45] = (uint8)((fs->rootdir_first_cluster>>8)&0xFF);
    42ba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42bd:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    42c0:	c1 e8 08             	shr    eax,0x8
    42c3:	89 c2                	mov    edx,eax
    42c5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42c8:	88 50 71             	mov    BYTE PTR [eax+0x71],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:296
        fs->currentsector.sector[46] = (uint8)((fs->rootdir_first_cluster>>16)&0xFF);
    42cb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42ce:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    42d1:	c1 e8 10             	shr    eax,0x10
    42d4:	89 c2                	mov    edx,eax
    42d6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42d9:	88 50 72             	mov    BYTE PTR [eax+0x72],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:297
        fs->currentsector.sector[47] = (uint8)((fs->rootdir_first_cluster>>24)&0xFF);
    42dc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42df:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    42e2:	c1 e8 18             	shr    eax,0x18
    42e5:	89 c2                	mov    edx,eax
    42e7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42ea:	88 50 73             	mov    BYTE PTR [eax+0x73],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:300

        // BPB_FSInfo
        fs->currentsector.sector[48] = (uint8)((fs->fs_info_sector>>0)&0xFF);
    42ed:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42f0:	0f b7 40 18          	movzx  eax,WORD PTR [eax+0x18]
    42f4:	89 c2                	mov    edx,eax
    42f6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42f9:	88 50 74             	mov    BYTE PTR [eax+0x74],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:301
        fs->currentsector.sector[49] = (uint8)((fs->fs_info_sector>>8)&0xFF);
    42fc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    42ff:	0f b7 40 18          	movzx  eax,WORD PTR [eax+0x18]
    4303:	66 c1 e8 08          	shr    ax,0x8
    4307:	89 c2                	mov    edx,eax
    4309:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    430c:	88 50 75             	mov    BYTE PTR [eax+0x75],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:304

        // BPB_BkBootSec
        fs->currentsector.sector[50] = 6;
    430f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4312:	c6 40 76 06          	mov    BYTE PTR [eax+0x76],0x6
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:305
        fs->currentsector.sector[51] = 0;
    4316:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4319:	c6 40 77 00          	mov    BYTE PTR [eax+0x77],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:308

        // Drive number
        fs->currentsector.sector[64] = 0x00;
    431d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4320:	c6 80 84 00 00 00 00 	mov    BYTE PTR [eax+0x84],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:311

        // Boot signature
        fs->currentsector.sector[66] = 0x29;
    4327:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    432a:	c6 80 86 00 00 00 29 	mov    BYTE PTR [eax+0x86],0x29
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:314

        // Volume ID
        fs->currentsector.sector[67] = 0x12;
    4331:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4334:	c6 80 87 00 00 00 12 	mov    BYTE PTR [eax+0x87],0x12
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:315
        fs->currentsector.sector[68] = 0x34;
    433b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    433e:	c6 80 88 00 00 00 34 	mov    BYTE PTR [eax+0x88],0x34
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:316
        fs->currentsector.sector[69] = 0x56;
    4345:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4348:	c6 80 89 00 00 00 56 	mov    BYTE PTR [eax+0x89],0x56
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:317
        fs->currentsector.sector[70] = 0x78;
    434f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4352:	c6 80 8a 00 00 00 78 	mov    BYTE PTR [eax+0x8a],0x78
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:320

        // Volume name
        for (i=0;i<11;i++)
    4359:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    4360:	eb 41                	jmp    43a3 <fatfs_create_boot_sector+0x4fa>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:322
        {
            if (i < (int)strlen(name))
    4362:	83 ec 0c             	sub    esp,0xc
    4365:	ff 75 14             	push   DWORD PTR [ebp+0x14]
    4368:	e8 f3 2f 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    436d:	83 c4 10             	add    esp,0x10
    4370:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    4373:	7e 1c                	jle    4391 <fatfs_create_boot_sector+0x4e8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:323
                fs->currentsector.sector[i+71] = name[i];
    4375:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    4378:	8d 50 47             	lea    edx,[eax+0x47]
    437b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
    437e:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    4381:	01 c8                	add    eax,ecx
    4383:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    4386:	89 c1                	mov    ecx,eax
    4388:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    438b:	88 4c 10 44          	mov    BYTE PTR [eax+edx*1+0x44],cl
    438f:	eb 0e                	jmp    439f <fatfs_create_boot_sector+0x4f6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:325
            else
                fs->currentsector.sector[i+71] = ' ';
    4391:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    4394:	8d 50 47             	lea    edx,[eax+0x47]
    4397:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    439a:	c6 44 10 44 20       	mov    BYTE PTR [eax+edx*1+0x44],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:320 (discriminator 2)
        fs->currentsector.sector[68] = 0x34;
        fs->currentsector.sector[69] = 0x56;
        fs->currentsector.sector[70] = 0x78;

        // Volume name
        for (i=0;i<11;i++)
    439f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:320 (discriminator 1)
    43a3:	83 7d f4 0a          	cmp    DWORD PTR [ebp-0xc],0xa
    43a7:	7e b9                	jle    4362 <fatfs_create_boot_sector+0x4b9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:329
            else
                fs->currentsector.sector[i+71] = ' ';
        }

        // File sys type
        fs->currentsector.sector[82] = 'F';
    43a9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    43ac:	c6 80 96 00 00 00 46 	mov    BYTE PTR [eax+0x96],0x46
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:330
        fs->currentsector.sector[83] = 'A';
    43b3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    43b6:	c6 80 97 00 00 00 41 	mov    BYTE PTR [eax+0x97],0x41
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:331
        fs->currentsector.sector[84] = 'T';
    43bd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    43c0:	c6 80 98 00 00 00 54 	mov    BYTE PTR [eax+0x98],0x54
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:332
        fs->currentsector.sector[85] = '3';
    43c7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    43ca:	c6 80 99 00 00 00 33 	mov    BYTE PTR [eax+0x99],0x33
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:333
        fs->currentsector.sector[86] = '2';
    43d1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    43d4:	c6 80 9a 00 00 00 32 	mov    BYTE PTR [eax+0x9a],0x32
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:334
        fs->currentsector.sector[87] = ' ';
    43db:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    43de:	c6 80 9b 00 00 00 20 	mov    BYTE PTR [eax+0x9b],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:335
        fs->currentsector.sector[88] = ' ';
    43e5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    43e8:	c6 80 9c 00 00 00 20 	mov    BYTE PTR [eax+0x9c],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:336
        fs->currentsector.sector[89] = ' ';
    43ef:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    43f2:	c6 80 9d 00 00 00 20 	mov    BYTE PTR [eax+0x9d],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:339

        // Signature
        fs->currentsector.sector[510] = 0x55;
    43f9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    43fc:	c6 80 42 02 00 00 55 	mov    BYTE PTR [eax+0x242],0x55
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:340
        fs->currentsector.sector[511] = 0xAA;
    4403:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4406:	c6 80 43 02 00 00 aa 	mov    BYTE PTR [eax+0x243],0xaa
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:343
    }

    if (fs->disk_io.write_media(boot_sector_lba, fs->currentsector.sector, 1))
    440d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4410:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    4413:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    4416:	83 c2 44             	add    edx,0x44
    4419:	83 ec 04             	sub    esp,0x4
    441c:	6a 01                	push   0x1
    441e:	52                   	push   edx
    441f:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    4422:	ff d0                	call   eax
    4424:	83 c4 10             	add    esp,0x10
    4427:	85 c0                	test   eax,eax
    4429:	74 07                	je     4432 <fatfs_create_boot_sector+0x589>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:344
        return 1;
    442b:	b8 01 00 00 00       	mov    eax,0x1
    4430:	eb 05                	jmp    4437 <fatfs_create_boot_sector+0x58e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:346
    else
        return 0;
    4432:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:347
}
    4437:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    443a:	c9                   	leave  
    443b:	c3                   	ret    

0000443c <fatfs_create_fsinfo_sector>:
fatfs_create_fsinfo_sector():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:352
//-----------------------------------------------------------------------------
// fatfs_create_fsinfo_sector: Create the FSInfo sector (FAT32)
//-----------------------------------------------------------------------------
static int fatfs_create_fsinfo_sector(struct fatfs *fs, uint32 sector_lba)
{
    443c:	55                   	push   ebp
    443d:	89 e5                	mov    ebp,esp
    443f:	53                   	push   ebx
    4440:	83 ec 04             	sub    esp,0x4
    4443:	e8 ae 2a 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    4448:	05 e0 6a 00 00       	add    eax,0x6ae0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:354
    // Zero sector initially
    memset(fs->currentsector.sector, 0, FAT_SECTOR_SIZE);
    444d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    4450:	83 c2 44             	add    edx,0x44
    4453:	83 ec 04             	sub    esp,0x4
    4456:	68 00 02 00 00       	push   0x200
    445b:	6a 00                	push   0x0
    445d:	52                   	push   edx
    445e:	89 c3                	mov    ebx,eax
    4460:	e8 db 2d 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    4465:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:357

    // FSI_LeadSig
    fs->currentsector.sector[0] = 0x52;
    4468:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    446b:	c6 40 44 52          	mov    BYTE PTR [eax+0x44],0x52
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:358
    fs->currentsector.sector[1] = 0x52;
    446f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4472:	c6 40 45 52          	mov    BYTE PTR [eax+0x45],0x52
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:359
    fs->currentsector.sector[2] = 0x61;
    4476:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4479:	c6 40 46 61          	mov    BYTE PTR [eax+0x46],0x61
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:360
    fs->currentsector.sector[3] = 0x41;
    447d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4480:	c6 40 47 41          	mov    BYTE PTR [eax+0x47],0x41
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:363

    // FSI_StrucSig
    fs->currentsector.sector[484] = 0x72;
    4484:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4487:	c6 80 28 02 00 00 72 	mov    BYTE PTR [eax+0x228],0x72
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:364
    fs->currentsector.sector[485] = 0x72;
    448e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4491:	c6 80 29 02 00 00 72 	mov    BYTE PTR [eax+0x229],0x72
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:365
    fs->currentsector.sector[486] = 0x41;
    4498:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    449b:	c6 80 2a 02 00 00 41 	mov    BYTE PTR [eax+0x22a],0x41
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:366
    fs->currentsector.sector[487] = 0x61;
    44a2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    44a5:	c6 80 2b 02 00 00 61 	mov    BYTE PTR [eax+0x22b],0x61
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:369

    // FSI_Free_Count
    fs->currentsector.sector[488] = 0xFF;
    44ac:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    44af:	c6 80 2c 02 00 00 ff 	mov    BYTE PTR [eax+0x22c],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:370
    fs->currentsector.sector[489] = 0xFF;
    44b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    44b9:	c6 80 2d 02 00 00 ff 	mov    BYTE PTR [eax+0x22d],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:371
    fs->currentsector.sector[490] = 0xFF;
    44c0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    44c3:	c6 80 2e 02 00 00 ff 	mov    BYTE PTR [eax+0x22e],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:372
    fs->currentsector.sector[491] = 0xFF;
    44ca:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    44cd:	c6 80 2f 02 00 00 ff 	mov    BYTE PTR [eax+0x22f],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:375

    // FSI_Nxt_Free
    fs->currentsector.sector[492] = 0xFF;
    44d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    44d7:	c6 80 30 02 00 00 ff 	mov    BYTE PTR [eax+0x230],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:376
    fs->currentsector.sector[493] = 0xFF;
    44de:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    44e1:	c6 80 31 02 00 00 ff 	mov    BYTE PTR [eax+0x231],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:377
    fs->currentsector.sector[494] = 0xFF;
    44e8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    44eb:	c6 80 32 02 00 00 ff 	mov    BYTE PTR [eax+0x232],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:378
    fs->currentsector.sector[495] = 0xFF;
    44f2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    44f5:	c6 80 33 02 00 00 ff 	mov    BYTE PTR [eax+0x233],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:381

    // Signature
    fs->currentsector.sector[510] = 0x55;
    44fc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    44ff:	c6 80 42 02 00 00 55 	mov    BYTE PTR [eax+0x242],0x55
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:382
    fs->currentsector.sector[511] = 0xAA;
    4506:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4509:	c6 80 43 02 00 00 aa 	mov    BYTE PTR [eax+0x243],0xaa
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:384

    if (fs->disk_io.write_media(sector_lba, fs->currentsector.sector, 1))
    4510:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4513:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    4516:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    4519:	83 c2 44             	add    edx,0x44
    451c:	83 ec 04             	sub    esp,0x4
    451f:	6a 01                	push   0x1
    4521:	52                   	push   edx
    4522:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    4525:	ff d0                	call   eax
    4527:	83 c4 10             	add    esp,0x10
    452a:	85 c0                	test   eax,eax
    452c:	74 07                	je     4535 <fatfs_create_fsinfo_sector+0xf9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:385
        return 1;
    452e:	b8 01 00 00 00       	mov    eax,0x1
    4533:	eb 05                	jmp    453a <fatfs_create_fsinfo_sector+0xfe>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:387
    else
        return 0;
    4535:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:388
}
    453a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    453d:	c9                   	leave  
    453e:	c3                   	ret    

0000453f <fatfs_erase_fat>:
fatfs_erase_fat():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:393
//-----------------------------------------------------------------------------
// fatfs_erase_fat: Erase FAT table using fs details in fs struct
//-----------------------------------------------------------------------------
static int fatfs_erase_fat(struct fatfs *fs, int is_fat32)
{
    453f:	55                   	push   ebp
    4540:	89 e5                	mov    ebp,esp
    4542:	53                   	push   ebx
    4543:	83 ec 14             	sub    esp,0x14
    4546:	e8 af 29 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    454b:	81 c3 dd 69 00 00    	add    ebx,0x69dd
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:397
    uint32 i;

    // Zero sector initially
    memset(fs->currentsector.sector, 0, FAT_SECTOR_SIZE);
    4551:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4554:	83 c0 44             	add    eax,0x44
    4557:	83 ec 04             	sub    esp,0x4
    455a:	68 00 02 00 00       	push   0x200
    455f:	6a 00                	push   0x0
    4561:	50                   	push   eax
    4562:	e8 d9 2c 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    4567:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:400

    // Initialise default allocate / reserved clusters
    if (!is_fat32)
    456a:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    456e:	75 1e                	jne    458e <fatfs_erase_fat+0x4f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:402
    {
        SET_16BIT_WORD(fs->currentsector.sector, 0, 0xFFF8);
    4570:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4573:	c6 40 44 f8          	mov    BYTE PTR [eax+0x44],0xf8
    4577:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    457a:	c6 40 45 ff          	mov    BYTE PTR [eax+0x45],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:403
        SET_16BIT_WORD(fs->currentsector.sector, 2, 0xFFFF);
    457e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4581:	c6 40 46 ff          	mov    BYTE PTR [eax+0x46],0xff
    4585:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4588:	c6 40 47 ff          	mov    BYTE PTR [eax+0x47],0xff
    458c:	eb 54                	jmp    45e2 <fatfs_erase_fat+0xa3>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:407
    }
    else
    {
        SET_32BIT_WORD(fs->currentsector.sector, 0, 0x0FFFFFF8);
    458e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4591:	c6 40 44 f8          	mov    BYTE PTR [eax+0x44],0xf8
    4595:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4598:	c6 40 45 ff          	mov    BYTE PTR [eax+0x45],0xff
    459c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    459f:	c6 40 46 ff          	mov    BYTE PTR [eax+0x46],0xff
    45a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    45a6:	c6 40 47 0f          	mov    BYTE PTR [eax+0x47],0xf
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:408
        SET_32BIT_WORD(fs->currentsector.sector, 4, 0xFFFFFFFF);
    45aa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    45ad:	c6 40 48 ff          	mov    BYTE PTR [eax+0x48],0xff
    45b1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    45b4:	c6 40 49 ff          	mov    BYTE PTR [eax+0x49],0xff
    45b8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    45bb:	c6 40 4a ff          	mov    BYTE PTR [eax+0x4a],0xff
    45bf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    45c2:	c6 40 4b ff          	mov    BYTE PTR [eax+0x4b],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:409
        SET_32BIT_WORD(fs->currentsector.sector, 8, 0x0FFFFFFF);
    45c6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    45c9:	c6 40 4c ff          	mov    BYTE PTR [eax+0x4c],0xff
    45cd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    45d0:	c6 40 4d ff          	mov    BYTE PTR [eax+0x4d],0xff
    45d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    45d7:	c6 40 4e ff          	mov    BYTE PTR [eax+0x4e],0xff
    45db:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    45de:	c6 40 4f 0f          	mov    BYTE PTR [eax+0x4f],0xf
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:412
    }

    if (!fs->disk_io.write_media(fs->fat_begin_lba + 0, fs->currentsector.sector, 1))
    45e2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    45e5:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    45e8:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    45eb:	8d 4a 44             	lea    ecx,[edx+0x44]
    45ee:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    45f1:	8b 52 14             	mov    edx,DWORD PTR [edx+0x14]
    45f4:	83 ec 04             	sub    esp,0x4
    45f7:	6a 01                	push   0x1
    45f9:	51                   	push   ecx
    45fa:	52                   	push   edx
    45fb:	ff d0                	call   eax
    45fd:	83 c4 10             	add    esp,0x10
    4600:	85 c0                	test   eax,eax
    4602:	75 07                	jne    460b <fatfs_erase_fat+0xcc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:413
        return 0;
    4604:	b8 00 00 00 00       	mov    eax,0x0
    4609:	eb 71                	jmp    467c <fatfs_erase_fat+0x13d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:416

    // Zero remaining FAT sectors
    memset(fs->currentsector.sector, 0, FAT_SECTOR_SIZE);
    460b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    460e:	83 c0 44             	add    eax,0x44
    4611:	83 ec 04             	sub    esp,0x4
    4614:	68 00 02 00 00       	push   0x200
    4619:	6a 00                	push   0x0
    461b:	50                   	push   eax
    461c:	e8 1f 2c 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    4621:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:417
    for (i=1;i<fs->fat_sectors*fs->num_of_fats;i++)
    4624:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [ebp-0xc],0x1
    462b:	eb 32                	jmp    465f <fatfs_erase_fat+0x120>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:418
        if (!fs->disk_io.write_media(fs->fat_begin_lba + i, fs->currentsector.sector, 1))
    462d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4630:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    4633:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    4636:	8d 4a 44             	lea    ecx,[edx+0x44]
    4639:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    463c:	8b 5a 14             	mov    ebx,DWORD PTR [edx+0x14]
    463f:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    4642:	01 da                	add    edx,ebx
    4644:	83 ec 04             	sub    esp,0x4
    4647:	6a 01                	push   0x1
    4649:	51                   	push   ecx
    464a:	52                   	push   edx
    464b:	ff d0                	call   eax
    464d:	83 c4 10             	add    esp,0x10
    4650:	85 c0                	test   eax,eax
    4652:	75 07                	jne    465b <fatfs_erase_fat+0x11c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:419
            return 0;
    4654:	b8 00 00 00 00       	mov    eax,0x0
    4659:	eb 21                	jmp    467c <fatfs_erase_fat+0x13d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:417 (discriminator 2)
    if (!fs->disk_io.write_media(fs->fat_begin_lba + 0, fs->currentsector.sector, 1))
        return 0;

    // Zero remaining FAT sectors
    memset(fs->currentsector.sector, 0, FAT_SECTOR_SIZE);
    for (i=1;i<fs->fat_sectors*fs->num_of_fats;i++)
    465b:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:417 (discriminator 1)
    465f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4662:	8b 50 20             	mov    edx,DWORD PTR [eax+0x20]
    4665:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4668:	0f b6 40 2c          	movzx  eax,BYTE PTR [eax+0x2c]
    466c:	0f b6 c0             	movzx  eax,al
    466f:	0f af c2             	imul   eax,edx
    4672:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    4675:	77 b6                	ja     462d <fatfs_erase_fat+0xee>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:421
        if (!fs->disk_io.write_media(fs->fat_begin_lba + i, fs->currentsector.sector, 1))
            return 0;

    return 1;
    4677:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:422
}
    467c:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    467f:	c9                   	leave  
    4680:	c3                   	ret    

00004681 <fatfs_format_fat16>:
fatfs_format_fat16():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:427
//-----------------------------------------------------------------------------
// fatfs_format_fat16: Format a FAT16 partition
//-----------------------------------------------------------------------------
int fatfs_format_fat16(struct fatfs *fs, uint32 volume_sectors, const char *name)
{
    4681:	55                   	push   ebp
    4682:	89 e5                	mov    ebp,esp
    4684:	53                   	push   ebx
    4685:	83 ec 04             	sub    esp,0x4
    4688:	e8 69 28 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    468d:	05 9b 68 00 00       	add    eax,0x689b
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:428
    fs->currentsector.address = FAT32_INVALID_CLUSTER;
    4692:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    4695:	c7 82 44 02 00 00 ff 	mov    DWORD PTR [edx+0x244],0xffffffff
    469c:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:429
    fs->currentsector.dirty = 0;
    469f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    46a2:	c7 82 48 02 00 00 00 	mov    DWORD PTR [edx+0x248],0x0
    46a9:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:431

    fs->next_free_cluster = 0; // Invalid
    46ac:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    46af:	c7 42 24 00 00 00 00 	mov    DWORD PTR [edx+0x24],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:433

    fatfs_fat_init(fs);
    46b6:	83 ec 0c             	sub    esp,0xc
    46b9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    46bc:	89 c3                	mov    ebx,eax
    46be:	e8 6d 28 00 00       	call   6f30 <__x86.get_pc_thunk.bx+0x36>
    46c3:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:436

    // Make sure we have read + write functions
    if (!fs->disk_io.read_media || !fs->disk_io.write_media)
    46c6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    46c9:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
    46cc:	85 c0                	test   eax,eax
    46ce:	74 0a                	je     46da <fatfs_format_fat16+0x59>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:436 (discriminator 1)
    46d0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    46d3:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    46d6:	85 c0                	test   eax,eax
    46d8:	75 0a                	jne    46e4 <fatfs_format_fat16+0x63>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:437
        return FAT_INIT_MEDIA_ACCESS_ERROR;
    46da:	b8 ff ff ff ff       	mov    eax,0xffffffff
    46df:	e9 29 01 00 00       	jmp    480d <fatfs_format_fat16+0x18c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:440

    // Volume is FAT16
    fs->fat_type = FAT_TYPE_16;
    46e4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    46e7:	c7 40 30 00 00 00 00 	mov    DWORD PTR [eax+0x30],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:443

    // Not valid for FAT16
    fs->fs_info_sector = 0;
    46ee:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    46f1:	66 c7 40 18 00 00    	mov    WORD PTR [eax+0x18],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:444
    fs->rootdir_first_cluster = 0;
    46f7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    46fa:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:448

    // Sector 0: Boot sector
    // NOTE: We don't need an MBR, it is a waste of a good sector!
    fs->lba_begin = 0;
    4701:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4704:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [eax+0x1c],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:449
    if (!fatfs_create_boot_sector(fs, fs->lba_begin, volume_sectors, name, 0))
    470b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    470e:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
    4711:	83 ec 0c             	sub    esp,0xc
    4714:	6a 00                	push   0x0
    4716:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    4719:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    471c:	50                   	push   eax
    471d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    4720:	e8 84 f7 ff ff       	call   3ea9 <fatfs_create_boot_sector>
    4725:	83 c4 20             	add    esp,0x20
    4728:	85 c0                	test   eax,eax
    472a:	75 0a                	jne    4736 <fatfs_format_fat16+0xb5>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:450
        return 0;
    472c:	b8 00 00 00 00       	mov    eax,0x0
    4731:	e9 d7 00 00 00       	jmp    480d <fatfs_format_fat16+0x18c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:453

    // For FAT16 (which this may be), rootdir_first_cluster is actuall rootdir_first_sector
    fs->rootdir_first_sector = fs->reserved_sectors + (fs->num_of_fats * fs->fat_sectors);
    4736:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4739:	0f b7 40 2a          	movzx  eax,WORD PTR [eax+0x2a]
    473d:	0f b7 d0             	movzx  edx,ax
    4740:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4743:	0f b6 40 2c          	movzx  eax,BYTE PTR [eax+0x2c]
    4747:	0f b6 c8             	movzx  ecx,al
    474a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    474d:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    4750:	0f af c1             	imul   eax,ecx
    4753:	01 c2                	add    edx,eax
    4755:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4758:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:454
    fs->rootdir_sectors = ((fs->root_entry_count * 32) + (FAT_SECTOR_SIZE - 1)) / FAT_SECTOR_SIZE;
    475b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    475e:	0f b7 40 28          	movzx  eax,WORD PTR [eax+0x28]
    4762:	0f b7 c0             	movzx  eax,ax
    4765:	c1 e0 05             	shl    eax,0x5
    4768:	05 ff 01 00 00       	add    eax,0x1ff
    476d:	8d 90 ff 01 00 00    	lea    edx,[eax+0x1ff]
    4773:	85 c0                	test   eax,eax
    4775:	0f 48 c2             	cmovs  eax,edx
    4778:	c1 f8 09             	sar    eax,0x9
    477b:	89 c2                	mov    edx,eax
    477d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4780:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:457

    // First FAT LBA address
    fs->fat_begin_lba = fs->lba_begin + fs->reserved_sectors;
    4783:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4786:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
    4789:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    478c:	0f b7 40 2a          	movzx  eax,WORD PTR [eax+0x2a]
    4790:	0f b7 c0             	movzx  eax,ax
    4793:	01 c2                	add    edx,eax
    4795:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4798:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:460

    // The address of the first data cluster on this volume
    fs->cluster_begin_lba = fs->fat_begin_lba + (fs->num_of_fats * fs->fat_sectors);
    479b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    479e:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
    47a1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    47a4:	0f b6 40 2c          	movzx  eax,BYTE PTR [eax+0x2c]
    47a8:	0f b6 c8             	movzx  ecx,al
    47ab:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    47ae:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    47b1:	0f af c1             	imul   eax,ecx
    47b4:	01 c2                	add    edx,eax
    47b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    47b9:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:463

    // Initialise FAT sectors
    if (!fatfs_erase_fat(fs, 0))
    47bc:	83 ec 08             	sub    esp,0x8
    47bf:	6a 00                	push   0x0
    47c1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    47c4:	e8 76 fd ff ff       	call   453f <fatfs_erase_fat>
    47c9:	83 c4 10             	add    esp,0x10
    47cc:	85 c0                	test   eax,eax
    47ce:	75 07                	jne    47d7 <fatfs_format_fat16+0x156>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:464
        return 0;
    47d0:	b8 00 00 00 00       	mov    eax,0x0
    47d5:	eb 36                	jmp    480d <fatfs_format_fat16+0x18c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:467

    // Erase Root directory
    if (!fatfs_erase_sectors(fs, fs->lba_begin + fs->rootdir_first_sector, fs->rootdir_sectors))
    47d7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    47da:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
    47dd:	89 c1                	mov    ecx,eax
    47df:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    47e2:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
    47e5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    47e8:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
    47eb:	01 d0                	add    eax,edx
    47ed:	83 ec 04             	sub    esp,0x4
    47f0:	51                   	push   ecx
    47f1:	50                   	push   eax
    47f2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    47f5:	e8 39 f6 ff ff       	call   3e33 <fatfs_erase_sectors>
    47fa:	83 c4 10             	add    esp,0x10
    47fd:	85 c0                	test   eax,eax
    47ff:	75 07                	jne    4808 <fatfs_format_fat16+0x187>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:468
        return 0;
    4801:	b8 00 00 00 00       	mov    eax,0x0
    4806:	eb 05                	jmp    480d <fatfs_format_fat16+0x18c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:470

    return 1;
    4808:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:471
}
    480d:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    4810:	c9                   	leave  
    4811:	c3                   	ret    

00004812 <fatfs_format_fat32>:
fatfs_format_fat32():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:476
//-----------------------------------------------------------------------------
// fatfs_format_fat32: Format a FAT32 partition
//-----------------------------------------------------------------------------
int fatfs_format_fat32(struct fatfs *fs, uint32 volume_sectors, const char *name)
{
    4812:	55                   	push   ebp
    4813:	89 e5                	mov    ebp,esp
    4815:	56                   	push   esi
    4816:	53                   	push   ebx
    4817:	e8 de 26 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    481c:	81 c3 0c 67 00 00    	add    ebx,0x670c
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:477
    fs->currentsector.address = FAT32_INVALID_CLUSTER;
    4822:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4825:	c7 80 44 02 00 00 ff 	mov    DWORD PTR [eax+0x244],0xffffffff
    482c:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:478
    fs->currentsector.dirty = 0;
    482f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4832:	c7 80 48 02 00 00 00 	mov    DWORD PTR [eax+0x248],0x0
    4839:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:480

    fs->next_free_cluster = 0; // Invalid
    483c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    483f:	c7 40 24 00 00 00 00 	mov    DWORD PTR [eax+0x24],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:482

    fatfs_fat_init(fs);
    4846:	83 ec 0c             	sub    esp,0xc
    4849:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    484c:	e8 df 26 00 00       	call   6f30 <__x86.get_pc_thunk.bx+0x36>
    4851:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:485

    // Make sure we have read + write functions
    if (!fs->disk_io.read_media || !fs->disk_io.write_media)
    4854:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4857:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
    485a:	85 c0                	test   eax,eax
    485c:	74 0a                	je     4868 <fatfs_format_fat32+0x56>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:485 (discriminator 1)
    485e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4861:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    4864:	85 c0                	test   eax,eax
    4866:	75 0a                	jne    4872 <fatfs_format_fat32+0x60>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:486
        return FAT_INIT_MEDIA_ACCESS_ERROR;
    4868:	b8 ff ff ff ff       	mov    eax,0xffffffff
    486d:	e9 08 01 00 00       	jmp    497a <fatfs_format_fat32+0x168>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:489

    // Volume is FAT32
    fs->fat_type = FAT_TYPE_32;
    4872:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4875:	c7 40 30 01 00 00 00 	mov    DWORD PTR [eax+0x30],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:492

    // Basic defaults for normal FAT32 partitions
    fs->fs_info_sector = 1;
    487c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    487f:	66 c7 40 18 01 00    	mov    WORD PTR [eax+0x18],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:493
    fs->rootdir_first_cluster = 2;
    4885:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4888:	c7 40 08 02 00 00 00 	mov    DWORD PTR [eax+0x8],0x2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:497

    // Sector 0: Boot sector
    // NOTE: We don't need an MBR, it is a waste of a good sector!
    fs->lba_begin = 0;
    488f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4892:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [eax+0x1c],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:498
    if (!fatfs_create_boot_sector(fs, fs->lba_begin, volume_sectors, name, 1))
    4899:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    489c:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
    489f:	83 ec 0c             	sub    esp,0xc
    48a2:	6a 01                	push   0x1
    48a4:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    48a7:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    48aa:	50                   	push   eax
    48ab:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    48ae:	e8 f6 f5 ff ff       	call   3ea9 <fatfs_create_boot_sector>
    48b3:	83 c4 20             	add    esp,0x20
    48b6:	85 c0                	test   eax,eax
    48b8:	75 0a                	jne    48c4 <fatfs_format_fat32+0xb2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:499
        return 0;
    48ba:	b8 00 00 00 00       	mov    eax,0x0
    48bf:	e9 b6 00 00 00       	jmp    497a <fatfs_format_fat32+0x168>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:502

    // First FAT LBA address
    fs->fat_begin_lba = fs->lba_begin + fs->reserved_sectors;
    48c4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48c7:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
    48ca:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48cd:	0f b7 40 2a          	movzx  eax,WORD PTR [eax+0x2a]
    48d1:	0f b7 c0             	movzx  eax,ax
    48d4:	01 c2                	add    edx,eax
    48d6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48d9:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:505

    // The address of the first data cluster on this volume
    fs->cluster_begin_lba = fs->fat_begin_lba + (fs->num_of_fats * fs->fat_sectors);
    48dc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48df:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
    48e2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48e5:	0f b6 40 2c          	movzx  eax,BYTE PTR [eax+0x2c]
    48e9:	0f b6 c8             	movzx  ecx,al
    48ec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48ef:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    48f2:	0f af c1             	imul   eax,ecx
    48f5:	01 c2                	add    edx,eax
    48f7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48fa:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:508

    // Initialise FSInfo sector
    if (!fatfs_create_fsinfo_sector(fs, fs->fs_info_sector))
    48fd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4900:	0f b7 40 18          	movzx  eax,WORD PTR [eax+0x18]
    4904:	0f b7 c0             	movzx  eax,ax
    4907:	83 ec 08             	sub    esp,0x8
    490a:	50                   	push   eax
    490b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    490e:	e8 29 fb ff ff       	call   443c <fatfs_create_fsinfo_sector>
    4913:	83 c4 10             	add    esp,0x10
    4916:	85 c0                	test   eax,eax
    4918:	75 07                	jne    4921 <fatfs_format_fat32+0x10f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:509
        return 0;
    491a:	b8 00 00 00 00       	mov    eax,0x0
    491f:	eb 59                	jmp    497a <fatfs_format_fat32+0x168>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:512

    // Initialise FAT sectors
    if (!fatfs_erase_fat(fs, 1))
    4921:	83 ec 08             	sub    esp,0x8
    4924:	6a 01                	push   0x1
    4926:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    4929:	e8 11 fc ff ff       	call   453f <fatfs_erase_fat>
    492e:	83 c4 10             	add    esp,0x10
    4931:	85 c0                	test   eax,eax
    4933:	75 07                	jne    493c <fatfs_format_fat32+0x12a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:513
        return 0;
    4935:	b8 00 00 00 00       	mov    eax,0x0
    493a:	eb 3e                	jmp    497a <fatfs_format_fat32+0x168>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:516

    // Erase Root directory
    if (!fatfs_erase_sectors(fs, fatfs_lba_of_cluster(fs, fs->rootdir_first_cluster), fs->sectors_per_cluster))
    493c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    493f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    4942:	0f b6 f0             	movzx  esi,al
    4945:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4948:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    494b:	83 ec 08             	sub    esp,0x8
    494e:	50                   	push   eax
    494f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    4952:	e8 d9 29 00 00       	call   7330 <__x86.get_pc_thunk.bx+0x436>
    4957:	83 c4 10             	add    esp,0x10
    495a:	83 ec 04             	sub    esp,0x4
    495d:	56                   	push   esi
    495e:	50                   	push   eax
    495f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    4962:	e8 cc f4 ff ff       	call   3e33 <fatfs_erase_sectors>
    4967:	83 c4 10             	add    esp,0x10
    496a:	85 c0                	test   eax,eax
    496c:	75 07                	jne    4975 <fatfs_format_fat32+0x163>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:517
        return 0;
    496e:	b8 00 00 00 00       	mov    eax,0x0
    4973:	eb 05                	jmp    497a <fatfs_format_fat32+0x168>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:519

    return 1;
    4975:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:520
}
    497a:	8d 65 f8             	lea    esp,[ebp-0x8]
    497d:	5b                   	pop    ebx
    497e:	5e                   	pop    esi
    497f:	5d                   	pop    ebp
    4980:	c3                   	ret    

00004981 <fatfs_format>:
fatfs_format():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:525
//-----------------------------------------------------------------------------
// fatfs_format: Format a partition with either FAT16 or FAT32 based on size
//-----------------------------------------------------------------------------
int fatfs_format(struct fatfs *fs, uint32 volume_sectors, const char *name)
{
    4981:	55                   	push   ebp
    4982:	89 e5                	mov    ebp,esp
    4984:	53                   	push   ebx
    4985:	83 ec 04             	sub    esp,0x4
    4988:	e8 69 25 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    498d:	05 9b 65 00 00       	add    eax,0x659b
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:527
    // 2GB - 32K limit for safe behaviour for FAT16
    if (volume_sectors <= 4194304)
    4992:	81 7d 0c 00 00 40 00 	cmp    DWORD PTR [ebp+0xc],0x400000
    4999:	77 18                	ja     49b3 <fatfs_format+0x32>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:528
        return fatfs_format_fat16(fs, volume_sectors, name);
    499b:	83 ec 04             	sub    esp,0x4
    499e:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    49a1:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    49a4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    49a7:	89 c3                	mov    ebx,eax
    49a9:	e8 a2 29 00 00       	call   7350 <__x86.get_pc_thunk.bx+0x456>
    49ae:	83 c4 10             	add    esp,0x10
    49b1:	eb 16                	jmp    49c9 <fatfs_format+0x48>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:530
    else
        return fatfs_format_fat32(fs, volume_sectors, name);
    49b3:	83 ec 04             	sub    esp,0x4
    49b6:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    49b9:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    49bc:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    49bf:	89 c3                	mov    ebx,eax
    49c1:	e8 1a 28 00 00       	call   71e0 <__x86.get_pc_thunk.bx+0x2e6>
    49c6:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_format.c:531
}
    49c9:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    49cc:	c9                   	leave  
    49cd:	c3                   	ret    
    49ce:	66 90                	xchg   ax,ax

000049d0 <fatfs_lfn_cache_init>:
fatfs_lfn_cache_init():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:40

//-----------------------------------------------------------------------------
// fatfs_lfn_cache_init: Clear long file name cache
//-----------------------------------------------------------------------------
void fatfs_lfn_cache_init(struct lfn_cache *lfn, int wipeTable)
{
    49d0:	55                   	push   ebp
    49d1:	89 e5                	mov    ebp,esp
    49d3:	53                   	push   ebx
    49d4:	83 ec 14             	sub    esp,0x14
    49d7:	e8 1e 25 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    49dc:	81 c3 4c 65 00 00    	add    ebx,0x654c
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:41
    int i = 0;
    49e2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:43

    lfn->no_of_strings = 0;
    49e9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    49ec:	c6 80 05 01 00 00 00 	mov    BYTE PTR [eax+0x105],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:48

#if FATFS_INC_LFN_SUPPORT

    // Zero out buffer also
    if (wipeTable)
    49f3:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    49f7:	74 36                	je     4a2f <fatfs_lfn_cache_init+0x5f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:49
        for (i=0;i<MAX_LONGFILENAME_ENTRIES;i++)
    49f9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    4a00:	eb 27                	jmp    4a29 <fatfs_lfn_cache_init+0x59>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:50 (discriminator 3)
            memset(lfn->String[i], 0x00, MAX_LFN_ENTRY_LENGTH);
    4a02:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    4a05:	89 d0                	mov    eax,edx
    4a07:	01 c0                	add    eax,eax
    4a09:	01 d0                	add    eax,edx
    4a0b:	c1 e0 02             	shl    eax,0x2
    4a0e:	01 d0                	add    eax,edx
    4a10:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    4a13:	01 d0                	add    eax,edx
    4a15:	83 ec 04             	sub    esp,0x4
    4a18:	6a 0d                	push   0xd
    4a1a:	6a 00                	push   0x0
    4a1c:	50                   	push   eax
    4a1d:	e8 1e 28 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    4a22:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:49 (discriminator 3)

#if FATFS_INC_LFN_SUPPORT

    // Zero out buffer also
    if (wipeTable)
        for (i=0;i<MAX_LONGFILENAME_ENTRIES;i++)
    4a25:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:49 (discriminator 1)
    4a29:	83 7d f4 13          	cmp    DWORD PTR [ebp-0xc],0x13
    4a2d:	7e d3                	jle    4a02 <fatfs_lfn_cache_init+0x32>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:52
            memset(lfn->String[i], 0x00, MAX_LFN_ENTRY_LENGTH);
#endif
}
    4a2f:	90                   	nop
    4a30:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    4a33:	c9                   	leave  
    4a34:	c3                   	ret    

00004a35 <fatfs_lfn_cache_entry>:
fatfs_lfn_cache_entry():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:59
// fatfs_lfn_cache_entry - Function extracts long file name text from sector
// at a specific offset
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
void fatfs_lfn_cache_entry(struct lfn_cache *lfn, uint8 *entryBuffer)
{
    4a35:	55                   	push   ebp
    4a36:	89 e5                	mov    ebp,esp
    4a38:	53                   	push   ebx
    4a39:	83 ec 10             	sub    esp,0x10
    4a3c:	e8 b5 24 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    4a41:	05 e7 64 00 00       	add    eax,0x64e7
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:61
    uint8 LFNIndex, i;
    LFNIndex = entryBuffer[0] & 0x1F;
    4a46:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4a49:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    4a4c:	83 e0 1f             	and    eax,0x1f
    4a4f:	88 45 fa             	mov    BYTE PTR [ebp-0x6],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:64

    // Limit file name to cache size!
    if (LFNIndex > MAX_LONGFILENAME_ENTRIES)
    4a52:	80 7d fa 14          	cmp    BYTE PTR [ebp-0x6],0x14
    4a56:	0f 87 45 02 00 00    	ja     4ca1 <fatfs_lfn_cache_entry+0x26c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:68
        return ;

    // This is an error condition
    if (LFNIndex == 0)
    4a5c:	80 7d fa 00          	cmp    BYTE PTR [ebp-0x6],0x0
    4a60:	0f 84 3e 02 00 00    	je     4ca4 <fatfs_lfn_cache_entry+0x26f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:71
        return ;

    if (lfn->no_of_strings == 0)
    4a66:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4a69:	0f b6 80 05 01 00 00 	movzx  eax,BYTE PTR [eax+0x105]
    4a70:	84 c0                	test   al,al
    4a72:	75 0d                	jne    4a81 <fatfs_lfn_cache_entry+0x4c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:72
        lfn->no_of_strings = LFNIndex;
    4a74:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4a77:	0f b6 55 fa          	movzx  edx,BYTE PTR [ebp-0x6]
    4a7b:	88 90 05 01 00 00    	mov    BYTE PTR [eax+0x105],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:74

    lfn->String[LFNIndex-1][0] = entryBuffer[1];
    4a81:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4a85:	8d 50 ff             	lea    edx,[eax-0x1]
    4a88:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4a8b:	0f b6 48 01          	movzx  ecx,BYTE PTR [eax+0x1]
    4a8f:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4a92:	89 d0                	mov    eax,edx
    4a94:	01 c0                	add    eax,eax
    4a96:	01 d0                	add    eax,edx
    4a98:	c1 e0 02             	shl    eax,0x2
    4a9b:	01 d0                	add    eax,edx
    4a9d:	01 d8                	add    eax,ebx
    4a9f:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:75
    lfn->String[LFNIndex-1][1] = entryBuffer[3];
    4aa1:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4aa5:	8d 50 ff             	lea    edx,[eax-0x1]
    4aa8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4aab:	0f b6 48 03          	movzx  ecx,BYTE PTR [eax+0x3]
    4aaf:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4ab2:	89 d0                	mov    eax,edx
    4ab4:	01 c0                	add    eax,eax
    4ab6:	01 d0                	add    eax,edx
    4ab8:	c1 e0 02             	shl    eax,0x2
    4abb:	01 d0                	add    eax,edx
    4abd:	01 d8                	add    eax,ebx
    4abf:	83 c0 01             	add    eax,0x1
    4ac2:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:76
    lfn->String[LFNIndex-1][2] = entryBuffer[5];
    4ac4:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4ac8:	8d 50 ff             	lea    edx,[eax-0x1]
    4acb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4ace:	0f b6 48 05          	movzx  ecx,BYTE PTR [eax+0x5]
    4ad2:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4ad5:	89 d0                	mov    eax,edx
    4ad7:	01 c0                	add    eax,eax
    4ad9:	01 d0                	add    eax,edx
    4adb:	c1 e0 02             	shl    eax,0x2
    4ade:	01 d0                	add    eax,edx
    4ae0:	01 d8                	add    eax,ebx
    4ae2:	83 c0 02             	add    eax,0x2
    4ae5:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:77
    lfn->String[LFNIndex-1][3] = entryBuffer[7];
    4ae7:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4aeb:	8d 50 ff             	lea    edx,[eax-0x1]
    4aee:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4af1:	0f b6 48 07          	movzx  ecx,BYTE PTR [eax+0x7]
    4af5:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4af8:	89 d0                	mov    eax,edx
    4afa:	01 c0                	add    eax,eax
    4afc:	01 d0                	add    eax,edx
    4afe:	c1 e0 02             	shl    eax,0x2
    4b01:	01 d0                	add    eax,edx
    4b03:	01 d8                	add    eax,ebx
    4b05:	83 c0 03             	add    eax,0x3
    4b08:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:78
    lfn->String[LFNIndex-1][4] = entryBuffer[9];
    4b0a:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4b0e:	8d 50 ff             	lea    edx,[eax-0x1]
    4b11:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4b14:	0f b6 48 09          	movzx  ecx,BYTE PTR [eax+0x9]
    4b18:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4b1b:	89 d0                	mov    eax,edx
    4b1d:	01 c0                	add    eax,eax
    4b1f:	01 d0                	add    eax,edx
    4b21:	c1 e0 02             	shl    eax,0x2
    4b24:	01 d0                	add    eax,edx
    4b26:	01 d8                	add    eax,ebx
    4b28:	83 c0 04             	add    eax,0x4
    4b2b:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:79
    lfn->String[LFNIndex-1][5] = entryBuffer[0x0E];
    4b2d:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4b31:	8d 50 ff             	lea    edx,[eax-0x1]
    4b34:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4b37:	0f b6 48 0e          	movzx  ecx,BYTE PTR [eax+0xe]
    4b3b:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4b3e:	89 d0                	mov    eax,edx
    4b40:	01 c0                	add    eax,eax
    4b42:	01 d0                	add    eax,edx
    4b44:	c1 e0 02             	shl    eax,0x2
    4b47:	01 d0                	add    eax,edx
    4b49:	01 d8                	add    eax,ebx
    4b4b:	83 c0 05             	add    eax,0x5
    4b4e:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:80
    lfn->String[LFNIndex-1][6] = entryBuffer[0x10];
    4b50:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4b54:	8d 50 ff             	lea    edx,[eax-0x1]
    4b57:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4b5a:	0f b6 48 10          	movzx  ecx,BYTE PTR [eax+0x10]
    4b5e:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4b61:	89 d0                	mov    eax,edx
    4b63:	01 c0                	add    eax,eax
    4b65:	01 d0                	add    eax,edx
    4b67:	c1 e0 02             	shl    eax,0x2
    4b6a:	01 d0                	add    eax,edx
    4b6c:	01 d8                	add    eax,ebx
    4b6e:	83 c0 06             	add    eax,0x6
    4b71:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:81
    lfn->String[LFNIndex-1][7] = entryBuffer[0x12];
    4b73:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4b77:	8d 50 ff             	lea    edx,[eax-0x1]
    4b7a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4b7d:	0f b6 48 12          	movzx  ecx,BYTE PTR [eax+0x12]
    4b81:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4b84:	89 d0                	mov    eax,edx
    4b86:	01 c0                	add    eax,eax
    4b88:	01 d0                	add    eax,edx
    4b8a:	c1 e0 02             	shl    eax,0x2
    4b8d:	01 d0                	add    eax,edx
    4b8f:	01 d8                	add    eax,ebx
    4b91:	83 c0 07             	add    eax,0x7
    4b94:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:82
    lfn->String[LFNIndex-1][8] = entryBuffer[0x14];
    4b96:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4b9a:	8d 50 ff             	lea    edx,[eax-0x1]
    4b9d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4ba0:	0f b6 48 14          	movzx  ecx,BYTE PTR [eax+0x14]
    4ba4:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4ba7:	89 d0                	mov    eax,edx
    4ba9:	01 c0                	add    eax,eax
    4bab:	01 d0                	add    eax,edx
    4bad:	c1 e0 02             	shl    eax,0x2
    4bb0:	01 d0                	add    eax,edx
    4bb2:	01 d8                	add    eax,ebx
    4bb4:	83 c0 08             	add    eax,0x8
    4bb7:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:83
    lfn->String[LFNIndex-1][9] = entryBuffer[0x16];
    4bb9:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4bbd:	8d 50 ff             	lea    edx,[eax-0x1]
    4bc0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4bc3:	0f b6 48 16          	movzx  ecx,BYTE PTR [eax+0x16]
    4bc7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4bca:	89 d0                	mov    eax,edx
    4bcc:	01 c0                	add    eax,eax
    4bce:	01 d0                	add    eax,edx
    4bd0:	c1 e0 02             	shl    eax,0x2
    4bd3:	01 d0                	add    eax,edx
    4bd5:	01 d8                	add    eax,ebx
    4bd7:	83 c0 09             	add    eax,0x9
    4bda:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:84
    lfn->String[LFNIndex-1][10] = entryBuffer[0x18];
    4bdc:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4be0:	8d 50 ff             	lea    edx,[eax-0x1]
    4be3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4be6:	0f b6 48 18          	movzx  ecx,BYTE PTR [eax+0x18]
    4bea:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4bed:	89 d0                	mov    eax,edx
    4bef:	01 c0                	add    eax,eax
    4bf1:	01 d0                	add    eax,edx
    4bf3:	c1 e0 02             	shl    eax,0x2
    4bf6:	01 d0                	add    eax,edx
    4bf8:	01 d8                	add    eax,ebx
    4bfa:	83 c0 0a             	add    eax,0xa
    4bfd:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:85
    lfn->String[LFNIndex-1][11] = entryBuffer[0x1C];
    4bff:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4c03:	8d 50 ff             	lea    edx,[eax-0x1]
    4c06:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4c09:	0f b6 48 1c          	movzx  ecx,BYTE PTR [eax+0x1c]
    4c0d:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4c10:	89 d0                	mov    eax,edx
    4c12:	01 c0                	add    eax,eax
    4c14:	01 d0                	add    eax,edx
    4c16:	c1 e0 02             	shl    eax,0x2
    4c19:	01 d0                	add    eax,edx
    4c1b:	01 d8                	add    eax,ebx
    4c1d:	83 c0 0b             	add    eax,0xb
    4c20:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:86
    lfn->String[LFNIndex-1][12] = entryBuffer[0x1E];
    4c22:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4c26:	8d 50 ff             	lea    edx,[eax-0x1]
    4c29:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4c2c:	0f b6 48 1e          	movzx  ecx,BYTE PTR [eax+0x1e]
    4c30:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4c33:	89 d0                	mov    eax,edx
    4c35:	01 c0                	add    eax,eax
    4c37:	01 d0                	add    eax,edx
    4c39:	c1 e0 02             	shl    eax,0x2
    4c3c:	01 d0                	add    eax,edx
    4c3e:	01 d8                	add    eax,ebx
    4c40:	83 c0 0c             	add    eax,0xc
    4c43:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:88

    for (i=0; i<MAX_LFN_ENTRY_LENGTH; i++)
    4c45:	c6 45 fb 00          	mov    BYTE PTR [ebp-0x5],0x0
    4c49:	eb 4e                	jmp    4c99 <fatfs_lfn_cache_entry+0x264>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:89
        if (lfn->String[LFNIndex-1][i]==0xFF)
    4c4b:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4c4f:	8d 50 ff             	lea    edx,[eax-0x1]
    4c52:	0f b6 4d fb          	movzx  ecx,BYTE PTR [ebp-0x5]
    4c56:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4c59:	89 d0                	mov    eax,edx
    4c5b:	01 c0                	add    eax,eax
    4c5d:	01 d0                	add    eax,edx
    4c5f:	c1 e0 02             	shl    eax,0x2
    4c62:	01 d0                	add    eax,edx
    4c64:	01 d8                	add    eax,ebx
    4c66:	01 c8                	add    eax,ecx
    4c68:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    4c6b:	3c ff                	cmp    al,0xff
    4c6d:	75 20                	jne    4c8f <fatfs_lfn_cache_entry+0x25a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:90
            lfn->String[LFNIndex-1][i] = 0x20; // Replace with spaces
    4c6f:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
    4c73:	8d 50 ff             	lea    edx,[eax-0x1]
    4c76:	0f b6 4d fb          	movzx  ecx,BYTE PTR [ebp-0x5]
    4c7a:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    4c7d:	89 d0                	mov    eax,edx
    4c7f:	01 c0                	add    eax,eax
    4c81:	01 d0                	add    eax,edx
    4c83:	c1 e0 02             	shl    eax,0x2
    4c86:	01 d0                	add    eax,edx
    4c88:	01 d8                	add    eax,ebx
    4c8a:	01 c8                	add    eax,ecx
    4c8c:	c6 00 20             	mov    BYTE PTR [eax],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:88 (discriminator 2)
    lfn->String[LFNIndex-1][9] = entryBuffer[0x16];
    lfn->String[LFNIndex-1][10] = entryBuffer[0x18];
    lfn->String[LFNIndex-1][11] = entryBuffer[0x1C];
    lfn->String[LFNIndex-1][12] = entryBuffer[0x1E];

    for (i=0; i<MAX_LFN_ENTRY_LENGTH; i++)
    4c8f:	0f b6 45 fb          	movzx  eax,BYTE PTR [ebp-0x5]
    4c93:	83 c0 01             	add    eax,0x1
    4c96:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:88 (discriminator 1)
    4c99:	80 7d fb 0c          	cmp    BYTE PTR [ebp-0x5],0xc
    4c9d:	76 ac                	jbe    4c4b <fatfs_lfn_cache_entry+0x216>
    4c9f:	eb 04                	jmp    4ca5 <fatfs_lfn_cache_entry+0x270>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:65
    uint8 LFNIndex, i;
    LFNIndex = entryBuffer[0] & 0x1F;

    // Limit file name to cache size!
    if (LFNIndex > MAX_LONGFILENAME_ENTRIES)
        return ;
    4ca1:	90                   	nop
    4ca2:	eb 01                	jmp    4ca5 <fatfs_lfn_cache_entry+0x270>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:69

    // This is an error condition
    if (LFNIndex == 0)
        return ;
    4ca4:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:91
    lfn->String[LFNIndex-1][12] = entryBuffer[0x1E];

    for (i=0; i<MAX_LFN_ENTRY_LENGTH; i++)
        if (lfn->String[LFNIndex-1][i]==0xFF)
            lfn->String[LFNIndex-1][i] = 0x20; // Replace with spaces
}
    4ca5:	83 c4 10             	add    esp,0x10
    4ca8:	5b                   	pop    ebx
    4ca9:	5d                   	pop    ebp
    4caa:	c3                   	ret    

00004cab <fatfs_lfn_cache_get>:
fatfs_lfn_cache_get():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:98
//-----------------------------------------------------------------------------
// fatfs_lfn_cache_get: Get a reference to the long filename
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
char* fatfs_lfn_cache_get(struct lfn_cache *lfn)
{
    4cab:	55                   	push   ebp
    4cac:	89 e5                	mov    ebp,esp
    4cae:	e8 43 22 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    4cb3:	05 75 62 00 00       	add    eax,0x6275
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:100
    // Null terminate long filename
    if (lfn->no_of_strings == MAX_LONGFILENAME_ENTRIES)
    4cb8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4cbb:	0f b6 80 05 01 00 00 	movzx  eax,BYTE PTR [eax+0x105]
    4cc2:	3c 14                	cmp    al,0x14
    4cc4:	75 0c                	jne    4cd2 <fatfs_lfn_cache_get+0x27>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:101
        lfn->Null = '\0';
    4cc6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4cc9:	c6 80 04 01 00 00 00 	mov    BYTE PTR [eax+0x104],0x0
    4cd0:	eb 36                	jmp    4d08 <fatfs_lfn_cache_get+0x5d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:102
    else if (lfn->no_of_strings)
    4cd2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4cd5:	0f b6 80 05 01 00 00 	movzx  eax,BYTE PTR [eax+0x105]
    4cdc:	84 c0                	test   al,al
    4cde:	74 22                	je     4d02 <fatfs_lfn_cache_get+0x57>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:103
        lfn->String[lfn->no_of_strings][0] = '\0';
    4ce0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4ce3:	0f b6 80 05 01 00 00 	movzx  eax,BYTE PTR [eax+0x105]
    4cea:	0f b6 d0             	movzx  edx,al
    4ced:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
    4cf0:	89 d0                	mov    eax,edx
    4cf2:	01 c0                	add    eax,eax
    4cf4:	01 d0                	add    eax,edx
    4cf6:	c1 e0 02             	shl    eax,0x2
    4cf9:	01 d0                	add    eax,edx
    4cfb:	01 c8                	add    eax,ecx
    4cfd:	c6 00 00             	mov    BYTE PTR [eax],0x0
    4d00:	eb 06                	jmp    4d08 <fatfs_lfn_cache_get+0x5d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:105
    else
        lfn->String[0][0] = '\0';
    4d02:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4d05:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:107

    return (char*)&lfn->String[0][0];
    4d08:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:108
}
    4d0b:	5d                   	pop    ebp
    4d0c:	c3                   	ret    

00004d0d <fatfs_entry_lfn_text>:
fatfs_entry_lfn_text():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:115
//-----------------------------------------------------------------------------
// fatfs_entry_lfn_text: If LFN text entry found
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
int fatfs_entry_lfn_text(struct fat_dir_entry *entry)
{
    4d0d:	55                   	push   ebp
    4d0e:	89 e5                	mov    ebp,esp
    4d10:	e8 e1 21 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    4d15:	05 13 62 00 00       	add    eax,0x6213
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:116
    if ((entry->Attr & FILE_ATTR_LFN_TEXT) == FILE_ATTR_LFN_TEXT)
    4d1a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4d1d:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
    4d21:	0f b6 c0             	movzx  eax,al
    4d24:	83 e0 0f             	and    eax,0xf
    4d27:	83 f8 0f             	cmp    eax,0xf
    4d2a:	75 07                	jne    4d33 <fatfs_entry_lfn_text+0x26>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:117
        return 1;
    4d2c:	b8 01 00 00 00       	mov    eax,0x1
    4d31:	eb 05                	jmp    4d38 <fatfs_entry_lfn_text+0x2b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:119
    else
        return 0;
    4d33:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:120
}
    4d38:	5d                   	pop    ebp
    4d39:	c3                   	ret    

00004d3a <fatfs_entry_lfn_invalid>:
fatfs_entry_lfn_invalid():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:127
//-----------------------------------------------------------------------------
// fatfs_entry_lfn_invalid: If SFN found not relating to LFN
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
int fatfs_entry_lfn_invalid(struct fat_dir_entry *entry)
{
    4d3a:	55                   	push   ebp
    4d3b:	89 e5                	mov    ebp,esp
    4d3d:	e8 b4 21 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    4d42:	05 e6 61 00 00       	add    eax,0x61e6
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:128
    if ( (entry->Name[0]==FILE_HEADER_BLANK)  ||
    4d47:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4d4a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    4d4d:	84 c0                	test   al,al
    4d4f:	74 26                	je     4d77 <fatfs_entry_lfn_invalid+0x3d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:129 (discriminator 1)
         (entry->Name[0]==FILE_HEADER_DELETED)||
    4d51:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4d54:	0f b6 00             	movzx  eax,BYTE PTR [eax]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:128 (discriminator 1)
// fatfs_entry_lfn_invalid: If SFN found not relating to LFN
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
int fatfs_entry_lfn_invalid(struct fat_dir_entry *entry)
{
    if ( (entry->Name[0]==FILE_HEADER_BLANK)  ||
    4d57:	3c e5                	cmp    al,0xe5
    4d59:	74 1c                	je     4d77 <fatfs_entry_lfn_invalid+0x3d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:130
         (entry->Name[0]==FILE_HEADER_DELETED)||
         (entry->Attr==FILE_ATTR_VOLUME_ID) ||
    4d5b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4d5e:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:129
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
int fatfs_entry_lfn_invalid(struct fat_dir_entry *entry)
{
    if ( (entry->Name[0]==FILE_HEADER_BLANK)  ||
         (entry->Name[0]==FILE_HEADER_DELETED)||
    4d62:	3c 08                	cmp    al,0x8
    4d64:	74 11                	je     4d77 <fatfs_entry_lfn_invalid+0x3d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:131
         (entry->Attr==FILE_ATTR_VOLUME_ID) ||
         (entry->Attr & FILE_ATTR_SYSHID) )
    4d66:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4d69:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
    4d6d:	0f b6 c0             	movzx  eax,al
    4d70:	83 e0 06             	and    eax,0x6
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:130
#if FATFS_INC_LFN_SUPPORT
int fatfs_entry_lfn_invalid(struct fat_dir_entry *entry)
{
    if ( (entry->Name[0]==FILE_HEADER_BLANK)  ||
         (entry->Name[0]==FILE_HEADER_DELETED)||
         (entry->Attr==FILE_ATTR_VOLUME_ID) ||
    4d73:	85 c0                	test   eax,eax
    4d75:	74 07                	je     4d7e <fatfs_entry_lfn_invalid+0x44>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:132
         (entry->Attr & FILE_ATTR_SYSHID) )
        return 1;
    4d77:	b8 01 00 00 00       	mov    eax,0x1
    4d7c:	eb 05                	jmp    4d83 <fatfs_entry_lfn_invalid+0x49>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:134
    else
        return 0;
    4d7e:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:135
}
    4d83:	5d                   	pop    ebp
    4d84:	c3                   	ret    

00004d85 <fatfs_entry_lfn_exists>:
fatfs_entry_lfn_exists():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:142
//-----------------------------------------------------------------------------
// fatfs_entry_lfn_exists: If LFN exists and correlation SFN found
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
int fatfs_entry_lfn_exists(struct lfn_cache *lfn, struct fat_dir_entry *entry)
{
    4d85:	55                   	push   ebp
    4d86:	89 e5                	mov    ebp,esp
    4d88:	e8 69 21 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    4d8d:	05 9b 61 00 00       	add    eax,0x619b
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:143
    if ( (entry->Attr!=FILE_ATTR_LFN_TEXT) &&
    4d92:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4d95:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
    4d99:	3c 0f                	cmp    al,0xf
    4d9b:	74 45                	je     4de2 <fatfs_entry_lfn_exists+0x5d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:144 (discriminator 1)
         (entry->Name[0]!=FILE_HEADER_BLANK) &&
    4d9d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4da0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:143 (discriminator 1)
// fatfs_entry_lfn_exists: If LFN exists and correlation SFN found
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
int fatfs_entry_lfn_exists(struct lfn_cache *lfn, struct fat_dir_entry *entry)
{
    if ( (entry->Attr!=FILE_ATTR_LFN_TEXT) &&
    4da3:	84 c0                	test   al,al
    4da5:	74 3b                	je     4de2 <fatfs_entry_lfn_exists+0x5d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:145
         (entry->Name[0]!=FILE_HEADER_BLANK) &&
         (entry->Name[0]!=FILE_HEADER_DELETED) &&
    4da7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4daa:	0f b6 00             	movzx  eax,BYTE PTR [eax]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:144
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
int fatfs_entry_lfn_exists(struct lfn_cache *lfn, struct fat_dir_entry *entry)
{
    if ( (entry->Attr!=FILE_ATTR_LFN_TEXT) &&
         (entry->Name[0]!=FILE_HEADER_BLANK) &&
    4dad:	3c e5                	cmp    al,0xe5
    4daf:	74 31                	je     4de2 <fatfs_entry_lfn_exists+0x5d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:146
         (entry->Name[0]!=FILE_HEADER_DELETED) &&
         (entry->Attr!=FILE_ATTR_VOLUME_ID) &&
    4db1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4db4:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:145
#if FATFS_INC_LFN_SUPPORT
int fatfs_entry_lfn_exists(struct lfn_cache *lfn, struct fat_dir_entry *entry)
{
    if ( (entry->Attr!=FILE_ATTR_LFN_TEXT) &&
         (entry->Name[0]!=FILE_HEADER_BLANK) &&
         (entry->Name[0]!=FILE_HEADER_DELETED) &&
    4db8:	3c 08                	cmp    al,0x8
    4dba:	74 26                	je     4de2 <fatfs_entry_lfn_exists+0x5d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:147
         (entry->Attr!=FILE_ATTR_VOLUME_ID) &&
         (!(entry->Attr&FILE_ATTR_SYSHID)) &&
    4dbc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4dbf:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
    4dc3:	0f b6 c0             	movzx  eax,al
    4dc6:	83 e0 06             	and    eax,0x6
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:146
int fatfs_entry_lfn_exists(struct lfn_cache *lfn, struct fat_dir_entry *entry)
{
    if ( (entry->Attr!=FILE_ATTR_LFN_TEXT) &&
         (entry->Name[0]!=FILE_HEADER_BLANK) &&
         (entry->Name[0]!=FILE_HEADER_DELETED) &&
         (entry->Attr!=FILE_ATTR_VOLUME_ID) &&
    4dc9:	85 c0                	test   eax,eax
    4dcb:	75 15                	jne    4de2 <fatfs_entry_lfn_exists+0x5d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:148
         (!(entry->Attr&FILE_ATTR_SYSHID)) &&
         (lfn->no_of_strings) )
    4dcd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4dd0:	0f b6 80 05 01 00 00 	movzx  eax,BYTE PTR [eax+0x105]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:147
{
    if ( (entry->Attr!=FILE_ATTR_LFN_TEXT) &&
         (entry->Name[0]!=FILE_HEADER_BLANK) &&
         (entry->Name[0]!=FILE_HEADER_DELETED) &&
         (entry->Attr!=FILE_ATTR_VOLUME_ID) &&
         (!(entry->Attr&FILE_ATTR_SYSHID)) &&
    4dd7:	84 c0                	test   al,al
    4dd9:	74 07                	je     4de2 <fatfs_entry_lfn_exists+0x5d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:149
         (lfn->no_of_strings) )
        return 1;
    4ddb:	b8 01 00 00 00       	mov    eax,0x1
    4de0:	eb 05                	jmp    4de7 <fatfs_entry_lfn_exists+0x62>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:151
    else
        return 0;
    4de2:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:152
}
    4de7:	5d                   	pop    ebp
    4de8:	c3                   	ret    

00004de9 <fatfs_entry_sfn_only>:
fatfs_entry_sfn_only():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:158
#endif
//-----------------------------------------------------------------------------
// fatfs_entry_sfn_only: If SFN only exists
//-----------------------------------------------------------------------------
int fatfs_entry_sfn_only(struct fat_dir_entry *entry)
{
    4de9:	55                   	push   ebp
    4dea:	89 e5                	mov    ebp,esp
    4dec:	e8 05 21 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    4df1:	05 37 61 00 00       	add    eax,0x6137
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:159
    if ( (entry->Attr!=FILE_ATTR_LFN_TEXT) &&
    4df6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4df9:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
    4dfd:	3c 0f                	cmp    al,0xf
    4dff:	74 37                	je     4e38 <fatfs_entry_sfn_only+0x4f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:160 (discriminator 1)
         (entry->Name[0]!=FILE_HEADER_BLANK) &&
    4e01:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4e04:	0f b6 00             	movzx  eax,BYTE PTR [eax]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:159 (discriminator 1)
//-----------------------------------------------------------------------------
// fatfs_entry_sfn_only: If SFN only exists
//-----------------------------------------------------------------------------
int fatfs_entry_sfn_only(struct fat_dir_entry *entry)
{
    if ( (entry->Attr!=FILE_ATTR_LFN_TEXT) &&
    4e07:	84 c0                	test   al,al
    4e09:	74 2d                	je     4e38 <fatfs_entry_sfn_only+0x4f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:161
         (entry->Name[0]!=FILE_HEADER_BLANK) &&
         (entry->Name[0]!=FILE_HEADER_DELETED) &&
    4e0b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4e0e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:160
// fatfs_entry_sfn_only: If SFN only exists
//-----------------------------------------------------------------------------
int fatfs_entry_sfn_only(struct fat_dir_entry *entry)
{
    if ( (entry->Attr!=FILE_ATTR_LFN_TEXT) &&
         (entry->Name[0]!=FILE_HEADER_BLANK) &&
    4e11:	3c e5                	cmp    al,0xe5
    4e13:	74 23                	je     4e38 <fatfs_entry_sfn_only+0x4f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:162
         (entry->Name[0]!=FILE_HEADER_DELETED) &&
         (entry->Attr!=FILE_ATTR_VOLUME_ID) &&
    4e15:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4e18:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:161
//-----------------------------------------------------------------------------
int fatfs_entry_sfn_only(struct fat_dir_entry *entry)
{
    if ( (entry->Attr!=FILE_ATTR_LFN_TEXT) &&
         (entry->Name[0]!=FILE_HEADER_BLANK) &&
         (entry->Name[0]!=FILE_HEADER_DELETED) &&
    4e1c:	3c 08                	cmp    al,0x8
    4e1e:	74 18                	je     4e38 <fatfs_entry_sfn_only+0x4f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:163
         (entry->Attr!=FILE_ATTR_VOLUME_ID) &&
         (!(entry->Attr&FILE_ATTR_SYSHID)) )
    4e20:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4e23:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
    4e27:	0f b6 c0             	movzx  eax,al
    4e2a:	83 e0 06             	and    eax,0x6
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:162
int fatfs_entry_sfn_only(struct fat_dir_entry *entry)
{
    if ( (entry->Attr!=FILE_ATTR_LFN_TEXT) &&
         (entry->Name[0]!=FILE_HEADER_BLANK) &&
         (entry->Name[0]!=FILE_HEADER_DELETED) &&
         (entry->Attr!=FILE_ATTR_VOLUME_ID) &&
    4e2d:	85 c0                	test   eax,eax
    4e2f:	75 07                	jne    4e38 <fatfs_entry_sfn_only+0x4f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:164
         (!(entry->Attr&FILE_ATTR_SYSHID)) )
        return 1;
    4e31:	b8 01 00 00 00       	mov    eax,0x1
    4e36:	eb 05                	jmp    4e3d <fatfs_entry_sfn_only+0x54>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:166
    else
        return 0;
    4e38:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:167
}
    4e3d:	5d                   	pop    ebp
    4e3e:	c3                   	ret    

00004e3f <fatfs_entry_is_dir>:
fatfs_entry_is_dir():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:173
// TODO: FILE_ATTR_SYSHID ?!?!??!
//-----------------------------------------------------------------------------
// fatfs_entry_is_dir: Returns 1 if a directory
//-----------------------------------------------------------------------------
int fatfs_entry_is_dir(struct fat_dir_entry *entry)
{
    4e3f:	55                   	push   ebp
    4e40:	89 e5                	mov    ebp,esp
    4e42:	e8 af 20 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    4e47:	05 e1 60 00 00       	add    eax,0x60e1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:174
    if (entry->Attr & FILE_TYPE_DIR)
    4e4c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4e4f:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
    4e53:	0f b6 c0             	movzx  eax,al
    4e56:	83 e0 10             	and    eax,0x10
    4e59:	85 c0                	test   eax,eax
    4e5b:	74 07                	je     4e64 <fatfs_entry_is_dir+0x25>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:175
        return 1;
    4e5d:	b8 01 00 00 00       	mov    eax,0x1
    4e62:	eb 05                	jmp    4e69 <fatfs_entry_is_dir+0x2a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:177
    else
        return 0;
    4e64:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:178
}
    4e69:	5d                   	pop    ebp
    4e6a:	c3                   	ret    

00004e6b <fatfs_entry_is_file>:
fatfs_entry_is_file():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:183
//-----------------------------------------------------------------------------
// fatfs_entry_is_file: Returns 1 is a file entry
//-----------------------------------------------------------------------------
int fatfs_entry_is_file(struct fat_dir_entry *entry)
{
    4e6b:	55                   	push   ebp
    4e6c:	89 e5                	mov    ebp,esp
    4e6e:	e8 83 20 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    4e73:	05 b5 60 00 00       	add    eax,0x60b5
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:184
    if (entry->Attr & FILE_TYPE_FILE)
    4e78:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4e7b:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
    4e7f:	0f b6 c0             	movzx  eax,al
    4e82:	83 e0 20             	and    eax,0x20
    4e85:	85 c0                	test   eax,eax
    4e87:	74 07                	je     4e90 <fatfs_entry_is_file+0x25>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:185
        return 1;
    4e89:	b8 01 00 00 00       	mov    eax,0x1
    4e8e:	eb 05                	jmp    4e95 <fatfs_entry_is_file+0x2a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:187
    else
        return 0;
    4e90:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:188
}
    4e95:	5d                   	pop    ebp
    4e96:	c3                   	ret    

00004e97 <fatfs_lfn_entries_required>:
fatfs_lfn_entries_required():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:194
//-----------------------------------------------------------------------------
// fatfs_lfn_entries_required: Calculate number of 13 characters entries
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
int fatfs_lfn_entries_required(char *filename)
{
    4e97:	55                   	push   ebp
    4e98:	89 e5                	mov    ebp,esp
    4e9a:	53                   	push   ebx
    4e9b:	83 ec 14             	sub    esp,0x14
    4e9e:	e8 53 20 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    4ea3:	05 85 60 00 00       	add    eax,0x6085
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:195
    int length = (int)strlen(filename);
    4ea8:	83 ec 0c             	sub    esp,0xc
    4eab:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    4eae:	89 c3                	mov    ebx,eax
    4eb0:	e8 ab 24 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    4eb5:	83 c4 10             	add    esp,0x10
    4eb8:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:197

    if (length)
    4ebb:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    4ebf:	74 1d                	je     4ede <fatfs_lfn_entries_required+0x47>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:198
        return (length + MAX_LFN_ENTRY_LENGTH - 1) / MAX_LFN_ENTRY_LENGTH;
    4ec1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    4ec4:	8d 48 0c             	lea    ecx,[eax+0xc]
    4ec7:	ba 4f ec c4 4e       	mov    edx,0x4ec4ec4f
    4ecc:	89 c8                	mov    eax,ecx
    4ece:	f7 ea                	imul   edx
    4ed0:	c1 fa 02             	sar    edx,0x2
    4ed3:	89 c8                	mov    eax,ecx
    4ed5:	c1 f8 1f             	sar    eax,0x1f
    4ed8:	29 c2                	sub    edx,eax
    4eda:	89 d0                	mov    eax,edx
    4edc:	eb 05                	jmp    4ee3 <fatfs_lfn_entries_required+0x4c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:200
    else
        return 0;
    4ede:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:201
}
    4ee3:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    4ee6:	c9                   	leave  
    4ee7:	c3                   	ret    

00004ee8 <fatfs_filename_to_lfn>:
fatfs_filename_to_lfn():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:208
//-----------------------------------------------------------------------------
// fatfs_filename_to_lfn:
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
void fatfs_filename_to_lfn(char *filename, uint8 *buffer, int entry, uint8 sfnChk)
{
    4ee8:	55                   	push   ebp
    4ee9:	89 e5                	mov    ebp,esp
    4eeb:	53                   	push   ebx
    4eec:	83 ec 64             	sub    esp,0x64
    4eef:	e8 06 20 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    4ef4:	81 c3 34 60 00 00    	add    ebx,0x6034
    4efa:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    4efd:	88 45 a4             	mov    BYTE PTR [ebp-0x5c],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:210
    int i;
    int nameIndexes[MAX_LFN_ENTRY_LENGTH] = {1,3,5,7,9,0x0E,0x10,0x12,0x14,0x16,0x18,0x1C,0x1E};
    4f00:	c7 45 b4 01 00 00 00 	mov    DWORD PTR [ebp-0x4c],0x1
    4f07:	c7 45 b8 03 00 00 00 	mov    DWORD PTR [ebp-0x48],0x3
    4f0e:	c7 45 bc 05 00 00 00 	mov    DWORD PTR [ebp-0x44],0x5
    4f15:	c7 45 c0 07 00 00 00 	mov    DWORD PTR [ebp-0x40],0x7
    4f1c:	c7 45 c4 09 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x9
    4f23:	c7 45 c8 0e 00 00 00 	mov    DWORD PTR [ebp-0x38],0xe
    4f2a:	c7 45 cc 10 00 00 00 	mov    DWORD PTR [ebp-0x34],0x10
    4f31:	c7 45 d0 12 00 00 00 	mov    DWORD PTR [ebp-0x30],0x12
    4f38:	c7 45 d4 14 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x14
    4f3f:	c7 45 d8 16 00 00 00 	mov    DWORD PTR [ebp-0x28],0x16
    4f46:	c7 45 dc 18 00 00 00 	mov    DWORD PTR [ebp-0x24],0x18
    4f4d:	c7 45 e0 1c 00 00 00 	mov    DWORD PTR [ebp-0x20],0x1c
    4f54:	c7 45 e4 1e 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1e
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:213

    // 13 characters entries
    int length = (int)strlen(filename);
    4f5b:	83 ec 0c             	sub    esp,0xc
    4f5e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    4f61:	e8 fa 23 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    4f66:	83 c4 10             	add    esp,0x10
    4f69:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:214
    int entriesRequired = fatfs_lfn_entries_required(filename);
    4f6c:	83 ec 0c             	sub    esp,0xc
    4f6f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    4f72:	e8 09 21 00 00       	call   7080 <__x86.get_pc_thunk.bx+0x186>
    4f77:	83 c4 10             	add    esp,0x10
    4f7a:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:217

    // Filename offset
    int start = entry * MAX_LFN_ENTRY_LENGTH;
    4f7d:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    4f80:	89 d0                	mov    eax,edx
    4f82:	01 c0                	add    eax,eax
    4f84:	01 d0                	add    eax,edx
    4f86:	c1 e0 02             	shl    eax,0x2
    4f89:	01 d0                	add    eax,edx
    4f8b:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:220

    // Initialise to zeros
    memset(buffer, 0x00, FAT_DIR_ENTRY_SIZE);
    4f8e:	83 ec 04             	sub    esp,0x4
    4f91:	6a 20                	push   0x20
    4f93:	6a 00                	push   0x0
    4f95:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    4f98:	e8 a3 22 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    4f9d:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:223

    // LFN entry number
    buffer[0] = (uint8)(((entriesRequired-1)==entry)?(0x40|(entry+1)):(entry+1));
    4fa0:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    4fa3:	83 e8 01             	sub    eax,0x1
    4fa6:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
    4fa9:	75 0d                	jne    4fb8 <fatfs_filename_to_lfn+0xd0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:223 (discriminator 1)
    4fab:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    4fae:	83 c0 01             	add    eax,0x1
    4fb1:	83 c8 40             	or     eax,0x40
    4fb4:	89 c2                	mov    edx,eax
    4fb6:	eb 06                	jmp    4fbe <fatfs_filename_to_lfn+0xd6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:223 (discriminator 2)
    4fb8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    4fbb:	8d 50 01             	lea    edx,[eax+0x1]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:223 (discriminator 4)
    4fbe:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4fc1:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:226 (discriminator 4)

    // LFN flag
    buffer[11] = 0x0F;
    4fc3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4fc6:	83 c0 0b             	add    eax,0xb
    4fc9:	c6 00 0f             	mov    BYTE PTR [eax],0xf
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:229 (discriminator 4)

    // Checksum of short filename
    buffer[13] = sfnChk;
    4fcc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4fcf:	8d 50 0d             	lea    edx,[eax+0xd]
    4fd2:	0f b6 45 a4          	movzx  eax,BYTE PTR [ebp-0x5c]
    4fd6:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:232 (discriminator 4)

    // Copy to buffer
    for (i=0;i<MAX_LFN_ENTRY_LENGTH;i++)
    4fd8:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    4fdf:	eb 78                	jmp    5059 <fatfs_filename_to_lfn+0x171>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:234
    {
        if ( (start+i) < length )
    4fe1:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    4fe4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    4fe7:	01 d0                	add    eax,edx
    4fe9:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
    4fec:	7d 24                	jge    5012 <fatfs_filename_to_lfn+0x12a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:235
            buffer[nameIndexes[i]] = filename[start+i];
    4fee:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    4ff1:	8b 44 85 b4          	mov    eax,DWORD PTR [ebp+eax*4-0x4c]
    4ff5:	89 c2                	mov    edx,eax
    4ff7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    4ffa:	01 d0                	add    eax,edx
    4ffc:	8b 4d e8             	mov    ecx,DWORD PTR [ebp-0x18]
    4fff:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    5002:	01 ca                	add    edx,ecx
    5004:	89 d1                	mov    ecx,edx
    5006:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    5009:	01 ca                	add    edx,ecx
    500b:	0f b6 12             	movzx  edx,BYTE PTR [edx]
    500e:	88 10                	mov    BYTE PTR [eax],dl
    5010:	eb 43                	jmp    5055 <fatfs_filename_to_lfn+0x16d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:236
        else if ( (start+i) == length )
    5012:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    5015:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5018:	01 d0                	add    eax,edx
    501a:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
    501d:	75 13                	jne    5032 <fatfs_filename_to_lfn+0x14a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:237
            buffer[nameIndexes[i]] = 0x00;
    501f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5022:	8b 44 85 b4          	mov    eax,DWORD PTR [ebp+eax*4-0x4c]
    5026:	89 c2                	mov    edx,eax
    5028:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    502b:	01 d0                	add    eax,edx
    502d:	c6 00 00             	mov    BYTE PTR [eax],0x0
    5030:	eb 23                	jmp    5055 <fatfs_filename_to_lfn+0x16d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:240
        else
        {
            buffer[nameIndexes[i]] = 0xFF;
    5032:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5035:	8b 44 85 b4          	mov    eax,DWORD PTR [ebp+eax*4-0x4c]
    5039:	89 c2                	mov    edx,eax
    503b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    503e:	01 d0                	add    eax,edx
    5040:	c6 00 ff             	mov    BYTE PTR [eax],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:241
            buffer[nameIndexes[i]+1] = 0xFF;
    5043:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5046:	8b 44 85 b4          	mov    eax,DWORD PTR [ebp+eax*4-0x4c]
    504a:	8d 50 01             	lea    edx,[eax+0x1]
    504d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5050:	01 d0                	add    eax,edx
    5052:	c6 00 ff             	mov    BYTE PTR [eax],0xff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:232 (discriminator 2)

    // Checksum of short filename
    buffer[13] = sfnChk;

    // Copy to buffer
    for (i=0;i<MAX_LFN_ENTRY_LENGTH;i++)
    5055:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:232 (discriminator 1)
    5059:	83 7d f4 0c          	cmp    DWORD PTR [ebp-0xc],0xc
    505d:	7e 82                	jle    4fe1 <fatfs_filename_to_lfn+0xf9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:244
        {
            buffer[nameIndexes[i]] = 0xFF;
            buffer[nameIndexes[i]+1] = 0xFF;
        }
    }
}
    505f:	90                   	nop
    5060:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    5063:	c9                   	leave  
    5064:	c3                   	ret    

00005065 <fatfs_sfn_create_entry>:
fatfs_sfn_create_entry():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:251
//-----------------------------------------------------------------------------
// fatfs_sfn_create_entry: Create the short filename directory entry
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
void fatfs_sfn_create_entry(char *shortfilename, uint32 size, uint32 startCluster, struct fat_dir_entry *entry, int dir)
{
    5065:	55                   	push   ebp
    5066:	89 e5                	mov    ebp,esp
    5068:	83 ec 10             	sub    esp,0x10
    506b:	e8 86 1e 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5070:	05 b8 5e 00 00       	add    eax,0x5eb8
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:255
    int i;

    // Copy short filename
    for (i=0;i<FAT_SFN_SIZE_FULL;i++)
    5075:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
    507c:	eb 1b                	jmp    5099 <fatfs_sfn_create_entry+0x34>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:256 (discriminator 3)
        entry->Name[i] = shortfilename[i];
    507e:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
    5081:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5084:	01 d0                	add    eax,edx
    5086:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5089:	89 c1                	mov    ecx,eax
    508b:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
    508e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
    5091:	01 d0                	add    eax,edx
    5093:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:255 (discriminator 3)
void fatfs_sfn_create_entry(char *shortfilename, uint32 size, uint32 startCluster, struct fat_dir_entry *entry, int dir)
{
    int i;

    // Copy short filename
    for (i=0;i<FAT_SFN_SIZE_FULL;i++)
    5095:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:255 (discriminator 1)
    5099:	83 7d fc 0a          	cmp    DWORD PTR [ebp-0x4],0xa
    509d:	7e df                	jle    507e <fatfs_sfn_create_entry+0x19>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:259
        entry->Name[i] = shortfilename[i];

    // Unless we have a RTC we might as well set these to 1980
    entry->CrtTimeTenth = 0x00;
    509f:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50a2:	c6 40 0d 00          	mov    BYTE PTR [eax+0xd],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:260
    entry->CrtTime[1] = entry->CrtTime[0] = 0x00;
    50a6:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50a9:	c6 40 0e 00          	mov    BYTE PTR [eax+0xe],0x0
    50ad:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50b0:	0f b6 50 0e          	movzx  edx,BYTE PTR [eax+0xe]
    50b4:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50b7:	88 50 0f             	mov    BYTE PTR [eax+0xf],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:261
    entry->CrtDate[1] = 0x00;
    50ba:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50bd:	c6 40 11 00          	mov    BYTE PTR [eax+0x11],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:262
    entry->CrtDate[0] = 0x20;
    50c1:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50c4:	c6 40 10 20          	mov    BYTE PTR [eax+0x10],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:263
    entry->LstAccDate[1] = 0x00;
    50c8:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50cb:	c6 40 13 00          	mov    BYTE PTR [eax+0x13],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:264
    entry->LstAccDate[0] = 0x20;
    50cf:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50d2:	c6 40 12 20          	mov    BYTE PTR [eax+0x12],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:265
    entry->WrtTime[1] = entry->WrtTime[0] = 0x00;
    50d6:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50d9:	c6 40 16 00          	mov    BYTE PTR [eax+0x16],0x0
    50dd:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50e0:	0f b6 50 16          	movzx  edx,BYTE PTR [eax+0x16]
    50e4:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50e7:	88 50 17             	mov    BYTE PTR [eax+0x17],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:266
    entry->WrtDate[1] = 0x00;
    50ea:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50ed:	c6 40 19 00          	mov    BYTE PTR [eax+0x19],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:267
    entry->WrtDate[0] = 0x20;
    50f1:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    50f4:	c6 40 18 20          	mov    BYTE PTR [eax+0x18],0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:269

    if (!dir)
    50f8:	83 7d 18 00          	cmp    DWORD PTR [ebp+0x18],0x0
    50fc:	75 09                	jne    5107 <fatfs_sfn_create_entry+0xa2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:270
        entry->Attr = FILE_TYPE_FILE;
    50fe:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    5101:	c6 40 0b 20          	mov    BYTE PTR [eax+0xb],0x20
    5105:	eb 07                	jmp    510e <fatfs_sfn_create_entry+0xa9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:272
    else
        entry->Attr = FILE_TYPE_DIR;
    5107:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    510a:	c6 40 0b 10          	mov    BYTE PTR [eax+0xb],0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:274

    entry->NTRes = 0x00;
    510e:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    5111:	c6 40 0c 00          	mov    BYTE PTR [eax+0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:276

    entry->FstClusHI = FAT_HTONS((uint16)((startCluster>>16) & 0xFFFF));
    5115:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    5118:	c1 e8 10             	shr    eax,0x10
    511b:	89 c2                	mov    edx,eax
    511d:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    5120:	66 89 50 14          	mov    WORD PTR [eax+0x14],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:277
    entry->FstClusLO = FAT_HTONS((uint16)((startCluster>>0) & 0xFFFF));
    5124:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    5127:	89 c2                	mov    edx,eax
    5129:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    512c:	66 89 50 1a          	mov    WORD PTR [eax+0x1a],dx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:278
    entry->FileSize = FAT_HTONL(size);
    5130:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    5133:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    5136:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:279
}
    5139:	90                   	nop
    513a:	c9                   	leave  
    513b:	c3                   	ret    

0000513c <fatfs_lfn_create_sfn>:
fatfs_lfn_create_sfn():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:286
//-----------------------------------------------------------------------------
// fatfs_lfn_create_sfn: Create a padded SFN
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fatfs_lfn_create_sfn(char *sfn_output, char *filename)
{
    513c:	55                   	push   ebp
    513d:	89 e5                	mov    ebp,esp
    513f:	53                   	push   ebx
    5140:	83 ec 24             	sub    esp,0x24
    5143:	e8 b2 1d 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    5148:	81 c3 e0 5d 00 00    	add    ebx,0x5de0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:288
    int i;
    int dotPos = -1;
    514e:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:291
    char ext[3];
    int pos;
    int len = (int)strlen(filename);
    5155:	83 ec 0c             	sub    esp,0xc
    5158:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    515b:	e8 00 22 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    5160:	83 c4 10             	add    esp,0x10
    5163:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:294

    // Invalid to start with .
    if (filename[0]=='.')
    5166:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5169:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    516c:	3c 2e                	cmp    al,0x2e
    516e:	75 0a                	jne    517a <fatfs_lfn_create_sfn+0x3e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:295
        return 0;
    5170:	b8 00 00 00 00       	mov    eax,0x0
    5175:	e9 a5 01 00 00       	jmp    531f <fatfs_lfn_create_sfn+0x1e3>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:297

    memset(sfn_output, ' ', FAT_SFN_SIZE_FULL);
    517a:	83 ec 04             	sub    esp,0x4
    517d:	6a 0b                	push   0xb
    517f:	6a 20                	push   0x20
    5181:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    5184:	e8 b7 20 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    5189:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:298
    memset(ext, ' ', 3);
    518c:	83 ec 04             	sub    esp,0x4
    518f:	6a 03                	push   0x3
    5191:	6a 20                	push   0x20
    5193:	8d 45 e5             	lea    eax,[ebp-0x1b]
    5196:	50                   	push   eax
    5197:	e8 a4 20 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    519c:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:301

    // Find dot seperator
    for (i = 0; i< len; i++)
    519f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    51a6:	eb 19                	jmp    51c1 <fatfs_lfn_create_sfn+0x85>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:303
    {
        if (filename[i]=='.')
    51a8:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    51ab:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    51ae:	01 d0                	add    eax,edx
    51b0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    51b3:	3c 2e                	cmp    al,0x2e
    51b5:	75 06                	jne    51bd <fatfs_lfn_create_sfn+0x81>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:304
            dotPos = i;
    51b7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    51ba:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:301 (discriminator 2)

    memset(sfn_output, ' ', FAT_SFN_SIZE_FULL);
    memset(ext, ' ', 3);

    // Find dot seperator
    for (i = 0; i< len; i++)
    51bd:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:301 (discriminator 1)
    51c1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    51c4:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
    51c7:	7c df                	jl     51a8 <fatfs_lfn_create_sfn+0x6c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:308
        if (filename[i]=='.')
            dotPos = i;
    }

    // Extract extensions
    if (dotPos!=-1)
    51c9:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
    51cd:	74 44                	je     5213 <fatfs_lfn_create_sfn+0xd7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:311
    {
        // Copy first three chars of extension
        for (i = (dotPos+1); i < (dotPos+1+3); i++)
    51cf:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    51d2:	83 c0 01             	add    eax,0x1
    51d5:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    51d8:	eb 28                	jmp    5202 <fatfs_lfn_create_sfn+0xc6>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:312
            if (i<len)
    51da:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    51dd:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
    51e0:	7d 1c                	jge    51fe <fatfs_lfn_create_sfn+0xc2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:313
                ext[i-(dotPos+1)] = filename[i];
    51e2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    51e5:	8d 50 01             	lea    edx,[eax+0x1]
    51e8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    51eb:	29 d0                	sub    eax,edx
    51ed:	89 c2                	mov    edx,eax
    51ef:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
    51f2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    51f5:	01 c8                	add    eax,ecx
    51f7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    51fa:	88 44 15 e5          	mov    BYTE PTR [ebp+edx*1-0x1b],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:311 (discriminator 2)

    // Extract extensions
    if (dotPos!=-1)
    {
        // Copy first three chars of extension
        for (i = (dotPos+1); i < (dotPos+1+3); i++)
    51fe:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:311 (discriminator 1)
    5202:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5205:	83 c0 04             	add    eax,0x4
    5208:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    520b:	7f cd                	jg     51da <fatfs_lfn_create_sfn+0x9e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:316
            if (i<len)
                ext[i-(dotPos+1)] = filename[i];

        // Shorten the length to the dot position
        len = dotPos;
    520d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5210:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:320
    }

    // Add filename part
    pos = 0;
    5213:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:321
    for (i=0;i<len;i++)
    521a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    5221:	e9 85 00 00 00       	jmp    52ab <fatfs_lfn_create_sfn+0x16f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:323
    {
        if ( (filename[i]!=' ') && (filename[i]!='.') )
    5226:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    5229:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    522c:	01 d0                	add    eax,edx
    522e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5231:	3c 20                	cmp    al,0x20
    5233:	74 6c                	je     52a1 <fatfs_lfn_create_sfn+0x165>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:323 (discriminator 1)
    5235:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    5238:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    523b:	01 d0                	add    eax,edx
    523d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5240:	3c 2e                	cmp    al,0x2e
    5242:	74 5d                	je     52a1 <fatfs_lfn_create_sfn+0x165>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:325
        {
            if (filename[i] >= 'a' && filename[i] <= 'z')
    5244:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    5247:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    524a:	01 d0                	add    eax,edx
    524c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    524f:	3c 60                	cmp    al,0x60
    5251:	7e 31                	jle    5284 <fatfs_lfn_create_sfn+0x148>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:325 (discriminator 1)
    5253:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    5256:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5259:	01 d0                	add    eax,edx
    525b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    525e:	3c 7a                	cmp    al,0x7a
    5260:	7f 22                	jg     5284 <fatfs_lfn_create_sfn+0x148>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:326
                sfn_output[pos++] = filename[i] - 'a' + 'A';
    5262:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    5265:	8d 50 01             	lea    edx,[eax+0x1]
    5268:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
    526b:	89 c2                	mov    edx,eax
    526d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5270:	01 d0                	add    eax,edx
    5272:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
    5275:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    5278:	01 ca                	add    edx,ecx
    527a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
    527d:	83 ea 20             	sub    edx,0x20
    5280:	88 10                	mov    BYTE PTR [eax],dl
    5282:	eb 1d                	jmp    52a1 <fatfs_lfn_create_sfn+0x165>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:328
            else
                sfn_output[pos++] = filename[i];
    5284:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    5287:	8d 50 01             	lea    edx,[eax+0x1]
    528a:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
    528d:	89 c2                	mov    edx,eax
    528f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5292:	01 c2                	add    edx,eax
    5294:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
    5297:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    529a:	01 c8                	add    eax,ecx
    529c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    529f:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:332
        }

        // Fill upto 8 characters
        if (pos==FAT_SFN_SIZE_PARTIAL)
    52a1:	83 7d ec 08          	cmp    DWORD PTR [ebp-0x14],0x8
    52a5:	74 12                	je     52b9 <fatfs_lfn_create_sfn+0x17d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:321 (discriminator 2)
        len = dotPos;
    }

    // Add filename part
    pos = 0;
    for (i=0;i<len;i++)
    52a7:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:321 (discriminator 1)
    52ab:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    52ae:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
    52b1:	0f 8c 6f ff ff ff    	jl     5226 <fatfs_lfn_create_sfn+0xea>
    52b7:	eb 01                	jmp    52ba <fatfs_lfn_create_sfn+0x17e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:333
                sfn_output[pos++] = filename[i];
        }

        // Fill upto 8 characters
        if (pos==FAT_SFN_SIZE_PARTIAL)
            break;
    52b9:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:337
    }

    // Add extension part
    for (i=FAT_SFN_SIZE_PARTIAL;i<FAT_SFN_SIZE_FULL;i++)
    52ba:	c7 45 f4 08 00 00 00 	mov    DWORD PTR [ebp-0xc],0x8
    52c1:	eb 51                	jmp    5314 <fatfs_lfn_create_sfn+0x1d8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:339
    {
        if (ext[i-FAT_SFN_SIZE_PARTIAL] >= 'a' && ext[i-FAT_SFN_SIZE_PARTIAL] <= 'z')
    52c3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    52c6:	83 e8 08             	sub    eax,0x8
    52c9:	0f b6 44 05 e5       	movzx  eax,BYTE PTR [ebp+eax*1-0x1b]
    52ce:	3c 60                	cmp    al,0x60
    52d0:	7e 29                	jle    52fb <fatfs_lfn_create_sfn+0x1bf>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:339 (discriminator 1)
    52d2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    52d5:	83 e8 08             	sub    eax,0x8
    52d8:	0f b6 44 05 e5       	movzx  eax,BYTE PTR [ebp+eax*1-0x1b]
    52dd:	3c 7a                	cmp    al,0x7a
    52df:	7f 1a                	jg     52fb <fatfs_lfn_create_sfn+0x1bf>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:340
            sfn_output[i] = ext[i-FAT_SFN_SIZE_PARTIAL] - 'a' + 'A';
    52e1:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    52e4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    52e7:	01 d0                	add    eax,edx
    52e9:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    52ec:	83 ea 08             	sub    edx,0x8
    52ef:	0f b6 54 15 e5       	movzx  edx,BYTE PTR [ebp+edx*1-0x1b]
    52f4:	83 ea 20             	sub    edx,0x20
    52f7:	88 10                	mov    BYTE PTR [eax],dl
    52f9:	eb 15                	jmp    5310 <fatfs_lfn_create_sfn+0x1d4>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:342
        else
            sfn_output[i] = ext[i-FAT_SFN_SIZE_PARTIAL];
    52fb:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    52fe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5301:	01 c2                	add    edx,eax
    5303:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5306:	83 e8 08             	sub    eax,0x8
    5309:	0f b6 44 05 e5       	movzx  eax,BYTE PTR [ebp+eax*1-0x1b]
    530e:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:337 (discriminator 2)
        if (pos==FAT_SFN_SIZE_PARTIAL)
            break;
    }

    // Add extension part
    for (i=FAT_SFN_SIZE_PARTIAL;i<FAT_SFN_SIZE_FULL;i++)
    5310:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:337 (discriminator 1)
    5314:	83 7d f4 0a          	cmp    DWORD PTR [ebp-0xc],0xa
    5318:	7e a9                	jle    52c3 <fatfs_lfn_create_sfn+0x187>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:345
            sfn_output[i] = ext[i-FAT_SFN_SIZE_PARTIAL] - 'a' + 'A';
        else
            sfn_output[i] = ext[i-FAT_SFN_SIZE_PARTIAL];
    }

    return 1;
    531a:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:346 (discriminator 1)
}
    531f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    5322:	c9                   	leave  
    5323:	c3                   	ret    

00005324 <fatfs_itoa>:
fatfs_itoa():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:351
//-----------------------------------------------------------------------------
// fatfs_itoa:
//-----------------------------------------------------------------------------
static void fatfs_itoa(uint32 num, char *s)
{
    5324:	55                   	push   ebp
    5325:	89 e5                	mov    ebp,esp
    5327:	53                   	push   ebx
    5328:	83 ec 30             	sub    esp,0x30
    532b:	e8 c6 1b 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5330:	05 f8 5b 00 00       	add    eax,0x5bf8
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:354
    char* cp;
    char outbuf[12];
    const char digits[] = "0123456789ABCDEF";
    5335:	c7 45 db 30 31 32 33 	mov    DWORD PTR [ebp-0x25],0x33323130
    533c:	c7 45 df 34 35 36 37 	mov    DWORD PTR [ebp-0x21],0x37363534
    5343:	c7 45 e3 38 39 41 42 	mov    DWORD PTR [ebp-0x1d],0x42413938
    534a:	c7 45 e7 43 44 45 46 	mov    DWORD PTR [ebp-0x19],0x46454443
    5351:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:357

    // Build string backwards
    cp = outbuf;
    5355:	8d 45 ec             	lea    eax,[ebp-0x14]
    5358:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:360 (discriminator 1)
    do
    {
        *cp++ = digits[(int)(num % 10)];
    535b:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
    535e:	8d 41 01             	lea    eax,[ecx+0x1]
    5361:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
    5364:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
    5367:	ba cd cc cc cc       	mov    edx,0xcccccccd
    536c:	89 d8                	mov    eax,ebx
    536e:	f7 e2                	mul    edx
    5370:	c1 ea 03             	shr    edx,0x3
    5373:	89 d0                	mov    eax,edx
    5375:	c1 e0 02             	shl    eax,0x2
    5378:	01 d0                	add    eax,edx
    537a:	01 c0                	add    eax,eax
    537c:	29 c3                	sub    ebx,eax
    537e:	89 da                	mov    edx,ebx
    5380:	89 d0                	mov    eax,edx
    5382:	0f b6 44 05 db       	movzx  eax,BYTE PTR [ebp+eax*1-0x25]
    5387:	88 01                	mov    BYTE PTR [ecx],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:362 (discriminator 1)
    }
    while ((num /= 10) > 0);
    5389:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    538c:	ba cd cc cc cc       	mov    edx,0xcccccccd
    5391:	f7 e2                	mul    edx
    5393:	89 d0                	mov    eax,edx
    5395:	c1 e8 03             	shr    eax,0x3
    5398:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
    539b:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
    539f:	75 ba                	jne    535b <fatfs_itoa+0x37>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:364

    *cp-- = 0;
    53a1:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    53a4:	8d 50 ff             	lea    edx,[eax-0x1]
    53a7:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
    53aa:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:367

    // Copy in forwards
    while (cp >= outbuf)
    53ad:	eb 17                	jmp    53c6 <fatfs_itoa+0xa2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:368
        *s++ = *cp--;
    53af:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    53b2:	8d 50 01             	lea    edx,[eax+0x1]
    53b5:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
    53b8:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
    53bb:	8d 4a ff             	lea    ecx,[edx-0x1]
    53be:	89 4d f8             	mov    DWORD PTR [ebp-0x8],ecx
    53c1:	0f b6 12             	movzx  edx,BYTE PTR [edx]
    53c4:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:367
    while ((num /= 10) > 0);

    *cp-- = 0;

    // Copy in forwards
    while (cp >= outbuf)
    53c6:	8d 45 ec             	lea    eax,[ebp-0x14]
    53c9:	39 45 f8             	cmp    DWORD PTR [ebp-0x8],eax
    53cc:	73 e1                	jae    53af <fatfs_itoa+0x8b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:370
        *s++ = *cp--;

    *s = 0;
    53ce:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    53d1:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:371
}
    53d4:	90                   	nop
    53d5:	83 c4 30             	add    esp,0x30
    53d8:	5b                   	pop    ebx
    53d9:	5d                   	pop    ebp
    53da:	c3                   	ret    

000053db <fatfs_lfn_generate_tail>:
fatfs_lfn_generate_tail():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:381
// sfn_output = Output short filename with tail
//-----------------------------------------------------------------------------
#if FATFS_INC_LFN_SUPPORT
#if FATFS_INC_WRITE_SUPPORT
int fatfs_lfn_generate_tail(char *sfn_output, char *sfn_input, uint32 tailNum)
{
    53db:	55                   	push   ebp
    53dc:	89 e5                	mov    ebp,esp
    53de:	53                   	push   ebx
    53df:	83 ec 14             	sub    esp,0x14
    53e2:	e8 13 1b 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    53e7:	81 c3 41 5b 00 00    	add    ebx,0x5b41
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:385
    int tail_chars;
    char tail_str[12];

    if (tailNum > 99999)
    53ed:	81 7d 10 9f 86 01 00 	cmp    DWORD PTR [ebp+0x10],0x1869f
    53f4:	76 07                	jbe    53fd <fatfs_lfn_generate_tail+0x22>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:386
        return 0;
    53f6:	b8 00 00 00 00       	mov    eax,0x0
    53fb:	eb 79                	jmp    5476 <fatfs_lfn_generate_tail+0x9b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:389

    // Convert to number
    memset(tail_str, 0x00, sizeof(tail_str));
    53fd:	83 ec 04             	sub    esp,0x4
    5400:	6a 0c                	push   0xc
    5402:	6a 00                	push   0x0
    5404:	8d 45 e8             	lea    eax,[ebp-0x18]
    5407:	50                   	push   eax
    5408:	e8 33 1e 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    540d:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:390
    tail_str[0] = '~';
    5410:	c6 45 e8 7e          	mov    BYTE PTR [ebp-0x18],0x7e
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:391
    fatfs_itoa(tailNum, tail_str+1);
    5414:	8d 45 e8             	lea    eax,[ebp-0x18]
    5417:	83 c0 01             	add    eax,0x1
    541a:	83 ec 08             	sub    esp,0x8
    541d:	50                   	push   eax
    541e:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    5421:	e8 fe fe ff ff       	call   5324 <fatfs_itoa>
    5426:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:394

    // Copy in base filename
    memcpy(sfn_output, sfn_input, FAT_SFN_SIZE_FULL);
    5429:	83 ec 04             	sub    esp,0x4
    542c:	6a 0b                	push   0xb
    542e:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    5431:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    5434:	e8 87 1b 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
    5439:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:397

    // Overwrite with tail
    tail_chars = (int)strlen(tail_str);
    543c:	83 ec 0c             	sub    esp,0xc
    543f:	8d 45 e8             	lea    eax,[ebp-0x18]
    5442:	50                   	push   eax
    5443:	e8 18 1f 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    5448:	83 c4 10             	add    esp,0x10
    544b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:398
    memcpy(sfn_output+(FAT_SFN_SIZE_PARTIAL-tail_chars), tail_str, tail_chars);
    544e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5451:	ba 08 00 00 00       	mov    edx,0x8
    5456:	2b 55 f4             	sub    edx,DWORD PTR [ebp-0xc]
    5459:	89 d1                	mov    ecx,edx
    545b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    545e:	01 ca                	add    edx,ecx
    5460:	83 ec 04             	sub    esp,0x4
    5463:	50                   	push   eax
    5464:	8d 45 e8             	lea    eax,[ebp-0x18]
    5467:	50                   	push   eax
    5468:	52                   	push   edx
    5469:	e8 52 1b 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
    546e:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:400

    return 1;
    5471:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:401 (discriminator 1)
}
    5476:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    5479:	c9                   	leave  
    547a:	c3                   	ret    

0000547b <fatfs_convert_from_fat_time>:
fatfs_convert_from_fat_time():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:409
//-----------------------------------------------------------------------------
// fatfs_convert_from_fat_time: Convert FAT time to h/m/s
//-----------------------------------------------------------------------------
#if FATFS_INC_TIME_DATE_SUPPORT
void fatfs_convert_from_fat_time(uint16 fat_time, int *hours, int *minutes, int *seconds)
{
    547b:	55                   	push   ebp
    547c:	89 e5                	mov    ebp,esp
    547e:	83 ec 04             	sub    esp,0x4
    5481:	e8 70 1a 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5486:	05 a2 5a 00 00       	add    eax,0x5aa2
    548b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    548e:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:410
    *hours = (fat_time >> FAT_TIME_HOURS_SHIFT) & FAT_TIME_HOURS_MASK;
    5492:	0f b7 45 fc          	movzx  eax,WORD PTR [ebp-0x4]
    5496:	66 c1 e8 0b          	shr    ax,0xb
    549a:	0f b7 c0             	movzx  eax,ax
    549d:	83 e0 1f             	and    eax,0x1f
    54a0:	89 c2                	mov    edx,eax
    54a2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    54a5:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:411
    *minutes = (fat_time >> FAT_TIME_MINUTES_SHIFT) & FAT_TIME_MINUTES_MASK;
    54a7:	0f b7 45 fc          	movzx  eax,WORD PTR [ebp-0x4]
    54ab:	66 c1 e8 05          	shr    ax,0x5
    54af:	0f b7 c0             	movzx  eax,ax
    54b2:	83 e0 3f             	and    eax,0x3f
    54b5:	89 c2                	mov    edx,eax
    54b7:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    54ba:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:412
    *seconds = (fat_time >> FAT_TIME_SECONDS_SHIFT) & FAT_TIME_SECONDS_MASK;
    54bc:	0f b7 45 fc          	movzx  eax,WORD PTR [ebp-0x4]
    54c0:	83 e0 1f             	and    eax,0x1f
    54c3:	89 c2                	mov    edx,eax
    54c5:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    54c8:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:413
    *seconds = *seconds * FAT_TIME_SECONDS_SCALE;
    54ca:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    54cd:	8b 00                	mov    eax,DWORD PTR [eax]
    54cf:	8d 14 00             	lea    edx,[eax+eax*1]
    54d2:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    54d5:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:414
}
    54d7:	90                   	nop
    54d8:	c9                   	leave  
    54d9:	c3                   	ret    

000054da <fatfs_convert_from_fat_date>:
fatfs_convert_from_fat_date():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:419
//-----------------------------------------------------------------------------
// fatfs_convert_from_fat_date: Convert FAT date to d/m/y
//-----------------------------------------------------------------------------
void fatfs_convert_from_fat_date(uint16 fat_date, int *day, int *month, int *year)
{
    54da:	55                   	push   ebp
    54db:	89 e5                	mov    ebp,esp
    54dd:	83 ec 04             	sub    esp,0x4
    54e0:	e8 11 1a 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    54e5:	05 43 5a 00 00       	add    eax,0x5a43
    54ea:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    54ed:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:420
    *day = (fat_date >> FAT_DATE_DAY_SHIFT) & FAT_DATE_DAY_MASK;
    54f1:	0f b7 45 fc          	movzx  eax,WORD PTR [ebp-0x4]
    54f5:	83 e0 1f             	and    eax,0x1f
    54f8:	89 c2                	mov    edx,eax
    54fa:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    54fd:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:421
    *month = (fat_date >> FAT_DATE_MONTH_SHIFT) & FAT_DATE_MONTH_MASK;
    54ff:	0f b7 45 fc          	movzx  eax,WORD PTR [ebp-0x4]
    5503:	66 c1 e8 05          	shr    ax,0x5
    5507:	0f b7 c0             	movzx  eax,ax
    550a:	83 e0 0f             	and    eax,0xf
    550d:	89 c2                	mov    edx,eax
    550f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    5512:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:422
    *year = (fat_date >> FAT_DATE_YEAR_SHIFT) & FAT_DATE_YEAR_MASK;
    5514:	0f b7 45 fc          	movzx  eax,WORD PTR [ebp-0x4]
    5518:	66 c1 e8 09          	shr    ax,0x9
    551c:	0f b7 c0             	movzx  eax,ax
    551f:	83 e0 7f             	and    eax,0x7f
    5522:	89 c2                	mov    edx,eax
    5524:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    5527:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:423
    *year = *year + FAT_DATE_YEAR_OFFSET;
    5529:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    552c:	8b 00                	mov    eax,DWORD PTR [eax]
    552e:	8d 90 bc 07 00 00    	lea    edx,[eax+0x7bc]
    5534:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    5537:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:424
}
    5539:	90                   	nop
    553a:	c9                   	leave  
    553b:	c3                   	ret    

0000553c <fatfs_convert_to_fat_time>:
fatfs_convert_to_fat_time():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:429
//-----------------------------------------------------------------------------
// fatfs_convert_to_fat_time: Convert h/m/s to FAT time
//-----------------------------------------------------------------------------
uint16 fatfs_convert_to_fat_time(int hours, int minutes, int seconds)
{
    553c:	55                   	push   ebp
    553d:	89 e5                	mov    ebp,esp
    553f:	83 ec 10             	sub    esp,0x10
    5542:	e8 af 19 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5547:	05 e1 59 00 00       	add    eax,0x59e1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:430
    uint16 fat_time = 0;
    554c:	66 c7 45 fe 00 00    	mov    WORD PTR [ebp-0x2],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:433

    // Most FAT times are to a resolution of 2 seconds
    seconds /= FAT_TIME_SECONDS_SCALE;
    5552:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    5555:	89 c2                	mov    edx,eax
    5557:	c1 ea 1f             	shr    edx,0x1f
    555a:	01 d0                	add    eax,edx
    555c:	d1 f8                	sar    eax,1
    555e:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:435

    fat_time = (hours & FAT_TIME_HOURS_MASK) << FAT_TIME_HOURS_SHIFT;
    5561:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5564:	c1 e0 0b             	shl    eax,0xb
    5567:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:436
    fat_time|= (minutes & FAT_TIME_MINUTES_MASK) << FAT_TIME_MINUTES_SHIFT;
    556b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    556e:	83 e0 3f             	and    eax,0x3f
    5571:	c1 e0 05             	shl    eax,0x5
    5574:	89 c2                	mov    edx,eax
    5576:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    557a:	09 d0                	or     eax,edx
    557c:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:437
    fat_time|= (seconds & FAT_TIME_SECONDS_MASK) << FAT_TIME_SECONDS_SHIFT;
    5580:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    5583:	83 e0 1f             	and    eax,0x1f
    5586:	89 c2                	mov    edx,eax
    5588:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    558c:	09 d0                	or     eax,edx
    558e:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:439

    return fat_time;
    5592:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:440
}
    5596:	c9                   	leave  
    5597:	c3                   	ret    

00005598 <fatfs_convert_to_fat_date>:
fatfs_convert_to_fat_date():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:445
//-----------------------------------------------------------------------------
// fatfs_convert_to_fat_date: Convert d/m/y to FAT date
//-----------------------------------------------------------------------------
uint16 fatfs_convert_to_fat_date(int day, int month, int year)
{
    5598:	55                   	push   ebp
    5599:	89 e5                	mov    ebp,esp
    559b:	83 ec 10             	sub    esp,0x10
    559e:	e8 53 19 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    55a3:	05 85 59 00 00       	add    eax,0x5985
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:446
    uint16 fat_date = 0;
    55a8:	66 c7 45 fe 00 00    	mov    WORD PTR [ebp-0x2],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:449

    // FAT dates are relative to 1980
    if (year >= FAT_DATE_YEAR_OFFSET)
    55ae:	81 7d 10 bb 07 00 00 	cmp    DWORD PTR [ebp+0x10],0x7bb
    55b5:	7e 07                	jle    55be <fatfs_convert_to_fat_date+0x26>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:450
        year -= FAT_DATE_YEAR_OFFSET;
    55b7:	81 6d 10 bc 07 00 00 	sub    DWORD PTR [ebp+0x10],0x7bc
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:452

    fat_date = (day & FAT_DATE_DAY_MASK) << FAT_DATE_DAY_SHIFT;
    55be:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    55c1:	83 e0 1f             	and    eax,0x1f
    55c4:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:453
    fat_date|= (month & FAT_DATE_MONTH_MASK) << FAT_DATE_MONTH_SHIFT;
    55c8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    55cb:	83 e0 0f             	and    eax,0xf
    55ce:	c1 e0 05             	shl    eax,0x5
    55d1:	89 c2                	mov    edx,eax
    55d3:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    55d7:	09 d0                	or     eax,edx
    55d9:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:454
    fat_date|= (year & FAT_DATE_YEAR_MASK) << FAT_DATE_YEAR_SHIFT;
    55dd:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    55e0:	c1 e0 09             	shl    eax,0x9
    55e3:	89 c2                	mov    edx,eax
    55e5:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    55e9:	09 d0                	or     eax,edx
    55eb:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:456

    return fat_date;
    55ef:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_misc.c:457
}
    55f3:	c9                   	leave  
    55f4:	c3                   	ret    
    55f5:	66 90                	xchg   ax,ax
    55f7:	90                   	nop

000055f8 <fatfs_total_path_levels>:
fatfs_total_path_levels():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:45
//        c:\folder\file.zip
//        /dev/etc/samba.conf
// Returns: -1 = Error, 0 or more = Ok
//-----------------------------------------------------------------------------
int fatfs_total_path_levels(char *path)
{
    55f8:	55                   	push   ebp
    55f9:	89 e5                	mov    ebp,esp
    55fb:	83 ec 10             	sub    esp,0x10
    55fe:	e8 f3 18 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5603:	05 25 59 00 00       	add    eax,0x5925
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:46
    int levels = 0;
    5608:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:49
    char expectedchar;

    if (!path)
    560f:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
    5613:	75 07                	jne    561c <fatfs_total_path_levels+0x24>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:50
        return -1;
    5615:	b8 ff ff ff ff       	mov    eax,0xffffffff
    561a:	eb 74                	jmp    5690 <fatfs_total_path_levels+0x98>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:55

    // Acceptable formats:
    //  c:\folder\file.zip
    //  /dev/etc/samba.conf
    if (*path == '/')
    561c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    561f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5622:	3c 2f                	cmp    al,0x2f
    5624:	75 0a                	jne    5630 <fatfs_total_path_levels+0x38>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:57
    {
        expectedchar = '/';
    5626:	c6 45 fb 2f          	mov    BYTE PTR [ebp-0x5],0x2f
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:58
        path++;
    562a:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
    562e:	eb 50                	jmp    5680 <fatfs_total_path_levels+0x88>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:60
    }
    else if (path[1] == ':' || path[2] == '\\')
    5630:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5633:	83 c0 01             	add    eax,0x1
    5636:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5639:	3c 3a                	cmp    al,0x3a
    563b:	74 0d                	je     564a <fatfs_total_path_levels+0x52>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:60 (discriminator 1)
    563d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5640:	83 c0 02             	add    eax,0x2
    5643:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5646:	3c 5c                	cmp    al,0x5c
    5648:	75 0a                	jne    5654 <fatfs_total_path_levels+0x5c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:62
    {
        expectedchar = '\\';
    564a:	c6 45 fb 5c          	mov    BYTE PTR [ebp-0x5],0x5c
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:63
        path += 3;
    564e:	83 45 08 03          	add    DWORD PTR [ebp+0x8],0x3
    5652:	eb 07                	jmp    565b <fatfs_total_path_levels+0x63>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:66
    }
    else
        return -1;
    5654:	b8 ff ff ff ff       	mov    eax,0xffffffff
    5659:	eb 35                	jmp    5690 <fatfs_total_path_levels+0x98>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:69

    // Count levels in path string
    while (*path)
    565b:	eb 23                	jmp    5680 <fatfs_total_path_levels+0x88>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:75
    {
        // Fast forward through actual subdir text to next slash
        for (; *path; )
        {
            // If slash detected escape from for loop
            if (*path == expectedchar) { path++; break; }
    565d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5660:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5663:	3a 45 fb             	cmp    al,BYTE PTR [ebp-0x5]
    5666:	75 06                	jne    566e <fatfs_total_path_levels+0x76>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:75 (discriminator 1)
    5668:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
    566c:	eb 0e                	jmp    567c <fatfs_total_path_levels+0x84>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:76
            path++;
    566e:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:72

    // Count levels in path string
    while (*path)
    {
        // Fast forward through actual subdir text to next slash
        for (; *path; )
    5672:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5675:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5678:	84 c0                	test   al,al
    567a:	75 e1                	jne    565d <fatfs_total_path_levels+0x65>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:80
            if (*path == expectedchar) { path++; break; }
            path++;
        }

        // Increase number of subdirs founds
        levels++;
    567c:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:69
    }
    else
        return -1;

    // Count levels in path string
    while (*path)
    5680:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5683:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5686:	84 c0                	test   al,al
    5688:	75 e8                	jne    5672 <fatfs_total_path_levels+0x7a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:84
        // Increase number of subdirs founds
        levels++;
    }

    // Subtract the file itself
    return levels-1;
    568a:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
    568d:	83 e8 01             	sub    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:85
}
    5690:	c9                   	leave  
    5691:	c3                   	ret    

00005692 <fatfs_get_substring>:
fatfs_get_substring():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:93
// (or file) at the specified level.
// E.g. C:\folder\file.zip : Level 0 = C:\folder, Level 1 = file.zip
// Returns: -1 = Error, 0 = Ok
//-----------------------------------------------------------------------------
int fatfs_get_substring(char *path, int levelreq, char *output, int max_len)
{
    5692:	55                   	push   ebp
    5693:	89 e5                	mov    ebp,esp
    5695:	53                   	push   ebx
    5696:	83 ec 24             	sub    esp,0x24
    5699:	e8 58 18 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    569e:	05 8a 58 00 00       	add    eax,0x588a
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:95
    int i;
    int pathlen=0;
    56a3:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:96
    int levels=0;
    56aa:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:97
    int copypnt=0;
    56b1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:100
    char expectedchar;

    if (!path || max_len <= 0)
    56b8:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
    56bc:	74 06                	je     56c4 <fatfs_get_substring+0x32>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:100 (discriminator 1)
    56be:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
    56c2:	7f 0a                	jg     56ce <fatfs_get_substring+0x3c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:101
        return -1;
    56c4:	b8 ff ff ff ff       	mov    eax,0xffffffff
    56c9:	e9 d7 00 00 00       	jmp    57a5 <fatfs_get_substring+0x113>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:106

    // Acceptable formats:
    //  c:\folder\file.zip
    //  /dev/etc/samba.conf
    if (*path == '/')
    56ce:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    56d1:	0f b6 12             	movzx  edx,BYTE PTR [edx]
    56d4:	80 fa 2f             	cmp    dl,0x2f
    56d7:	75 0a                	jne    56e3 <fatfs_get_substring+0x51>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:108
    {
        expectedchar = '/';
    56d9:	c6 45 eb 2f          	mov    BYTE PTR [ebp-0x15],0x2f
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:109
        path++;
    56dd:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
    56e1:	eb 30                	jmp    5713 <fatfs_get_substring+0x81>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:111
    }
    else if (path[1] == ':' || path[2] == '\\')
    56e3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    56e6:	83 c2 01             	add    edx,0x1
    56e9:	0f b6 12             	movzx  edx,BYTE PTR [edx]
    56ec:	80 fa 3a             	cmp    dl,0x3a
    56ef:	74 0e                	je     56ff <fatfs_get_substring+0x6d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:111 (discriminator 1)
    56f1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    56f4:	83 c2 02             	add    edx,0x2
    56f7:	0f b6 12             	movzx  edx,BYTE PTR [edx]
    56fa:	80 fa 5c             	cmp    dl,0x5c
    56fd:	75 0a                	jne    5709 <fatfs_get_substring+0x77>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:113
    {
        expectedchar = '\\';
    56ff:	c6 45 eb 5c          	mov    BYTE PTR [ebp-0x15],0x5c
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:114
        path += 3;
    5703:	83 45 08 03          	add    DWORD PTR [ebp+0x8],0x3
    5707:	eb 0a                	jmp    5713 <fatfs_get_substring+0x81>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:117
    }
    else
        return -1;
    5709:	b8 ff ff ff ff       	mov    eax,0xffffffff
    570e:	e9 92 00 00 00       	jmp    57a5 <fatfs_get_substring+0x113>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:120

    // Get string length of path
    pathlen = (int)strlen (path);
    5713:	83 ec 0c             	sub    esp,0xc
    5716:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    5719:	89 c3                	mov    ebx,eax
    571b:	e8 40 1c 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    5720:	83 c4 10             	add    esp,0x10
    5723:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:123

    // Loop through the number of times as characters in 'path'
    for (i = 0; i<pathlen; i++)
    5726:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    572d:	eb 4d                	jmp    577c <fatfs_get_substring+0xea>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:126
    {
        // If a '\' is found then increase level
        if (*path == expectedchar) levels++;
    572f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5732:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5735:	3a 45 eb             	cmp    al,BYTE PTR [ebp-0x15]
    5738:	75 04                	jne    573e <fatfs_get_substring+0xac>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:126 (discriminator 1)
    573a:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:129

        // If correct level and the character is not a '\' or '/' then copy text to 'output'
        if ( (levels == levelreq) && (*path != expectedchar) && (copypnt < (max_len-1)))
    573e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5741:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
    5744:	75 2e                	jne    5774 <fatfs_get_substring+0xe2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:129 (discriminator 1)
    5746:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5749:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    574c:	3a 45 eb             	cmp    al,BYTE PTR [ebp-0x15]
    574f:	74 23                	je     5774 <fatfs_get_substring+0xe2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:129 (discriminator 2)
    5751:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    5754:	83 e8 01             	sub    eax,0x1
    5757:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
    575a:	7e 18                	jle    5774 <fatfs_get_substring+0xe2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:130
            output[copypnt++] = *path;
    575c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    575f:	8d 50 01             	lea    edx,[eax+0x1]
    5762:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
    5765:	89 c2                	mov    edx,eax
    5767:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    576a:	01 c2                	add    edx,eax
    576c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    576f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5772:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:133 (discriminator 2)

        // Increment through path string
        path++;
    5774:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:123 (discriminator 2)

    // Get string length of path
    pathlen = (int)strlen (path);

    // Loop through the number of times as characters in 'path'
    for (i = 0; i<pathlen; i++)
    5778:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:123 (discriminator 1)
    577c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    577f:	3b 45 e4             	cmp    eax,DWORD PTR [ebp-0x1c]
    5782:	7c ab                	jl     572f <fatfs_get_substring+0x9d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:137
        // Increment through path string
        path++;
    }

    // Null Terminate
    output[copypnt] = '\0';
    5784:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    5787:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    578a:	01 d0                	add    eax,edx
    578c:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:140

    // If a string was copied return 0 else return 1
    if (output[0] != '\0')
    578f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    5792:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5795:	84 c0                	test   al,al
    5797:	74 07                	je     57a0 <fatfs_get_substring+0x10e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:141
        return 0;    // OK
    5799:	b8 00 00 00 00       	mov    eax,0x0
    579e:	eb 05                	jmp    57a5 <fatfs_get_substring+0x113>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:143
    else
        return -1;    // Error
    57a0:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:144
}
    57a5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    57a8:	c9                   	leave  
    57a9:	c3                   	ret    

000057aa <fatfs_split_path>:
fatfs_split_path():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:152
// Returned is the path string and file Name string
// E.g. C:\folder\file.zip -> path = C:\folder  filename = file.zip
// E.g. C:\file.zip -> path = [blank]  filename = file.zip
//-----------------------------------------------------------------------------
int fatfs_split_path(char *full_path, char *path, int max_path, char *filename, int max_filename)
{
    57aa:	55                   	push   ebp
    57ab:	89 e5                	mov    ebp,esp
    57ad:	56                   	push   esi
    57ae:	53                   	push   ebx
    57af:	83 ec 10             	sub    esp,0x10
    57b2:	e8 43 17 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    57b7:	81 c3 71 57 00 00    	add    ebx,0x5771
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:156
    int strindex;

    // Count the levels to the filepath
    int levels = fatfs_total_path_levels(full_path);
    57bd:	83 ec 0c             	sub    esp,0xc
    57c0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    57c3:	e8 58 18 00 00       	call   7020 <__x86.get_pc_thunk.bx+0x126>
    57c8:	83 c4 10             	add    esp,0x10
    57cb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:157
    if (levels == -1)
    57ce:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
    57d2:	75 0a                	jne    57de <fatfs_split_path+0x34>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:158
        return -1;
    57d4:	b8 ff ff ff ff       	mov    eax,0xffffffff
    57d9:	e9 88 00 00 00       	jmp    5866 <fatfs_split_path+0xbc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:161

    // Get filename part of string
    if (fatfs_get_substring(full_path, levels, filename, max_filename) != 0)
    57de:	ff 75 18             	push   DWORD PTR [ebp+0x18]
    57e1:	ff 75 14             	push   DWORD PTR [ebp+0x14]
    57e4:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    57e7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    57ea:	e8 21 1b 00 00       	call   7310 <__x86.get_pc_thunk.bx+0x416>
    57ef:	83 c4 10             	add    esp,0x10
    57f2:	85 c0                	test   eax,eax
    57f4:	74 07                	je     57fd <fatfs_split_path+0x53>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:162
        return -1;
    57f6:	b8 ff ff ff ff       	mov    eax,0xffffffff
    57fb:	eb 69                	jmp    5866 <fatfs_split_path+0xbc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:165

    // If root file
    if (levels == 0)
    57fd:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    5801:	75 08                	jne    580b <fatfs_split_path+0x61>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:166
        path[0] = '\0';
    5803:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5806:	c6 00 00             	mov    BYTE PTR [eax],0x0
    5809:	eb 56                	jmp    5861 <fatfs_split_path+0xb7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:169
    else
    {
        strindex = (int)strlen(full_path) - (int)strlen(filename);
    580b:	83 ec 0c             	sub    esp,0xc
    580e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    5811:	e8 4a 1b 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    5816:	83 c4 10             	add    esp,0x10
    5819:	89 c6                	mov    esi,eax
    581b:	83 ec 0c             	sub    esp,0xc
    581e:	ff 75 14             	push   DWORD PTR [ebp+0x14]
    5821:	e8 3a 1b 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    5826:	83 c4 10             	add    esp,0x10
    5829:	29 c6                	sub    esi,eax
    582b:	89 f0                	mov    eax,esi
    582d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:170
        if (strindex > max_path)
    5830:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5833:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
    5836:	7e 06                	jle    583e <fatfs_split_path+0x94>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:171
            strindex = max_path;
    5838:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    583b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:173

        memcpy(path, full_path, strindex);
    583e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5841:	83 ec 04             	sub    esp,0x4
    5844:	50                   	push   eax
    5845:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    5848:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    584b:	e8 70 17 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
    5850:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:174
        path[strindex-1] = '\0';
    5853:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5856:	8d 50 ff             	lea    edx,[eax-0x1]
    5859:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    585c:	01 d0                	add    eax,edx
    585e:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:177
    }

    return 0;
    5861:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:178
}
    5866:	8d 65 f8             	lea    esp,[ebp-0x8]
    5869:	5b                   	pop    ebx
    586a:	5e                   	pop    esi
    586b:	5d                   	pop    ebp
    586c:	c3                   	ret    

0000586d <FileString_StrCmpNoCase>:
FileString_StrCmpNoCase():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:183
//-----------------------------------------------------------------------------
// FileString_StrCmpNoCase: Compare two strings case with case sensitivity
//-----------------------------------------------------------------------------
static int FileString_StrCmpNoCase(char *s1, char *s2, int n)
{
    586d:	55                   	push   ebp
    586e:	89 e5                	mov    ebp,esp
    5870:	83 ec 10             	sub    esp,0x10
    5873:	e8 7e 16 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5878:	05 b0 56 00 00       	add    eax,0x56b0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:187
    int diff;
    char a,b;

    while (n--)
    587d:	eb 74                	jmp    58f3 <FileString_StrCmpNoCase+0x86>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:189
    {
        a = *s1;
    587f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5882:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5885:	88 45 ff             	mov    BYTE PTR [ebp-0x1],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:190
        b = *s2;
    5888:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    588b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    588e:	88 45 fe             	mov    BYTE PTR [ebp-0x2],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:193

        // Make lower case if uppercase
        if ((a>='A') && (a<='Z'))
    5891:	80 7d ff 40          	cmp    BYTE PTR [ebp-0x1],0x40
    5895:	7e 10                	jle    58a7 <FileString_StrCmpNoCase+0x3a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:193 (discriminator 1)
    5897:	80 7d ff 5a          	cmp    BYTE PTR [ebp-0x1],0x5a
    589b:	7f 0a                	jg     58a7 <FileString_StrCmpNoCase+0x3a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:194
            a+= 32;
    589d:	0f b6 45 ff          	movzx  eax,BYTE PTR [ebp-0x1]
    58a1:	83 c0 20             	add    eax,0x20
    58a4:	88 45 ff             	mov    BYTE PTR [ebp-0x1],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:195
        if ((b>='A') && (b<='Z'))
    58a7:	80 7d fe 40          	cmp    BYTE PTR [ebp-0x2],0x40
    58ab:	7e 10                	jle    58bd <FileString_StrCmpNoCase+0x50>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:195 (discriminator 1)
    58ad:	80 7d fe 5a          	cmp    BYTE PTR [ebp-0x2],0x5a
    58b1:	7f 0a                	jg     58bd <FileString_StrCmpNoCase+0x50>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:196
            b+= 32;
    58b3:	0f b6 45 fe          	movzx  eax,BYTE PTR [ebp-0x2]
    58b7:	83 c0 20             	add    eax,0x20
    58ba:	88 45 fe             	mov    BYTE PTR [ebp-0x2],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:198

        diff = a - b;
    58bd:	0f be 55 ff          	movsx  edx,BYTE PTR [ebp-0x1]
    58c1:	0f be 45 fe          	movsx  eax,BYTE PTR [ebp-0x2]
    58c5:	29 c2                	sub    edx,eax
    58c7:	89 d0                	mov    eax,edx
    58c9:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:201

        // If different
        if (diff)
    58cc:	83 7d f8 00          	cmp    DWORD PTR [ebp-0x8],0x0
    58d0:	74 05                	je     58d7 <FileString_StrCmpNoCase+0x6a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:202
            return diff;
    58d2:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    58d5:	eb 32                	jmp    5909 <FileString_StrCmpNoCase+0x9c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:205

        // If run out of strings
        if ( (*s1 == 0) || (*s2 == 0) )
    58d7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    58da:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    58dd:	84 c0                	test   al,al
    58df:	74 23                	je     5904 <FileString_StrCmpNoCase+0x97>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:205 (discriminator 1)
    58e1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    58e4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    58e7:	84 c0                	test   al,al
    58e9:	74 19                	je     5904 <FileString_StrCmpNoCase+0x97>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:208
            break;

        s1++;
    58eb:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:209
        s2++;
    58ef:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:187
static int FileString_StrCmpNoCase(char *s1, char *s2, int n)
{
    int diff;
    char a,b;

    while (n--)
    58f3:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    58f6:	8d 50 ff             	lea    edx,[eax-0x1]
    58f9:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
    58fc:	85 c0                	test   eax,eax
    58fe:	0f 85 7b ff ff ff    	jne    587f <FileString_StrCmpNoCase+0x12>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:211
            break;

        s1++;
        s2++;
    }
    return 0;
    5904:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:212
}
    5909:	c9                   	leave  
    590a:	c3                   	ret    

0000590b <FileString_GetExtension>:
FileString_GetExtension():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:218
//-----------------------------------------------------------------------------
// FileString_GetExtension: Get index to extension within filename
// Returns -1 if not found or index otherwise
//-----------------------------------------------------------------------------
static int FileString_GetExtension(char *str)
{
    590b:	55                   	push   ebp
    590c:	89 e5                	mov    ebp,esp
    590e:	83 ec 10             	sub    esp,0x10
    5911:	e8 e0 15 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5916:	05 12 56 00 00       	add    eax,0x5612
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:219
    int dotPos = -1;
    591b:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:220
    char *strSrc = str;
    5922:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5925:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:223

    // Find last '.' in string (if at all)
    while (*strSrc)
    5928:	eb 1b                	jmp    5945 <FileString_GetExtension+0x3a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:225
    {
        if (*strSrc=='.')
    592a:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    592d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5930:	3c 2e                	cmp    al,0x2e
    5932:	75 0d                	jne    5941 <FileString_GetExtension+0x36>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:226
            dotPos = (int)(strSrc-str);
    5934:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
    5937:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    593a:	29 c2                	sub    edx,eax
    593c:	89 d0                	mov    eax,edx
    593e:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:228

        strSrc++;
    5941:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:223
{
    int dotPos = -1;
    char *strSrc = str;

    // Find last '.' in string (if at all)
    while (*strSrc)
    5945:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    5948:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    594b:	84 c0                	test   al,al
    594d:	75 db                	jne    592a <FileString_GetExtension+0x1f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:231
            dotPos = (int)(strSrc-str);

        strSrc++;
    }

    return dotPos;
    594f:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:232
}
    5952:	c9                   	leave  
    5953:	c3                   	ret    

00005954 <FileString_TrimLength>:
FileString_TrimLength():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:238
//-----------------------------------------------------------------------------
// FileString_TrimLength: Get length of string excluding trailing spaces
// Returns -1 if not found or index otherwise
//-----------------------------------------------------------------------------
static int FileString_TrimLength(char *str, int strLen)
{
    5954:	55                   	push   ebp
    5955:	89 e5                	mov    ebp,esp
    5957:	83 ec 10             	sub    esp,0x10
    595a:	e8 97 15 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    595f:	05 c9 55 00 00       	add    eax,0x55c9
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:239
    int length = strLen;
    5964:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5967:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:240
    char *strSrc = str+strLen-1;
    596a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    596d:	8d 50 ff             	lea    edx,[eax-0x1]
    5970:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5973:	01 d0                	add    eax,edx
    5975:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:243

    // Find last non white space
    while (strLen != 0)
    5978:	eb 1f                	jmp    5999 <FileString_TrimLength+0x45>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:245
    {
        if (*strSrc == ' ')
    597a:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    597d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5980:	3c 20                	cmp    al,0x20
    5982:	75 1d                	jne    59a1 <FileString_TrimLength+0x4d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:246
            length = (int)(strSrc - str);
    5984:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
    5987:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    598a:	29 c2                	sub    edx,eax
    598c:	89 d0                	mov    eax,edx
    598e:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:250
        else
            break;

        strSrc--;
    5991:	83 6d f8 01          	sub    DWORD PTR [ebp-0x8],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:251
        strLen--;
    5995:	83 6d 0c 01          	sub    DWORD PTR [ebp+0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:243
{
    int length = strLen;
    char *strSrc = str+strLen-1;

    // Find last non white space
    while (strLen != 0)
    5999:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    599d:	75 db                	jne    597a <FileString_TrimLength+0x26>
    599f:	eb 01                	jmp    59a2 <FileString_TrimLength+0x4e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:248
    {
        if (*strSrc == ' ')
            length = (int)(strSrc - str);
        else
            break;
    59a1:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:254

        strSrc--;
        strLen--;
    }

    return length;
    59a2:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:255
}
    59a5:	c9                   	leave  
    59a6:	c3                   	ret    

000059a7 <fatfs_compare_names>:
fatfs_compare_names():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:261
//-----------------------------------------------------------------------------
// fatfs_compare_names: Compare two filenames (without copying or changing origonals)
// Returns 1 if match, 0 if not
//-----------------------------------------------------------------------------
int fatfs_compare_names(char* strA, char* strB)
{
    59a7:	55                   	push   ebp
    59a8:	89 e5                	mov    ebp,esp
    59aa:	56                   	push   esi
    59ab:	53                   	push   ebx
    59ac:	83 ec 20             	sub    esp,0x20
    59af:	e8 46 15 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    59b4:	81 c3 74 55 00 00    	add    ebx,0x5574
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:262
    char *ext1 = NULL;
    59ba:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:263
    char *ext2 = NULL;
    59c1:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:268
    int ext1Pos, ext2Pos;
    int file1Len, file2Len;

    // Get both files extension
    ext1Pos = FileString_GetExtension(strA);
    59c8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    59cb:	e8 3b ff ff ff       	call   590b <FileString_GetExtension>
    59d0:	83 c4 04             	add    esp,0x4
    59d3:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:269
    ext2Pos = FileString_GetExtension(strB);
    59d6:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    59d9:	e8 2d ff ff ff       	call   590b <FileString_GetExtension>
    59de:	83 c4 04             	add    esp,0x4
    59e1:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:274

    // NOTE: Extension position can be different for matching
    // filename if trailing space are present before it!
    // Check that if one has an extension, so does the other
    if ((ext1Pos==-1) && (ext2Pos!=-1))
    59e4:	83 7d e4 ff          	cmp    DWORD PTR [ebp-0x1c],0xffffffff
    59e8:	75 10                	jne    59fa <fatfs_compare_names+0x53>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:274 (discriminator 1)
    59ea:	83 7d e0 ff          	cmp    DWORD PTR [ebp-0x20],0xffffffff
    59ee:	74 0a                	je     59fa <fatfs_compare_names+0x53>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:275
        return 0;
    59f0:	b8 00 00 00 00       	mov    eax,0x0
    59f5:	e9 21 01 00 00       	jmp    5b1b <fatfs_compare_names+0x174>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:276
    if ((ext2Pos==-1) && (ext1Pos!=-1))
    59fa:	83 7d e0 ff          	cmp    DWORD PTR [ebp-0x20],0xffffffff
    59fe:	75 10                	jne    5a10 <fatfs_compare_names+0x69>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:276 (discriminator 1)
    5a00:	83 7d e4 ff          	cmp    DWORD PTR [ebp-0x1c],0xffffffff
    5a04:	74 0a                	je     5a10 <fatfs_compare_names+0x69>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:277
        return 0;
    5a06:	b8 00 00 00 00       	mov    eax,0x0
    5a0b:	e9 0b 01 00 00       	jmp    5b1b <fatfs_compare_names+0x174>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:280

    // If they both have extensions, compare them
    if (ext1Pos!=-1)
    5a10:	83 7d e4 ff          	cmp    DWORD PTR [ebp-0x1c],0xffffffff
    5a14:	0f 84 84 00 00 00    	je     5a9e <fatfs_compare_names+0xf7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:283
    {
        // Set pointer to start of extension
        ext1 = strA+ext1Pos+1;
    5a1a:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    5a1d:	8d 50 01             	lea    edx,[eax+0x1]
    5a20:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5a23:	01 d0                	add    eax,edx
    5a25:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:284
        ext2 = strB+ext2Pos+1;
    5a28:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    5a2b:	8d 50 01             	lea    edx,[eax+0x1]
    5a2e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5a31:	01 d0                	add    eax,edx
    5a33:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:287

        // Verify that the file extension lengths match!
        if (strlen(ext1) != strlen(ext2))
    5a36:	83 ec 0c             	sub    esp,0xc
    5a39:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    5a3c:	e8 1f 19 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    5a41:	83 c4 10             	add    esp,0x10
    5a44:	89 c6                	mov    esi,eax
    5a46:	83 ec 0c             	sub    esp,0xc
    5a49:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    5a4c:	e8 0f 19 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    5a51:	83 c4 10             	add    esp,0x10
    5a54:	39 c6                	cmp    esi,eax
    5a56:	74 0a                	je     5a62 <fatfs_compare_names+0xbb>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:288
            return 0;
    5a58:	b8 00 00 00 00       	mov    eax,0x0
    5a5d:	e9 b9 00 00 00       	jmp    5b1b <fatfs_compare_names+0x174>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:291

        // If they dont match
        if (FileString_StrCmpNoCase(ext1, ext2, (int)strlen(ext1))!=0)
    5a62:	83 ec 0c             	sub    esp,0xc
    5a65:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    5a68:	e8 f3 18 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    5a6d:	83 c4 10             	add    esp,0x10
    5a70:	83 ec 04             	sub    esp,0x4
    5a73:	50                   	push   eax
    5a74:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
    5a77:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    5a7a:	e8 ee fd ff ff       	call   586d <FileString_StrCmpNoCase>
    5a7f:	83 c4 10             	add    esp,0x10
    5a82:	85 c0                	test   eax,eax
    5a84:	74 0a                	je     5a90 <fatfs_compare_names+0xe9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:292
            return 0;
    5a86:	b8 00 00 00 00       	mov    eax,0x0
    5a8b:	e9 8b 00 00 00       	jmp    5b1b <fatfs_compare_names+0x174>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:295

        // Filelength is upto extensions
        file1Len = ext1Pos;
    5a90:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    5a93:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:296
        file2Len = ext2Pos;
    5a96:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    5a99:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
    5a9c:	eb 22                	jmp    5ac0 <fatfs_compare_names+0x119>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:302
    }
    // No extensions
    else
    {
        // Filelength is actual filelength
        file1Len = (int)strlen(strA);
    5a9e:	83 ec 0c             	sub    esp,0xc
    5aa1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    5aa4:	e8 b7 18 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    5aa9:	83 c4 10             	add    esp,0x10
    5aac:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:303
        file2Len = (int)strlen(strB);
    5aaf:	83 ec 0c             	sub    esp,0xc
    5ab2:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    5ab5:	e8 a6 18 00 00       	call   7360 <__x86.get_pc_thunk.bx+0x466>
    5aba:	83 c4 10             	add    esp,0x10
    5abd:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:307
    }

    // Find length without trailing spaces (before ext)
    file1Len = FileString_TrimLength(strA, file1Len);
    5ac0:	83 ec 08             	sub    esp,0x8
    5ac3:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    5ac6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    5ac9:	e8 86 fe ff ff       	call   5954 <FileString_TrimLength>
    5ace:	83 c4 10             	add    esp,0x10
    5ad1:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:308
    file2Len = FileString_TrimLength(strB, file2Len);
    5ad4:	83 ec 08             	sub    esp,0x8
    5ad7:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    5ada:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    5add:	e8 72 fe ff ff       	call   5954 <FileString_TrimLength>
    5ae2:	83 c4 10             	add    esp,0x10
    5ae5:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:311

    // Check the file lengths match
    if (file1Len!=file2Len)
    5ae8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5aeb:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
    5aee:	74 07                	je     5af7 <fatfs_compare_names+0x150>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:312
        return 0;
    5af0:	b8 00 00 00 00       	mov    eax,0x0
    5af5:	eb 24                	jmp    5b1b <fatfs_compare_names+0x174>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:315

    // Compare main part of filenames
    if (FileString_StrCmpNoCase(strA, strB, file1Len)!=0)
    5af7:	83 ec 04             	sub    esp,0x4
    5afa:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    5afd:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    5b00:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    5b03:	e8 65 fd ff ff       	call   586d <FileString_StrCmpNoCase>
    5b08:	83 c4 10             	add    esp,0x10
    5b0b:	85 c0                	test   eax,eax
    5b0d:	74 07                	je     5b16 <fatfs_compare_names+0x16f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:316
        return 0;
    5b0f:	b8 00 00 00 00       	mov    eax,0x0
    5b14:	eb 05                	jmp    5b1b <fatfs_compare_names+0x174>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:318
    else
        return 1;
    5b16:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:319
}
    5b1b:	8d 65 f8             	lea    esp,[ebp-0x8]
    5b1e:	5b                   	pop    ebx
    5b1f:	5e                   	pop    esi
    5b20:	5d                   	pop    ebp
    5b21:	c3                   	ret    

00005b22 <fatfs_string_ends_with_slash>:
fatfs_string_ends_with_slash():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:324
//-----------------------------------------------------------------------------
// fatfs_string_ends_with_slash: Does the string end with a slash (\ or /)
//-----------------------------------------------------------------------------
int fatfs_string_ends_with_slash(char *path)
{
    5b22:	55                   	push   ebp
    5b23:	89 e5                	mov    ebp,esp
    5b25:	e8 cc 13 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5b2a:	05 fe 53 00 00       	add    eax,0x53fe
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:325
    if (path)
    5b2f:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
    5b33:	74 38                	je     5b6d <fatfs_string_ends_with_slash+0x4b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:327
    {
        while (*path)
    5b35:	eb 2c                	jmp    5b63 <fatfs_string_ends_with_slash+0x41>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:330
        {
            // Last character?
            if (!(*(path+1)))
    5b37:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5b3a:	83 c0 01             	add    eax,0x1
    5b3d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5b40:	84 c0                	test   al,al
    5b42:	75 1b                	jne    5b5f <fatfs_string_ends_with_slash+0x3d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:332
            {
                if (*path == '\\' || *path == '/')
    5b44:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5b47:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5b4a:	3c 5c                	cmp    al,0x5c
    5b4c:	74 0a                	je     5b58 <fatfs_string_ends_with_slash+0x36>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:332 (discriminator 1)
    5b4e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5b51:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5b54:	3c 2f                	cmp    al,0x2f
    5b56:	75 07                	jne    5b5f <fatfs_string_ends_with_slash+0x3d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:333
                    return 1;
    5b58:	b8 01 00 00 00       	mov    eax,0x1
    5b5d:	eb 13                	jmp    5b72 <fatfs_string_ends_with_slash+0x50>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:336
            }

            path++;
    5b5f:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:327
//-----------------------------------------------------------------------------
int fatfs_string_ends_with_slash(char *path)
{
    if (path)
    {
        while (*path)
    5b63:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5b66:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5b69:	84 c0                	test   al,al
    5b6b:	75 ca                	jne    5b37 <fatfs_string_ends_with_slash+0x15>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:340

            path++;
        }
    }

    return 0;
    5b6d:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:341
}
    5b72:	5d                   	pop    ebp
    5b73:	c3                   	ret    

00005b74 <fatfs_get_sfn_display_name>:
fatfs_get_sfn_display_name():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:346
//-----------------------------------------------------------------------------
// fatfs_get_sfn_display_name: Get display name for SFN entry
//-----------------------------------------------------------------------------
int fatfs_get_sfn_display_name(char* out, char* in)
{
    5b74:	55                   	push   ebp
    5b75:	89 e5                	mov    ebp,esp
    5b77:	83 ec 10             	sub    esp,0x10
    5b7a:	e8 77 13 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5b7f:	05 a9 53 00 00       	add    eax,0x53a9
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:347
    int len = 0;
    5b84:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:348
    while (*in && len <= 11)
    5b8b:	eb 40                	jmp    5bcd <fatfs_get_sfn_display_name+0x59>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:350
    {
        char a = *in++;
    5b8d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5b90:	8d 50 01             	lea    edx,[eax+0x1]
    5b93:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
    5b96:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5b99:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:352

        if (a == ' ')
    5b9c:	80 7d fb 20          	cmp    BYTE PTR [ebp-0x5],0x20
    5ba0:	75 02                	jne    5ba4 <fatfs_get_sfn_display_name+0x30>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:353
            continue;
    5ba2:	eb 29                	jmp    5bcd <fatfs_get_sfn_display_name+0x59>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:355
        // Make lower case if uppercase
        else if ((a>='A') && (a<='Z'))
    5ba4:	80 7d fb 40          	cmp    BYTE PTR [ebp-0x5],0x40
    5ba8:	7e 10                	jle    5bba <fatfs_get_sfn_display_name+0x46>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:355 (discriminator 1)
    5baa:	80 7d fb 5a          	cmp    BYTE PTR [ebp-0x5],0x5a
    5bae:	7f 0a                	jg     5bba <fatfs_get_sfn_display_name+0x46>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:356
            a+= 32;
    5bb0:	0f b6 45 fb          	movzx  eax,BYTE PTR [ebp-0x5]
    5bb4:	83 c0 20             	add    eax,0x20
    5bb7:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:358

        *out++ = a;
    5bba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5bbd:	8d 50 01             	lea    edx,[eax+0x1]
    5bc0:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
    5bc3:	0f b6 55 fb          	movzx  edx,BYTE PTR [ebp-0x5]
    5bc7:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:359
        len++;
    5bc9:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:348
// fatfs_get_sfn_display_name: Get display name for SFN entry
//-----------------------------------------------------------------------------
int fatfs_get_sfn_display_name(char* out, char* in)
{
    int len = 0;
    while (*in && len <= 11)
    5bcd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5bd0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5bd3:	84 c0                	test   al,al
    5bd5:	74 06                	je     5bdd <fatfs_get_sfn_display_name+0x69>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:348 (discriminator 1)
    5bd7:	83 7d fc 0b          	cmp    DWORD PTR [ebp-0x4],0xb
    5bdb:	7e b0                	jle    5b8d <fatfs_get_sfn_display_name+0x19>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:362

        *out++ = a;
        len++;
    }

    *out = '\0';
    5bdd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5be0:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:363
    return 1;
    5be3:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:364
}
    5be8:	c9                   	leave  
    5be9:	c3                   	ret    

00005bea <fatfs_get_extension>:
fatfs_get_extension():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:371
// fatfs_get_extension: Get extension of filename passed in 'filename'.
// Returned extension is always lower case.
// Returns: 1 if ok, 0 if not.
//-----------------------------------------------------------------------------
int fatfs_get_extension(char* filename, char* out, int maxlen)
{
    5bea:	55                   	push   ebp
    5beb:	89 e5                	mov    ebp,esp
    5bed:	83 ec 10             	sub    esp,0x10
    5bf0:	e8 01 13 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5bf5:	05 33 53 00 00       	add    eax,0x5333
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:372
    int len = 0;
    5bfa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:375

    // Get files extension offset
    int ext_pos = FileString_GetExtension(filename);
    5c01:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    5c04:	e8 02 fd ff ff       	call   590b <FileString_GetExtension>
    5c09:	83 c4 04             	add    esp,0x4
    5c0c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:377

    if (ext_pos > 0 && out && maxlen)
    5c0f:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    5c13:	7e 71                	jle    5c86 <fatfs_get_extension+0x9c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:377 (discriminator 1)
    5c15:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    5c19:	74 6b                	je     5c86 <fatfs_get_extension+0x9c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:377 (discriminator 2)
    5c1b:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
    5c1f:	74 65                	je     5c86 <fatfs_get_extension+0x9c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:379
    {
        filename += ext_pos + 1;
    5c21:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5c24:	83 c0 01             	add    eax,0x1
    5c27:	01 45 08             	add    DWORD PTR [ebp+0x8],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:381

        while (*filename && len < (maxlen-1))
    5c2a:	eb 38                	jmp    5c64 <fatfs_get_extension+0x7a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:383
        {
            char a = *filename++;
    5c2c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5c2f:	8d 50 01             	lea    edx,[eax+0x1]
    5c32:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
    5c35:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5c38:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:386

            // Make lowercase if uppercase
            if ((a>='A') && (a<='Z'))
    5c3b:	80 7d fb 40          	cmp    BYTE PTR [ebp-0x5],0x40
    5c3f:	7e 10                	jle    5c51 <fatfs_get_extension+0x67>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:386 (discriminator 1)
    5c41:	80 7d fb 5a          	cmp    BYTE PTR [ebp-0x5],0x5a
    5c45:	7f 0a                	jg     5c51 <fatfs_get_extension+0x67>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:387
                a+= 32;
    5c47:	0f b6 45 fb          	movzx  eax,BYTE PTR [ebp-0x5]
    5c4b:	83 c0 20             	add    eax,0x20
    5c4e:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:389

            *out++ = a;
    5c51:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5c54:	8d 50 01             	lea    edx,[eax+0x1]
    5c57:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
    5c5a:	0f b6 55 fb          	movzx  edx,BYTE PTR [ebp-0x5]
    5c5e:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:390
            len++;
    5c60:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:381

    if (ext_pos > 0 && out && maxlen)
    {
        filename += ext_pos + 1;

        while (*filename && len < (maxlen-1))
    5c64:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5c67:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5c6a:	84 c0                	test   al,al
    5c6c:	74 0b                	je     5c79 <fatfs_get_extension+0x8f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:381 (discriminator 1)
    5c6e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    5c71:	83 e8 01             	sub    eax,0x1
    5c74:	3b 45 fc             	cmp    eax,DWORD PTR [ebp-0x4]
    5c77:	7f b3                	jg     5c2c <fatfs_get_extension+0x42>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:393

            *out++ = a;
            len++;
        }

        *out = '\0';
    5c79:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5c7c:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:394
        return 1;
    5c7f:	b8 01 00 00 00       	mov    eax,0x1
    5c84:	eb 05                	jmp    5c8b <fatfs_get_extension+0xa1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:397
    }

    return 0;
    5c86:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:398
}
    5c8b:	c9                   	leave  
    5c8c:	c3                   	ret    

00005c8d <fatfs_create_path_string>:
fatfs_create_path_string():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:404
//-----------------------------------------------------------------------------
// fatfs_create_path_string: Append path & filename to create file path string.
// Returns: 1 if ok, 0 if not.
//-----------------------------------------------------------------------------
int fatfs_create_path_string(char* path, char *filename, char* out, int maxlen)
{
    5c8d:	55                   	push   ebp
    5c8e:	89 e5                	mov    ebp,esp
    5c90:	83 ec 10             	sub    esp,0x10
    5c93:	e8 5e 12 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5c98:	05 90 52 00 00       	add    eax,0x5290
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:405
    int len = 0;
    5c9d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:406
    char last = 0;
    5ca4:	c6 45 fb 00          	mov    BYTE PTR [ebp-0x5],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:407
    char seperator = '/';
    5ca8:	c6 45 fa 2f          	mov    BYTE PTR [ebp-0x6],0x2f
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:409

    if (path && filename && out && maxlen > 0)
    5cac:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
    5cb0:	0f 84 bb 00 00 00    	je     5d71 <fatfs_create_path_string+0xe4>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:409 (discriminator 1)
    5cb6:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    5cba:	0f 84 b1 00 00 00    	je     5d71 <fatfs_create_path_string+0xe4>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:409 (discriminator 2)
    5cc0:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
    5cc4:	0f 84 a7 00 00 00    	je     5d71 <fatfs_create_path_string+0xe4>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:409 (discriminator 3)
    5cca:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
    5cce:	0f 8e 9d 00 00 00    	jle    5d71 <fatfs_create_path_string+0xe4>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:411
    {
        while (*path && len < (maxlen-2))
    5cd4:	eb 2c                	jmp    5d02 <fatfs_create_path_string+0x75>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:413
        {
            last = *path++;
    5cd6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5cd9:	8d 50 01             	lea    edx,[eax+0x1]
    5cdc:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
    5cdf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5ce2:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:414
            if (last == '\\')
    5ce5:	80 7d fb 5c          	cmp    BYTE PTR [ebp-0x5],0x5c
    5ce9:	75 04                	jne    5cef <fatfs_create_path_string+0x62>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:415
                seperator = '\\';
    5ceb:	c6 45 fa 5c          	mov    BYTE PTR [ebp-0x6],0x5c
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:416
            *out++ = last;
    5cef:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    5cf2:	8d 50 01             	lea    edx,[eax+0x1]
    5cf5:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
    5cf8:	0f b6 55 fb          	movzx  edx,BYTE PTR [ebp-0x5]
    5cfc:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:417
            len++;
    5cfe:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:411
    char last = 0;
    char seperator = '/';

    if (path && filename && out && maxlen > 0)
    {
        while (*path && len < (maxlen-2))
    5d02:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5d05:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5d08:	84 c0                	test   al,al
    5d0a:	74 0b                	je     5d17 <fatfs_create_path_string+0x8a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:411 (discriminator 1)
    5d0c:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    5d0f:	83 e8 02             	sub    eax,0x2
    5d12:	3b 45 fc             	cmp    eax,DWORD PTR [ebp-0x4]
    5d15:	7f bf                	jg     5cd6 <fatfs_create_path_string+0x49>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:421
            *out++ = last;
            len++;
        }

        // Add a seperator if trailing one not found
        if (last != '\\' && last != '/')
    5d17:	80 7d fb 5c          	cmp    BYTE PTR [ebp-0x5],0x5c
    5d1b:	74 32                	je     5d4f <fatfs_create_path_string+0xc2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:421 (discriminator 1)
    5d1d:	80 7d fb 2f          	cmp    BYTE PTR [ebp-0x5],0x2f
    5d21:	74 2c                	je     5d4f <fatfs_create_path_string+0xc2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:422
            *out++ = seperator;
    5d23:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    5d26:	8d 50 01             	lea    edx,[eax+0x1]
    5d29:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
    5d2c:	0f b6 55 fa          	movzx  edx,BYTE PTR [ebp-0x6]
    5d30:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:424

        while (*filename && len < (maxlen-1))
    5d32:	eb 1b                	jmp    5d4f <fatfs_create_path_string+0xc2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:426
        {
            *out++ = *filename++;
    5d34:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    5d37:	8d 50 01             	lea    edx,[eax+0x1]
    5d3a:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
    5d3d:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    5d40:	8d 4a 01             	lea    ecx,[edx+0x1]
    5d43:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
    5d46:	0f b6 12             	movzx  edx,BYTE PTR [edx]
    5d49:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:427
            len++;
    5d4b:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:424

        // Add a seperator if trailing one not found
        if (last != '\\' && last != '/')
            *out++ = seperator;

        while (*filename && len < (maxlen-1))
    5d4f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5d52:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    5d55:	84 c0                	test   al,al
    5d57:	74 0b                	je     5d64 <fatfs_create_path_string+0xd7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:424 (discriminator 1)
    5d59:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    5d5c:	83 e8 01             	sub    eax,0x1
    5d5f:	3b 45 fc             	cmp    eax,DWORD PTR [ebp-0x4]
    5d62:	7f d0                	jg     5d34 <fatfs_create_path_string+0xa7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:430
        {
            *out++ = *filename++;
            len++;
        }

        *out = '\0';
    5d64:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    5d67:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:432

        return 1;
    5d6a:	b8 01 00 00 00       	mov    eax,0x1
    5d6f:	eb 05                	jmp    5d76 <fatfs_create_path_string+0xe9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:435
    }

    return 0;
    5d71:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_string.c:436
}
    5d76:	c9                   	leave  
    5d77:	c3                   	ret    

00005d78 <fatfs_fat_init>:
fatfs_fat_init():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:61

//-----------------------------------------------------------------------------
// fatfs_fat_init:
//-----------------------------------------------------------------------------
void fatfs_fat_init(struct fatfs *fs)
{
    5d78:	55                   	push   ebp
    5d79:	89 e5                	mov    ebp,esp
    5d7b:	56                   	push   esi
    5d7c:	53                   	push   ebx
    5d7d:	83 ec 10             	sub    esp,0x10
    5d80:	e8 75 11 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    5d85:	81 c3 a3 51 00 00    	add    ebx,0x51a3
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:65
    int i;

    // FAT buffer chain head
    fs->fat_buffer_head = NULL;
    5d8b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5d8e:	c7 80 54 02 00 00 00 	mov    DWORD PTR [eax+0x254],0x0
    5d95:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:67

    for (i=0;i<FAT_BUFFERS;i++)
    5d98:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    5d9f:	e9 cf 00 00 00       	jmp    5e73 <fatfs_fat_init+0xfb>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:70 (discriminator 3)
    {
        // Initialise buffers to invalid
        fs->fat_buffers[i].address = FAT32_INVALID_CLUSTER;
    5da4:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    5da7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5daa:	c1 e0 04             	shl    eax,0x4
    5dad:	89 c1                	mov    ecx,eax
    5daf:	c1 e1 05             	shl    ecx,0x5
    5db2:	01 c8                	add    eax,ecx
    5db4:	01 d0                	add    eax,edx
    5db6:	05 58 04 00 00       	add    eax,0x458
    5dbb:	c7 00 ff ff ff ff    	mov    DWORD PTR [eax],0xffffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:71 (discriminator 3)
        fs->fat_buffers[i].dirty = 0;
    5dc1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    5dc4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5dc7:	c1 e0 04             	shl    eax,0x4
    5dca:	89 c1                	mov    ecx,eax
    5dcc:	c1 e1 05             	shl    ecx,0x5
    5dcf:	01 c8                	add    eax,ecx
    5dd1:	01 d0                	add    eax,edx
    5dd3:	05 5c 04 00 00       	add    eax,0x45c
    5dd8:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:72 (discriminator 3)
        memset(fs->fat_buffers[i].sector, 0x00, sizeof(fs->fat_buffers[i].sector));
    5dde:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5de1:	c1 e0 04             	shl    eax,0x4
    5de4:	89 c2                	mov    edx,eax
    5de6:	c1 e2 05             	shl    edx,0x5
    5de9:	01 d0                	add    eax,edx
    5deb:	8d 90 50 02 00 00    	lea    edx,[eax+0x250]
    5df1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5df4:	01 d0                	add    eax,edx
    5df6:	83 c0 08             	add    eax,0x8
    5df9:	83 ec 04             	sub    esp,0x4
    5dfc:	68 00 02 00 00       	push   0x200
    5e01:	6a 00                	push   0x0
    5e03:	50                   	push   eax
    5e04:	e8 37 14 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    5e09:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:73 (discriminator 3)
        fs->fat_buffers[i].ptr = NULL;
    5e0c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    5e0f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5e12:	c1 e0 04             	shl    eax,0x4
    5e15:	89 c1                	mov    ecx,eax
    5e17:	c1 e1 05             	shl    ecx,0x5
    5e1a:	01 c8                	add    eax,ecx
    5e1c:	01 d0                	add    eax,edx
    5e1e:	05 60 04 00 00       	add    eax,0x460
    5e23:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:76 (discriminator 3)

        // Add to head of queue
        fs->fat_buffers[i].next = fs->fat_buffer_head;
    5e29:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5e2c:	8b 90 54 02 00 00    	mov    edx,DWORD PTR [eax+0x254]
    5e32:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
    5e35:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5e38:	c1 e0 04             	shl    eax,0x4
    5e3b:	89 c6                	mov    esi,eax
    5e3d:	c1 e6 05             	shl    esi,0x5
    5e40:	01 f0                	add    eax,esi
    5e42:	01 c8                	add    eax,ecx
    5e44:	05 64 04 00 00       	add    eax,0x464
    5e49:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:77 (discriminator 3)
        fs->fat_buffer_head = &fs->fat_buffers[i];
    5e4b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5e4e:	c1 e0 04             	shl    eax,0x4
    5e51:	89 c2                	mov    edx,eax
    5e53:	c1 e2 05             	shl    edx,0x5
    5e56:	01 d0                	add    eax,edx
    5e58:	8d 90 50 02 00 00    	lea    edx,[eax+0x250]
    5e5e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5e61:	01 d0                	add    eax,edx
    5e63:	8d 50 08             	lea    edx,[eax+0x8]
    5e66:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5e69:	89 90 54 02 00 00    	mov    DWORD PTR [eax+0x254],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:67 (discriminator 3)
    int i;

    // FAT buffer chain head
    fs->fat_buffer_head = NULL;

    for (i=0;i<FAT_BUFFERS;i++)
    5e6f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:67 (discriminator 1)
    5e73:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    5e77:	0f 8e 27 ff ff ff    	jle    5da4 <fatfs_fat_init+0x2c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:79

        // Add to head of queue
        fs->fat_buffers[i].next = fs->fat_buffer_head;
        fs->fat_buffer_head = &fs->fat_buffers[i];
    }
}
    5e7d:	90                   	nop
    5e7e:	8d 65 f8             	lea    esp,[ebp-0x8]
    5e81:	5b                   	pop    ebx
    5e82:	5e                   	pop    esi
    5e83:	5d                   	pop    ebp
    5e84:	c3                   	ret    

00005e85 <fatfs_fat_writeback>:
fatfs_fat_writeback():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:84
//-----------------------------------------------------------------------------
// fatfs_fat_writeback: Writeback 'dirty' FAT sectors to disk
//-----------------------------------------------------------------------------
static int fatfs_fat_writeback(struct fatfs *fs, struct fat_buffer *pcur)
{
    5e85:	55                   	push   ebp
    5e86:	89 e5                	mov    ebp,esp
    5e88:	83 ec 18             	sub    esp,0x18
    5e8b:	e8 66 10 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5e90:	05 98 50 00 00       	add    eax,0x5098
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:85
    if (pcur)
    5e95:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    5e99:	0f 84 9b 00 00 00    	je     5f3a <fatfs_fat_writeback+0xb5>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:88
    {
        // Writeback sector if changed
        if (pcur->dirty)
    5e9f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5ea2:	8b 80 04 02 00 00    	mov    eax,DWORD PTR [eax+0x204]
    5ea8:	85 c0                	test   eax,eax
    5eaa:	0f 84 83 00 00 00    	je     5f33 <fatfs_fat_writeback+0xae>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:90
        {
            if (fs->disk_io.write_media)
    5eb0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5eb3:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    5eb6:	85 c0                	test   eax,eax
    5eb8:	74 6c                	je     5f26 <fatfs_fat_writeback+0xa1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:92
            {
                uint32 sectors = FAT_BUFFER_SECTORS;
    5eba:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:93
                uint32 offset = pcur->address - fs->fat_begin_lba;
    5ec1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5ec4:	8b 90 00 02 00 00    	mov    edx,DWORD PTR [eax+0x200]
    5eca:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5ecd:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
    5ed0:	29 c2                	sub    edx,eax
    5ed2:	89 d0                	mov    eax,edx
    5ed4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:96

                // Limit to sectors used for the FAT
                if ((offset + FAT_BUFFER_SECTORS) <= fs->fat_sectors)
    5ed7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5eda:	8d 50 01             	lea    edx,[eax+0x1]
    5edd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5ee0:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    5ee3:	39 c2                	cmp    edx,eax
    5ee5:	77 09                	ja     5ef0 <fatfs_fat_writeback+0x6b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:97
                    sectors = FAT_BUFFER_SECTORS;
    5ee7:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [ebp-0xc],0x1
    5eee:	eb 0c                	jmp    5efc <fatfs_fat_writeback+0x77>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:99
                else
                    sectors = fs->fat_sectors - offset;
    5ef0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5ef3:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    5ef6:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
    5ef9:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:101

                if (!fs->disk_io.write_media(pcur->address, pcur->sector, sectors))
    5efc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5eff:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    5f02:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
    5f05:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    5f08:	8b 92 00 02 00 00    	mov    edx,DWORD PTR [edx+0x200]
    5f0e:	83 ec 04             	sub    esp,0x4
    5f11:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    5f14:	51                   	push   ecx
    5f15:	52                   	push   edx
    5f16:	ff d0                	call   eax
    5f18:	83 c4 10             	add    esp,0x10
    5f1b:	85 c0                	test   eax,eax
    5f1d:	75 07                	jne    5f26 <fatfs_fat_writeback+0xa1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:102
                    return 0;
    5f1f:	b8 00 00 00 00       	mov    eax,0x0
    5f24:	eb 19                	jmp    5f3f <fatfs_fat_writeback+0xba>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:105
            }

            pcur->dirty = 0;
    5f26:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    5f29:	c7 80 04 02 00 00 00 	mov    DWORD PTR [eax+0x204],0x0
    5f30:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:108
        }

        return 1;
    5f33:	b8 01 00 00 00       	mov    eax,0x1
    5f38:	eb 05                	jmp    5f3f <fatfs_fat_writeback+0xba>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:111
    }
    else
        return 0;
    5f3a:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:112
}
    5f3f:	c9                   	leave  
    5f40:	c3                   	ret    

00005f41 <fatfs_fat_read_sector>:
fatfs_fat_read_sector():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:117
//-----------------------------------------------------------------------------
// fatfs_fat_read_sector: Read a FAT sector
//-----------------------------------------------------------------------------
static struct fat_buffer *fatfs_fat_read_sector(struct fatfs *fs, uint32 sector)
{
    5f41:	55                   	push   ebp
    5f42:	89 e5                	mov    ebp,esp
    5f44:	83 ec 18             	sub    esp,0x18
    5f47:	e8 aa 0f 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    5f4c:	05 dc 4f 00 00       	add    eax,0x4fdc
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:118
    struct fat_buffer *last = NULL;
    5f51:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:119
    struct fat_buffer *pcur = fs->fat_buffer_head;
    5f58:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5f5b:	8b 80 54 02 00 00    	mov    eax,DWORD PTR [eax+0x254]
    5f61:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:122

    // Itterate through sector buffer list
    while (pcur)
    5f64:	eb 60                	jmp    5fc6 <fatfs_fat_read_sector+0x85>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:125
    {
        // Sector within this buffer?
        if ((sector >= pcur->address) && (sector < (pcur->address + FAT_BUFFER_SECTORS)))
    5f66:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5f69:	8b 80 00 02 00 00    	mov    eax,DWORD PTR [eax+0x200]
    5f6f:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
    5f72:	77 11                	ja     5f85 <fatfs_fat_read_sector+0x44>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:125 (discriminator 1)
    5f74:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5f77:	8b 80 00 02 00 00    	mov    eax,DWORD PTR [eax+0x200]
    5f7d:	83 c0 01             	add    eax,0x1
    5f80:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
    5f83:	77 49                	ja     5fce <fatfs_fat_read_sector+0x8d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:129
            break;

        // End of list?
        if (pcur->next == NULL)
    5f85:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5f88:	8b 80 0c 02 00 00    	mov    eax,DWORD PTR [eax+0x20c]
    5f8e:	85 c0                	test   eax,eax
    5f90:	75 22                	jne    5fb4 <fatfs_fat_read_sector+0x73>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:132
        {
            // Remove buffer from list
            if (last)
    5f92:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    5f96:	74 0f                	je     5fa7 <fatfs_fat_read_sector+0x66>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:133
                last->next = NULL;
    5f98:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    5f9b:	c7 80 0c 02 00 00 00 	mov    DWORD PTR [eax+0x20c],0x0
    5fa2:	00 00 00 
    5fa5:	eb 0d                	jmp    5fb4 <fatfs_fat_read_sector+0x73>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:136
            // We the first and last buffer in the chain?
            else
                fs->fat_buffer_head = NULL;
    5fa7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    5faa:	c7 80 54 02 00 00 00 	mov    DWORD PTR [eax+0x254],0x0
    5fb1:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:139
        }

        last = pcur;
    5fb4:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5fb7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:140
        pcur = pcur->next;
    5fba:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5fbd:	8b 80 0c 02 00 00    	mov    eax,DWORD PTR [eax+0x20c]
    5fc3:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:122
{
    struct fat_buffer *last = NULL;
    struct fat_buffer *pcur = fs->fat_buffer_head;

    // Itterate through sector buffer list
    while (pcur)
    5fc6:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    5fca:	75 9a                	jne    5f66 <fatfs_fat_read_sector+0x25>
    5fcc:	eb 01                	jmp    5fcf <fatfs_fat_read_sector+0x8e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:126
    {
        // Sector within this buffer?
        if ((sector >= pcur->address) && (sector < (pcur->address + FAT_BUFFER_SECTORS)))
            break;
    5fce:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:144
        last = pcur;
        pcur = pcur->next;
    }

    // We found the sector already in FAT buffer chain
    if (pcur)
    5fcf:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    5fd3:	74 29                	je     5ffe <fatfs_fat_read_sector+0xbd>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:146
    {
        pcur->ptr = (uint8 *)(pcur->sector + ((sector - pcur->address) * FAT_SECTOR_SIZE));
    5fd5:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    5fd8:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5fdb:	8b 80 00 02 00 00    	mov    eax,DWORD PTR [eax+0x200]
    5fe1:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
    5fe4:	29 c1                	sub    ecx,eax
    5fe6:	89 c8                	mov    eax,ecx
    5fe8:	c1 e0 09             	shl    eax,0x9
    5feb:	01 c2                	add    edx,eax
    5fed:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5ff0:	89 90 08 02 00 00    	mov    DWORD PTR [eax+0x208],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:147
        return pcur;
    5ff6:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    5ff9:	e9 9e 00 00 00       	jmp    609c <fatfs_fat_read_sector+0x15b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:151
    }

    // Else, we removed the last item from the list
    pcur = last;
    5ffe:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    6001:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:154

    // Add to start of sector buffer list (now newest sector)
    pcur->next = fs->fat_buffer_head;
    6004:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6007:	8b 90 54 02 00 00    	mov    edx,DWORD PTR [eax+0x254]
    600d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6010:	89 90 0c 02 00 00    	mov    DWORD PTR [eax+0x20c],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:155
    fs->fat_buffer_head = pcur;
    6016:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6019:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    601c:	89 90 54 02 00 00    	mov    DWORD PTR [eax+0x254],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:158

    // Writeback sector if changed
    if (pcur->dirty)
    6022:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6025:	8b 80 04 02 00 00    	mov    eax,DWORD PTR [eax+0x204]
    602b:	85 c0                	test   eax,eax
    602d:	74 1c                	je     604b <fatfs_fat_read_sector+0x10a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:159
        if (!fatfs_fat_writeback(fs, pcur))
    602f:	83 ec 08             	sub    esp,0x8
    6032:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    6035:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6038:	e8 48 fe ff ff       	call   5e85 <fatfs_fat_writeback>
    603d:	83 c4 10             	add    esp,0x10
    6040:	85 c0                	test   eax,eax
    6042:	75 07                	jne    604b <fatfs_fat_read_sector+0x10a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:160
            return 0;
    6044:	b8 00 00 00 00       	mov    eax,0x0
    6049:	eb 51                	jmp    609c <fatfs_fat_read_sector+0x15b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:163

    // Address is now new sector
    pcur->address = sector;
    604b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    604e:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    6051:	89 90 00 02 00 00    	mov    DWORD PTR [eax+0x200],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:166

    // Read next sector
    if (!fs->disk_io.read_media(pcur->address, pcur->sector, FAT_BUFFER_SECTORS))
    6057:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    605a:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
    605d:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
    6060:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    6063:	8b 92 00 02 00 00    	mov    edx,DWORD PTR [edx+0x200]
    6069:	83 ec 04             	sub    esp,0x4
    606c:	6a 01                	push   0x1
    606e:	51                   	push   ecx
    606f:	52                   	push   edx
    6070:	ff d0                	call   eax
    6072:	83 c4 10             	add    esp,0x10
    6075:	85 c0                	test   eax,eax
    6077:	75 14                	jne    608d <fatfs_fat_read_sector+0x14c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:169
    {
        // Read failed, invalidate buffer address
        pcur->address = FAT32_INVALID_CLUSTER;
    6079:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    607c:	c7 80 00 02 00 00 ff 	mov    DWORD PTR [eax+0x200],0xffffffff
    6083:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:170
        return NULL;
    6086:	b8 00 00 00 00       	mov    eax,0x0
    608b:	eb 0f                	jmp    609c <fatfs_fat_read_sector+0x15b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:173
    }

    pcur->ptr = pcur->sector;
    608d:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    6090:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6093:	89 90 08 02 00 00    	mov    DWORD PTR [eax+0x208],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:174
    return pcur;
    6099:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:175
}
    609c:	c9                   	leave  
    609d:	c3                   	ret    

0000609e <fatfs_fat_purge>:
fatfs_fat_purge():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:180
//-----------------------------------------------------------------------------
// fatfs_fat_purge: Purge 'dirty' FAT sectors to disk
//-----------------------------------------------------------------------------
int fatfs_fat_purge(struct fatfs *fs)
{
    609e:	55                   	push   ebp
    609f:	89 e5                	mov    ebp,esp
    60a1:	83 ec 18             	sub    esp,0x18
    60a4:	e8 4d 0e 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    60a9:	05 7f 4e 00 00       	add    eax,0x4e7f
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:181
    struct fat_buffer *pcur = fs->fat_buffer_head;
    60ae:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    60b1:	8b 80 54 02 00 00    	mov    eax,DWORD PTR [eax+0x254]
    60b7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:184

    // Itterate through sector buffer list
    while (pcur)
    60ba:	eb 35                	jmp    60f1 <fatfs_fat_purge+0x53>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:187
    {
        // Writeback sector if changed
        if (pcur->dirty)
    60bc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    60bf:	8b 80 04 02 00 00    	mov    eax,DWORD PTR [eax+0x204]
    60c5:	85 c0                	test   eax,eax
    60c7:	74 1c                	je     60e5 <fatfs_fat_purge+0x47>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:188
            if (!fatfs_fat_writeback(fs, pcur))
    60c9:	83 ec 08             	sub    esp,0x8
    60cc:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    60cf:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    60d2:	e8 ae fd ff ff       	call   5e85 <fatfs_fat_writeback>
    60d7:	83 c4 10             	add    esp,0x10
    60da:	85 c0                	test   eax,eax
    60dc:	75 07                	jne    60e5 <fatfs_fat_purge+0x47>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:189
                return 0;
    60de:	b8 00 00 00 00       	mov    eax,0x0
    60e3:	eb 17                	jmp    60fc <fatfs_fat_purge+0x5e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:191

        pcur = pcur->next;
    60e5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    60e8:	8b 80 0c 02 00 00    	mov    eax,DWORD PTR [eax+0x20c]
    60ee:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:184
int fatfs_fat_purge(struct fatfs *fs)
{
    struct fat_buffer *pcur = fs->fat_buffer_head;

    // Itterate through sector buffer list
    while (pcur)
    60f1:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    60f5:	75 c5                	jne    60bc <fatfs_fat_purge+0x1e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:194
                return 0;

        pcur = pcur->next;
    }

    return 1;
    60f7:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:195
}
    60fc:	c9                   	leave  
    60fd:	c3                   	ret    

000060fe <fatfs_find_next_cluster>:
fatfs_find_next_cluster():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:206
//-----------------------------------------------------------------------------
// fatfs_find_next_cluster: Return cluster number of next cluster in chain by
// reading FAT table and traversing it. Return 0xffffffff for end of chain.
//-----------------------------------------------------------------------------
uint32 fatfs_find_next_cluster(struct fatfs *fs, uint32 current_cluster)
{
    60fe:	55                   	push   ebp
    60ff:	89 e5                	mov    ebp,esp
    6101:	83 ec 18             	sub    esp,0x18
    6104:	e8 ed 0d 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    6109:	05 1f 4e 00 00       	add    eax,0x4e1f
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:212
    uint32 fat_sector_offset, position;
    uint32 nextcluster;
    struct fat_buffer *pbuf;

    // Why is '..' labelled with cluster 0 when it should be 2 ??
    if (current_cluster == 0)
    610e:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    6112:	75 07                	jne    611b <fatfs_find_next_cluster+0x1d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:213
        current_cluster = 2;
    6114:	c7 45 0c 02 00 00 00 	mov    DWORD PTR [ebp+0xc],0x2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:216

    // Find which sector of FAT table to read
    if (fs->fat_type == FAT_TYPE_16)
    611b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    611e:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
    6121:	85 c0                	test   eax,eax
    6123:	75 0b                	jne    6130 <fatfs_find_next_cluster+0x32>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:217
        fat_sector_offset = current_cluster / 256;
    6125:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    6128:	c1 e8 08             	shr    eax,0x8
    612b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    612e:	eb 09                	jmp    6139 <fatfs_find_next_cluster+0x3b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:219
    else
        fat_sector_offset = current_cluster / 128;
    6130:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    6133:	c1 e8 07             	shr    eax,0x7
    6136:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:222

    // Read FAT sector into buffer
    pbuf = fatfs_fat_read_sector(fs, fs->fat_begin_lba+fat_sector_offset);
    6139:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    613c:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
    613f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    6142:	01 d0                	add    eax,edx
    6144:	83 ec 08             	sub    esp,0x8
    6147:	50                   	push   eax
    6148:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    614b:	e8 f1 fd ff ff       	call   5f41 <fatfs_fat_read_sector>
    6150:	83 c4 10             	add    esp,0x10
    6153:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:223
    if (!pbuf)
    6156:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
    615a:	75 0a                	jne    6166 <fatfs_find_next_cluster+0x68>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:224
        return (FAT32_LAST_CLUSTER);
    615c:	b8 ff ff ff ff       	mov    eax,0xffffffff
    6161:	e9 2a 01 00 00       	jmp    6290 <fatfs_find_next_cluster+0x192>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:226

    if (fs->fat_type == FAT_TYPE_16)
    6166:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6169:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
    616c:	85 c0                	test   eax,eax
    616e:	75 71                	jne    61e1 <fatfs_find_next_cluster+0xe3>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:229
    {
        // Find 32 bit entry of current sector relating to cluster number
        position = (current_cluster - (fat_sector_offset * 256)) * 2;
    6170:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    6173:	c1 e0 08             	shl    eax,0x8
    6176:	89 c2                	mov    edx,eax
    6178:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    617b:	29 d0                	sub    eax,edx
    617d:	01 c0                	add    eax,eax
    617f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:232

        // Read Next Clusters value from Sector Buffer
        nextcluster = FAT16_GET_16BIT_WORD(pbuf, (uint16)position);
    6182:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    6185:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    618b:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    618e:	0f b7 d2             	movzx  edx,dx
    6191:	83 c2 01             	add    edx,0x1
    6194:	01 d0                	add    eax,edx
    6196:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    6199:	0f b6 c0             	movzx  eax,al
    619c:	c1 e0 08             	shl    eax,0x8
    619f:	89 c1                	mov    ecx,eax
    61a1:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    61a4:	8b 90 08 02 00 00    	mov    edx,DWORD PTR [eax+0x208]
    61aa:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    61ad:	0f b7 c0             	movzx  eax,ax
    61b0:	01 d0                	add    eax,edx
    61b2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    61b5:	0f b6 c0             	movzx  eax,al
    61b8:	01 c8                	add    eax,ecx
    61ba:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:235

        // If end of chain found
        if (nextcluster >= 0xFFF8 && nextcluster <= 0xFFFF)
    61bd:	81 7d f0 f7 ff 00 00 	cmp    DWORD PTR [ebp-0x10],0xfff7
    61c4:	0f 86 c3 00 00 00    	jbe    628d <fatfs_find_next_cluster+0x18f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:235 (discriminator 1)
    61ca:	81 7d f0 ff ff 00 00 	cmp    DWORD PTR [ebp-0x10],0xffff
    61d1:	0f 87 b6 00 00 00    	ja     628d <fatfs_find_next_cluster+0x18f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:236
            return (FAT32_LAST_CLUSTER);
    61d7:	b8 ff ff ff ff       	mov    eax,0xffffffff
    61dc:	e9 af 00 00 00       	jmp    6290 <fatfs_find_next_cluster+0x192>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:241
    }
    else
    {
        // Find 32 bit entry of current sector relating to cluster number
        position = (current_cluster - (fat_sector_offset * 128)) * 4;
    61e1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    61e4:	c1 e0 07             	shl    eax,0x7
    61e7:	89 c2                	mov    edx,eax
    61e9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    61ec:	29 d0                	sub    eax,edx
    61ee:	c1 e0 02             	shl    eax,0x2
    61f1:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:244

        // Read Next Clusters value from Sector Buffer
        nextcluster = FAT32_GET_32BIT_WORD(pbuf, (uint16)position);
    61f4:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    61f7:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    61fd:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    6200:	0f b7 d2             	movzx  edx,dx
    6203:	83 c2 03             	add    edx,0x3
    6206:	01 d0                	add    eax,edx
    6208:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    620b:	0f b6 c0             	movzx  eax,al
    620e:	c1 e0 18             	shl    eax,0x18
    6211:	89 c1                	mov    ecx,eax
    6213:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    6216:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    621c:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    621f:	0f b7 d2             	movzx  edx,dx
    6222:	83 c2 02             	add    edx,0x2
    6225:	01 d0                	add    eax,edx
    6227:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    622a:	0f b6 c0             	movzx  eax,al
    622d:	c1 e0 10             	shl    eax,0x10
    6230:	01 c1                	add    ecx,eax
    6232:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    6235:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    623b:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    623e:	0f b7 d2             	movzx  edx,dx
    6241:	83 c2 01             	add    edx,0x1
    6244:	01 d0                	add    eax,edx
    6246:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    6249:	0f b6 c0             	movzx  eax,al
    624c:	c1 e0 08             	shl    eax,0x8
    624f:	01 c1                	add    ecx,eax
    6251:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    6254:	8b 90 08 02 00 00    	mov    edx,DWORD PTR [eax+0x208]
    625a:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    625d:	0f b7 c0             	movzx  eax,ax
    6260:	01 d0                	add    eax,edx
    6262:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    6265:	0f b6 c0             	movzx  eax,al
    6268:	01 c8                	add    eax,ecx
    626a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:247

        // Mask out MS 4 bits (its 28bit addressing)
        nextcluster = nextcluster & 0x0FFFFFFF;
    626d:	81 65 f0 ff ff ff 0f 	and    DWORD PTR [ebp-0x10],0xfffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:250

        // If end of chain found
        if (nextcluster >= 0x0FFFFFF8 && nextcluster <= 0x0FFFFFFF)
    6274:	81 7d f0 f7 ff ff 0f 	cmp    DWORD PTR [ebp-0x10],0xffffff7
    627b:	76 10                	jbe    628d <fatfs_find_next_cluster+0x18f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:250 (discriminator 1)
    627d:	81 7d f0 ff ff ff 0f 	cmp    DWORD PTR [ebp-0x10],0xfffffff
    6284:	77 07                	ja     628d <fatfs_find_next_cluster+0x18f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:251
            return (FAT32_LAST_CLUSTER);
    6286:	b8 ff ff ff ff       	mov    eax,0xffffffff
    628b:	eb 03                	jmp    6290 <fatfs_find_next_cluster+0x192>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:255
    }

    // Else return next cluster
    return (nextcluster);
    628d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:256
}
    6290:	c9                   	leave  
    6291:	c3                   	ret    

00006292 <fatfs_set_fs_info_next_free_cluster>:
fatfs_set_fs_info_next_free_cluster():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:261
//-----------------------------------------------------------------------------
// fatfs_set_fs_info_next_free_cluster: Write the next free cluster to the FSINFO table
//-----------------------------------------------------------------------------
void fatfs_set_fs_info_next_free_cluster(struct fatfs *fs, uint32 newValue)
{
    6292:	55                   	push   ebp
    6293:	89 e5                	mov    ebp,esp
    6295:	83 ec 18             	sub    esp,0x18
    6298:	e8 59 0c 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    629d:	05 8b 4c 00 00       	add    eax,0x4c8b
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:262
    if (fs->fat_type == FAT_TYPE_16)
    62a2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    62a5:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
    62a8:	85 c0                	test   eax,eax
    62aa:	0f 84 de 00 00 00    	je     638e <fatfs_set_fs_info_next_free_cluster+0xfc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:267
        ;
    else
    {
        // Load sector to change it
        struct fat_buffer *pbuf = fatfs_fat_read_sector(fs, fs->lba_begin+fs->fs_info_sector);
    62b0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    62b3:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
    62b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    62b9:	0f b7 40 18          	movzx  eax,WORD PTR [eax+0x18]
    62bd:	0f b7 c0             	movzx  eax,ax
    62c0:	01 d0                	add    eax,edx
    62c2:	83 ec 08             	sub    esp,0x8
    62c5:	50                   	push   eax
    62c6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    62c9:	e8 73 fc ff ff       	call   5f41 <fatfs_fat_read_sector>
    62ce:	83 c4 10             	add    esp,0x10
    62d1:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:268
        if (!pbuf)
    62d4:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    62d8:	0f 84 af 00 00 00    	je     638d <fatfs_set_fs_info_next_free_cluster+0xfb>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:272
            return ;

        // Change
        FAT32_SET_32BIT_WORD(pbuf, 492, newValue);
    62de:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    62e1:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    62e7:	05 ec 01 00 00       	add    eax,0x1ec
    62ec:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    62ef:	88 10                	mov    BYTE PTR [eax],dl
    62f1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    62f4:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    62fa:	05 ed 01 00 00       	add    eax,0x1ed
    62ff:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    6302:	c1 ea 08             	shr    edx,0x8
    6305:	88 10                	mov    BYTE PTR [eax],dl
    6307:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    630a:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    6310:	05 ee 01 00 00       	add    eax,0x1ee
    6315:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    6318:	c1 ea 10             	shr    edx,0x10
    631b:	88 10                	mov    BYTE PTR [eax],dl
    631d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    6320:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    6326:	05 ef 01 00 00       	add    eax,0x1ef
    632b:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    632e:	c1 ea 18             	shr    edx,0x18
    6331:	88 10                	mov    BYTE PTR [eax],dl
    6333:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    6336:	c7 80 04 02 00 00 01 	mov    DWORD PTR [eax+0x204],0x1
    633d:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:273
        fs->next_free_cluster = newValue;
    6340:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6343:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    6346:	89 50 24             	mov    DWORD PTR [eax+0x24],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:276

        // Write back FSINFO sector to disk
        if (fs->disk_io.write_media)
    6349:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    634c:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    634f:	85 c0                	test   eax,eax
    6351:	74 1e                	je     6371 <fatfs_set_fs_info_next_free_cluster+0xdf>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:277
            fs->disk_io.write_media(pbuf->address, pbuf->sector, 1);
    6353:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6356:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    6359:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
    635c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    635f:	8b 92 00 02 00 00    	mov    edx,DWORD PTR [edx+0x200]
    6365:	83 ec 04             	sub    esp,0x4
    6368:	6a 01                	push   0x1
    636a:	51                   	push   ecx
    636b:	52                   	push   edx
    636c:	ff d0                	call   eax
    636e:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:280

        // Invalidate cache entry
        pbuf->address = FAT32_INVALID_CLUSTER;
    6371:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    6374:	c7 80 00 02 00 00 ff 	mov    DWORD PTR [eax+0x200],0xffffffff
    637b:	ff ff ff 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:281
        pbuf->dirty = 0;
    637e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    6381:	c7 80 04 02 00 00 00 	mov    DWORD PTR [eax+0x204],0x0
    6388:	00 00 00 
    638b:	eb 01                	jmp    638e <fatfs_set_fs_info_next_free_cluster+0xfc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:269
    else
    {
        // Load sector to change it
        struct fat_buffer *pbuf = fatfs_fat_read_sector(fs, fs->lba_begin+fs->fs_info_sector);
        if (!pbuf)
            return ;
    638d:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:283

        // Invalidate cache entry
        pbuf->address = FAT32_INVALID_CLUSTER;
        pbuf->dirty = 0;
    }
}
    638e:	c9                   	leave  
    638f:	c3                   	ret    

00006390 <fatfs_find_blank_cluster>:
fatfs_find_blank_cluster():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:289
//-----------------------------------------------------------------------------
// fatfs_find_blank_cluster: Find a free cluster entry by reading the FAT
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fatfs_find_blank_cluster(struct fatfs *fs, uint32 start_cluster, uint32 *free_cluster)
{
    6390:	55                   	push   ebp
    6391:	89 e5                	mov    ebp,esp
    6393:	83 ec 28             	sub    esp,0x28
    6396:	e8 5b 0b 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    639b:	05 8d 4b 00 00       	add    eax,0x4b8d
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:292
    uint32 fat_sector_offset, position;
    uint32 nextcluster;
    uint32 current_cluster = start_cluster;
    63a0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    63a3:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:298
    struct fat_buffer *pbuf;

    do
    {
        // Find which sector of FAT table to read
        if (fs->fat_type == FAT_TYPE_16)
    63a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    63a9:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
    63ac:	85 c0                	test   eax,eax
    63ae:	75 0b                	jne    63bb <fatfs_find_blank_cluster+0x2b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:299
            fat_sector_offset = current_cluster / 256;
    63b0:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    63b3:	c1 e8 08             	shr    eax,0x8
    63b6:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    63b9:	eb 09                	jmp    63c4 <fatfs_find_blank_cluster+0x34>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:301
        else
            fat_sector_offset = current_cluster / 128;
    63bb:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    63be:	c1 e8 07             	shr    eax,0x7
    63c1:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:303

        if ( fat_sector_offset < fs->fat_sectors)
    63c4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    63c7:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    63ca:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    63cd:	0f 86 28 01 00 00    	jbe    64fb <fatfs_find_blank_cluster+0x16b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:306
        {
            // Read FAT sector into buffer
            pbuf = fatfs_fat_read_sector(fs, fs->fat_begin_lba+fat_sector_offset);
    63d3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    63d6:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
    63d9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    63dc:	01 d0                	add    eax,edx
    63de:	83 ec 08             	sub    esp,0x8
    63e1:	50                   	push   eax
    63e2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    63e5:	e8 57 fb ff ff       	call   5f41 <fatfs_fat_read_sector>
    63ea:	83 c4 10             	add    esp,0x10
    63ed:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:307
            if (!pbuf)
    63f0:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
    63f4:	75 0a                	jne    6400 <fatfs_find_blank_cluster+0x70>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:308
                return 0;
    63f6:	b8 00 00 00 00       	mov    eax,0x0
    63fb:	e9 19 01 00 00       	jmp    6519 <fatfs_find_blank_cluster+0x189>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:310

            if (fs->fat_type == FAT_TYPE_16)
    6400:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6403:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
    6406:	85 c0                	test   eax,eax
    6408:	75 52                	jne    645c <fatfs_find_blank_cluster+0xcc>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:313
            {
                // Find 32 bit entry of current sector relating to cluster number
                position = (current_cluster - (fat_sector_offset * 256)) * 2;
    640a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    640d:	c1 e0 08             	shl    eax,0x8
    6410:	89 c2                	mov    edx,eax
    6412:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    6415:	29 d0                	sub    eax,edx
    6417:	01 c0                	add    eax,eax
    6419:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:316

                // Read Next Clusters value from Sector Buffer
                nextcluster = FAT16_GET_16BIT_WORD(pbuf, (uint16)position);
    641c:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    641f:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    6425:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
    6428:	0f b7 d2             	movzx  edx,dx
    642b:	83 c2 01             	add    edx,0x1
    642e:	01 d0                	add    eax,edx
    6430:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    6433:	0f b6 c0             	movzx  eax,al
    6436:	c1 e0 08             	shl    eax,0x8
    6439:	89 c1                	mov    ecx,eax
    643b:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    643e:	8b 90 08 02 00 00    	mov    edx,DWORD PTR [eax+0x208]
    6444:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    6447:	0f b7 c0             	movzx  eax,ax
    644a:	01 d0                	add    eax,edx
    644c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    644f:	0f b6 c0             	movzx  eax,al
    6452:	01 c8                	add    eax,ecx
    6454:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
    6457:	e9 93 00 00 00       	jmp    64ef <fatfs_find_blank_cluster+0x15f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:321
            }
            else
            {
                // Find 32 bit entry of current sector relating to cluster number
                position = (current_cluster - (fat_sector_offset * 128)) * 4;
    645c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    645f:	c1 e0 07             	shl    eax,0x7
    6462:	89 c2                	mov    edx,eax
    6464:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    6467:	29 d0                	sub    eax,edx
    6469:	c1 e0 02             	shl    eax,0x2
    646c:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:324

                // Read Next Clusters value from Sector Buffer
                nextcluster = FAT32_GET_32BIT_WORD(pbuf, (uint16)position);
    646f:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    6472:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    6478:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
    647b:	0f b7 d2             	movzx  edx,dx
    647e:	83 c2 03             	add    edx,0x3
    6481:	01 d0                	add    eax,edx
    6483:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    6486:	0f b6 c0             	movzx  eax,al
    6489:	c1 e0 18             	shl    eax,0x18
    648c:	89 c1                	mov    ecx,eax
    648e:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    6491:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    6497:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
    649a:	0f b7 d2             	movzx  edx,dx
    649d:	83 c2 02             	add    edx,0x2
    64a0:	01 d0                	add    eax,edx
    64a2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    64a5:	0f b6 c0             	movzx  eax,al
    64a8:	c1 e0 10             	shl    eax,0x10
    64ab:	01 c1                	add    ecx,eax
    64ad:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    64b0:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    64b6:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
    64b9:	0f b7 d2             	movzx  edx,dx
    64bc:	83 c2 01             	add    edx,0x1
    64bf:	01 d0                	add    eax,edx
    64c1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    64c4:	0f b6 c0             	movzx  eax,al
    64c7:	c1 e0 08             	shl    eax,0x8
    64ca:	01 c1                	add    ecx,eax
    64cc:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    64cf:	8b 90 08 02 00 00    	mov    edx,DWORD PTR [eax+0x208]
    64d5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    64d8:	0f b7 c0             	movzx  eax,ax
    64db:	01 d0                	add    eax,edx
    64dd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    64e0:	0f b6 c0             	movzx  eax,al
    64e3:	01 c8                	add    eax,ecx
    64e5:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:327

                // Mask out MS 4 bits (its 28bit addressing)
                nextcluster = nextcluster & 0x0FFFFFFF;
    64e8:	81 65 f0 ff ff ff 0f 	and    DWORD PTR [ebp-0x10],0xfffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:330
            }

            if (nextcluster !=0 )
    64ef:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    64f3:	74 0d                	je     6502 <fatfs_find_blank_cluster+0x172>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:331
                current_cluster++;
    64f5:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
    64f9:	eb 07                	jmp    6502 <fatfs_find_blank_cluster+0x172>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:335
        }
        else
            // Otherwise, run out of FAT sectors to check...
            return 0;
    64fb:	b8 00 00 00 00       	mov    eax,0x0
    6500:	eb 17                	jmp    6519 <fatfs_find_blank_cluster+0x189>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:337
    }
    while (nextcluster != 0x0);
    6502:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    6506:	0f 85 9a fe ff ff    	jne    63a6 <fatfs_find_blank_cluster+0x16>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:340

    // Found blank entry
    *free_cluster = current_cluster;
    650c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    650f:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    6512:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:341
    return 1;
    6514:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:342
}
    6519:	c9                   	leave  
    651a:	c3                   	ret    

0000651b <fatfs_fat_set_cluster>:
fatfs_fat_set_cluster():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:350
// fatfs_fat_set_cluster: Set a cluster link in the chain. NOTE: Immediate
// write (slow).
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fatfs_fat_set_cluster(struct fatfs *fs, uint32 cluster, uint32 next_cluster)
{
    651b:	55                   	push   ebp
    651c:	89 e5                	mov    ebp,esp
    651e:	83 ec 18             	sub    esp,0x18
    6521:	e8 d0 09 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    6526:	05 02 4a 00 00       	add    eax,0x4a02
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:355
    struct fat_buffer *pbuf;
    uint32 fat_sector_offset, position;

    // Find which sector of FAT table to read
    if (fs->fat_type == FAT_TYPE_16)
    652b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    652e:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
    6531:	85 c0                	test   eax,eax
    6533:	75 0b                	jne    6540 <fatfs_fat_set_cluster+0x25>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:356
        fat_sector_offset = cluster / 256;
    6535:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    6538:	c1 e8 08             	shr    eax,0x8
    653b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    653e:	eb 09                	jmp    6549 <fatfs_fat_set_cluster+0x2e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:358
    else
        fat_sector_offset = cluster / 128;
    6540:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    6543:	c1 e8 07             	shr    eax,0x7
    6546:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:361

    // Read FAT sector into buffer
    pbuf = fatfs_fat_read_sector(fs, fs->fat_begin_lba+fat_sector_offset);
    6549:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    654c:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
    654f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    6552:	01 d0                	add    eax,edx
    6554:	83 ec 08             	sub    esp,0x8
    6557:	50                   	push   eax
    6558:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    655b:	e8 e1 f9 ff ff       	call   5f41 <fatfs_fat_read_sector>
    6560:	83 c4 10             	add    esp,0x10
    6563:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:362
    if (!pbuf)
    6566:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    656a:	75 0a                	jne    6576 <fatfs_fat_set_cluster+0x5b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:363
        return 0;
    656c:	b8 00 00 00 00       	mov    eax,0x0
    6571:	e9 f2 00 00 00       	jmp    6668 <fatfs_fat_set_cluster+0x14d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:365

    if (fs->fat_type == FAT_TYPE_16)
    6576:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6579:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
    657c:	85 c0                	test   eax,eax
    657e:	75 59                	jne    65d9 <fatfs_fat_set_cluster+0xbe>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:368
    {
        // Find 16 bit entry of current sector relating to cluster number
        position = (cluster - (fat_sector_offset * 256)) * 2;
    6580:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    6583:	c1 e0 08             	shl    eax,0x8
    6586:	89 c2                	mov    edx,eax
    6588:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    658b:	29 d0                	sub    eax,edx
    658d:	01 c0                	add    eax,eax
    658f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:371

        // Write Next Clusters value to Sector Buffer
        FAT16_SET_16BIT_WORD(pbuf, (uint16)position, ((uint16)next_cluster));
    6592:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6595:	8b 90 08 02 00 00    	mov    edx,DWORD PTR [eax+0x208]
    659b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    659e:	0f b7 c0             	movzx  eax,ax
    65a1:	01 d0                	add    eax,edx
    65a3:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    65a6:	88 10                	mov    BYTE PTR [eax],dl
    65a8:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    65ab:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    65b1:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    65b4:	0f b7 d2             	movzx  edx,dx
    65b7:	83 c2 01             	add    edx,0x1
    65ba:	01 d0                	add    eax,edx
    65bc:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    65bf:	0f b7 d2             	movzx  edx,dx
    65c2:	c1 fa 08             	sar    edx,0x8
    65c5:	88 10                	mov    BYTE PTR [eax],dl
    65c7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    65ca:	c7 80 04 02 00 00 01 	mov    DWORD PTR [eax+0x204],0x1
    65d1:	00 00 00 
    65d4:	e9 8a 00 00 00       	jmp    6663 <fatfs_fat_set_cluster+0x148>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:376
    }
    else
    {
        // Find 32 bit entry of current sector relating to cluster number
        position = (cluster - (fat_sector_offset * 128)) * 4;
    65d9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    65dc:	c1 e0 07             	shl    eax,0x7
    65df:	89 c2                	mov    edx,eax
    65e1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    65e4:	29 d0                	sub    eax,edx
    65e6:	c1 e0 02             	shl    eax,0x2
    65e9:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:379

        // Write Next Clusters value to Sector Buffer
        FAT32_SET_32BIT_WORD(pbuf, (uint16)position, next_cluster);
    65ec:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    65ef:	8b 90 08 02 00 00    	mov    edx,DWORD PTR [eax+0x208]
    65f5:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    65f8:	0f b7 c0             	movzx  eax,ax
    65fb:	01 d0                	add    eax,edx
    65fd:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    6600:	88 10                	mov    BYTE PTR [eax],dl
    6602:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6605:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    660b:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    660e:	0f b7 d2             	movzx  edx,dx
    6611:	83 c2 01             	add    edx,0x1
    6614:	01 d0                	add    eax,edx
    6616:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    6619:	c1 ea 08             	shr    edx,0x8
    661c:	88 10                	mov    BYTE PTR [eax],dl
    661e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6621:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    6627:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    662a:	0f b7 d2             	movzx  edx,dx
    662d:	83 c2 02             	add    edx,0x2
    6630:	01 d0                	add    eax,edx
    6632:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    6635:	c1 ea 10             	shr    edx,0x10
    6638:	88 10                	mov    BYTE PTR [eax],dl
    663a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    663d:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    6643:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    6646:	0f b7 d2             	movzx  edx,dx
    6649:	83 c2 03             	add    edx,0x3
    664c:	01 d0                	add    eax,edx
    664e:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    6651:	c1 ea 18             	shr    edx,0x18
    6654:	88 10                	mov    BYTE PTR [eax],dl
    6656:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6659:	c7 80 04 02 00 00 01 	mov    DWORD PTR [eax+0x204],0x1
    6660:	00 00 00 
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:382
    }

    return 1;
    6663:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:383
}
    6668:	c9                   	leave  
    6669:	c3                   	ret    

0000666a <fatfs_free_cluster_chain>:
fatfs_free_cluster_chain():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:390
//-----------------------------------------------------------------------------
// fatfs_free_cluster_chain: Follow a chain marking each element as free
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fatfs_free_cluster_chain(struct fatfs *fs, uint32 start_cluster)
{
    666a:	55                   	push   ebp
    666b:	89 e5                	mov    ebp,esp
    666d:	53                   	push   ebx
    666e:	83 ec 14             	sub    esp,0x14
    6671:	e8 84 08 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    6676:	81 c3 b2 48 00 00    	add    ebx,0x48b2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:392
    uint32 last_cluster;
    uint32 next_cluster = start_cluster;
    667c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    667f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:395

    // Loop until end of chain
    while ( (next_cluster != FAT32_LAST_CLUSTER) && (next_cluster != 0x00000000) )
    6682:	eb 2d                	jmp    66b1 <fatfs_free_cluster_chain+0x47>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:397
    {
        last_cluster = next_cluster;
    6684:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    6687:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:400

        // Find next link
        next_cluster = fatfs_find_next_cluster(fs, next_cluster);
    668a:	83 ec 08             	sub    esp,0x8
    668d:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    6690:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6693:	e8 28 0c 00 00       	call   72c0 <__x86.get_pc_thunk.bx+0x3c6>
    6698:	83 c4 10             	add    esp,0x10
    669b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:403

        // Clear last link
        fatfs_fat_set_cluster(fs, last_cluster, 0x00000000);
    669e:	83 ec 04             	sub    esp,0x4
    66a1:	6a 00                	push   0x0
    66a3:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    66a6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    66a9:	e8 02 0b 00 00       	call   71b0 <__x86.get_pc_thunk.bx+0x2b6>
    66ae:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:395
{
    uint32 last_cluster;
    uint32 next_cluster = start_cluster;

    // Loop until end of chain
    while ( (next_cluster != FAT32_LAST_CLUSTER) && (next_cluster != 0x00000000) )
    66b1:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
    66b5:	74 06                	je     66bd <fatfs_free_cluster_chain+0x53>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:395 (discriminator 1)
    66b7:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    66bb:	75 c7                	jne    6684 <fatfs_free_cluster_chain+0x1a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:406

        // Clear last link
        fatfs_fat_set_cluster(fs, last_cluster, 0x00000000);
    }

    return 1;
    66bd:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:407
}
    66c2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    66c5:	c9                   	leave  
    66c6:	c3                   	ret    

000066c7 <fatfs_fat_add_cluster_to_chain>:
fatfs_fat_add_cluster_to_chain():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:415
// fatfs_fat_add_cluster_to_chain: Follow a chain marking and then add a new entry
// to the current tail.
//-----------------------------------------------------------------------------
#if FATFS_INC_WRITE_SUPPORT
int fatfs_fat_add_cluster_to_chain(struct fatfs *fs, uint32 start_cluster, uint32 newEntry)
{
    66c7:	55                   	push   ebp
    66c8:	89 e5                	mov    ebp,esp
    66ca:	53                   	push   ebx
    66cb:	83 ec 14             	sub    esp,0x14
    66ce:	e8 27 08 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    66d3:	81 c3 55 48 00 00    	add    ebx,0x4855
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:416
    uint32 last_cluster = FAT32_LAST_CLUSTER;
    66d9:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:417
    uint32 next_cluster = start_cluster;
    66e0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    66e3:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:419

    if (start_cluster == FAT32_LAST_CLUSTER)
    66e6:	83 7d 0c ff          	cmp    DWORD PTR [ebp+0xc],0xffffffff
    66ea:	75 2e                	jne    671a <fatfs_fat_add_cluster_to_chain+0x53>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:420
        return 0;
    66ec:	b8 00 00 00 00       	mov    eax,0x0
    66f1:	eb 59                	jmp    674c <fatfs_fat_add_cluster_to_chain+0x85>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:425

    // Loop until end of chain
    while ( next_cluster != FAT32_LAST_CLUSTER )
    {
        last_cluster = next_cluster;
    66f3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    66f6:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:428

        // Find next link
        next_cluster = fatfs_find_next_cluster(fs, next_cluster);
    66f9:	83 ec 08             	sub    esp,0x8
    66fc:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    66ff:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6702:	e8 b9 0b 00 00       	call   72c0 <__x86.get_pc_thunk.bx+0x3c6>
    6707:	83 c4 10             	add    esp,0x10
    670a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:429
        if (!next_cluster)
    670d:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    6711:	75 07                	jne    671a <fatfs_fat_add_cluster_to_chain+0x53>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:430
            return 0;
    6713:	b8 00 00 00 00       	mov    eax,0x0
    6718:	eb 32                	jmp    674c <fatfs_fat_add_cluster_to_chain+0x85>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:423

    if (start_cluster == FAT32_LAST_CLUSTER)
        return 0;

    // Loop until end of chain
    while ( next_cluster != FAT32_LAST_CLUSTER )
    671a:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
    671e:	75 d3                	jne    66f3 <fatfs_fat_add_cluster_to_chain+0x2c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:434
        if (!next_cluster)
            return 0;
    }

    // Add link in for new cluster
    fatfs_fat_set_cluster(fs, last_cluster, newEntry);
    6720:	83 ec 04             	sub    esp,0x4
    6723:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    6726:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    6729:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    672c:	e8 7f 0a 00 00       	call   71b0 <__x86.get_pc_thunk.bx+0x2b6>
    6731:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:437

    // Mark new cluster as end of chain
    fatfs_fat_set_cluster(fs, newEntry, FAT32_LAST_CLUSTER);
    6734:	83 ec 04             	sub    esp,0x4
    6737:	6a ff                	push   0xffffffff
    6739:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    673c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    673f:	e8 6c 0a 00 00       	call   71b0 <__x86.get_pc_thunk.bx+0x2b6>
    6744:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:439

    return 1;
    6747:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:440
}
    674c:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    674f:	c9                   	leave  
    6750:	c3                   	ret    

00006751 <fatfs_count_free_clusters>:
fatfs_count_free_clusters():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:446
#endif
//-----------------------------------------------------------------------------
// fatfs_count_free_clusters:
//-----------------------------------------------------------------------------
uint32 fatfs_count_free_clusters(struct fatfs *fs)
{
    6751:	55                   	push   ebp
    6752:	89 e5                	mov    ebp,esp
    6754:	83 ec 18             	sub    esp,0x18
    6757:	e8 9a 07 00 00       	call   6ef6 <__x86.get_pc_thunk.ax>
    675c:	05 cc 47 00 00       	add    eax,0x47cc
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:448
    uint32 i,j;
    uint32 count = 0;
    6761:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:451
    struct fat_buffer *pbuf;

    for (i = 0; i < fs->fat_sectors; i++)
    6768:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    676f:	e9 19 01 00 00       	jmp    688d <fatfs_count_free_clusters+0x13c>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:454
    {
        // Read FAT sector into buffer
        pbuf = fatfs_fat_read_sector(fs, fs->fat_begin_lba + i);
    6774:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6777:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
    677a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    677d:	01 d0                	add    eax,edx
    677f:	83 ec 08             	sub    esp,0x8
    6782:	50                   	push   eax
    6783:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6786:	e8 b6 f7 ff ff       	call   5f41 <fatfs_fat_read_sector>
    678b:	83 c4 10             	add    esp,0x10
    678e:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:455
        if (!pbuf)
    6791:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
    6795:	0f 84 03 01 00 00    	je     689e <fatfs_count_free_clusters+0x14d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:458
            break;

        for (j = 0; j < FAT_SECTOR_SIZE; )
    679b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
    67a2:	e9 d5 00 00 00       	jmp    687c <fatfs_count_free_clusters+0x12b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:460
        {
            if (fs->fat_type == FAT_TYPE_16)
    67a7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    67aa:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
    67ad:	85 c0                	test   eax,eax
    67af:	75 49                	jne    67fa <fatfs_count_free_clusters+0xa9>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:462
            {
                if (FAT16_GET_16BIT_WORD(pbuf, (uint16)j) == 0)
    67b1:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    67b4:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    67ba:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    67bd:	0f b7 d2             	movzx  edx,dx
    67c0:	83 c2 01             	add    edx,0x1
    67c3:	01 d0                	add    eax,edx
    67c5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    67c8:	0f b6 c0             	movzx  eax,al
    67cb:	c1 e0 08             	shl    eax,0x8
    67ce:	89 c1                	mov    ecx,eax
    67d0:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    67d3:	8b 90 08 02 00 00    	mov    edx,DWORD PTR [eax+0x208]
    67d9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    67dc:	0f b7 c0             	movzx  eax,ax
    67df:	01 d0                	add    eax,edx
    67e1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    67e4:	0f b6 c0             	movzx  eax,al
    67e7:	01 c8                	add    eax,ecx
    67e9:	85 c0                	test   eax,eax
    67eb:	75 04                	jne    67f1 <fatfs_count_free_clusters+0xa0>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:463
                    count++;
    67ed:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:465

                j += 2;
    67f1:	83 45 f0 02          	add    DWORD PTR [ebp-0x10],0x2
    67f5:	e9 82 00 00 00       	jmp    687c <fatfs_count_free_clusters+0x12b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:469
            }
            else
            {
                if (FAT32_GET_32BIT_WORD(pbuf, (uint16)j) == 0)
    67fa:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    67fd:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    6803:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    6806:	0f b7 d2             	movzx  edx,dx
    6809:	83 c2 03             	add    edx,0x3
    680c:	01 d0                	add    eax,edx
    680e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    6811:	0f b6 c0             	movzx  eax,al
    6814:	c1 e0 18             	shl    eax,0x18
    6817:	89 c1                	mov    ecx,eax
    6819:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    681c:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    6822:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    6825:	0f b7 d2             	movzx  edx,dx
    6828:	83 c2 02             	add    edx,0x2
    682b:	01 d0                	add    eax,edx
    682d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    6830:	0f b6 c0             	movzx  eax,al
    6833:	c1 e0 10             	shl    eax,0x10
    6836:	01 c1                	add    ecx,eax
    6838:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    683b:	8b 80 08 02 00 00    	mov    eax,DWORD PTR [eax+0x208]
    6841:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    6844:	0f b7 d2             	movzx  edx,dx
    6847:	83 c2 01             	add    edx,0x1
    684a:	01 d0                	add    eax,edx
    684c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    684f:	0f b6 c0             	movzx  eax,al
    6852:	c1 e0 08             	shl    eax,0x8
    6855:	01 c1                	add    ecx,eax
    6857:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    685a:	8b 90 08 02 00 00    	mov    edx,DWORD PTR [eax+0x208]
    6860:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6863:	0f b7 c0             	movzx  eax,ax
    6866:	01 d0                	add    eax,edx
    6868:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    686b:	0f b6 c0             	movzx  eax,al
    686e:	01 c8                	add    eax,ecx
    6870:	85 c0                	test   eax,eax
    6872:	75 04                	jne    6878 <fatfs_count_free_clusters+0x127>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:470
                    count++;
    6874:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:472

                j += 4;
    6878:	83 45 f0 04          	add    DWORD PTR [ebp-0x10],0x4
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:458 (discriminator 1)
        // Read FAT sector into buffer
        pbuf = fatfs_fat_read_sector(fs, fs->fat_begin_lba + i);
        if (!pbuf)
            break;

        for (j = 0; j < FAT_SECTOR_SIZE; )
    687c:	81 7d f0 ff 01 00 00 	cmp    DWORD PTR [ebp-0x10],0x1ff
    6883:	0f 86 1e ff ff ff    	jbe    67a7 <fatfs_count_free_clusters+0x56>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:451 (discriminator 2)
{
    uint32 i,j;
    uint32 count = 0;
    struct fat_buffer *pbuf;

    for (i = 0; i < fs->fat_sectors; i++)
    6889:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:451 (discriminator 1)
    688d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6890:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    6893:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
    6896:	0f 87 d8 fe ff ff    	ja     6774 <fatfs_count_free_clusters+0x23>
    689c:	eb 01                	jmp    689f <fatfs_count_free_clusters+0x14e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:456
    {
        // Read FAT sector into buffer
        pbuf = fatfs_fat_read_sector(fs, fs->fat_begin_lba + i);
        if (!pbuf)
            break;
    689e:	90                   	nop
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:477
                j += 4;
            }
        }
    }

    return count;
    689f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_table.c:478
}
    68a2:	c9                   	leave  
    68a3:	c3                   	ret    

000068a4 <fatfs_add_free_space>:
fatfs_add_free_space():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:46
//-----------------------------------------------------------------------------
// fatfs_add_free_space: Allocate another cluster of free space to the end
// of a files cluster chain.
//-----------------------------------------------------------------------------
int fatfs_add_free_space(struct fatfs *fs, uint32 *startCluster, uint32 clusters)
{
    68a4:	55                   	push   ebp
    68a5:	89 e5                	mov    ebp,esp
    68a7:	53                   	push   ebx
    68a8:	83 ec 14             	sub    esp,0x14
    68ab:	e8 4a 06 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    68b0:	81 c3 78 46 00 00    	add    ebx,0x4678
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:49
    uint32 i;
    uint32 nextcluster;
    uint32 start = *startCluster;
    68b6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    68b9:	8b 00                	mov    eax,DWORD PTR [eax]
    68bb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:52

    // Set the next free cluster hint to unknown
    if (fs->next_free_cluster != FAT32_LAST_CLUSTER)
    68be:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    68c1:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
    68c4:	83 f8 ff             	cmp    eax,0xffffffff
    68c7:	74 10                	je     68d9 <fatfs_add_free_space+0x35>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:53
        fatfs_set_fs_info_next_free_cluster(fs, FAT32_LAST_CLUSTER);
    68c9:	83 ec 08             	sub    esp,0x8
    68cc:	6a ff                	push   0xffffffff
    68ce:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    68d1:	e8 ea 07 00 00       	call   70c0 <__x86.get_pc_thunk.bx+0x1c6>
    68d6:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:55

    for (i=0;i<clusters;i++)
    68d9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    68e0:	eb 67                	jmp    6949 <fatfs_add_free_space+0xa5>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:58
    {
        // Start looking for free clusters from the beginning
        if (fatfs_find_blank_cluster(fs, fs->rootdir_first_cluster, &nextcluster))
    68e2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    68e5:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    68e8:	83 ec 04             	sub    esp,0x4
    68eb:	8d 55 ec             	lea    edx,[ebp-0x14]
    68ee:	52                   	push   edx
    68ef:	50                   	push   eax
    68f0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    68f3:	e8 98 06 00 00       	call   6f90 <__x86.get_pc_thunk.bx+0x96>
    68f8:	83 c4 10             	add    esp,0x10
    68fb:	85 c0                	test   eax,eax
    68fd:	74 3f                	je     693e <fatfs_add_free_space+0x9a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:61
        {
            // Point last to this
            fatfs_fat_set_cluster(fs, start, nextcluster);
    68ff:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    6902:	83 ec 04             	sub    esp,0x4
    6905:	50                   	push   eax
    6906:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    6909:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    690c:	e8 9f 08 00 00       	call   71b0 <__x86.get_pc_thunk.bx+0x2b6>
    6911:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:64

            // Point this to end of file
            fatfs_fat_set_cluster(fs, nextcluster, FAT32_LAST_CLUSTER);
    6914:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    6917:	83 ec 04             	sub    esp,0x4
    691a:	6a ff                	push   0xffffffff
    691c:	50                   	push   eax
    691d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6920:	e8 8b 08 00 00       	call   71b0 <__x86.get_pc_thunk.bx+0x2b6>
    6925:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:67

            // Adjust argument reference
            start = nextcluster;
    6928:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    692b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:68
            if (i == 0)
    692e:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    6932:	75 11                	jne    6945 <fatfs_add_free_space+0xa1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:69
                *startCluster = nextcluster;
    6934:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    6937:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    693a:	89 10                	mov    DWORD PTR [eax],edx
    693c:	eb 07                	jmp    6945 <fatfs_add_free_space+0xa1>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:72
        }
        else
            return 0;
    693e:	b8 00 00 00 00       	mov    eax,0x0
    6943:	eb 11                	jmp    6956 <fatfs_add_free_space+0xb2>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:55 (discriminator 2)

    // Set the next free cluster hint to unknown
    if (fs->next_free_cluster != FAT32_LAST_CLUSTER)
        fatfs_set_fs_info_next_free_cluster(fs, FAT32_LAST_CLUSTER);

    for (i=0;i<clusters;i++)
    6945:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:55 (discriminator 1)
    6949:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    694c:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
    694f:	72 91                	jb     68e2 <fatfs_add_free_space+0x3e>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:75
        }
        else
            return 0;
    }

    return 1;
    6951:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:76 (discriminator 1)
}
    6956:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    6959:	c9                   	leave  
    695a:	c3                   	ret    

0000695b <fatfs_allocate_free_space>:
fatfs_allocate_free_space():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:83
// fatfs_allocate_free_space: Add an ammount of free space to a file either from
// 'startCluster' if newFile = false, or allocating a new start to the chain if
// newFile = true.
//-----------------------------------------------------------------------------
int fatfs_allocate_free_space(struct fatfs *fs, int newFile, uint32 *startCluster, uint32 size)
{
    695b:	55                   	push   ebp
    695c:	89 e5                	mov    ebp,esp
    695e:	53                   	push   ebx
    695f:	83 ec 14             	sub    esp,0x14
    6962:	e8 93 05 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    6967:	81 c3 c1 45 00 00    	add    ebx,0x45c1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:88
    uint32 clusterSize;
    uint32 clusterCount;
    uint32 nextcluster;

    if (size==0)
    696d:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
    6971:	75 0a                	jne    697d <fatfs_allocate_free_space+0x22>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:89
        return 0;
    6973:	b8 00 00 00 00       	mov    eax,0x0
    6978:	e9 c8 00 00 00       	jmp    6a45 <fatfs_allocate_free_space+0xea>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:92

    // Set the next free cluster hint to unknown
    if (fs->next_free_cluster != FAT32_LAST_CLUSTER)
    697d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6980:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
    6983:	83 f8 ff             	cmp    eax,0xffffffff
    6986:	74 10                	je     6998 <fatfs_allocate_free_space+0x3d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:93
        fatfs_set_fs_info_next_free_cluster(fs, FAT32_LAST_CLUSTER);
    6988:	83 ec 08             	sub    esp,0x8
    698b:	6a ff                	push   0xffffffff
    698d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6990:	e8 2b 07 00 00       	call   70c0 <__x86.get_pc_thunk.bx+0x1c6>
    6995:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:96

    // Work out size and clusters
    clusterSize = fs->sectors_per_cluster * FAT_SECTOR_SIZE;
    6998:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    699b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    699e:	0f b6 c0             	movzx  eax,al
    69a1:	c1 e0 09             	shl    eax,0x9
    69a4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:97
    clusterCount = (size / clusterSize);
    69a7:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    69aa:	ba 00 00 00 00       	mov    edx,0x0
    69af:	f7 75 f0             	div    DWORD PTR [ebp-0x10]
    69b2:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:100

    // If any left over
    if (size-(clusterSize*clusterCount))
    69b5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    69b8:	0f af 45 f4          	imul   eax,DWORD PTR [ebp-0xc]
    69bc:	3b 45 14             	cmp    eax,DWORD PTR [ebp+0x14]
    69bf:	74 04                	je     69c5 <fatfs_allocate_free_space+0x6a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:101
        clusterCount++;
    69c1:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:104

    // Allocated first link in the chain if a new file
    if (newFile)
    69c5:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
    69c9:	74 4d                	je     6a18 <fatfs_allocate_free_space+0xbd>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:106
    {
        if (!fatfs_find_blank_cluster(fs, fs->rootdir_first_cluster, &nextcluster))
    69cb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    69ce:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    69d1:	83 ec 04             	sub    esp,0x4
    69d4:	8d 55 ec             	lea    edx,[ebp-0x14]
    69d7:	52                   	push   edx
    69d8:	50                   	push   eax
    69d9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    69dc:	e8 af 05 00 00       	call   6f90 <__x86.get_pc_thunk.bx+0x96>
    69e1:	83 c4 10             	add    esp,0x10
    69e4:	85 c0                	test   eax,eax
    69e6:	75 07                	jne    69ef <fatfs_allocate_free_space+0x94>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:107
            return 0;
    69e8:	b8 00 00 00 00       	mov    eax,0x0
    69ed:	eb 56                	jmp    6a45 <fatfs_allocate_free_space+0xea>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:110

        // If this is all that is needed then all done
        if (clusterCount==1)
    69ef:	83 7d f4 01          	cmp    DWORD PTR [ebp-0xc],0x1
    69f3:	75 2b                	jne    6a20 <fatfs_allocate_free_space+0xc5>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:112
        {
            fatfs_fat_set_cluster(fs, nextcluster, FAT32_LAST_CLUSTER);
    69f5:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    69f8:	83 ec 04             	sub    esp,0x4
    69fb:	6a ff                	push   0xffffffff
    69fd:	50                   	push   eax
    69fe:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6a01:	e8 aa 07 00 00       	call   71b0 <__x86.get_pc_thunk.bx+0x2b6>
    6a06:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:113
            *startCluster = nextcluster;
    6a09:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    6a0c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    6a0f:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:114
            return 1;
    6a11:	b8 01 00 00 00       	mov    eax,0x1
    6a16:	eb 2d                	jmp    6a45 <fatfs_allocate_free_space+0xea>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:119
        }
    }
    // Allocate from end of current chain (startCluster is end of chain)
    else
        nextcluster = *startCluster;
    6a18:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    6a1b:	8b 00                	mov    eax,DWORD PTR [eax]
    6a1d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:121

    if (!fatfs_add_free_space(fs, &nextcluster, clusterCount))
    6a20:	83 ec 04             	sub    esp,0x4
    6a23:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    6a26:	8d 45 ec             	lea    eax,[ebp-0x14]
    6a29:	50                   	push   eax
    6a2a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6a2d:	e8 6e 06 00 00       	call   70a0 <__x86.get_pc_thunk.bx+0x1a6>
    6a32:	83 c4 10             	add    esp,0x10
    6a35:	85 c0                	test   eax,eax
    6a37:	75 07                	jne    6a40 <fatfs_allocate_free_space+0xe5>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:122
            return 0;
    6a39:	b8 00 00 00 00       	mov    eax,0x0
    6a3e:	eb 05                	jmp    6a45 <fatfs_allocate_free_space+0xea>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:124

    return 1;
    6a40:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:125 (discriminator 1)
}
    6a45:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    6a48:	c9                   	leave  
    6a49:	c3                   	ret    

00006a4a <fatfs_find_free_dir_offset>:
fatfs_find_free_dir_offset():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:131
//-----------------------------------------------------------------------------
// fatfs_find_free_dir_offset: Find a free space in the directory for a new entry
// which takes up 'entryCount' blocks (or allocate some more)
//-----------------------------------------------------------------------------
static int fatfs_find_free_dir_offset(struct fatfs *fs, uint32 dirCluster, int entryCount, uint32 *pSector, uint8 *pOffset)
{
    6a4a:	55                   	push   ebp
    6a4b:	89 e5                	mov    ebp,esp
    6a4d:	53                   	push   ebx
    6a4e:	83 ec 24             	sub    esp,0x24
    6a51:	e8 a4 04 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    6a56:	81 c3 d2 44 00 00    	add    ebx,0x44d2
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:133
    struct fat_dir_entry *directoryEntry;
    uint8 item=0;
    6a5c:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:134
    uint16 recordoffset = 0;
    6a60:	66 c7 45 e6 00 00    	mov    WORD PTR [ebp-0x1a],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:135
    uint8 i=0;
    6a66:	c6 45 f6 00          	mov    BYTE PTR [ebp-0xa],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:136
    int x=0;
    6a6a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:137
    int possible_spaces = 0;
    6a71:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:138
    int start_recorded = 0;
    6a78:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:141

    // No entries required?
    if (entryCount == 0)
    6a7f:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
    6a83:	75 0a                	jne    6a8f <fatfs_find_free_dir_offset+0x45>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:142
        return 0;
    6a85:	b8 00 00 00 00       	mov    eax,0x0
    6a8a:	e9 fd 01 00 00       	jmp    6c8c <fatfs_find_free_dir_offset+0x242>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:148

    // Main cluster following loop
    while (1)
    {
        // Read sector
        if (fatfs_sector_reader(fs, dirCluster, x++, 0))
    6a8f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6a92:	8d 50 01             	lea    edx,[eax+0x1]
    6a95:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
    6a98:	6a 00                	push   0x0
    6a9a:	50                   	push   eax
    6a9b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    6a9e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6aa1:	e8 ea 07 00 00       	call   7290 <__x86.get_pc_thunk.bx+0x396>
    6aa6:	83 c4 10             	add    esp,0x10
    6aa9:	85 c0                	test   eax,eax
    6aab:	0f 84 1a 01 00 00    	je     6bcb <fatfs_find_free_dir_offset+0x181>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:151
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
    6ab1:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
    6ab5:	e9 02 01 00 00       	jmp    6bbc <fatfs_find_free_dir_offset+0x172>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:154
            {
                // Create the multiplier for sector access
                recordoffset = FAT_DIR_ENTRY_SIZE * item;
    6aba:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    6abe:	c1 e0 05             	shl    eax,0x5
    6ac1:	66 89 45 e6          	mov    WORD PTR [ebp-0x1a],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:157

                // Overlay directory entry over buffer
                directoryEntry = (struct fat_dir_entry*)(fs->currentsector.sector+recordoffset);
    6ac5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6ac8:	8d 50 44             	lea    edx,[eax+0x44]
    6acb:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
    6acf:	01 d0                	add    eax,edx
    6ad1:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:160

                // LFN Entry
                if (fatfs_entry_lfn_text(directoryEntry))
    6ad4:	83 ec 0c             	sub    esp,0xc
    6ad7:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    6ada:	e8 d1 07 00 00       	call   72b0 <__x86.get_pc_thunk.bx+0x3b6>
    6adf:	83 c4 10             	add    esp,0x10
    6ae2:	85 c0                	test   eax,eax
    6ae4:	74 2c                	je     6b12 <fatfs_find_free_dir_offset+0xc8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:163
                {
                    // First entry?
                    if (possible_spaces == 0)
    6ae6:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
    6aea:	75 1d                	jne    6b09 <fatfs_find_free_dir_offset+0xbf>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:166
                    {
                        // Store start
                        *pSector = x-1;
    6aec:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6aef:	83 e8 01             	sub    eax,0x1
    6af2:	89 c2                	mov    edx,eax
    6af4:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    6af7:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:167
                        *pOffset = item;
    6af9:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
    6afc:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
    6b00:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:168
                        start_recorded = 1;
    6b02:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:173
                    }

                    // Increment the count in-case the file turns
                    // out to be deleted...
                    possible_spaces++;
    6b09:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
    6b0d:	e9 a0 00 00 00       	jmp    6bb2 <fatfs_find_free_dir_offset+0x168>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:179
                }
                // SFN Entry
                else
                {
                    // Has file been deleted?
                    if (fs->currentsector.sector[recordoffset] == FILE_HEADER_DELETED)
    6b12:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
    6b16:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    6b19:	0f b6 44 02 44       	movzx  eax,BYTE PTR [edx+eax*1+0x44]
    6b1e:	3c e5                	cmp    al,0xe5
    6b20:	75 39                	jne    6b5b <fatfs_find_free_dir_offset+0x111>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:182
                    {
                        // First entry?
                        if (possible_spaces == 0)
    6b22:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
    6b26:	75 1d                	jne    6b45 <fatfs_find_free_dir_offset+0xfb>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:185
                        {
                            // Store start
                            *pSector = x-1;
    6b28:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6b2b:	83 e8 01             	sub    eax,0x1
    6b2e:	89 c2                	mov    edx,eax
    6b30:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    6b33:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:186
                            *pOffset = item;
    6b35:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
    6b38:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
    6b3c:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:187
                            start_recorded = 1;
    6b3e:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:190
                        }

                        possible_spaces++;
    6b45:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:193

                        // We have found enough space?
                        if (possible_spaces >= entryCount)
    6b49:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    6b4c:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
    6b4f:	7c 61                	jl     6bb2 <fatfs_find_free_dir_offset+0x168>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:194
                            return 1;
    6b51:	b8 01 00 00 00       	mov    eax,0x1
    6b56:	e9 31 01 00 00       	jmp    6c8c <fatfs_find_free_dir_offset+0x242>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:199

                        // Else continue counting until we find a valid entry!
                    }
                    // Is the file entry empty?
                    else if (fs->currentsector.sector[recordoffset] == FILE_HEADER_BLANK)
    6b5b:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
    6b5f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    6b62:	0f b6 44 02 44       	movzx  eax,BYTE PTR [edx+eax*1+0x44]
    6b67:	84 c0                	test   al,al
    6b69:	75 39                	jne    6ba4 <fatfs_find_free_dir_offset+0x15a>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:202
                    {
                        // First entry?
                        if (possible_spaces == 0)
    6b6b:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
    6b6f:	75 1d                	jne    6b8e <fatfs_find_free_dir_offset+0x144>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:205
                        {
                            // Store start
                            *pSector = x-1;
    6b71:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6b74:	83 e8 01             	sub    eax,0x1
    6b77:	89 c2                	mov    edx,eax
    6b79:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    6b7c:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:206
                            *pOffset = item;
    6b7e:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
    6b81:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
    6b85:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:207
                            start_recorded = 1;
    6b87:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:211
                        }

                        // Increment the blank entries count
                        possible_spaces++;
    6b8e:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:214

                        // We have found enough space?
                        if (possible_spaces >= entryCount)
    6b92:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    6b95:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
    6b98:	7c 18                	jl     6bb2 <fatfs_find_free_dir_offset+0x168>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:215
                            return 1;
    6b9a:	b8 01 00 00 00       	mov    eax,0x1
    6b9f:	e9 e8 00 00 00       	jmp    6c8c <fatfs_find_free_dir_offset+0x242>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:221
                    }
                    // File entry is valid
                    else
                    {
                        // Reset all flags
                        possible_spaces = 0;
    6ba4:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:222
                        start_recorded = 0;
    6bab:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:151 (discriminator 2)
    {
        // Read sector
        if (fatfs_sector_reader(fs, dirCluster, x++, 0))
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
    6bb2:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    6bb6:	83 c0 01             	add    eax,0x1
    6bb9:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:151 (discriminator 1)
    6bbc:	80 7d f7 0f          	cmp    BYTE PTR [ebp-0x9],0xf
    6bc0:	0f 86 f4 fe ff ff    	jbe    6aba <fatfs_find_free_dir_offset+0x70>
    6bc6:	e9 c4 fe ff ff       	jmp    6a8f <fatfs_find_free_dir_offset+0x45>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:233
        else
        {
            uint32 newCluster;

            // Get a new cluster for directory
            if (!fatfs_find_blank_cluster(fs, fs->rootdir_first_cluster, &newCluster))
    6bcb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6bce:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    6bd1:	83 ec 04             	sub    esp,0x4
    6bd4:	8d 55 dc             	lea    edx,[ebp-0x24]
    6bd7:	52                   	push   edx
    6bd8:	50                   	push   eax
    6bd9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6bdc:	e8 af 03 00 00       	call   6f90 <__x86.get_pc_thunk.bx+0x96>
    6be1:	83 c4 10             	add    esp,0x10
    6be4:	85 c0                	test   eax,eax
    6be6:	75 0a                	jne    6bf2 <fatfs_find_free_dir_offset+0x1a8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:234
                return 0;
    6be8:	b8 00 00 00 00       	mov    eax,0x0
    6bed:	e9 9a 00 00 00       	jmp    6c8c <fatfs_find_free_dir_offset+0x242>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:237

            // Add cluster to end of directory tree
            if (!fatfs_fat_add_cluster_to_chain(fs, dirCluster, newCluster))
    6bf2:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
    6bf5:	83 ec 04             	sub    esp,0x4
    6bf8:	50                   	push   eax
    6bf9:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    6bfc:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6bff:	e8 5c 03 00 00       	call   6f60 <__x86.get_pc_thunk.bx+0x66>
    6c04:	83 c4 10             	add    esp,0x10
    6c07:	85 c0                	test   eax,eax
    6c09:	75 07                	jne    6c12 <fatfs_find_free_dir_offset+0x1c8>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:238
                return 0;
    6c0b:	b8 00 00 00 00       	mov    eax,0x0
    6c10:	eb 7a                	jmp    6c8c <fatfs_find_free_dir_offset+0x242>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:241

            // Erase new directory cluster
            memset(fs->currentsector.sector, 0x00, FAT_SECTOR_SIZE);
    6c12:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6c15:	83 c0 44             	add    eax,0x44
    6c18:	83 ec 04             	sub    esp,0x4
    6c1b:	68 00 02 00 00       	push   0x200
    6c20:	6a 00                	push   0x0
    6c22:	50                   	push   eax
    6c23:	e8 18 06 00 00       	call   7240 <__x86.get_pc_thunk.bx+0x346>
    6c28:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:242
            for (i=0;i<fs->sectors_per_cluster;i++)
    6c2b:	c6 45 f6 00          	mov    BYTE PTR [ebp-0xa],0x0
    6c2f:	eb 2b                	jmp    6c5c <fatfs_find_free_dir_offset+0x212>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:244
            {
                if (!fatfs_write_sector(fs, newCluster, i, 0))
    6c31:	0f b6 55 f6          	movzx  edx,BYTE PTR [ebp-0xa]
    6c35:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
    6c38:	6a 00                	push   0x0
    6c3a:	52                   	push   edx
    6c3b:	50                   	push   eax
    6c3c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6c3f:	e8 3c 07 00 00       	call   7380 <__x86.get_pc_thunk.bx+0x486>
    6c44:	83 c4 10             	add    esp,0x10
    6c47:	85 c0                	test   eax,eax
    6c49:	75 07                	jne    6c52 <fatfs_find_free_dir_offset+0x208>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:245
                    return 0;
    6c4b:	b8 00 00 00 00       	mov    eax,0x0
    6c50:	eb 3a                	jmp    6c8c <fatfs_find_free_dir_offset+0x242>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:242 (discriminator 2)
            if (!fatfs_fat_add_cluster_to_chain(fs, dirCluster, newCluster))
                return 0;

            // Erase new directory cluster
            memset(fs->currentsector.sector, 0x00, FAT_SECTOR_SIZE);
            for (i=0;i<fs->sectors_per_cluster;i++)
    6c52:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
    6c56:	83 c0 01             	add    eax,0x1
    6c59:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:242 (discriminator 1)
    6c5c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6c5f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    6c62:	3a 45 f6             	cmp    al,BYTE PTR [ebp-0xa]
    6c65:	77 ca                	ja     6c31 <fatfs_find_free_dir_offset+0x1e7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:249
                if (!fatfs_write_sector(fs, newCluster, i, 0))
                    return 0;
            }

            // If non of the name fitted on previous sectors
            if (!start_recorded)
    6c67:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
    6c6b:	75 1a                	jne    6c87 <fatfs_find_free_dir_offset+0x23d>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:252
            {
                // Store start
                *pSector = (x-1);
    6c6d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6c70:	83 e8 01             	sub    eax,0x1
    6c73:	89 c2                	mov    edx,eax
    6c75:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    6c78:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:253
                *pOffset = 0;
    6c7a:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
    6c7d:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:254
                start_recorded = 1;
    6c80:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:257
            }

            return 1;
    6c87:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:262 (discriminator 2)
        }
    } // End of while loop

    return 0;
}
    6c8c:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    6c8f:	c9                   	leave  
    6c90:	c3                   	ret    

00006c91 <fatfs_add_file_entry>:
fatfs_add_file_entry():
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:267
//-----------------------------------------------------------------------------
// fatfs_add_file_entry: Add a directory entry to a location found by FindFreeOffset
//-----------------------------------------------------------------------------
int fatfs_add_file_entry(struct fatfs *fs, uint32 dirCluster, char *filename, char *shortfilename, uint32 startCluster, uint32 size, int dir)
{
    6c91:	55                   	push   ebp
    6c92:	89 e5                	mov    ebp,esp
    6c94:	53                   	push   ebx
    6c95:	83 ec 54             	sub    esp,0x54
    6c98:	e8 5d 02 00 00       	call   6efa <__x86.get_pc_thunk.bx>
    6c9d:	81 c3 8b 42 00 00    	add    ebx,0x428b
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:268
    uint8 item=0;
    6ca3:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:269
    uint16 recordoffset = 0;
    6ca7:	66 c7 45 da 00 00    	mov    WORD PTR [ebp-0x26],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:270
    uint8 i=0;
    6cad:	c6 45 f6 00          	mov    BYTE PTR [ebp-0xa],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:271
    uint32 x=0;
    6cb1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:274
    int entryCount;
    struct fat_dir_entry shortEntry;
    int dirtySector = 0;
    6cb8:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:276

    uint32 dirSector = 0;
    6cbf:	c7 45 b4 00 00 00 00 	mov    DWORD PTR [ebp-0x4c],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:277
    uint8 dirOffset = 0;
    6cc6:	c6 45 b3 00          	mov    BYTE PTR [ebp-0x4d],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:278
    int foundEnd = 0;
    6cca:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:284

    uint8 checksum;
    uint8 *pSname;

    // No write access?
    if (!fs->disk_io.write_media)
    6cd1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6cd4:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    6cd7:	85 c0                	test   eax,eax
    6cd9:	75 0a                	jne    6ce5 <fatfs_add_file_entry+0x54>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:285
        return 0;
    6cdb:	b8 00 00 00 00       	mov    eax,0x0
    6ce0:	e9 0c 02 00 00       	jmp    6ef1 <fatfs_add_file_entry+0x260>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:290

#if FATFS_INC_LFN_SUPPORT
    // How many LFN entries are required?
    // NOTE: We always request one LFN even if it would fit in a SFN!
    entryCount = fatfs_lfn_entries_required(filename);
    6ce5:	83 ec 0c             	sub    esp,0xc
    6ce8:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    6ceb:	e8 90 03 00 00       	call   7080 <__x86.get_pc_thunk.bx+0x186>
    6cf0:	83 c4 10             	add    esp,0x10
    6cf3:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:291
    if (!entryCount)
    6cf6:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
    6cfa:	75 0a                	jne    6d06 <fatfs_add_file_entry+0x75>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:292
        return 0;
    6cfc:	b8 00 00 00 00       	mov    eax,0x0
    6d01:	e9 eb 01 00 00       	jmp    6ef1 <fatfs_add_file_entry+0x260>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:299
    entryCount = 0;
#endif

    // Find space in the directory for this filename (or allocate some more)
    // NOTE: We need to find space for at least the LFN + SFN (or just the SFN if LFNs not supported).
    if (!fatfs_find_free_dir_offset(fs, dirCluster, entryCount + 1, &dirSector, &dirOffset))
    6d06:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    6d09:	8d 50 01             	lea    edx,[eax+0x1]
    6d0c:	83 ec 0c             	sub    esp,0xc
    6d0f:	8d 45 b3             	lea    eax,[ebp-0x4d]
    6d12:	50                   	push   eax
    6d13:	8d 45 b4             	lea    eax,[ebp-0x4c]
    6d16:	50                   	push   eax
    6d17:	52                   	push   edx
    6d18:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    6d1b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6d1e:	e8 27 fd ff ff       	call   6a4a <fatfs_find_free_dir_offset>
    6d23:	83 c4 20             	add    esp,0x20
    6d26:	85 c0                	test   eax,eax
    6d28:	75 0a                	jne    6d34 <fatfs_add_file_entry+0xa3>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:300
        return 0;
    6d2a:	b8 00 00 00 00       	mov    eax,0x0
    6d2f:	e9 bd 01 00 00       	jmp    6ef1 <fatfs_add_file_entry+0x260>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:303

    // Generate checksum of short filename
    pSname = (uint8*)shortfilename;
    6d34:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    6d37:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:304
    checksum = 0;
    6d3a:	c6 45 e3 00          	mov    BYTE PTR [ebp-0x1d],0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:305
    for (i=11; i!=0; i--) checksum = ((checksum & 1) ? 0x80 : 0) + (checksum >> 1) + *pSname++;
    6d3e:	c6 45 f6 0b          	mov    BYTE PTR [ebp-0xa],0xb
    6d42:	eb 3b                	jmp    6d7f <fatfs_add_file_entry+0xee>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:305 (discriminator 7)
    6d44:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
    6d48:	83 e0 01             	and    eax,0x1
    6d4b:	85 c0                	test   eax,eax
    6d4d:	74 07                	je     6d56 <fatfs_add_file_entry+0xc5>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:305 (discriminator 2)
    6d4f:	ba 80 ff ff ff       	mov    edx,0xffffff80
    6d54:	eb 05                	jmp    6d5b <fatfs_add_file_entry+0xca>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:305 (discriminator 3)
    6d56:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:305 (discriminator 5)
    6d5b:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
    6d5f:	d0 e8                	shr    al,1
    6d61:	8d 0c 02             	lea    ecx,[edx+eax*1]
    6d64:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
    6d67:	8d 50 01             	lea    edx,[eax+0x1]
    6d6a:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
    6d6d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    6d70:	01 c8                	add    eax,ecx
    6d72:	88 45 e3             	mov    BYTE PTR [ebp-0x1d],al
    6d75:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
    6d79:	83 e8 01             	sub    eax,0x1
    6d7c:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:305 (discriminator 6)
    6d7f:	80 7d f6 00          	cmp    BYTE PTR [ebp-0xa],0x0
    6d83:	75 bf                	jne    6d44 <fatfs_add_file_entry+0xb3>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:308

    // Start from current sector where space was found!
    x = dirSector;
    6d85:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
    6d88:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:314

    // Main cluster following loop
    while (1)
    {
        // Read sector
        if (fatfs_sector_reader(fs, dirCluster, x++, 0))
    6d8b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6d8e:	8d 50 01             	lea    edx,[eax+0x1]
    6d91:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
    6d94:	6a 00                	push   0x0
    6d96:	50                   	push   eax
    6d97:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
    6d9a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    6d9d:	e8 ee 04 00 00       	call   7290 <__x86.get_pc_thunk.bx+0x396>
    6da2:	83 c4 10             	add    esp,0x10
    6da5:	85 c0                	test   eax,eax
    6da7:	0f 84 3f 01 00 00    	je     6eec <fatfs_add_file_entry+0x25b>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:317
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
    6dad:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
    6db1:	e9 ea 00 00 00       	jmp    6ea0 <fatfs_add_file_entry+0x20f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:320
            {
                // Create the multiplier for sector access
                recordoffset = FAT_DIR_ENTRY_SIZE * item;
    6db6:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    6dba:	c1 e0 05             	shl    eax,0x5
    6dbd:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:323

                // If the start position for the entry has been found
                if (foundEnd==0)
    6dc1:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
    6dc5:	75 1d                	jne    6de4 <fatfs_add_file_entry+0x153>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:324
                    if ( (dirSector==(x-1)) && (dirOffset==item) )
    6dc7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    6dca:	8d 50 ff             	lea    edx,[eax-0x1]
    6dcd:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
    6dd0:	39 c2                	cmp    edx,eax
    6dd2:	75 10                	jne    6de4 <fatfs_add_file_entry+0x153>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:324 (discriminator 1)
    6dd4:	0f b6 45 b3          	movzx  eax,BYTE PTR [ebp-0x4d]
    6dd8:	3a 45 f7             	cmp    al,BYTE PTR [ebp-0x9]
    6ddb:	75 07                	jne    6de4 <fatfs_add_file_entry+0x153>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:325
                        foundEnd = 1;
    6ddd:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:328

                // Start adding filename
                if (foundEnd)
    6de4:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
    6de8:	0f 84 a8 00 00 00    	je     6e96 <fatfs_add_file_entry+0x205>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:330
                {
                    if (entryCount==0)
    6dee:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
    6df2:	75 74                	jne    6e68 <fatfs_add_file_entry+0x1d7>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:333
                    {
                        // Short filename
                        fatfs_sfn_create_entry(shortfilename, size, startCluster, &shortEntry, dir);
    6df4:	83 ec 0c             	sub    esp,0xc
    6df7:	ff 75 20             	push   DWORD PTR [ebp+0x20]
    6dfa:	8d 45 ba             	lea    eax,[ebp-0x46]
    6dfd:	50                   	push   eax
    6dfe:	ff 75 18             	push   DWORD PTR [ebp+0x18]
    6e01:	ff 75 1c             	push   DWORD PTR [ebp+0x1c]
    6e04:	ff 75 14             	push   DWORD PTR [ebp+0x14]
    6e07:	e8 84 05 00 00       	call   7390 <__x86.get_pc_thunk.bx+0x496>
    6e0c:	83 c4 20             	add    esp,0x20
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:337

#if FATFS_INC_TIME_DATE_SUPPORT
                        // Update create, access & modify time & date
                        fatfs_update_timestamps(&shortEntry, 1, 1, 1);
    6e0f:	6a 01                	push   0x1
    6e11:	6a 01                	push   0x1
    6e13:	6a 01                	push   0x1
    6e15:	8d 45 ba             	lea    eax,[ebp-0x46]
    6e18:	50                   	push   eax
    6e19:	e8 22 02 00 00       	call   7040 <__x86.get_pc_thunk.bx+0x146>
    6e1e:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:340
#endif

                        memcpy(&fs->currentsector.sector[recordoffset], &shortEntry, sizeof(shortEntry));
    6e21:	0f b7 45 da          	movzx  eax,WORD PTR [ebp-0x26]
    6e25:	8d 50 40             	lea    edx,[eax+0x40]
    6e28:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6e2b:	01 d0                	add    eax,edx
    6e2d:	8d 50 04             	lea    edx,[eax+0x4]
    6e30:	83 ec 04             	sub    esp,0x4
    6e33:	6a 20                	push   0x20
    6e35:	8d 45 ba             	lea    eax,[ebp-0x46]
    6e38:	50                   	push   eax
    6e39:	52                   	push   edx
    6e3a:	e8 81 01 00 00       	call   6fc0 <__x86.get_pc_thunk.bx+0xc6>
    6e3f:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:343

                        // Writeback
                        return fs->disk_io.write_media(fs->currentsector.address, fs->currentsector.sector, 1);
    6e42:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6e45:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    6e48:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    6e4b:	8d 4a 44             	lea    ecx,[edx+0x44]
    6e4e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    6e51:	8b 92 44 02 00 00    	mov    edx,DWORD PTR [edx+0x244]
    6e57:	83 ec 04             	sub    esp,0x4
    6e5a:	6a 01                	push   0x1
    6e5c:	51                   	push   ecx
    6e5d:	52                   	push   edx
    6e5e:	ff d0                	call   eax
    6e60:	83 c4 10             	add    esp,0x10
    6e63:	e9 89 00 00 00       	jmp    6ef1 <fatfs_add_file_entry+0x260>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:348
                    }
#if FATFS_INC_LFN_SUPPORT
                    else
                    {
                        entryCount--;
    6e68:	83 6d ec 01          	sub    DWORD PTR [ebp-0x14],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:351

                        // Copy entry to directory buffer
                        fatfs_filename_to_lfn(filename, &fs->currentsector.sector[recordoffset], entryCount, checksum);
    6e6c:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
    6e70:	0f b7 55 da          	movzx  edx,WORD PTR [ebp-0x26]
    6e74:	8d 4a 40             	lea    ecx,[edx+0x40]
    6e77:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    6e7a:	01 ca                	add    edx,ecx
    6e7c:	83 c2 04             	add    edx,0x4
    6e7f:	50                   	push   eax
    6e80:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    6e83:	52                   	push   edx
    6e84:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    6e87:	e8 e4 03 00 00       	call   7270 <__x86.get_pc_thunk.bx+0x376>
    6e8c:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:352
                        dirtySector = 1;
    6e8f:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:317 (discriminator 2)
    {
        // Read sector
        if (fatfs_sector_reader(fs, dirCluster, x++, 0))
        {
            // Analyse Sector
            for (item = 0; item < FAT_DIR_ENTRIES_PER_SECTOR; item++)
    6e96:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
    6e9a:	83 c0 01             	add    eax,0x1
    6e9d:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:317 (discriminator 1)
    6ea0:	80 7d f7 0f          	cmp    BYTE PTR [ebp-0x9],0xf
    6ea4:	0f 86 0c ff ff ff    	jbe    6db6 <fatfs_add_file_entry+0x125>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:359
#endif
                }
            } // End of if

            // Write back to disk before loading another sector
            if (dirtySector)
    6eaa:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
    6eae:	0f 84 d7 fe ff ff    	je     6d8b <fatfs_add_file_entry+0xfa>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:361
            {
                if (!fs->disk_io.write_media(fs->currentsector.address, fs->currentsector.sector, 1))
    6eb4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    6eb7:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
    6eba:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    6ebd:	8d 4a 44             	lea    ecx,[edx+0x44]
    6ec0:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    6ec3:	8b 92 44 02 00 00    	mov    edx,DWORD PTR [edx+0x244]
    6ec9:	83 ec 04             	sub    esp,0x4
    6ecc:	6a 01                	push   0x1
    6ece:	51                   	push   ecx
    6ecf:	52                   	push   edx
    6ed0:	ff d0                	call   eax
    6ed2:	83 c4 10             	add    esp,0x10
    6ed5:	85 c0                	test   eax,eax
    6ed7:	75 07                	jne    6ee0 <fatfs_add_file_entry+0x24f>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:362
                    return 0;
    6ed9:	b8 00 00 00 00       	mov    eax,0x0
    6ede:	eb 11                	jmp    6ef1 <fatfs_add_file_entry+0x260>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:364

                dirtySector = 0;
    6ee0:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
    6ee7:	e9 9f fe ff ff       	jmp    6d8b <fatfs_add_file_entry+0xfa>
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:368
            }
        }
        else
            return 0;
    6eec:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/fatLib/../chrisOS/src/fat/fat_write.c:372 (discriminator 2)
    } // End of while loop

    return 0;
}
    6ef1:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    6ef4:	c9                   	leave  
    6ef5:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

00006ef6 <__x86.get_pc_thunk.ax>:
__x86.get_pc_thunk.ax():
    6ef6:	8b 04 24             	mov    eax,DWORD PTR [esp]
    6ef9:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.bx:

00006efa <__x86.get_pc_thunk.bx>:
__x86.get_pc_thunk.bx():
    6efa:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
    6efd:	c3                   	ret    

Disassembly of section .plt:

00006f00 <.plt>:
    6f00:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
    6f06:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
    6f0c:	00 00                	add    BYTE PTR [eax],al
    6f0e:	00 00                	add    BYTE PTR [eax],al
    6f10:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
    6f16:	68 00 00 00 00       	push   0x0
    6f1b:	e9 e0 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6f20:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
    6f26:	68 08 00 00 00       	push   0x8
    6f2b:	e9 d0 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6f30:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
    6f36:	68 10 00 00 00       	push   0x10
    6f3b:	e9 c0 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6f40:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
    6f46:	68 18 00 00 00       	push   0x18
    6f4b:	e9 b0 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6f50:	ff a3 1c 00 00 00    	jmp    DWORD PTR [ebx+0x1c]
    6f56:	68 20 00 00 00       	push   0x20
    6f5b:	e9 a0 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6f60:	ff a3 20 00 00 00    	jmp    DWORD PTR [ebx+0x20]
    6f66:	68 28 00 00 00       	push   0x28
    6f6b:	e9 90 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6f70:	ff a3 24 00 00 00    	jmp    DWORD PTR [ebx+0x24]
    6f76:	68 30 00 00 00       	push   0x30
    6f7b:	e9 80 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6f80:	ff a3 28 00 00 00    	jmp    DWORD PTR [ebx+0x28]
    6f86:	68 38 00 00 00       	push   0x38
    6f8b:	e9 70 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6f90:	ff a3 2c 00 00 00    	jmp    DWORD PTR [ebx+0x2c]
    6f96:	68 40 00 00 00       	push   0x40
    6f9b:	e9 60 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6fa0:	ff a3 30 00 00 00    	jmp    DWORD PTR [ebx+0x30]
    6fa6:	68 48 00 00 00       	push   0x48
    6fab:	e9 50 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6fb0:	ff a3 34 00 00 00    	jmp    DWORD PTR [ebx+0x34]
    6fb6:	68 50 00 00 00       	push   0x50
    6fbb:	e9 40 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6fc0:	ff a3 38 00 00 00    	jmp    DWORD PTR [ebx+0x38]
    6fc6:	68 58 00 00 00       	push   0x58
    6fcb:	e9 30 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6fd0:	ff a3 3c 00 00 00    	jmp    DWORD PTR [ebx+0x3c]
    6fd6:	68 60 00 00 00       	push   0x60
    6fdb:	e9 20 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6fe0:	ff a3 40 00 00 00    	jmp    DWORD PTR [ebx+0x40]
    6fe6:	68 68 00 00 00       	push   0x68
    6feb:	e9 10 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    6ff0:	ff a3 44 00 00 00    	jmp    DWORD PTR [ebx+0x44]
    6ff6:	68 70 00 00 00       	push   0x70
    6ffb:	e9 00 ff ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7000:	ff a3 48 00 00 00    	jmp    DWORD PTR [ebx+0x48]
    7006:	68 78 00 00 00       	push   0x78
    700b:	e9 f0 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7010:	ff a3 4c 00 00 00    	jmp    DWORD PTR [ebx+0x4c]
    7016:	68 80 00 00 00       	push   0x80
    701b:	e9 e0 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7020:	ff a3 50 00 00 00    	jmp    DWORD PTR [ebx+0x50]
    7026:	68 88 00 00 00       	push   0x88
    702b:	e9 d0 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7030:	ff a3 54 00 00 00    	jmp    DWORD PTR [ebx+0x54]
    7036:	68 90 00 00 00       	push   0x90
    703b:	e9 c0 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7040:	ff a3 58 00 00 00    	jmp    DWORD PTR [ebx+0x58]
    7046:	68 98 00 00 00       	push   0x98
    704b:	e9 b0 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7050:	ff a3 5c 00 00 00    	jmp    DWORD PTR [ebx+0x5c]
    7056:	68 a0 00 00 00       	push   0xa0
    705b:	e9 a0 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7060:	ff a3 60 00 00 00    	jmp    DWORD PTR [ebx+0x60]
    7066:	68 a8 00 00 00       	push   0xa8
    706b:	e9 90 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7070:	ff a3 64 00 00 00    	jmp    DWORD PTR [ebx+0x64]
    7076:	68 b0 00 00 00       	push   0xb0
    707b:	e9 80 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7080:	ff a3 68 00 00 00    	jmp    DWORD PTR [ebx+0x68]
    7086:	68 b8 00 00 00       	push   0xb8
    708b:	e9 70 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7090:	ff a3 6c 00 00 00    	jmp    DWORD PTR [ebx+0x6c]
    7096:	68 c0 00 00 00       	push   0xc0
    709b:	e9 60 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    70a0:	ff a3 70 00 00 00    	jmp    DWORD PTR [ebx+0x70]
    70a6:	68 c8 00 00 00       	push   0xc8
    70ab:	e9 50 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    70b0:	ff a3 74 00 00 00    	jmp    DWORD PTR [ebx+0x74]
    70b6:	68 d0 00 00 00       	push   0xd0
    70bb:	e9 40 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    70c0:	ff a3 78 00 00 00    	jmp    DWORD PTR [ebx+0x78]
    70c6:	68 d8 00 00 00       	push   0xd8
    70cb:	e9 30 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    70d0:	ff a3 7c 00 00 00    	jmp    DWORD PTR [ebx+0x7c]
    70d6:	68 e0 00 00 00       	push   0xe0
    70db:	e9 20 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    70e0:	ff a3 80 00 00 00    	jmp    DWORD PTR [ebx+0x80]
    70e6:	68 e8 00 00 00       	push   0xe8
    70eb:	e9 10 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    70f0:	ff a3 84 00 00 00    	jmp    DWORD PTR [ebx+0x84]
    70f6:	68 f0 00 00 00       	push   0xf0
    70fb:	e9 00 fe ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7100:	ff a3 88 00 00 00    	jmp    DWORD PTR [ebx+0x88]
    7106:	68 f8 00 00 00       	push   0xf8
    710b:	e9 f0 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7110:	ff a3 8c 00 00 00    	jmp    DWORD PTR [ebx+0x8c]
    7116:	68 00 01 00 00       	push   0x100
    711b:	e9 e0 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7120:	ff a3 90 00 00 00    	jmp    DWORD PTR [ebx+0x90]
    7126:	68 08 01 00 00       	push   0x108
    712b:	e9 d0 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7130:	ff a3 94 00 00 00    	jmp    DWORD PTR [ebx+0x94]
    7136:	68 10 01 00 00       	push   0x110
    713b:	e9 c0 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7140:	ff a3 98 00 00 00    	jmp    DWORD PTR [ebx+0x98]
    7146:	68 18 01 00 00       	push   0x118
    714b:	e9 b0 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7150:	ff a3 9c 00 00 00    	jmp    DWORD PTR [ebx+0x9c]
    7156:	68 20 01 00 00       	push   0x120
    715b:	e9 a0 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7160:	ff a3 a0 00 00 00    	jmp    DWORD PTR [ebx+0xa0]
    7166:	68 28 01 00 00       	push   0x128
    716b:	e9 90 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7170:	ff a3 a4 00 00 00    	jmp    DWORD PTR [ebx+0xa4]
    7176:	68 30 01 00 00       	push   0x130
    717b:	e9 80 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7180:	ff a3 a8 00 00 00    	jmp    DWORD PTR [ebx+0xa8]
    7186:	68 38 01 00 00       	push   0x138
    718b:	e9 70 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7190:	ff a3 ac 00 00 00    	jmp    DWORD PTR [ebx+0xac]
    7196:	68 40 01 00 00       	push   0x140
    719b:	e9 60 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    71a0:	ff a3 b0 00 00 00    	jmp    DWORD PTR [ebx+0xb0]
    71a6:	68 48 01 00 00       	push   0x148
    71ab:	e9 50 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    71b0:	ff a3 b4 00 00 00    	jmp    DWORD PTR [ebx+0xb4]
    71b6:	68 50 01 00 00       	push   0x150
    71bb:	e9 40 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    71c0:	ff a3 b8 00 00 00    	jmp    DWORD PTR [ebx+0xb8]
    71c6:	68 58 01 00 00       	push   0x158
    71cb:	e9 30 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    71d0:	ff a3 bc 00 00 00    	jmp    DWORD PTR [ebx+0xbc]
    71d6:	68 60 01 00 00       	push   0x160
    71db:	e9 20 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    71e0:	ff a3 c0 00 00 00    	jmp    DWORD PTR [ebx+0xc0]
    71e6:	68 68 01 00 00       	push   0x168
    71eb:	e9 10 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    71f0:	ff a3 c4 00 00 00    	jmp    DWORD PTR [ebx+0xc4]
    71f6:	68 70 01 00 00       	push   0x170
    71fb:	e9 00 fd ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7200:	ff a3 c8 00 00 00    	jmp    DWORD PTR [ebx+0xc8]
    7206:	68 78 01 00 00       	push   0x178
    720b:	e9 f0 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7210:	ff a3 cc 00 00 00    	jmp    DWORD PTR [ebx+0xcc]
    7216:	68 80 01 00 00       	push   0x180
    721b:	e9 e0 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7220:	ff a3 d0 00 00 00    	jmp    DWORD PTR [ebx+0xd0]
    7226:	68 88 01 00 00       	push   0x188
    722b:	e9 d0 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7230:	ff a3 d4 00 00 00    	jmp    DWORD PTR [ebx+0xd4]
    7236:	68 90 01 00 00       	push   0x190
    723b:	e9 c0 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7240:	ff a3 d8 00 00 00    	jmp    DWORD PTR [ebx+0xd8]
    7246:	68 98 01 00 00       	push   0x198
    724b:	e9 b0 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7250:	ff a3 dc 00 00 00    	jmp    DWORD PTR [ebx+0xdc]
    7256:	68 a0 01 00 00       	push   0x1a0
    725b:	e9 a0 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7260:	ff a3 e0 00 00 00    	jmp    DWORD PTR [ebx+0xe0]
    7266:	68 a8 01 00 00       	push   0x1a8
    726b:	e9 90 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7270:	ff a3 e4 00 00 00    	jmp    DWORD PTR [ebx+0xe4]
    7276:	68 b0 01 00 00       	push   0x1b0
    727b:	e9 80 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7280:	ff a3 e8 00 00 00    	jmp    DWORD PTR [ebx+0xe8]
    7286:	68 b8 01 00 00       	push   0x1b8
    728b:	e9 70 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7290:	ff a3 ec 00 00 00    	jmp    DWORD PTR [ebx+0xec]
    7296:	68 c0 01 00 00       	push   0x1c0
    729b:	e9 60 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    72a0:	ff a3 f0 00 00 00    	jmp    DWORD PTR [ebx+0xf0]
    72a6:	68 c8 01 00 00       	push   0x1c8
    72ab:	e9 50 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    72b0:	ff a3 f4 00 00 00    	jmp    DWORD PTR [ebx+0xf4]
    72b6:	68 d0 01 00 00       	push   0x1d0
    72bb:	e9 40 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    72c0:	ff a3 f8 00 00 00    	jmp    DWORD PTR [ebx+0xf8]
    72c6:	68 d8 01 00 00       	push   0x1d8
    72cb:	e9 30 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    72d0:	ff a3 fc 00 00 00    	jmp    DWORD PTR [ebx+0xfc]
    72d6:	68 e0 01 00 00       	push   0x1e0
    72db:	e9 20 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    72e0:	ff a3 00 01 00 00    	jmp    DWORD PTR [ebx+0x100]
    72e6:	68 e8 01 00 00       	push   0x1e8
    72eb:	e9 10 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    72f0:	ff a3 04 01 00 00    	jmp    DWORD PTR [ebx+0x104]
    72f6:	68 f0 01 00 00       	push   0x1f0
    72fb:	e9 00 fc ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7300:	ff a3 08 01 00 00    	jmp    DWORD PTR [ebx+0x108]
    7306:	68 f8 01 00 00       	push   0x1f8
    730b:	e9 f0 fb ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7310:	ff a3 0c 01 00 00    	jmp    DWORD PTR [ebx+0x10c]
    7316:	68 00 02 00 00       	push   0x200
    731b:	e9 e0 fb ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7320:	ff a3 10 01 00 00    	jmp    DWORD PTR [ebx+0x110]
    7326:	68 08 02 00 00       	push   0x208
    732b:	e9 d0 fb ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7330:	ff a3 14 01 00 00    	jmp    DWORD PTR [ebx+0x114]
    7336:	68 10 02 00 00       	push   0x210
    733b:	e9 c0 fb ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7340:	ff a3 18 01 00 00    	jmp    DWORD PTR [ebx+0x118]
    7346:	68 18 02 00 00       	push   0x218
    734b:	e9 b0 fb ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7350:	ff a3 1c 01 00 00    	jmp    DWORD PTR [ebx+0x11c]
    7356:	68 20 02 00 00       	push   0x220
    735b:	e9 a0 fb ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7360:	ff a3 20 01 00 00    	jmp    DWORD PTR [ebx+0x120]
    7366:	68 28 02 00 00       	push   0x228
    736b:	e9 90 fb ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7370:	ff a3 24 01 00 00    	jmp    DWORD PTR [ebx+0x124]
    7376:	68 30 02 00 00       	push   0x230
    737b:	e9 80 fb ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7380:	ff a3 28 01 00 00    	jmp    DWORD PTR [ebx+0x128]
    7386:	68 38 02 00 00       	push   0x238
    738b:	e9 70 fb ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
    7390:	ff a3 2c 01 00 00    	jmp    DWORD PTR [ebx+0x12c]
    7396:	68 40 02 00 00       	push   0x240
    739b:	e9 60 fb ff ff       	jmp    6f00 <__x86.get_pc_thunk.bx+0x6>
