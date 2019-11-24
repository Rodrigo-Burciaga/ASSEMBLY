;; PRACTICE 8 PC - USART - USB



							.include "m48def.inc"
							.def temp  = r16
							.def cont1 = r17
							.def cont2 = r18
							.def counter_letters = r19
							.cseg 
							.org 0
							rjmp reset
							.org $012
							rjmp int_rx

reset:						ldi temp, $fe
							ldi counter_letters, $00
							out ddrd, temp
							rcall delay_100ms

configure_usart:			ldi temp, $02
							sts	ucsr0a, temp
							ldi temp, $98
							sts ucsr0b, temp
							ldi temp, 12					;doble de la velocidad
							sts ubrr0l, temp
							sei

configure_lcd:				ldi temp, $20 					;Se manda el 10 en la parte alta
							rcall output_lcd
							ldi temp, $C0
							rcall output_lcd
							rcall delay_5ms					;tiempo para leer la instrucción el lcd
							;Se manda el siguiente function set
							;DISPLAY ON OFF 
							;CURSOR 

							ldi temp, $00 					;Se manda el 0 en la parte ALTA
							rcall output_lcd
							ldi temp, $E0 					;Se manda e en la parte BAJA
							rcall output_lcd
							;Le damos tiempo al LCD para que haga la operacion
							rcall delay_5ms
							;---------------------------------------------------------------

							;Se manda el siguiente function set
							;Corrimiento de memoria ENTRY MODE SET

							ldi temp, $00 					;Se manda el 2 en la parte ALTA
							rcall output_lcd
							ldi temp, $60 ;Se manda el 6 en la parte BAJA
							rcall output_lcd
							;Le damos tiempo al LCD para que haga la operacion
							rcall delay_5ms
							;---------------------------------------------------------------
				
							;Clear display

							ldi temp, $00 					;Se manda el 2 en la parte ALTA
							rcall output_lcd				
							ldi temp, $10 					;Se manda el 1 en la parte BAJA
							rcall output_lcd
							;Le damos tiempo al LCD para que haga la operacion
							rcall delay_5ms
							
main:						nop
							rjmp main


;*********************** SUBRUTINAS ************************

delay_5ms:   				ldi cont1, 2
lazo4:		 				ldi cont2, 250
lazo3:		 				nop
						 	nop
						 	nop
						 	nop
						 	nop
						 	nop
						 	nop
						 	dec cont2
						 	brne lazo3
						 	dec cont1 
						 	brne lazo4
						 	ret


delay_100ms: 				ldi cont1, 40
lazo2:		 				ldi cont2, 250
lazo1:						nop
							nop
							nop
							nop
							nop
							nop
							nop
							dec cont2
							brne lazo1
							dec cont1 
							brne lazo2
						    ret

output_lcd:					out portd, temp
							sbi portd, 2					;Generar el pulso ENABLE para el LCD
							nop
							cbi portd,2
							ret

verify_overflow:			cpi counter_letters, 16
							breq change_line
							cpi counter_letters, 33
							breq reset_lcd
							ret

change_line:				ldi temp, $C0 					
							rcall output_lcd				
							ldi temp, $00 					
							rcall output_lcd
							;Le damos tiempo al LCD para que haga la operacion
							rcall delay_5ms
							ret

reset_lcd:					ldi temp, $00 					;Se manda el 2 en la parte ALTA
							rcall output_lcd				
							ldi temp, $10 					;Se manda el 1 en la parte BAJA
							rcall output_lcd
							;Le damos tiempo al LCD para que haga la operacion
							rcall delay_5ms
							ldi counter_letters, $00
							ret


;************************** INTERRUPCIONES

int_rx:						lds temp, udr0				; se limpia automaticamente la bandera de recepción
							sts udr0, temp
							push temp					; dato recibido
							andi temp, $F0
							ori temp, $08
							rcall output_lcd
							pop temp
							swap temp
							andi temp, $F0
							ori temp, $08
							rcall output_lcd
							rcall delay_5ms
							inc counter_letters
							rcall verify_overflow
							reti

