; =============== S U B	R O U T	I N E =======================================
CALC_DAD_ENGINE_STOP:				; CODE XREF: RESET_0-BC98p
		mov	DPTR, #0F80Ch
		movx	A, @DPTR
		mov	B, #4		; B-Register
		mul	AB
		mov	R2, A
		mov	R3, B		; B-Register
		jmp	code_EBF8
; End of function code_EB96

; =============== S U B	R O U T	I N E =======================================
CALC_DAD_VALUE:
		mov	C, RAM_23.6
		orl	C, RAM_24.6
		jnc	code_EBC3
		mov	A, THR_CODE
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		movc	A, @A+DPTR
		mov	R3, A
		mov	R2, RPM
		mov	DPTR, #0A1B1h	; Имитатор давления при	отказе ДАД | Абсолютное	давление, кПа*10 - Обороты коленвала, об/мин - Положение дросселя,%
		lcall	GET_3D_VALUE
		mov	B, #64h	; 'd'   ; B-Register
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		sjmp	code_EC2C
; ---------------------------------------------------------------------------

code_EBC3:				; CODE XREF: code_EBA4+4j
		mov	A, RAM_33
		jnz	code_EBC8
		ret
; ---------------------------------------------------------------------------

code_EBC8:				; CODE XREF: code_EBA4+21j
		mov	B, #40h	; '@'   ; B-Register
		mul	AB
		mov	MD0, RAM_34	; Multiplication/Division Register 0
		mov	MD1, RAM_35	; Multiplication/Division Register 1
		mov	MD2, RAM_7F	; Multiplication/Division Register 2
		mov	MD3, #0		; Multiplication/Division Register 3
		mov	MD4, A		; Multiplication/Division Register 4
		mov	MD5, B		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R2, MD0		; Multiplication/Division Register 0
		mov	R3, MD1		; Multiplication/Division Register 1
		mov	A, MD2		; Multiplication/Division Register 2
		mov	B, MD3		; Multiplication/Division Register 3
		mov	B, MD4		; Multiplication/Division Register 4
		mov	B, MD5		; Multiplication/Division Register 5
		jz	code_EBF8
		mov	R2, #0FFh
		mov	R3, #0FFh

code_EBF8:				; CODE XREF: code_EBA4+4Ej
		mov	DPTR, #609Ah	; Смещение характеристики ДАД |	вольт
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	R1, A
		mov	A, R0
		add	A, R2
		mov	R2, A
		mov	A, R1
		addc	A, R3
		mov	R3, A
		mov	DPTR, #6098h	; Hаклон характеристики	ДАД | кПа/вольт
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	R1, A
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	A, MD0		; Multiplication/Division Register 0
		mov	R0, MD1		; Multiplication/Division Register 1
		mov	R1, MD2		; Multiplication/Division Register 2
		mov	A, MD3		; Multiplication/Division Register 3
		jz	code_EC2C
		mov	R0, #0FFh
		mov	R1, #0FFh

code_EC2C:				; CODE XREF: code_EB96+Bj
					; code_EBA4+1Cj ...
		mov	PRESS_LO,	R0
		mov	PRESS_HI,	R1
		mov	DPTR, #0F876h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F98Ch
		movx	A, @DPTR
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		movc	A, @A+DPTR
		mov	R3, A
		mov	DPTR, #6613h	; Коэффициент выбора Тзаряда | Коэффициент - Обороты коленвала,	об/мин - Положение дросселя,%
		mov	R2, RPM_RT
		lcall	GET_3D_VALUE
		mov	B, A		; B-Register
		mov	DPTR, #0F87Bh
		movx	A, @DPTR
		mov	R0, A
		mov	DPTR, #0F93Bh
		movx	A, @DPTR
		clr	C
		subb	A, R0
		jnc	code_EC65
		mov	R1, A
		clr	A
		clr	C
		subb	A, R1
		mul	AB
		clr	A
		clr	C
		subb	A, B		; B-Register
		sjmp	code_EC68
; ---------------------------------------------------------------------------

code_EC65:				; CODE XREF: code_EBA4+B3j
		mul	AB
		mov	A, B		; B-Register

