			.include "m48def.inc"
			.def temp = r16
			.cseg
			.org 0

reset:		ldi temp, low(RAMEND)
			out SPL, temp
			ldi temp, high(RAMEND)
			out SPH, temp	

main:		nop 
			nop
			;rjmp routine
			rcall routine
			nop
			nop
			rjmp main

.cseg
routine: 	ldi r19, $f5
	   		nop
			;rjmp main
			ret
			
