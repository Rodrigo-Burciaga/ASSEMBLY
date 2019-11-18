.include	"m48def.inc"
.def	temp = r16
.org	0

ldi temp, $05
ldi r17, $03
dec temp
add temp, r17
nop