code_EC68:				; CODE XREF: code_EBA4+BEj
		add	A, R0
		mov	R0, A
		mov	B, #1Ah		; B-Register
		mov	DPTR, #0F99Bh
		movx	A, @DPTR
		clr	C
		subb	A, R0
		jnc	code_EC81
		mov	R1, A
		clr	A
		clr	C
		subb	A, R1
		mul	AB
		clr	A
		clr	C
		subb	A, B		; B-Register
		sjmp	code_EC84
; ---------------------------------------------------------------------------

code_EC81:				; CODE XREF: code_EBA4+CFj
		mul	AB
		mov	A, B		; B-Register

code_EC84:				; CODE XREF: code_EBA4+DAj
		add	A, R0
		movx	@DPTR, A
		mov	R0, A
		mov	DPTR, #8C27h	; Коррекция Тзаряда | Коэффициент коррекции - Тзаряда, град.С
		lcall	code_AED3
		mov	DPTR, #0F979h
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	A, R0
		mul	AB
		jnb	ACC.7, code_EC9A ; Accumulator
		inc	B		; B-Register

code_EC9A:				; CODE XREF: code_EBA4+F1j
		mov	A, B		; B-Register
		mov	DPTR, #0F99Ah
		movx	@DPTR, A
		add	A, #0E9h ; 'щ'
		mov	B, A		; B-Register
		clr	A
		addc	A, #0
		mov	MD0, PRESS_LO	; Multiplication/Division Register 0
		mov	MD4, #25h ; '%' ; Multiplication/Division Register 4
		mov	MD1, PRESS_HI	; Multiplication/Division Register 1
		mov	MD5, #1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		nop
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD2, R2		; Multiplication/Division Register 2
		mov	MD3, R3		; Multiplication/Division Register 3
		mov	MD4, B		; Multiplication/Division Register 4
		mov	MD5, A		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	A, MD2		; Multiplication/Division Register 2
		mov	A, MD3		; Multiplication/Division Register 3
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		
		mov	DPTR, #60ADh	; Цилиндровый объем двигателя |	см.куб.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, #1
		movc	A, @A+DPTR
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD4, B		; Multiplication/Division Register 4
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD5, A		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	A, MD0		; Multiplication/Division Register 0
		mov	A, MD1		; Multiplication/Division Register 1
		mov	R0, MD2		; Multiplication/Division Register 2
		mov	R1, MD3		; Multiplication/Division Register 3
		
		mov	DPTR, #0F99Ch
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		
		mov	MD0, PRESS_LO	; Multiplication/Division Register 0
		mov	MD4, #3		; Multiplication/Division Register 4
		mov	MD1, PRESS_HI	; Multiplication/Division Register 1
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		nop
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD2, R2		; Multiplication/Division Register 2
		mov	MD3, R3		; Multiplication/Division Register 3
		mov	MD4, #5		; Multiplication/Division Register 4
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	A, MD2		; Multiplication/Division Register 2
		mov	A, MD3		; Multiplication/Division Register 3
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		mov	DPTR, #5EF2h	; Минимум для квантования давления | кПа
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		clr	A
		jc	code_ED68
		mov	DPTR, #5EF4h	; Диапазон квантования давления	| кПа
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	DIV_R0R1_8
		lcall	MUL_R0R1_B
		mov	A, R1
		jnz	code_ED66
		mov	A, R0
		cjne	A, #0F0h, code_ED64 ; 'Ё'

code_ED64:
		jc	code_ED68

code_ED66:				; CODE XREF: code_EBA4+1BAj
		mov	A, #0F0h ; 'Ё'

code_ED68:				; CODE XREF: code_EBA4+1AAj
					; code_EBA4:code_ED64j
		mov	DPTR, #0F89Ah
		movx	@DPTR, A
		ret
; End of function code_EBA4


; =============== S U B	R O U T	I N E =======================================
code_ED6D:				; CODE XREF: RESET_0-BE96p
					; RESET_0-AFFFp
		mov	DPTR, #0F887h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F888h
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #84E1h	; Пересчет ТОЖ для модели Тзаряда | Температура, град.С	- Температура, град.С
		lcall	GET_2D_INTERPOLATION
		mov	DPTR, #0F87Bh
		movx	@DPTR, A
		ret
