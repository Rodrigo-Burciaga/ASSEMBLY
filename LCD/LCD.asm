
				.include "m48def.inc"
				.def temp  = r16
				.def cont1 = r17
				.def cont2 = r18
				.cseg 
				.org 0


				ldi temp, $fe
				out ddrd, temp
				rcall delay_100ms

				;Se pasa el function set 0010 para que Data Length sea de 4 bits
				ldi temp, $20 ;Se manda el 10 en la parte alta
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2
				;---------------------------------------------------------------


				;Le damos tiempo al LCD para que haga la operacion
				rcall delay_5ms


				;Se manda el siguiente function seT
				;N = lineas del lcd | para 2 lineas N  = 2
				;F = tamaño del caracter = 0

				;Se manda el C en la parte ALTA
				ldi temp, $C0
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2
				
				ldi temp, $80 ;Se manda el 8 en la parte BAJA
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2

				;Le damos tiempo al LCD para que haga la operacion
				rcall delay_5ms
				;---------------------------------------------------------------

				;Se manda el siguiente function set
				;DISPLAY ON OFF 
				;CURSOR 

				ldi temp, $00 ;Se manda el 0 en la parte ALTA
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2
				
				ldi temp, $E0 ;Se manda e en la parte BAJA
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2

				;Le damos tiempo al LCD para que haga la operacion
				rcall delay_5ms
				;---------------------------------------------------------------

				;Se manda el siguiente function set
				;Corrimiento de memoria ENTRY MODE SET

				ldi temp, $00 ;Se manda el 2 en la parte ALTA
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2
				
				ldi temp, $60 ;Se manda el 6 en la parte BAJA
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2

				;Le damos tiempo al LCD para que haga la operacion
				rcall delay_5ms
				;---------------------------------------------------------------
				
				;Clear desplay

				ldi temp, $00 ;Se manda el 2 en la parte ALTA
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2
				
				ldi temp, $10 ;Se manda el 1 en la parte BAJA
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2

				;Le damos tiempo al LCD para que haga la operacion
				rcall delay_5ms
				;---------------------------------------------------------------

				;TODO LO SIGUIENTE ES LA ESCRITURA
				;Se escribe "H"

				ldi temp, $48 ;Se le pone 8 para habilitar RS de escritura 
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2
				
				ldi temp, $88 ;Se manda el 6 en la parte BAJA
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2

				;Le damos tiempo al LCD para que haga la operacion
				rcall delay_5ms

				;Se escribe "O"

				ldi temp, $48 ;Se le pone 8 para habilitar RS de escritura 
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2
				
				ldi temp, $F8 ;Se manda el 6 en la parte BAJA
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2

				;Le damos tiempo al LCD para que haga la operacion
				rcall delay_5ms

				;Se escribe "L"

				ldi temp, $48 ;Se le pone 8 para habilitar RS de escritura 
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2
				
				ldi temp, $C8 ;Se manda el 6 en la parte BAJA
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2

				;Le damos tiempo al LCD para que haga la operacion
				rcall delay_5ms

				;Se escribe "A"

				ldi temp, $48 ;Se le pone 8 para habilitar RS de escritura 
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2
				
				ldi temp, $18 ;Se manda el 6 en la parte BAJA
				out portd, temp

				;Generar el pulso ENABLE para el LCD
				sbi portd, 2
				nop
				cbi portd,2

				;Le damos tiempo al LCD para que haga la operacion
				rcall delay_5ms
				nop
				

delay_100ms: ldi cont1, 40
lazo2:		 ldi cont2, 250
lazo1:		 nop
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

delay_5ms:   ldi cont1, 2
lazo4:		 ldi cont2, 250
lazo3:		 nop
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