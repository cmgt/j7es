FIRMWARE_VERSION MACRO
	db 'j7es_v17.6'
ENDM

;Инициализация нулями
INIT_DB_ZERO MACRO COUNT_BYTE
REPT COUNT_BYTE
	db	0
ENDM
ENDM

ALIGN_NOP MACRO ADDRESS
jmp ADDRESS
REPT ADDRESS - $
	db	0
ENDM
ENDM

FILL_NOP MACRO COUNT_NOP
REPT COUNT_NOP
	nop
ENDM
ENDM

GET_UOZ_XX MACRO
		mov	DPTR, #6F9Dh	; Коррекция УОЗ	на ХХ |	УОЗ, гр.п.к.в. - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		GET_RAM_BY_INDEX 6F7Dh, RPM_RT_32, CAPTURE_UOZ_XX_MODE
		clr	C
		subb	A, B		; B-Register
		mov	UOZXX_2, A
ENDM


; Расчет длительности импульса впрыска по статической производительности форс
CALC_INJ_STAT MACRO
		mov		DPTR, #5F24h
		clr		A
		movc	A, @A+DPTR
		mov		B, A
		mov		A, #1
		movc	A, @A+DPTR
		mov		MD0, R0
		mov		MD4, B
		mov		MD1, R1
		mov		MD5, A
		nop
		nop
		nop
		nop
		mov		A, MD0
		mov		A, MD1
		mov		R0, MD2
		mov		R1, MD3
ENDM