READ_CURRENT_KNOCK_ADC MACRO
	cjne	A, #6, exit_rck
	setb	RAM_28.3
	mov		ADCON1, #7
	mov		ADDATL, #0

loop_rck:
	jb		ADCON0.4, loop_rck
	mov		A, ADDATH
	subb	A, BASE_KNOCK   ; Естественный шум
	jnc		save_ck
	clr		A

save_ck:
	mov		KNOCK_LO, A
	mov	A, R7
	
exit_rck:
ENDM

INIT_HIP9011 MACRO
		mov	DPTR, #5F9Ch	; Начальный номер точки	настройки фильтра |
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		mov	DPTR, #0F93Bh
		movx	@DPTR, A
		mov	DPTR, #8A59h	; Настройка частоты фильтра | Номер в таблице частот - Точка настройки фильтра
		mov	A, R1
		movc	A, @A+DPTR
		mov	DPTR, #0F931h
		movx	@DPTR, A
		
		clr	P1.5		; Port 1 (PDIR=0)
		
		mov	B, #41h		; B-Register
		
		HIP9011_SPI_PROG_AND_SLEEP
		
		mov	DPTR, #5F9Ch	; Начальный номер точки	настройки фильтра |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		
		HIP9011_SPI_PROG_AND_SLEEP
		
		mov	DPTR, #5F9Fh
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		
		HIP9011_SPI_PROG_AND_SLEEP
		
		mov	DPTR, #5F9Dh
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		
		HIP9011_SPI_PROG_AND_SLEEP
		
		mov	DPTR, #5F9Eh
		clr	A
		movc	A, @A+DPTR
		setb	ACC.2		; Accumulator
		mov	B, A		; B-Register
		
		HIP9011_SPI_PROG
		
		lcall	HIP9011_SPI_SLEEP
		setb	P1.5		; Port 1 (PDIR=0)
		mov	ADCON1,	#7	; A/D Converter	Control	Register 1
		mov	ADDATL,	#0	; A/D Converter	Data Register, Low Byte

code_2531:				; CODE XREF: RESET_0:code_2531j
		jb	ADCON0.4, code_2531 ; A/D Converter Control Register 0
		mov	A, ADDATH	; A/D Converter	Data Register, High Byte
		cjne	A, #7, code_2539

code_2539:
		jc	code_253D
		mov	A, #7

code_253D:				; CODE XREF: RESET_0:code_2539j
		mov	BASE_KNOCK,	A
		lcall	HIP9011_SPI_SLEEP
		clr	P1.5		; Port 1 (PDIR=0)
		mov	DPTR, #5F9Eh
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		
		HIP9011_SPI_PROG
		
		lcall	HIP9011_SPI_SLEEP
		setb	P1.5
ENDM

HIP9011_SPI_PROG MACRO
		clr		P1.7
		lcall	HIP9011_SPI_SEND_COMMAND
		setb	P1.7
ENDM

HIP9011_SPI_PROG_AND_SLEEP MACRO
		HIP9011_SPI_PROG1
		lcall	HIP9011_SPI_SLEEP
		setb	P1.5		; Port 1 (PDIR=0)
		lcall	HIP9011_SPI_SLEEP
		clr		P1.5		; Port 1 (PDIR=0)
ENDM