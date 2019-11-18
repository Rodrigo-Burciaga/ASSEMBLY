				.include "m48def.inc"
				.def temp = r16
				.def contador = r17
				.cseg
				.org 0
				rjmp reset
				.org $010
				rjmp int_count

reset:			ldi temp, $05			; 1024 pre escalador
				out tccr0b, temp
				ldi temp, $01
				out tifr0, temp
				ldi temp, $01
				sts timsk0, temp
				sei
				ldi temp, $ff
				out ddrb, temp
				ldi temp, 0
				out portb, temp
				ldi contador, 0
			


main:			nop
				nop
				rjmp main
				

int_count:		inc contador
				ldi temp, $04
				cp contador, temp
				breq toogle
return:			reti
toogle:			
				ldi contador, $00
				sbic portb, 0
				rjmp clear_bit
				sbi portb, 0
				rjmp return
clear_bit:		cbi portb, 0
				rjmp return