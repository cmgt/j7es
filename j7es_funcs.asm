CALC_DUOZ_REGXX:
		mov	DPTR, #6095h	; Зона нечувствительности | об/мин.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, DELTA_RPM_XX
		mov	R0, A
		lcall	ABS_ACC
		clr	C
		subb	A, B		; B-Register
		jnc	CALC_DUOZ_REGXX_1
		mov	R0, #0

CALC_DUOZ_REGXX_1:				; CODE XREF: CALC_ADAPTATION_RXX+108j
		lcall	code_ADE2
		mov	B, #8		; B-Register
		lcall	MUL_ABSR0R1_B
		mov	A, R0
		mov	R0, B		; B-Register
		mov	R1, A
		mov	A, R1
		mov	DPTR, #6094h	; Пропорциональный коэффициент 2 | гр./(об/мин)
		jb	ACC.7, CALC_DUOZ_REGXX_2 ; Accumulator
		mov	DPTR, #6093h	; Пропорциональный коэффициент 1 | гр./(об/мин)

CALC_DUOZ_REGXX_2:				; CODE XREF: CALC_ADAPTATION_RXX+11Aj
		
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_ABSR0R1_B
		lcall	code_ADEC
		mov	B, A		; B-Register
		mov	DPTR, #6096h	; Минимальное смещение УОЗ | гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #6097h	; Максимальное смещение	УОЗ | гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		mov	A, B		; B-Register
		lcall	code_AD14
		mov	DPTR, #0FAB0h
		movx	@DPTR, A
	ret
	
HIP9011_SPI_SLEEP:
	FILL_NOP	30h
	ret
	
	
HIP9011_SPI_SEND_COMMAND:				; CODE XREF: IE0_0+2Fp	IE0_0+19Dp ...		
		setb	P1.1
		mov		C, B.7; B-Register
		mov		P1.0, C	; Accumulator
		clr		P1.1
		nop
		
		setb	P1.1
		mov		C, B.6; B-Register
		mov		P1.0, C	; Accumulator
		clr		P1.1
		nop
		
		setb	P1.1
		mov		C, B.5; B-Register
		mov		P1.0, C	; Accumulator
		clr		P1.1
		nop
		
		setb	P1.1
		mov		C, B.4; B-Register
		mov		P1.0, C	; Accumulator
		clr		P1.1
		nop
		
		setb	P1.1
		mov		C, B.3; B-Register
		mov		P1.0, C	; Accumulator
		clr		P1.1
		nop
		
		setb	P1.1
		mov		C, B.2; B-Register
		mov		P1.0, C	; Accumulator
		clr		P1.1
		nop
		
		setb	P1.1
		mov		C, B.1; B-Register
		mov		P1.0, C	; Accumulator
		clr		P1.1
		nop
		
		setb	P1.1
		mov		C, B.0; B-Register
		mov		P1.0, C	; Accumulator
		clr		P1.1
		nop
		ret
; End of function SPI_HIP

;=============== S U B	R O U T	I N E =======================================
FLAGS_INIT:
					; RESET_0-BCF3p ...
		mov	DPTR, #6051h
		clr	A
		movc	A, @A+DPTR
		mov	Hardware, A
		mov	DPTR, #6052h
		clr	A
		movc	A, @A+DPTR
		mov	B, A
		
		mov	DPTR, #5F02h
		clr		A
		movc	A, @A+DPTR
		mov		C, ACC.0
		mov		B.0, C
		
		mov	DPTR, #5F01h
		clr	A
		movc	A, @A+DPTR
		mov	C, ACC.2	; Accumulator
		mov	RAM_27.6, C
		
		mov	DPTR, #5F00h
		clr	A
		movc	A, @A+DPTR
		mov		C, ACC.3
		mov		RAM_28.7, C
		
		jnb	Hardware.5, code_E9DC
		jb	RAM_22.4, code_E9DC
		jb	ACC.1, code_E9DC ; Accumulator
		clr		B.5
		orl		P9, #40h	; Port 9 (PDIR=0)
		sjmp	code_E9DD
; ---------------------------------------------------------------------------

code_E9DC:				; CODE XREF: code_E9A9+24j
					; code_E9A9+27j ...
		setb	B.5
		anl		P9, #0BFh	; Port 9 (PDIR=0)
		
code_E9DD:
		mov Options, B
		ret
; End of function code_E9A9