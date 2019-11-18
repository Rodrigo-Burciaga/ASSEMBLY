; 	CONTADOR DEL 0 AL 9 ASCENDENTE Y DESCENDENTE CON INTERRUPCIÓN EXTERNA
;	AUTOR 		RODRIGO BURCIAGA
;	MICROCONTROLADORES ESCOM
;	PROFESOR JUANITO CARLOS

				.include "m48def.inc"
				.def temp = r16
				.def contador = r17
				.def temp2 = r18
				.def cont1 = r3
				.def cont2 = r4
				.def cont3 = r5
				.def cont4 = r6
				.def cont5 = r7
				.def bandera = r8
				.cseg 
				.org 0
				rjmp reset
				rjmp int_0



reset:			ldi temp, $ff
				out ddrb, temp			; configuracion puerto b salida
				ldi temp, $04
				out portd, temp			; configuración pull up D2 int0
				ldi temp, $02
				sts eicra, temp
				ldi temp, $01
				out eimsk, temp
				sei	
				ldi zl, low(display*2)
				ldi zh, high(display*2)
				ldi xl, $00
				ldi xh, $01
				ldi temp, 1
				mov bandera, temp		; 1 ascendente 0 descendente
				ldi contador, 0
				ldi temp, $0A
load_data:		lpm
				st x+, r0
				adiw zl, 1
				dec temp
				brne load_data
main:			ldi contador, 0
salida_bcd:		mov xl, contador
				ld temp2, x
				out portb, temp2
				rcall delay_1s
comprobacion:	ldi temp2, 1			; comprobacion ascendente
				cp bandera, temp2
				breq ascendente
descendente:	ldi temp2, 0
				cp contador, temp2
				breq poner9
				dec contador
				rjmp salida_bcd
ascendente:		ldi temp2, 9
				cp contador, temp2
				breq main
				inc contador
				rjmp salida_bcd
poner9:			ldi contador, 9
				rjmp salida_bcd
				

;a	b	c	d	e	f	g      	cátodo común
;b6	b5	b4	b3	b2	b1	b0
.cseg	;	 0	 1	 2	 3	 4	 5	 6	 7	 8	 9
display:.db $7e,$30,$6d,$79,$33,$5b,$5f,$70,$7f,$7b
 

; ################################## SUBRUTINAS
delay_1s:			ldi temp, 2
					mov cont3, temp			
lazo3:				ldi temp, 200
					mov cont2, temp		
lazo2:				ldi temp, 250
					mov cont1, temp
lazo1:				nop
					nop
					nop
					nop
					nop
					nop
					nop
					dec cont1
					brne lazo1
					dec cont2
					brne lazo2
					dec cont3
					brne lazo3
					ret	


delay_15ms:			ldi temp, 6
					mov cont4, temp
lazo2_1:			ldi temp, 250
					mov cont5, temp
lazo1_1:			nop
					nop
					nop
					nop
					nop
					nop
					nop
					dec cont5
					brne lazo1_1
					dec cont4
					brne lazo2_1
					ret

; ################################## INTERRUPCIONES
int_0: 			    rcall delay_15ms
					ldi temp, $01
					out eifr, temp
					sbic pind, 2
					reti
					com bandera
					mov temp, bandera
					andi temp, 1
					mov bandera, temp
					reti

					