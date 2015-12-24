;Расчет параметров ШИМ для управления соленойдом наддува
BOOST_CONTROL:
		mov		C, Hardware.1	;Адсорбер
		orl		C, /Hardware.2	;Соленоид наддува
		orl		C, RAM_2B.0		; 0	- Признак выключения двигателя
		jnc		BOOST_CONTROL_CALC
		clr		A
		ljmp BOOST_CONTROL_EXIT

BOOST_CONTROL_CALC:
		mov	DPTR, #7977h		;Желаемое давление наддува
		mov	A, RPM_THR_3D_RT
		movc	A, @A+DPTR
		;Умножаем желаемый избыток на 100 (в кПа) и прибавляем атмосферное давление (100 кПа)
		mov	B, #64h
		mul	AB
		add	A, #10h
		mov	R0, A
		mov	A, B
		addc	A, #27h
		mov	R1, A
		mov	A, R0
		mov	DPTR, #0F9D5h
		movx	@DPTR, A
		inc	DPTR
		mov	A, R1
		movx	@DPTR, A
		clr	C
		mov	A, PRESS_LO
		subb	A, R0
		mov	R0, A
		mov	A, PRESS_HI
		subb	A, R1
		mov	R1, A
		jb	ACC.7, code_B62F
		add	A, #10h
		mov	R1, A
		anl	A, #0E0h
		jz	code_B639
		mov	R1, #1Fh
		mov	R0, #0FFh
		sjmp	code_B639
; ---------------------------------------------------------------------------

code_B62F:
		add	A, #10h
		mov	R1, A
		jnb	ACC.7, code_B639 ; Accumulator
		mov	R0, #0
		mov	R1, #0

code_B639:				; CODE XREF: code_B5E1+46j
		lcall	DIV_R0R1_32
		mov	A, R0
		swap	A
		rl	A
		anl	A, #1Fh
		mov	DPTR, #7A87h		;коррекция duty от ошибки target boost
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #7F9Eh		;ограничение коррекции duty снизу
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #7FBEh		;ограничение коррекции duty сверху
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	R1, A
		mov	DPTR, #0F9D7h		; turbo dynamic proportional
		movx	A, @DPTR
		add		A, B 
		lcall	TestMinMaxNeg
		movx	@DPTR, A
		clr	A
		mov	DPTR, #623Ch		;Базовое Duty
		mov	R2, RPM_RT			;Квантованные обороты двигателя
		lcall	GET_2D_VALUE
		mov	R0, A
		mov	R1, #0
		lcall	MUL_R0R1_4
		mov	DPTR, #0F952h		;Текущая передача
		movx	A, @DPTR
		mov	DPTR, #625Ch		;Коррекция по передаче
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0F931h			;Твоздуха
		movx	A, @DPTR
		mov	DPTR, #6265h		;Коррекция по Твоздуха
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	A, R1
		jz	BOOST_CONTROL_1
		mov	R0, #0FFh

BOOST_CONTROL_1:
		mov	DPTR, #0F9D7h		; turbo dynamic proportional
		movx	A, @DPTR
		jb		ACC.7, ADD_NEG_DELTA_DUTY
		clr		C
		add		A, R0
		jnc		BOOST_CONTROL_2
		mov		A, #0FFh
		sjmp	BOOST_CONTROL_2
		
ADD_NEG_DELTA_DUTY:
		clr		C
		add		A, R0
		jc		BOOST_CONTROL_2
		mov		A, #0
		
BOOST_CONTROL_2:
		mov	B, A
		mov	DPTR, #628Ch   ;Выбор переходной зоны
		clr	A
		movc	A, @A+DPTR
		jb	ACC.0, THR_TRANSITION_ZONE ; Accumulator
		mov	DPTR, #628Fh
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		clr	C
		subb	A, PRESS_HI
		jnc	code_B79F
		mov	DPTR, #6290h
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		clr	C
		subb	A, PRESS_HI
		jc	code_B7A2
		mov	A, R1
		clr	C
		subb	A, R0
		mov	R2, A
		mov	A, #0FFh
		clr	C
		subb	A, B
		mov	B, A
		clr	C
		mov	A, PRESS_HI
		subb	A, R0
		mul	AB
		sjmp	code_B76B
; ---------------------------------------------------------------------------

THR_TRANSITION_ZONE:				; CODE XREF: code_B5E1+137j
		mov	DPTR, #628Dh
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		clr	C
		subb	A, RPM_1
		jnc	code_B79F
		mov	DPTR, #628Eh
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		clr	C
		subb	A, RPM_1
		jc	code_B7A2
		mov	A, R1
		clr	C
		subb	A, R0
		mov	R2, A
		mov	A, #0FFh
		clr	C
		subb	A, B		; B-Register
		mov	B, A		; B-Register
		clr	C
		mov	A, RPM_1
		subb	A, R0
		mul	AB

code_B76B:				; CODE XREF: code_B5E1+161j
		clr	RAM_28.4	; 0
		mov	MD0, A		; Multiplication/Division Register 0
		mov	MD1, B		; Multiplication/Division Register 1
		mov	MD4, R2		; Multiplication/Division Register 4
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R3, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		jbc	RAM_28.4, code_B76B ; 0
		mov	A, R1
		jz	code_B797
		mov	R3, #0FFh

code_B797:				; CODE XREF: code_B5E1+1B2j
		clr	C
		mov	A, #0FFh
		subb	A, R3
		mov	B, A		; B-Register
		sjmp	code_B7A2
; ---------------------------------------------------------------------------

code_B79F:				; CODE XREF: code_B5E1+143j
		mov	B, #0FFh	; B-Register

code_B7A2:				; CODE XREF: code_B5E1+14Ej
		mov	DPTR, #8D75h ;коррекция по дросселю
		mov	A, THR_CODE
		movc	A, @A+DPTR
		mul	AB
		
		mov	DPTR, #0FF50h ; уровень детонации
		movx	A, @DPTR
		mov	DPTR, #7FDEh ;смещение по детонации
		movc	A, @A+DPTR
		xch	A, B
		clr	C
		subb	A, B
		jnc	BOOST_CONTROL_3
		clr	A
		sjmp	BOOST_CONTROL_EXIT

BOOST_CONTROL_3:
		mov		B, #3Fh
		mul		AB
		jnb		ACC.7, BOOST_CONTROL_4
		inc		B

BOOST_CONTROL_4:
		xch		A, B 

BOOST_CONTROL_EXIT:				; CODE XREF: code_B5E1+DDj
		mov	DPTR, #0F806h
		movx	@DPTR, A
		ret