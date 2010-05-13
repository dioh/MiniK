gdt:
gdt_null: dd 0x0, 0x0
gdt_data: dd 0xFFFF, 0x004F9200
gdt_code: dd 0xFFFF, 0x004F9A00
tss_desc_print: dw 0x67	,TSS_PRINT 			;Base Address = 0x3000, limit = 0x67	
				db 0x0, 10001001b			;base 16-31 = 0x0 G = 0 AVL = 0 Limit 19:16 = 0 P = 1 DPL = 0 Type = 1001 Base 23:16 = 0
				dw 0x0
				
tss_base: dw 0x67	, TSS_BASE 			;Base Address = 0x3000, limit = 0x67	
				db 0x0, 10001001b			;base 16-31 = 0x0 G = 0 AVL = 0 Limit 19:16 = 0 P = 1 DPL = 0 Type = 1011 Base 23:16 = 0
				dw 0x0
				
task_gate_to_print: dw 0x0, print_tsd
 					db 0x0, 10000101
 					dw 0x0
								
gdt_len: equ $-gdt

gdt_desc:
dw gdt_len
dd gdt
