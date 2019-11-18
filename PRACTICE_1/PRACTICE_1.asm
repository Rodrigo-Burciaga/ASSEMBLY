				.include "m48def.inc"
				.cseg
				.def temp = r16
				.org 0


settings:		ldi temp, $f0
				out ddrb, temp
				ldi temp, $0f
				out portb, temp

main:			in temp, pinb
				com temp
				swap temp
				ori temp, $0f
				out portb, temp
				rjmp main