; End of function code_ED6D

; ---------------------------------------------------------------------------
CALC_DAD_GBC:
		mov	DPTR, #0F98Ch
		movx	A, @DPTR
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		movc	A, @A+DPTR
		push	ACC
		mov	R3, A
		mov	R2, RPM_RT
		mov	DPTR, #5F02h
		clr	A
		movc	A, @A+DPTR		
		mov	DPTR, #9294h	; Поправка циклового наполнения	по дросселю | Коэффициент коррекции - Обороты коленвала, об/мин	- Положение дросселя,%
		jnb	ACC.6, GET_DAD_KGBC 
		mov	DPTR, #7CF7h
GET_DAD_KGBC:
		lcall	GET_3D_VALUE
		
		mov	DPTR, #0F8B9h
		movx	@DPTR, A
		
		pop		ACC ;Вернуть положение дросселя
		mov		R3, A
		mov		R2, CRRXX
		mov		DPTR, #76EFh 	;Добавка по шагам РХХ
		lcall	GET_3D_VALUE
		push	ACC
		
		mov	DPTR, #0F99Ch
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		
		lcall	MUL_R0R1_2
		
		mov	DPTR, #0F8B9h
		movx	A, @DPTR
		mov		B, A
		lcall	MUL_R0R1_B
		
		mov		DPTR, #0F887h
		movx	A, @DPTR
		mov		R2, A
		mov		DPTR, #0F888h
		movx	A, @DPTR
		mov		R3, A
		mov		DPTR, #866Fh
		lcall	GET_2D_INTERPOLATION
		mov		B, A
		lcall	MUL_R0R1_B
		
		pop		ACC
		mov		B, #8
		mul		AB
		add		A, R0
		mov		R0, A
		mov		A, R1
		addc	A, B
		mov		R1, A
		
		mov	DPTR, #0F869h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		
		mov	DPTR, #5F09h	; Коэффициент фильтра для ХХ |
		jb	RAM_2B.1, code_16AD
		mov	DPTR, #5F08h	; Коэффициент фильтра |
code_16AD:				; CODE XREF: IE0_0+DC7j
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F82Ch
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		lcall	MUL_ABSR0R1_B
		lcall	ADD_R0R1_R2R3
		mov	A, R1
		movx	@DPTR, A
		dec	DPL		; Data Pointer,	Low Byte
		mov	A, R0
		movx	@DPTR, A
		mov	DPTR, #0F82Eh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	A, RPM
		jnz	code_16DD
		mov	R0, #0
		mov	R1, #0
		sjmp	code_171B
; ---------------------------------------------------------------------------

code_16DD:				; CODE XREF: IE0_0+DF4j
		mov	MD0, #0E8h ; 'ш' ; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, #3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	A, RAM_38
		mov	B, RAM_39	; B-Register
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD2, R2		; Multiplication/Division Register 2
		mov	MD3, R3		; Multiplication/Division Register 3
		mov	MD4, A		; Multiplication/Division Register 4
		mov	MD5, B		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	A, MD2		; Multiplication/Division Register 2
		mov	A, MD3		; Multiplication/Division Register 3
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5

code_171B:				; CODE XREF: IE0_0+DFAj
		mov	DPTR, #0F808h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		anl	A, #0FEh
		jz	code_172C
		mov	A, #0FFh
		sjmp	code_1730
; ---------------------------------------------------------------------------

code_172C:				; CODE XREF: IE0_0+E46j
		mov	A, R1
		rrc	A
		mov	A, R0
		rrc	A

code_1730:				; CODE XREF: IE0_0+E4Aj
		mov	DPTR, #0FF48h
		movx	@DPTR, A
		ret
;----------------------------------------------------------------------------

