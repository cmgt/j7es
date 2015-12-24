CALC_TABLE_GBC:
		mov		DPTR, #THR_CURRENT
		movx	A, @DPTR
		mov		DPTR, #7208h
		movc	A, @A+DPTR
		mov		R3, A
		mov		R2, CRRXX
		mov		DPTR, #76EFh	;Аддитивная коррекция БЦН по шагам РХХ
		lcall	GET_3D_VALUE
		push	ACC
		
		mov	DPTR, #THR_CURRENT
		movx	A, @DPTR
		mov	DPTR, #7208h
		movc	A, @A+DPTR
		mov	R3, A
		mov	R2, RPM
		clr	A
		mov	DPTR, #75EFh	;БЦН
		lcall	GET_3D_VALUE
		mov	B, #20h	; ' '   ; B-Register
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		
		pop		ACC
		mov		B, #8
		mul		AB
		add		A, R0
		mov		R0, A
		mov		A, R1
		addc	A, B
		mov		R1, A
		
		jnb	Hardware.4,	ctg_1 ; 4 ДТВ
		mov	DPTR, #0F8AAh
		movx	A, @DPTR
		add	A, #80h	; 'А'
		mov	B, A		; B-Register
		mov	A, #0
		addc	A, #1
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD4, B		; Multiplication/Division Register 4
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD5, A		; Multiplication/Division Register 5
		nop
		nop			; Текущее значение давления (ДАД)
		nop
		nop
		mov	A, MD0		; Multiplication/Division Register 0
		mov	R0, MD1		; Multiplication/Division Register 1
		mov	R1, MD2		; Multiplication/Division Register 2
		mov	A, MD3		; Multiplication/Division Register 3
		rrc	A
		mov	A, R1
		rrc	A
		mov	R1, A
		mov	A, R0
		rrc	A
		mov	R0, A

ctg_1:
		mov	DPTR, #0F887h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F888h
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #63ACh	; Мультипликативный коэффициент коррекции GBC по ТОЖ
		lcall	GET_2D_INTERPOLATION
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD4, A		; Multiplication/Division Register 4
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	A, MD0		; Multiplication/Division Register 0
		mov	R0, MD1		; Multiplication/Division Register 1
		mov	R1, MD2		; Multiplication/Division Register 2
		mov	A, MD3		; Multiplication/Division Register 3
		
		mov	DPTR, #0F869h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		
		mov	DPTR, #5F02h
		clr		A
		movc	A, @A+DPTR
		
		jnb	ACC.2, ctg_2	; Accumulator
		jb	RAM_23.6, ctg_2 ; 6 bit	АЦП ДМРВ/ДАД меньше минимума (обрыв ДМРВ /ДАД)
		jb	RAM_24.6, ctg_2
		mov	MD0, DAD_VALUE_LO ; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, DAD_VALUE_HI ; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
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
		mov	MD4, #10h	; Multiplication/Division Register 4
		mov	MD5, #27h ; ''' ; Multiplication/Division Register 5
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

ctg_2:				; CODE XREF: IE0_0+2B9j IE0_0+2BCj ...
		mov	DPTR, #0F82Eh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
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
		mov	DPTR, #0F808h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		ret