;; PRACTICE 9 USART - LCD - KEYPAD

							.include "m48def.inc"
							.def temp  = r16
							.def cont1 = r17
							.def cont2 = r18
							.def counter_letters = r19
							.def tecla = r20
							.def offset = r21
							.def copia_letter = r22
							.cseg 
							.org 0
							rjmp reset
							.org $012
							rjmp int_rx

reset:						ldi temp, $fe
							out ddrd, temp
							ldi counter_letters, $00
							ldi offset, $41
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

configure_keypad:			ldi temp, $f0
							out ddrb, temp
							ldi temp, $0f
							out portb, temp								; pull up
							rcall delay_100ms


main:						sbis pinb, 0
							rcall file1_pressed
							sbis pinb, 1
							rcall file2_pressed
							sbis pinb, 2
							rcall file3_pressed
							sbis pinb, 3
							rcall file4_pressed
							rjmp main





;******************************************* SUBRUTINAS *************************

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

file1_pressed:				ldi tecla, 0
							rcall pressHorizontal
							ret


file2_pressed:				ldi tecla, 4
							rcall pressHorizontal
							ret


file3_pressed:				ldi tecla, 8
							rcall pressHorizontal
							ret


file4_pressed:				ldi tecla, 12
							rcall pressHorizontal
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
							mov temp, copia_letter
							rcall algorithm_output_lcd
							ret


pressHorizontal:            ldi temp, $0f
							out ddrb, temp
							ldi temp, $f0
							out portb, temp	
							nop								; pull up
							rcall leeColumnas
							ret

leeColumnas:                sbis pinb, 4
							rcall col1_pressed
							sbis pinb, 5
							rcall col2_pressed
							sbis pinb, 6
							rcall col3_pressed
							sbis pinb, 7
							rcall col4_pressed
							ldi temp, $f0
							out ddrb, temp
							ldi temp, $0f
							out portb, temp	
							ret



col1_pressed:               mov temp, offset
							add temp, tecla
							mov copia_letter, temp
							rcall algorithm_output_lcd
							sts udr0, copia_letter
							inc counter_letters
							rcall verify_overflow
							rcall delay_100ms
							rcall delay_100ms
							ret 

col2_pressed:               ldi temp, 1
							add tecla, temp
							mov temp, offset
							add temp, tecla
							mov copia_letter, temp
							rcall algorithm_output_lcd
							sts udr0, copia_letter
							inc counter_letters
							rcall verify_overflow
							rcall delay_100ms
							rcall delay_100ms
							ret 

col3_pressed:               ldi temp, 2
							add tecla, temp
							mov temp, offset
							add temp, tecla
							mov copia_letter, temp
							rcall algorithm_output_lcd
							sts udr0, copia_letter
							inc counter_letters
							rcall verify_overflow
							rcall delay_100ms
							rcall delay_100ms
							ret 

col4_pressed:               ldi temp, 3
							add tecla, temp
							cpi tecla, 15
							breq cambiar_offset
							mov temp, offset
							add temp, tecla
							mov copia_letter, temp
							rcall algorithm_output_lcd
							sts udr0, copia_letter
							inc counter_letters
							rcall verify_overflow
regreso:					rcall delay_100ms
							rcall delay_100ms
							ret 



cambiar_offset:				cpi offset, $41			
							breq segundo_offset
							cpi offset, $50
							breq tercer_offset
							cpi offset, $30
							breq cuarto_offset
							cpi offset, $61
							breq quinto_offset
							ldi offset, $41				;LETRAS MAYÚSCULAS A - O
							rjmp regreso


segundo_offset:				ldi offset, $50    			;LETRAS MAYÚSCULAS P - ...
							rjmp regreso
tercer_offset:				ldi offset, $30				;NUMEROS 0-9
							rjmp regreso
cuarto_offset:			    ldi offset, $61
							rjmp regreso				;LETRAS MINUSCULAS a - o	
quinto_offset:				ldi offset, $70				;LETRAS MINÚSCULAS p - ..
							rjmp regreso					
							
algorithm_output_lcd:		push temp				
							andi temp, $F0
							ori temp, $08
							rcall output_lcd
							pop temp
							swap temp
							andi temp, $F0
							ori temp, $08
							rcall output_lcd
							rcall delay_5ms
							ret

;************************************** INTERRUPCIONES ****************************************+

int_rx:						lds temp, udr0				; se limpia automaticamente la bandera de recepción
							sts udr0, temp
							mov copia_letter, temp
							rcall algorithm_output_lcd
							rcall delay_5ms
							inc counter_letters
							rcall verify_overflow
							reti