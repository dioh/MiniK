TIMES (0x1E00 - ($-$$)) db 0
global PD
PD:
	dd 0x00004003,		;BITS 22 - 11 RESERVED - G = 0 PAT = 0 PS = 0 D = 0 A = 0 PCD = 0 PWT = 0 U/S = 0 R/W = 0
	;La direccion de la PT con los atributos en 3.

TIMES (0x2E00 - ($-$$)) nop
PT:
	base_pt: dd 0x0			;Primer entrada nula.
	
	;Segunda entrada
	dd 0x00001003	
	; Tercer entrada
	dd 0x00002003
	; Cuarta entrada
	dd 0x00003003
	; Quinta entrada
	dd 0x00004003
	; Sexta entrada
	dd 0x00004003
	
	;Nuleo hasta la posicion B8
	times (0xB2) dd 0x0
	
	; Entrada B8
	dd 0x000B8003

	; Entrada FA
	times (0xFA - 0xB9) dd 0x0
	dd 0x000B8003
	dd 0x000B9003
	dd 0x000BA003
	dd 0x000BB003
	dd 0x000BC003
	dd 0x000BD003
	dd 0x000BE003
	dd 0x000BF003
	dd 0x000C0003
	dd 0x000C1003

	;dw 0x3,		;BITS 22 - 11 RESERVED - G = 1 PAT = 0 PS = 0 D = 0 A = 0 PCD = 0 PWT = 0 U/S = 0 R/W = 1 P = 1
	;dw 0xB8000 		;La direccion de la PT shifteada en 4 lugares de atributos reservados.