;======== Ускор. насос по ДАД
CALC_DAD_ADD_FIELD:
		mov	DPTR, #0F983h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		clr	C
		mov	A, PRESS_LO
		subb	A, R2
		mov	R2, A
		mov	A, PRESS_HI
		subb	A, R3
		mov	R3, A
		jnc	code_EDDF
		clr	C
		mov	A, #0FFh
		subb	A, R2
		mov	R2, A
		mov	A, #0FFh
		subb	A, R3
		mov	R3, A
		mov	DPTR, #0F983h
		mov	A, PRESS_LO
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, PRESS_HI
		movx	@DPTR, A
		clr		A
		mov	DPTR, #5F1Dh
		movc	A, @A+DPTR
		mov	R0, A
		mov		A, #1
		movc	A, @A+DPTR
		mov	R1, A
		clr	C
		mov	A, R2
		subb	A, R0
		mov	A, R3
		subb	A, R1
		jnc	code_EDD6
		mov	DPTR, #0F981h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		clr		A
		mov	DPTR, #5F1Fh
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0F981h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_EDD6:				; CODE XREF: code:EDB8j
		clr	A
		mov	DPTR, #0F981h
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_EDDF:				; CODE XREF: code:ED94j
		mov	DPTR, #0F983h
		mov	A, PRESS_LO
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, PRESS_HI
		movx	@DPTR, A
		clr		A
		mov	DPTR, #5F20h
		movc	A, @A+DPTR
		mov	R0, A
		mov		A, #1
		movc	A, @A+DPTR
		mov	R1, A
		clr	C
		mov	A, R2
		subb	A, R0
		mov	A, R3
		subb	A, R1
		jc	code_EE39
		mov	A, R3
		mov	R1, A
		mov	A, R2
		mov	R0, A
		mov	DPTR, #8508h
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	A, RPM_RT
		mov	DPTR, #0A560h
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0F89Ah
		movx	A, @DPTR
		add	A, #4
		swap	A
		rl	A
		anl	A, #1Fh
		mov	DPTR, #0A580h
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0F981h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		clr	C
		mov	A, R0
		subb	A, R2
		mov	A, R1
		subb	A, R3
		jc	code_EE42
		sjmp	code_EE55
; ---------------------------------------------------------------------------

code_EE39:				; CODE XREF: code:EDF8j
		mov	A, RAM_41
		jnz	code_EE5E
		mov	DPTR, #5F1Fh
		sjmp	code_EE45
; ---------------------------------------------------------------------------

code_EE42:				; CODE XREF: code:EE35j
		mov	DPTR, #5F22h

code_EE45:				; CODE XREF: code:EE40j
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F981h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	MUL_R0R1_B

code_EE55:				; CODE XREF: code:EE37j
		mov	DPTR, #0F981h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A

code_EE5E:				; CODE XREF: code:EE3Bj
		ret
		
		; =============== S U B	R O U T	I N E =======================================


DIAG_DAD:				; CODE XREF: RESET_0:code_2D50p
		jb	RAM_2A.3, code_EE95
		mov	DPTR, #0F80Ch
		movx	A, @DPTR
		mov	R0, A
		mov	DPTR, #5EF0h	; Мин. напряжение АЦП ДАД для диагностики | В
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, R0
		jc	code_EE7E
		mov	DPTR, #0F99Eh
		movx	A, @DPTR
		jz	code_EE79
		dec	A
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_EE79:				; CODE XREF: code_EE5F+15j
		setb	RAM_23.6
		clr	RAM_24.6
		ret
; ---------------------------------------------------------------------------

code_EE7E:				; CODE XREF: code_EE5F+Fj
		mov	DPTR, #5EF1h	; Макс.	напряжение АЦП ДАД для диагностики | B
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, R0
		jnc	code_EE95
		mov	DPTR, #0F99Eh
		movx	A, @DPTR
		jz	code_EE90
		dec	A
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_EE90:				; CODE XREF: code_EE5F+2Cj
		clr	RAM_23.6
		setb	RAM_24.6
		ret
; ---------------------------------------------------------------------------

code_EE95:				; CODE XREF: code_EE5Fj code_EE5F+26j
		mov	DPTR, #0F99Eh
		mov	A, #14h
		movx	@DPTR, A
		clr	RAM_23.6
		clr	RAM_24.6
		ret
; End of function code_EE5F


; =============== S U B	R O U T	I N E =======================================