			.include "m48def.inc"
			.def temp = r16
			.cseg
			.org 0

			ldi temp, $80
			out ddrb, temp
			ldi temp, $01
			out portb, temp ; pull up resistor
			
main:		in temp, pinb
			andi temp, $01
			breq encender
			cbi portb,7
			rjmp main


encender:	sbi portb,7
			rjmp main
