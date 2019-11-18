
;Fast PWM: MODULACIÓN POR ANCHO DE PULSO
;contador siempre es un contador asced=ndente, llega a 255 y vuelve a 0
;cuando se sube o se baja el registro de comparacion se modifica la se;al

;Si se sube el registro de comparacion se hace mas ancho el pulso
;Si se baja, el ancho del pulso disminuye

;La frecuencia siempre es la misma.


;¿para que sirve modificar el ancho del pulso?
;Cuando se obtiene el voltaje promedio, este depende de si el registro de comparación estuvo en alto en bajo


;EJEMPLO
;poner un led en la salida OC0A
;el botón va en C0
;Si se presiona el botón la intensidad del led aumente


;Frecuencia de PWM = clk_IO / n * 256 ||| CLK = 1m n = 1 ... Aprox 4kh
	
	;Encabezado necesario para funcionamiento del problema
	.include "m48def.inc"
	.def temp = r16
	.def cte = r17
	.def cont1 = r18
	.def cont2 = r19
	.cseg
	.org 0 
	
	;Configuración de registros

	
	;Cada que presionamos el botón vamos a incrementar el registro de comparación
	;Solo se incrementa cuando el registro contador alcanza el TOP en el siguiente pulso


	;Lo vamos a hacer en FAST PWM
	;El top es 0xFF

	;Ponemos el 3 en TCCR0A para configurar FAST PWM
	;Esta es la salida
	;Con un 2 en la parte alta para que a salida se pone en 0 cuando la comparación es igual y se pone a 1 en el minimo (0)
	ldi temp, $83
	out tccr0a, temp		
	
	;Configuramos el prescalador a 1
	ldi temp, $01
	out tccr0b, temp

	;Configuramos la comparación (donde va a prender) en 125 de 255
	ldi temp, 5
	out ocr0a, temp
	
	;Habilitamos pull up en BO para que sea entreda
	ldi temp, $03
	out portb, temp

	;Habilitamos el buffer de salida
	ldi temp, $40
	out ddrd,temp
	;se asigna el incremento de 5 en 5
	ldi cte, $05
	
		;ver si se está presindo el botón 
main:	in temp, pinb
		;si B0 está presionado comienza a incrementar
		andi temp, $01
		breq incrementar
		;Si B1 está presionado comienza a decrementar
		in temp, pinb
		andi temp, $02
		breq decrementar
		rjmp main

incrementar: rcall delay_125ms
			;leer el registro de comparación
		 	 in temp, ocr0a	
			 ;Comparamos el registro con el máximo, si ya es el máximo no hacemos nada
			 cpi temp, $FF
			 breq main
			;sumamos la constante al registro para incrementar
			 add temp, cte
			;se escribe el registro de comparación con el incremento en 5
			 out ocr0a, temp
			 rjmp main

decrementar: rcall delay_125ms
			;leer el registro de comparación
			 in temp, ocr0a	
			 ;Comparamos el registro con el máximo, si ya es el máximo no hacemos nada
			 cpi temp, $00
			 breq main
			;sumamos la constante al registro para incrementar
			 sub temp, cte
			;se escribe el registro de comparación con el incremento en 5
			 out ocr0a, temp
			 rjmp main

return: rjmp main

delay_125ms: ;125mil ciclos = 125 ms | 50(10(250))
			
			 ;necesitamos un contador que vaya a 250 y el otro a 50
			 ldi cont1, 50
lazo2:		 ldi cont2, 250
			 nop
lazo1:		 nop
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

			 ;En la practica sube y baja y tiene tope