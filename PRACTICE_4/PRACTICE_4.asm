; 	CONTADOR DEL 0 AL 99 ASCENDENTE Y DESCENDENTE CON INTERRUPCIÓN EXTERNA
;	AUTOR 		RODRIGO BURCIAGA
;	MICROCONTROLADORES ESCOM
;	PROFESOR JUANITO CARLOS

				.include "m48def.inc"
				.def temp = r16
				.def mux = r17
				.def unidades = r18
				.def decenas = r19
				.def temp2 = r20
				.def cont1 = r3
				.def cont2 = r4
				.def cont3 = r5
				.def cont4 = r6
				.def cont5 = r7
				.def bandera = r8
				.def contador = r9
				.cseg 
				.org 0
				rjmp reset
				rjmp int_0					; interrupcion int0
				.org $010
				rjmp int_count				; overflow interrupt timer counter0

reset:			ldi temp, $ff
				out ddrb, temp			; configuracion puerto b salida
				ldi temp, $04
				out portd, temp			; configuración pull up D2 int0
				ldi temp, $02
				sts eicra, temp
				ldi temp, $01
				out eimsk, temp
				sei
				; FINAL CONFIG INTERRUPT_0
				ldi temp, $03
				out ddrc, temp			; c0, c1 salidas para Mux
				rcall config_int_timer0
				ldi zl, low(display*2)
				ldi zh, high(display*2)
				ldi xl, $00
				ldi xh, $01
				ldi temp, 1
				mov bandera, temp		; 1 ascendente 0 descendente
				ldi decenas, $08
				ldi unidades, $00
				ldi temp, $0A
load_data:		lpm
				st x+, r0
				adiw zl, 1
				dec temp
				brne load_data






				
			
			
main:			ldi mux, $02
				out portc, mux
				mov xl, unidades
				ld temp2, x
				out portb, temp2
				rcall delay_5ms

			
				ldi mux, $01
				out portc, mux
				mov xl, decenas
				ld temp2, x
				out portb, temp2
				rcall delay_5ms
				
			
				rjmp main


;a	b	c	d	e	f	g      	cátodo común
;b6	b5	b4	b3	b2	b1	b0
.cseg	;	 0	 1	 2	 3	 4	 5	 6	 7	 8	 9
display:.db $7e,$30,$6d,$79,$33,$5b,$5f,$70,$7f,$7b
 

; ################################## SUBRUTINAS
delay_1s:			ldi temp, 2
					mov cont3, temp			
lazo3:				ldi temp, 200
					mov cont2, temp		
lazo2:				ldi temp, 250
					mov cont1, temp
lazo1:				nop
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
					dec cont3
					brne lazo3
					ret


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

config_int_timer0:	ldi temp, $05			; 1024 pre escalador
					out tccr0b, temp
					ldi temp, $01
					out tifr0, temp
					ldi temp, $01
					sts timsk0, temp
					sei

; ################################## INTERRUPCIONES
int_0: 			    rcall delay_5ms
					rcall delay_5ms
					rcall delay_5ms
					ldi temp, $01
					out eifr, temp
					sbic pind, 2
					reti
					com bandera
					mov temp, bandera
					andi temp, 1
					mov bandera, temp
					reti

int_count:			inc contador
					ldi temp, $02
					cp contador, temp
					breq cambiar
return:				reti

cambiar:			ldi temp, 1
					cp bandera, temp
					breq aumentar

decrementar:		ldi temp, $00
					mov contador, temp
					ldi temp, $00
					cp unidades, temp
					breq reset_unidades_dec
					dec unidades
					rjmp return

reset_unidades_dec:	ldi unidades, $09

disminuir_decenas:  ldi temp, $00
					cp decenas, temp
					breq reset_decenas_dec
					dec decenas
					rjmp return

reset_decenas_dec:  ldi decenas, $09
					rjmp return




;#######################################

aumentar:			ldi temp, $00
					mov contador, temp
					ldi temp, $09
					cp unidades, temp
					breq reset_unidades
					inc unidades
					rjmp return
reset_unidades:		ldi unidades, $00

aumentar_decenas:   ldi temp, $09
					cp decenas, temp
					breq reset_decenas
					inc decenas
					rjmp return

reset_decenas:      ldi decenas, $00
					rjmp return