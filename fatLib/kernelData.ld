 . = 0x00200000;
    kernelData  BLOCK(8K): ALIGN(8K)  
    { 
	*(kernelData);
} 
