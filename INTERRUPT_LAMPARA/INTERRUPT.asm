					.include "m48def.inc"
					.def temp=r16
					.def cont1=r0
					.def cont2=r1
					.def cont3=r2
					.def cont4=r3
					.def cont5=r4
					.cseg
					.org 0
					rjmp reset
					rjmp int_0


reset: 				ldi temp, $01
					out ddrb, temp			; portb 0 como salida
					ldi temp, $04
					out portd, temp			; configuramos pull up portd PD2 INT0
					ldi temp, $02
					sts eicra, temp
					ldi temp, $01
					out eimsk, temp
					sei

main:				rcall delay_10s
					cbi portb,0
					rjmp main

;######################################## Subrutinas
delay_15ms:			ldi temp, 6
					mov cont4, temp
lazo2:				ldi temp, 250
					mov cont5, temp
lazo1:				nop
					nop
					nop
					nop
					nop
					nop
					nop
					dec cont5
					brne lazo1
					dec cont4
					brne lazo2
					ret


delay_10s:			ldi temp, 20
					mov cont1, temp
lazo5:				ldi temp, 200
					mov cont2, temp
lazo4:				ldi temp, 250
					mov cont3, temp
lazo3:				nop
					nop
					nop
					nop
					nop
					nop
					nop
					dec cont3
					brne lazo3
					dec cont2
					brne lazo4
					dec cont1
					brne lazo5
					ret

		
;#######################################  Interrupciones
int_0: 				rcall delay_15ms
					ldi temp, $01
					out eifr, temp
					sbic pind, 2
					reti
					ldi temp, 20
					mov cont1, temp
					ldi temp, 200
					mov cont2, temp
					ldi temp,250
					mov cont3, temp
					ldi temp, $01
					out portb, temp
					reti