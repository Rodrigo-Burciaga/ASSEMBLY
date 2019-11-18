; 	FRECUENCIOMETRO
;	AUTOR 		RODRIGO BURCIAGA
;	MICROCONTROLADORES ESCOM
;	PROFESOR JUANITO CARLOS

					.include "m48def.inc"
					.def temp = r16
					.def mux = r17
					.def unidades = r18
					.def decenas = r19
					.def centenas = r20
					.def unidades_aux = r21
					.def decenas_aux = r22
					.def centenas_aux = r23
					.def cont4 = r6
					.def cont5 = r7
					.def temp2 = r8
					.cseg 
					.org 0
					rjmp reset
					rjmp int_0
					.org 0x00B
					rjmp compa	


reset:				ldi temp, $ff
					out ddrb, temp			; configuracion puerto b salida
					ldi temp, $04
					out portd, temp			; configuración pull up D2 int0
					ldi temp, $02
					sts eicra, temp
					ldi temp, $01
					out eimsk, temp
					sei
					; FINAL CONFIG INTERRUPT_0
					ldi temp, $07
					out ddrc, temp			; c0, c1 y c2 salidas para Mux
					ldi zl, low(display*2)
					ldi zh, high(display*2)
					ldi xl, $00
					ldi xh, $01
					; FINAL CONFIG DATA 
					ldi unidades, $00
					ldi decenas, $00
					ldi centenas, $00
					ldi unidades_aux, $00
					ldi decenas_aux, $00
					ldi centenas_aux, $00
					; FINAL ASIGN RESET VALUES
					ldi temp,$0B
					sts tccr1b,temp
					/*Agregamos el valor calculado para OCCR1A con el preescalador definido a 64 t=1seg(OCR1A)(N)(1microseg)*/
					ldi temp,$3D
					sts OCR1AH,temp
					ldi temp,$09
					sts OCR1AL,temp
					ldi temp,$02
					sts timsk1,temp
					sei
					; FINAL CONFIG TIMER 1	
					ldi temp, $0A				
load_data:			lpm
					st x+, r0
					adiw zl, 1
					dec temp
					brne load_data



main:				ldi mux, $06
					out portc, mux
					mov xl, unidades
					ld temp2, x
					out portb, temp2
					rcall delay_5ms
					

					ldi mux, $05
					out portc, mux
					mov xl, decenas
					ld temp2, x
					out portb, temp2
					rcall delay_5ms

					ldi mux, $03
					out portc, mux
					mov xl, centenas
					ld temp2, x
					out portb, temp2
					rcall delay_5ms

					rjmp main

			
				


;a	b	c	d	e	f	g      	cátodo común
;b6	b5	b4	b3	b2	b1	b0
.cseg	;	 0	 1	 2	 3	 4	 5	 6	 7	 8	 9
display:.db $7e,$30,$6d,$79,$33,$5b,$5f,$70,$7f,$7b


;########################################## SUBRUTINAS
delay_5ms:			ldi temp, 2
					mov cont4, temp
lazo2_1:			ldi temp, 250
					mov cont5, temp
lazo1_1:			nop
					nop
					nop
					nop
					nop
					nop
					nop
					dec cont5
					brne lazo1_1
					dec cont4
					brne lazo2_1
					ret



;########################################## INTERRUPCIONES
int_0:				sbic pind, 2
return:				reti
aumentar:			ldi temp, $09
					cp unidades_aux, temp
					breq reset_unidades
					inc unidades_aux
					rjmp return
reset_unidades:		ldi unidades_aux, $00
aumentar_decenas:	ldi temp, $09
					cp decenas_aux, temp
					breq reset_decenas
					inc decenas_aux
					rjmp return
reset_decenas:      ldi decenas_aux, $00
					ldi temp, $09
					cp centenas_aux, temp
					breq reset_centenas
					inc centenas_aux
					rjmp return
reset_centenas:		ldi centenas_aux, $00
					rjmp return


compa:				mov unidades, unidades_aux
					mov decenas, decenas_aux
					mov	centenas, centenas_aux
					ldi unidades_aux, $00
					ldi decenas_aux, $00
					ldi centenas_aux, $00
					reti


