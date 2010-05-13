;******************************************************************************
; Rutinas de acceso al hardware de la PC
; Versión 1
; 5/6/2003
; Autor Alejandro Furfaro
;	afurfaro@electron.frba.utn.edu.ar
;******************************************************************************

;------------------------------
; ReproganarPICs
; Corre la base de los tipos de interrupción de ambos PICs 8259A de la PC a los
; 8 tipos consecutivos a partir de los valores base que recibe en BH para el
; PIC Nº1 y BL para el PIC Nº2.
; A su retorno las Interrupciones de ambos PICs están deshabilitadas.
;------------------------------

global hora
global fecha
global ReprogramarPICs

ReprogramarPICs:
; Inicialización PIC Nº1
	;ICW1
                mov     al,11h          ;IRQs activas x flanco, cascada, y ICW4
                out     20h,al
	;ICW2
                mov     al,bh           ;El PIC Nº1 arranca en INT tipo (Ah)
                out     21h,al
	;ICW3
                mov     al,04h          ;PIC1 Master, Slave ingresa Int.x IRQ2
                out     21h,al
	;ICW4
                mov     al,01h          ;Modo 8086
                out     21h,al
;Antes de inicializar el PIC Nº2, deshabilitamos las Interrupciones del PIC1
                mov     al,0FFh
                out     21h,al
;Ahora inicializamos el PIC Nº2
	;ICW1
                mov     al,11h          ;IRQs activas x flanco,cascada, y ICW4
                out     0A0h,al
	;ICW2
                mov     al,bl           ;El PIC Nº2 arranca en INT tipo (BL)
                out     0A1h,al
	;ICW3
                mov     al,02h          ;PIC2 Slave, ingresa Int x IRQ2
                out     0A1h,al
	;ICW4
                mov     al,01h          ;Modo 8086
                out     0A1h,al
;Enmascaramos el resto de las Interrupciones (las del PIC Nº2)
                mov     al,0FFh
                out     0A1h,al
                ret

;--------------------------------
;GATE_A20:
;Controla la se#al que maneja la compuerta del bit de direcciones A20. La se#al
;de compuerta del bit A20 es una salida del procesador de teclado 8042.
;Se debe utilizar cuando se planea acceder en Modo Protegido a direcciones de
;memoria mas allá del 1er. Mbyte.
;Llamar con :   AH = 0DDh, si se desea apagar esta se#al. (A20 siempre cero).
;               AL = 0DFh, si se desea disparar esta se#al. (x86 controla A20)
;Devuelve :     AL = 00, si hubo exito. El 8042 acepto el comando.
;               AL = 02, si fallo. El 8042 no acepto el comando.
;--------------------------------

port_a          EQU     060h            ;Direccion de E/S del Port A del 8042
status_port     EQU     064h            ;port de Estados del 8042

gate_a20:
		cli			;Mientras usa el 8042, no INTR
		call    _8042_empty?	;Ve si buffer del 8042 vac¡o.
		jnz     gate_a20_01	;No lo est ->retorna con AL=2.
		mov     al,0D1h		;Comando Write port del 8042..
		out     status_port,al	;...se env¡a al port 64h.
		call    _8042_empty?	;Espera se acepte el comando.
		jnz     gate_a20_01	;Si no se acepta, Ret con AL=2
		mov     al,ah		;Pone en AL el dato a escribir.
		out     port_a,al	;Lo env¡a al 8042.
		call    _8042_empty?	;Espera se acepte el comando.
gate_a20_01:
		ret

;--------------------------------
;8042_empty?:
;Espera que se vac¡e el buffer del 8042.
;Llamar con :   Nada.
;Devuelve :     AL = 00, el buffer del 8042 est  vac¡o.(ZF = 1)
;               AL = 02, time out. El buffer del 8042 sigue lleno. (ZF = 0)
;--------------------------------

_8042_empty?:
		push    cx                      ;salva CX.
		sub     cx,cx                   ;CX = 0 : valor de time out.
empty_8042_01:  in      al,status_port          ;Lee port de estado del 8042.
		and     al,00000010b            ;si el bit 1 est  seteado o...
		loopnz  empty_8042_01           ;no alcanz¢ time out, espera.
		pop     cx                      ;recupera cx
		ret                             ;retorna con AL=0, si se
						;limpi¢ bit 1, o AL=2 si no.

;--------------------------------
;hora
;Obtiene la hora del sistema desde el RTC
;Llamar con: Nada
;Devuelve:	AL: Segundos
;		AH: Minutos
;		DL: Hora
;--------------------------------

hora:
		call	RTC_disponible		;asegura que no esté
						;actualizandose el RTC
		mov	al,0x84
		out	70h,al			;Selecciona Registro de Hora
		in	al,71h			;lee hora
		mov	dl,al

		mov	al,0x82
		out	70h,al			;Selecciona Registro de Minutos
		in	al,71h			;lee minutos
		mov	ah,al

		mov 	al, 0x80
		out	70h,al			;Selecciona Registro de Segundos
		in	al,71h			;lee minutos

		ret


;--------------------------------
;fecha
;Obtiene la fecha del sistema desde el RTC
;Llamar con: Nada
;Devuelve:	AL: Dia de la Semana
;		AH: Fecha del Mes
;		DL: Mes
;		DH: Año
;--------------------------------

fecha:
		call	RTC_disponible		;asegura que no esté
						;actualizandose el RTC
		mov	al,9
		out	70h,al			;Selecciona Registro de Año
		in	al,71h			;lee año
		mov	dh,al

		mov	al,8
		out	70h,al			;Selecciona Registro de Mes
		in	al,71h			;lee mes
		mov	dl,al

		mov	al,7
		out	70h,al			;Selecciona Registro de Fecha
		in	al,71h			;lee Fecha del mes
		mov	ah,al

		mov	al,6
		out	70h,al			;Selecciona Registro de Día
		in	al,71h			;lee día de la semana

		ret

;--------------------------------
;RTC_disponible
;Verifica en el Status Register A que el RTC no esté actualizando fecha y hora
;Retorna cuando el RTC está disponible
;Llamar con : Nada
;Devuelve: Nada
;--------------------------------

RTC_disponible:
		mov	al,0Ah
		out	70h,al	;Selecciona registro de status A
wait_for_free:
		in	al,71h	;lee Status
		test	al,80h
		jnz	wait_for_free
		ret

;////////////////// Llamar con tamaño mensaje en ecx y mensaje en esi
;////////////////// Pinta la pantalla.

;~ screen_print:
;~ 
	;~ mov		ax, 0x8
	;~ mov 	es, ax
	;~ 
	;~ mov 	ecx, (25 * 80) << 1
	;~ mov 	ax, 0x1000
	;~ mov 	edi, video_mem
	;~ 
	;~ .cicloazul:
		;~ stosw
		;~ loop 	.cicloazul
	;~ 
	;~ mov 	edi, video_mem + ((10 * 80) + 13) << 1
	;~ 
	;~ mov 	ah, 0x1A
	;~ 
	;~ .ciclo:
		;~ lodsb
		;~ stosw
		;~ loop .ciclo
	;~ 
		;~ ret
