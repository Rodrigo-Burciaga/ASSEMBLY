			.include "m48def.inc"
			.def temp = r16

			.cseg
			.org 0

			ldi	temp, $FF
			out portb, temp ;configure pull up resistors
			ldi	temp, $01
			out ddrd, temp	;configure as output

main:		in temp, pinb
			com	temp
			out portd, temp
			rjmp main
