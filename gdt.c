#include "gdt.h"
#include "tss.h"

gdt_entry gdt[GDT_COUNT] = {
	/* Descriptor nulo*/
	(gdt_entry){(unsigned int) 0x00000000, (unsigned int) 0x00000000 },

	/* Codigo de kernel B=0x00000000 L=0xFFFFF*/
	(gdt_entry){ 
		(unsigned short) 0xFFFF, 
		(unsigned short) 0x0000,
		(unsigned char) 0x00, 
		(unsigned char) 0xA, 
		(unsigned char) 1, 
		(unsigned char) 0, 
		(unsigned char) 1, 
		(unsigned char) 0xF,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 1,  
		(unsigned char) 0, 
		(unsigned char) 0x00 
	},

	/* Datos de kernel B=0x00000000 L=0xFFFFF*/
	(gdt_entry){ 
		(unsigned short) 0xFFFF, 
		(unsigned short) 0x0000,
		(unsigned char) 0x00, 
		(unsigned char) 0x2, 
		(unsigned char) 1, 
		(unsigned char) 0, 
		(unsigned char) 1, 
		(unsigned char) 0xF,
		(unsigned char) 0,  
		(unsigned char) 0,  
		(unsigned char) 1,  
		(unsigned char) 0, 
		(unsigned char) 0x00 
	},

};


gdt_descriptor GDT_DESC = {(unsigned short) sizeof(gdt)-1, (unsigned int)&gdt};