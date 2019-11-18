			.include "m48def.inc"
			.def	temp = r16
			.cseg
			.org 0

main:		nop 
			nop
			ldi temp, 4
			cpi	temp, 2
			brne ejecutar
			nop
			inc temp
			rjmp main


ejecutar:	nop
			nop