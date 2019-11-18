.def temp = r16
.cseg
.org 0
rjmp reset
.org 0x00B
rjmp compa

reset:
	ldi temp,$ff
	out ddrb,temp
	/*Configuracion del timer*/
	ldi temp,$0B
	sts tccr1b,temp
	/*Agregamos el valor calculado para OCCR1A con el preescalador definido a 64 t=1seg(OCR1A)(N)(1microseg)*/
	ldi temp,$3D
	sts OCR1AH,temp
	ldi temp,$09
	sts OCR1AL,temp

	ldi temp,$02
	sts timsk1,temp
	sei

main:
	OUT PORTB,temp
	rjmp main
compa:
	inc temp
	reti

