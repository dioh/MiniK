ALIGN 8	
idt: 

dw	divide_error, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0
 
dw	who_the_fuck_knows, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	nmi_interrupt, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	breakpoint, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	overflow, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	bound_range_exceed, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	invalid_op_code, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	device_not_available, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	double_fault, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	invalid_tss, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	segment_not_present, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	stack_segment_fault, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	general_protection, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	page_fault, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	yet_another_wtfk, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	fpu_error, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	alignment_check, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	machine_check, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	simd_fp_exception, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	yet_yet_another_wtfk, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0


dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

dw	e0_to_21_exceptions, base_code_segment
dd  1000111100000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0







;////////////////////////////////////////////////////////////////////////////////////////////////////////
;									Interrupciones
;////////////////////////////////////////////////////////////////////////////////////////////////////////
;timer tick
dw	0x28, base_code_segment
db  0x0, 10001110b			;Atributos trapGate # 	- Offset 16 - 31 = 0
dw 	0x0

;keyboard
dw	keyboard_interrupt, base_code_segment
dd  1000111000000000b			;Atributos trapGate # 	- Offset 16 - 31 = 0

idt_len: equ $-idt

idt_desc:
dw idt_len
dd idt
