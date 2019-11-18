; Esta practica realiza un kit del auto increible con varias modalidades
				.include "m48def.inc"
				.def temp=r16
				.def dato=r17
				.def bandera=r18
				.def cont1=r19
				.def cont2=r20
				.def temp1=r21
				.def temp2=r22
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
				andi dato, $03			; kit normal, presionando los dos botones c0, c1
				breq rotar
				cpi dato, $01			; kit al doble presionando c1
				breq rotar
				cpi dato, $02			; presionamos c0
				breq inside
				cpi dato, $03 
				breq outside			; no se presiono ninguno
				rjmp main
outside:		ldi temp,$18
				out portb, temp
				rcall delay_500ms
				ldi temp1, $10
				ldi temp2, $08
				ldi temp, $0
outside_lazo:	lsl temp1
				lsr temp2
				or	temp,temp1
				or  temp, temp2
				out portb, temp
				rcall delay_500ms
				cpi temp, $81
				breq setting
				ldi temp, $0
				rjmp outside_lazo
;########################################################
inside:			ldi temp,$81
				out portb, temp
				rcall delay_500ms
				mov temp1, temp
				mov temp2, temp
				ldi temp, $0
inside_lazo:	lsl temp1
				lsr temp2
				or	temp,temp1
				or  temp, temp2
				out portb, temp
				rcall delay_500ms
				cpi temp, $18
				breq setting
				ldi temp, $0
				rjmp inside_lazo
;########################################################
rotar: 			cpi bandera, $00
				breq izquierda
derecha:		in temp,pinb
				cpi temp,$01
				breq rec_izq
				lsr temp 				; recorrer izquierda
				out portb, temp
				cpi dato, $01
				breq doble_vel
				rcall delay_500ms
				rjmp main
izquierda: 		in temp,pinb
				cpi temp,$80
				breq rec_der
				lsl temp  				; recorrer izquierda
				out portb, temp
				cpi dato, $01
				breq doble_vel
				rcall delay_500ms
				rjmp main

rec_der:		ldi bandera, $01
				rjmp derecha

rec_izq:		ldi bandera, $00
				rjmp izquierda
doble_vel:		rcall delay_125m
				rjmp main
;########################################################
setting:		ldi temp, $01
				out portb, temp
				rjmp main


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


delay_500ms:ldi cont2, 200		
lazo2_1:	ldi cont1, 250
lazo1_1:	nop
			nop
			nop
			nop
			nop
			nop
			nop
			dec cont1
			brne lazo1_1
			dec cont2
			brne lazo2_1
			ret	