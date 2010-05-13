scheduler:
	call print_tsd:0x0
	ret
	
screen_print:
mov		ax, 0x8
mov 	es, ax

mov 	ecx, (25 * 80) << 1
mov 	ax, 0x1000
mov 	edi, video_mem

.cicloazul:
	stosw
	loop 	.cicloazul

mov 	ecx, mensaje_len
mov 	edi, video_mem + 0x65A

mov 	ah, 0x1A
mov 	esi, mensaje

.ciclo:
	lodsb
	stosw
	loop .ciclo
	
iret
	
mensaje:	db 'Arrancamo!'
mensaje_len equ $ - mensaje
