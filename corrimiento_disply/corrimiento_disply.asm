			.include "m48def.inc"
			.def temp = r16
			.cseg
			.org 0

			ldi zl, low(display*2)
			ldi zh, high(display*2)
			ldi xl, $00
			ldi xh, $01
			ldi temp, $04
lazo:		lpm
			st x+,r0
			adiw zl,1
			dec temp
			brne lazo
			nop	
			nop

			.cseg
display:	.db $7e, $03, $5a, $6d
