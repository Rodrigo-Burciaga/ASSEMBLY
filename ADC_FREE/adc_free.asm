				.include"m48def.inc"
				.def temp = r16
				.cseg
				.org 0 
				rjmp reset


				.org $015
				rjmp fin_conv


reset:			ldi temp, $ff
				out ddrb, temp  			#puerto de salida
				ldi temp, $60 
				sts admux, temp 			#configuramos el adc en modo free runing
				ldi temp, $01
				sts didr0, temp				#quitamos el buffer digital
				ldi temp, $eb
				sts adcsra, temp
				sei


main:			nop
				rjmp main



fin_conv:		lds temp, adch 				#registro extendido
				out portb, temp
				reti
