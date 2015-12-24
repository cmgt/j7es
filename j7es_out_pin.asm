;============ Управление доп выводами
OUT_PIN_PROCESS:
		mov	R0, #0
		mov	R1, #0

code_EAFA:				; CODE XREF: code_EAF6+Cj
					; code_EAF6+4Cj ...
		cjne	R0, #3,	code_EAFB
		mov	A, R1
		jz	code_EB0A
		acall	code_EA42
code_EB0A:				; CODE XREF: code_EAF6+10j
		ret

code_EAFB:
		mov	DPTR, #5EF9h
		mov	A, R0
		inc	R0
		movc	A, @A+DPTR
		jz	code_EAFA

code_EB0B:				; CODE XREF: code_EAF6+9j
		jnb	ACC.0, code_EB44 ; Accumulator
		mov	DPTR, #6090h
		clr	A
		movc	A, @A+DPTR
		jb	ACC.1, code_EB22 ; Accumulator
		mov	C, RAM_23.3
		orl	C, RAM_24.3
		jc	code_EB74
		mov	B, TWAT		; B-Register
		sjmp	code_EB2E
; ---------------------------------------------------------------------------

code_EB22:				; CODE XREF: code_EAF6+1Dj
		mov		C, RAM_23.2
		orl		C, RAM_24.2
		jc		code_EB74
		mov		DPTR, #0F93Bh
		movx	A, @DPTR
		mov		B, A		; B-Register

code_EB2E:				; CODE XREF: code_EAF6+29j
		mov		DPTR, #6091h
		clr		A
		movc	A, @A+DPTR
		xch		A, B
		cjne	A, B, code_EB2F
code_EB2F:
		cpl		C
		jc		code_EB74
		
		xch		A, B
		mov		DPTR, #6092h
		clr		A
		movc	A, @A+DPTR
		cjne	A, B, code_EB30
code_EB30:
		jnc	code_EB74
		sjmp	code_EAFA
; ---------------------------------------------------------------------------

code_EB44:				; CODE XREF: code_EAF6:code_EB0Bj
		jnb	ACC.1, code_EB63 ; Accumulator
		mov	DPTR, #0F952h
		movx	A, @DPTR
		cjne	A, #5, out_pin_1
out_pin_1:
		jc		out_pin_2
		mov		A, #5
out_pin_2:
		push	ACC
		mov		B, RPM
		mov		DPTR, #5F0Ah
		movc	A, @A+DPTR
		xch		A, B
		cjne	A, B, out_pin_2_1
out_pin_2_1:
		cpl		C
		pop		B
		jc		code_EB74
		
		xch		A, B
		mov		DPTR, #5F10h
		movc	A, @A+DPTR
		cjne	A, B, out_pin_2_2
out_pin_2_2:
		jnc	code_EB74
		sjmp	code_EAFA
; ---------------------------------------------------------------------------

code_EB63:				; CODE XREF: code_EAF6:code_EB44j
		jnb		ACC.2, code_EAFA ; Accumulator
		mov		DPTR, #63D3h	; Зона регулирования | Зона - Обороты коленвала, об/мин	- Цикловое наполнение,мг/цикл
		mov		A, RPM_THR_3D_RT
		movc	A, @A+DPTR
		mov		C, ACC.3	; Accumulator

code_EB74:				; CODE XREF: code_EAF6+40j
					; code_EAF6+5Ej ...
		mov	DPTR, #0F999h
		movx	A, @DPTR
		mov		PSW.1, C
		cjne	R0, #1,	code_EB80
		mov		C, PSW.1
		mov		ACC.0, C	; Accumulator
		sjmp	code_EB92
; ---------------------------------------------------------------------------

code_EB80:				; CODE XREF: code_EAF6:code_EB74j
		cjne	R0, #2,	code_EB8C
		mov		C, PSW.1
		mov		ACC.1, C	; Accumulator
		setb	ACC.7
		sjmp	code_EB92
; ---------------------------------------------------------------------------

code_EB8C:				; CODE XREF: code_EAF6:code_EB80j
		cjne	R0, #3,	code_EB93
		mov		C, PSW.1
		mov		ACC.2, C	; Accumulator

code_EB92:				; CODE XREF: code_EAF6+87j
					; code_EAF6+93j
		movx	@DPTR, A
		inc	R1

code_EB93:
		jmp	code_EAFA

; End of function code_EAF6

; =============== S U B	R O U T	I N E =======================================

code_EA42:				; CODE XREF: RESET_0-C4D0p
					; RESET_0-A873p ...
		mov	DPTR, #0F999h
		movx	A, @DPTR
		mov		B, A
		
		jnb		ACC.7, code_EA43
		mov		DPTR, #0F9A7h
		movx	A, @DPTR
		mov		C, B.1
		mov		ACC.5, C
		movx	@DPTR, A
		
code_EA43:
		mov		DPTR, #0F9A8h
		movx	A, @DPTR
		mov		C, B.0
		mov		ACC.7, C
		mov		C, B.2
		mov		ACC.5, C
		movx	@DPTR, A
		
		mov	DPTR, #5F00h
		clr	A
		movc	A, @A+DPTR
		jnb	ACC.2, code_EA5C ; Accumulator
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		mov	C, ACC.3		; B-Register
		mov	DPTR, #0F9A8h
		movx	A, @DPTR
		mov	ACC.5, C	; Accumulator
		movx	@DPTR, A

code_EA5C:				; CODE XREF: code_EA42+5j
		anl	P9, #7Fh	; Port 9 (PDIR=0)
		mov	A, #0F0h ; 'Ё'
		lcall	code_EA81
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		lcall	code_EA81
		orl	P9, #80h	; Port 9 (PDIR=0)
		anl	P9, #7Fh	; Port 9 (PDIR=0)
		mov	A, #0FFh
		lcall	code_EA81
		mov	DPTR, #0F9A8h
		movx	A, @DPTR
		lcall	code_EA81
		orl	P9, #80h	; Port 9 (PDIR=0)
		ret
; End of function code_EA42