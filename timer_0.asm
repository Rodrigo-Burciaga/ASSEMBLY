
.include "m48def.inc"
.def temp = r16
.cseg
.org 0
rjmp reset
.org $010
rjmp timer_cero

reset:
	ldi temp,$ff
	out ddrd,temp
	ldi temp,$04
	out tccr0b,temp	
	ldi temp,$01
	sts timsk0,temp
	sei
main:nop
	rjmp main
timer_cero:
	in temp,pind
	andi temp,$01
	out portd,temp
	reti