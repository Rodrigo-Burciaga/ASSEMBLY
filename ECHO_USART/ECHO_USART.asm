;;; ECHO SERVER USART

					.include "m48def.inc"
					.def temp=r16
					.cseg
					.org 0
					rjmp reset
					.org $012
					rjmp int_rx


reset:				ldi temp, $ff
					out ddrb, temp
					ldi temp, $02				; pin de transmisión y recepción entrada y salida
					out ddrd, temp

configure_usart:	sts	ucsr0a, temp
					ldi temp, $98
					sts ucsr0b, temp
					ldi temp, 12				;doble de la velocidad
					sts ubrr0l, temp
					sei

main:				nop
					rjmp main



;############################################ INTERRUPCIONES

int_rx:				lds temp, udr0				; se limpia automaticamente la bandera de recepción
					sts udr0, temp
					out	portb, temp
					reti
