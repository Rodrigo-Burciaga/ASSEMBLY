				.include "m48def.inc"
				.def temp=r16
				.def dato=r17
				.def bandera=r18
				.def cont1=r19
				.def cont2=r20 
				.cseg
				.org 0

				ldi temp, $ff 			; puerto para salida
				out ddrb, temp 			; se configura para salida el puerto b

				out portc, temp 		; resistencias pull up en el puerto c


				ldi bandera,$00 		; 0 izq, 1 derecha
				ldi temp, $01
				out portb, temp 		; se enciende el primer led del puerto b
				rcall delay_125m

main:			in dato, pinc 			; leyendo el puerto c
				andi dato, $0f
				cpi dato, $05
				breq rotar
				rjmp main


rotar: 			cpi bandera, $00
				breq izquierda
derecha:		in temp,pinb
				cpi temp,$01
				breq rec_izq
				lsr temp 				; recorrer izquierda
				out portb, temp
				rcall delay_125m
				rjmp main
izquierda: 		in temp,pinb
				cpi temp,$80
				breq rec_der
				lsl temp  				; recorrer izquierda
				out portb, temp
				rcall delay_125m
				rjmp main

rec_der:		ldi bandera, $01
				rjmp derecha

rec_izq:		ldi bandera, $00
				rjmp izquierda



;;********************* subrutinas

delay_125m:	ldi cont2,50
lazo2:		ldi cont1, 250
lazo1:		nop
			nop
			nop
			nop
			nop
			nop
			nop
			dec cont1
			brne lazo1
			dec cont2
			brne lazo2
			ret
