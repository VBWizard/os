. = 0x00130000;
   .systemData   (NOLOAD) : ALIGN(4K)

{ 
	sysEnter_Vector = 0x0000;
	_sysEnter = 0x0100;
	*(.systemData);
}
