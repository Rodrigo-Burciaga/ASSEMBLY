.include "m48def.inc"
.def	temp = r16
.cseg
.org 0

nop 
nop
ldi	zl, low(salto)
ldi zh, high(salto)
ijmp
nop
nop


salto:	nop
		nop
		ret	