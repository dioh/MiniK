%define  video_mem 0xFA000
%define  base_code_segment 0x10
;Constantes de selector de TSS		
%define print_tsd 0x18

;extern GDT_DESC
extern tsss;
;extern gdt;

BITS 16
global start

start:
		;incluir en el linkeo
		mov ax, 0h
		mov es, ax
		mov ds, ax
		call	disable_A20
		;xchg	bx, bx
		call	check_A20
		;xchg	bx, bx
		call 	enable_A20
		;xchg	bx, bx
		call	check_A20
		;xchg 	bx, bx
		cli
		mov cx, gdt_len
		mov di, 0000H
		mov si,	gdt
		rep movsb

		mov	ax		, [gdt_len]
		mov	word [es:7C00h]	, ax 
		mov	word [es:7c02h]	, 0
		mov	word [es:7c04h]	, 0


		lgdt  		[gdt_desc]
		mov 		eax, cr0
		or		ax, 0x1
		mov		cr0,eax
		jmp		base_code_segment:inicio_32	

;/////////////////////////////////////////////
;//////////// Arranco Modo protegido.
;/////////////////////////////////////////////		 


BITS 32
inicio_32:

		; iniciar segmentos
		mov ax, 8h
		mov es, ax
		mov ss, ax
		mov ds, ax

;/////////////////////////////////////////////
;//////////// Arranco Paginación:  (  . )  ( .  )
;/////////////////////////////////////////////		 

;Modifico CR3 para pasar a paginación.

		MOV eax, PD
		mov CR3, eax

		MOV ebx, CR0
		OR	ebx, 0x80000000
		MOV CR0, ebx
		jmp base_code_segment:pagination_success


pagination_success:
;//////////////////////////////////////////////// 
;//////////////// WELCOME TO PAGINATION
;//////////////////////////////////////////////// 

			
;//////////////////////////////////////////////////////
;////////////////// Enableing interruptions
;//////////////////////////////////////////////////////

;Muevo los IRQ0 - IRQ7 de pic N1 a las interrupciones del 32 al 48
		mov BH, 0x20
		mov BL, 0x28
		call ReprogramarPICs
		;Habilito timer tick
		mov     al,0h
		out     21h,al

		LIDT [idt_desc]
		STI


;//////////////////////////////////////////////////////
;////////////////// CAll to print using TSS
;//////////////////////////////////////////////////////

		mov eax, $tsss		;Load selector de Tarea base	
		LTR ax

		call print_tsd:0x0
fake_tsd_call:
		jmp $               ; colgamos el programa	

%include "exceptions.asm"
%include "hw0.asm"
%include "includes/estructuras_paginacion.inc"
%include "includes/estructuras_idt.inc"
%include "includes/estructuras_gdt.inc"
%include "tasks.asm"
%include "includes/estructuras_tss.inc"
%include "includes/a20.asm"
%include "includes/macrosmodoreal.mac"
