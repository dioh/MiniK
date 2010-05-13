;FAKE TSS
TSS_BASE:
TIMES 7		dd 0x0				;Stacks y PTL
		dd PD					;CR3
	 	dd 0x0					;EIP
	 	dd 0x202				;EFLAGS
		dd 0x0					;EAX
		dd 0x0					;ECX
		dd 0x0					;EDX
		dd 0x0					;EBX
		dd 0x0					;ESP
		dd 0x0					;EBP
		dd 0x0					;ESO
	 	dd 0x0					;EDI
	 	
	 	;ES
	 	dd 0x8
	 	;CS
	 	dd 0x10
	 	;SS
	 	dd 0x8
	 	;DS
	 	dd 0x8
	 	;FS
	 	dd 0x8
	 	;GS
	 	dd 0x8
	 	;LDT
	 	dd 0x0
		;IO
		dd 0x0

;TSS Descriptor N° 1
ALIGN 8
TSS_PRINT:
TIMES 7		dd 0x0				;Stacks y PTL
		dd PD					;CR3
	 	dd screen_print			;EIP
	 	dd 0x202				;EFLAGS
		dd 0x0					;EAX
		dd 0x0					;ECX
		dd 0x0					;EDX
		dd 0x0					;EBX
		dd 0x0					;ESP
		dd 0x0					;EBP
		dd 0x0					;ESO
	 	dd 0x0					;EDI
	 	
	 	;ES
	 	dd 0x8
	 	;CS
	 	dd 0x10
	 	;SS
	 	dd 0x8
	 	;DS
	 	dd 0x8
	 	;FS
	 	dd 0x8
	 	;GS
	 	dd 0x8
	 	;LDT
	 	dd 0x0
		;IO
		dd 0x0


