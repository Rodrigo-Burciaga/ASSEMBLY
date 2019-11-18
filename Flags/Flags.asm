			.include "m48def.inc"
			.cseg
			.org 0

			ldi r16,$80
			ldi r17, $FF

;			cp r16,r17
;			brge salto
			nop
			nop
			ldi r16, 0b01111111
			ldi r17, 0b01
			add r16, r17



salto:		nop
			nop