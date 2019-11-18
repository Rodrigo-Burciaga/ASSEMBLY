.include "m48def.inc"

.def	temp = r16
.cseg
.org	0


ldi	xl, $06
ldi xh, $01 	
ldi temp, 4
ldi r17, 3
add temp, r17
st x+,temp
