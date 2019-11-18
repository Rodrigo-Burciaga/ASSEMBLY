					.include "m48def.inc"
					.def temp = r16
					.def cont1 = r17
					.def cont2 = r18
					.cseg
					.org 0

					
					ldi temp, $FF
					out ddrb, temp



main:				sbi pinb, 0
					rcall delay_5ms
					cbi pinb, 0
					rcall delay_5ms
					rjmp main



delay_5ms:			ldi cont2, 2		
lazo2:				ldi cont1, 250
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
					ret	