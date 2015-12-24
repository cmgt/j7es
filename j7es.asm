; Версия 17.7
	;1) Исправлена ошибка неправильного управления зажиганием для ПП режима (спасибо sceptic, за найденную ошибку)
	;2) Исправлена ошибка атомарности назначения параметров (с этой ошибкой связаны любые странности в поведении ПО)
	;3) Исправлен алгоритм ДАД
	
; Версия 17.3
	;1) Выбор подключения ДАД к Р7.5
	;2) Блокировка топливоподачи по давлению
	;3) Управление давлением наддува
	;4) Выбор способа чтения номера Dallas SN
	;5) Удален флаг "Инженерный ЭБУ", реализовано автоматическое определение типа ЭБУ
	
; Версия 17.1
	;1) Реализована блокировка топлива по давлению
	
; Версия 17.0
	;1) Исправлен алгоритм включения доп. выводов
	;2) Исправлен алгоритм выбора оборотов отсечки
	
; Версия 15.6
	;1) Реализована возможность отрицательных коррекций УОЗ по ТОЖ и ТВ
	;2) Реализовано обогащение СС по времени после пуска
	
; Версия 15.5
	;1) Реализована фиксация фазы впрыска с диагностики
	;2) Исправлена ошибка адреса калибровки "Состав смеси от оборотов и дросселя"
	
; Версия 14.4
	;1) Добавлена калибровка "Температура разрешения дин. коррекции УОЗ по доп. топливу"
	;2) Коэффициент коррекции УОЗ по доп. топливу заменен 2D таблицей от оборотов двигателя
	
; Версия 14.1
	;1) Смещение ДАД может быть отрицательным
	;2) Увеличена точность статики форсунок до 16 разрядов
	;3) Ускор. насос по ДАД

; ===========================================================================
$NOMOD51
$INCLUDE (C509.MCU)
$INCLUDE (j7es_const.asm)
$INCLUDE (j7es_macros.asm)
$INCLUDE (j7es_ram.asm)
$INCLUDE (j7es_calibr.asm)
$INCLUDE (j7es_ram_capture_m.asm)
$INCLUDE (j7es_hip9011_m.asm)
CSEG

; =============== S U B	R O U T	I N E =======================================

; RESET
; Attributes: thunk

		; public RESET
		ljmp	RESET_0
; End of function RESET


; =============== S U B	R O U T	I N E =======================================

; External Interrupt 0
; Attributes: thunk

		; public IE0
		ljmp	IE0_0
; End of function IE0

; ---------------------------------------------------------------------------
		db 0FAh	; ·
		db    RAM_CAPTURE_SUPPORT
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Timer	0 Overflow

		; public TF0
		reti
; End of function TF0

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; External Interrupt 1
; Attributes: thunk

		; public IE1
		ljmp	IE1_0
; End of function IE1

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Timer	1 Overflow
; Attributes: thunk

		; public TF1
		ljmp	TF1_0
; End of function TF1

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Serial Channel 0
; Attributes: thunk

		; public RI0_TI0
RI0_TI0:
		ljmp	RI0_TI0_0
; End of function RI0_TI0

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Timer	2 Overflow / Ext. Reload

		; public TF2_EXF2
TF2_EXF2:
		reti
; End of function TF2_EXF2

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		FIRMWARE_VERSION
		INIT_DB_ZERO	%43h - $

; =============== S U B	R O U T	I N E =======================================

; A/D Converter

		; public IADC
		reti
; End of function IADC

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; External Interrupt 2

		; public IEX2
		reti
; End of function IEX2

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; External Interrupt 3

		; public IEX3
		reti
; End of function IEX3

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; External Interrupt 4

		; public IEX4
		reti
; End of function IEX4

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; External Interrupt 5

		; public IEX5
		reti
; End of function IEX5

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; External Interrupt 6
; Attributes: thunk

		; public IEX6
		ljmp	IEX6_0
; End of function IEX6

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Serial Channel 1

		; public RI1_TI1
RI1_TI1:
		reti
; End of function RI1_TI1

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Compare Match	Interupt of Compare Registers assigned to Timer	2 CM0-CM7
; Attributes: thunk

		; public ICMP0_ICMP7
ICMP0_ICMP7:
		ljmp	ICMP0_ICMP7_0
; End of function ICMP0_ICMP7

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Compare Timer	Overflow

		; public CTF
CTF:
		reti
; End of function CTF

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Compare Match	Interupt of Compare Register COMSET

		; public ICS
ICS:
		reti
; End of function ICS

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Compare Match	Interupt of Compare Register COMCLR

		; public ICR
ICR:
		reti
; End of function ICR

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Compare / Capture Event interrupt

		; public ICC10_ICC17
ICC10_ICC17:
		reti
; End of function ICC10_ICC17

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Compare Timer	1 Overflow

		; public CT1F
CT1F:
		inc	RAM_78
		reti
; End of function CT1F

; ---------------------------------------------------------------------------
		db    0
		db    0
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR IEX6_0

code_E0:				; CODE XREF: IEX6_0j
		mov	R2, CCL3	; Compare/Capture Register 3, Low Byte
		mov	R3, CCH3	; Compare/Capture Register 3, High Byte
		cjne	R6, #39h, code_100 ; '9'
		mov	A, R2
		add	A, R4
		mov	CCL3, A		; Compare/Capture Register 3, Low Byte
		mov	A, R3
		addc	A, R5
		mov	CCH3, A		; Compare/Capture Register 3, High Byte
		clr	IRCON0.5	; Interrupt Request Control Register 0
		inc	R6
		mov	R7, #1Ch
		ljmp	code_2C3
; ---------------------------------------------------------------------------

code_100:				; CODE XREF: IEX6_0-2Cj
		clr	RAM_27.3
		anl	CCEN, #3Fh	; Compare/Capture Enable Register
		orl	CCEN, #40h	; Compare/Capture Enable Register
		inc	R6
		mov	R7, #1Dh
		ljmp	code_2C3
; ---------------------------------------------------------------------------

; =============== S U B	R O U T	I N E =======================================


IEX6_0:					; CODE XREF: IEX6j

; FUNCTION CHUNK AT 00E0 SIZE 00000033 BYTES

		push	PSW		; Program Status Word
		push	ACC		; Accumulator
		push	B		; B-Register
		mov	PSW, #18h	; Program Status Word
		jb	RAM_27.3, code_E0
		mov	A, CCL3		; Compare/Capture Register 3, Low Byte
		clr	C
		subb	A, R2
		mov	R0, A
		mov	A, CCH3		; Compare/Capture Register 3, High Byte
		subb	A, R3
		mov	R1, A
		jb	RAM_26.1, code_10E
		setb	RAM_26.5
		jmp	code_23D
		
code_10E:
		mov	A, RAM_5
		cjne	A, #4, code_139
		ljmp	code_1F2
; ---------------------------------------------------------------------------

code_139:				; CODE XREF: IEX6_0+1Aj
		clr	C
		subb	A, #2
		jnc	code_146
		inc	RAM_5
		ljmp	code_1DA
; ---------------------------------------------------------------------------

code_143:				; CODE XREF: IEX6_0+34j
		ljmp	code_1D7
; ---------------------------------------------------------------------------

code_146:				; CODE XREF: IEX6_0+23j
		mov	A, R4
		clr	C
		rlc	A
		mov	RAM_6, A
		mov	A, R5
		rlc	A
		jc	code_143
		mov	RAM_7, A
		mov	A, R0
		clr	C
		subb	A, RAM_6
		mov	RAM_6, A
		mov	A, R1
		subb	A, RAM_7
		mov	RAM_7, A
		setb	PSW.5		; Program Status Word
		jnc	code_170
		clr	PSW.5		; Program Status Word
		mov	A, RAM_6
		cpl	A
		add	A, #1
		mov	RAM_6, A
		mov	A, RAM_7
		cpl	A
		addc	A, #0
		mov	RAM_7, A

code_170:				; CODE XREF: IEX6_0+45j
		mov	A, RAM_6
		clr	C
		subb	A, R4
		mov	RAM_6, A
		mov	A, RAM_7
		subb	A, R5
		mov	RAM_7, A
		jnc	code_19E
		mov	A, R5
		jz	code_191
		rrc	A
		anl	A, #7Fh
		mov	B, A		; B-Register
		mov	A, R4
		rrc	A
		add	A, RAM_6
		mov	A, B		; B-Register
		addc	A, RAM_7
		jnc	code_1D7
		sjmp	code_1BB
; ---------------------------------------------------------------------------

code_191:				; CODE XREF: IEX6_0+65j
		mov	A, R4
		rrc	A
		anl	A, #7Fh
		add	A, RAM_6
		clr	A
		addc	A, RAM_7
		jnc	code_1D7
		sjmp	code_1BB
; ---------------------------------------------------------------------------

code_19E:				; CODE XREF: IEX6_0+62j
		mov	A, R5
		jz	code_1AF
		mov	B, A		; B-Register
		mov	A, R4
		clr	C
		subb	A, RAM_6
		mov	A, B		; B-Register
		subb	A, RAM_7
		jc	code_1D7
		sjmp	code_1BB
; ---------------------------------------------------------------------------

code_1AF:				; CODE XREF: IEX6_0+86j
		mov	A, R4
		rrc	A
		anl	A, #7Fh
		clr	C
		subb	A, RAM_6
		clr	A
		subb	A, RAM_7
		jc	code_1D7

code_1BB:				; CODE XREF: IEX6_0+76j IEX6_0+83j ...
		jb	PSW.5, code_1C3	; Program Status Word
		mov	RAM_5, #3
		sjmp	code_1DA
; ---------------------------------------------------------------------------

code_1C3:				; CODE XREF: IEX6_0:code_1BBj
		mov	A, RAM_5
		cjne	A, #3, code_1D7
		mov	R2, CCL3	; Compare/Capture Register 3, Low Byte
		mov	R3, CCH3	; Compare/Capture Register 3, High Byte
		inc	RAM_5
		clr	RAM_25.2
		clr	RAM_27.2
		clr	RAM_27.1
		ljmp	code_299
; ---------------------------------------------------------------------------

code_1D7:				; CODE XREF: IEX6_0:code_143j
					; IEX6_0+74j ...
		mov	RAM_5, #2

code_1DA:				; CODE XREF: IEX6_0+27j IEX6_0+A8j
		mov	R4, RAM_18
		mov	R5, RAM_19
		mov	R2, CCL3	; Compare/Capture Register 3, Low Byte
		mov	R3, CCH3	; Compare/Capture Register 3, High Byte
		setb	RAM_26.5
		ljmp	code_5A2
; ---------------------------------------------------------------------------

code_1E7:				; CODE XREF: IEX6_0+F6j IEX6_0+103j
		jb	RAM_27.2, code_23B
		jb	RAM_27.1, code_23B
		setb	RAM_27.2
		ljmp	code_5A2
; ---------------------------------------------------------------------------

code_1F2:				; CODE XREF: IEX6_0+1Dj
		mov	A, R0
		clr	C
		subb	A, R4
		mov	RAM_6, A
		mov	A, R1
		subb	A, R5
		mov	RAM_7, A
		jnc	code_21E
		mov	A, R5
		jz	code_211
		rrc	A
		anl	A, #7Fh
		mov	B, A		; B-Register
		mov	A, R4
		rrc	A
		add	A, RAM_6
		mov	A, B		; B-Register
		addc	A, RAM_7
		jc	code_250
		sjmp	code_1E7
; ---------------------------------------------------------------------------

code_211:				; CODE XREF: IEX6_0+E5j
		mov	A, R4
		rrc	A
		anl	A, #7Fh
		add	A, RAM_6
		clr	A
		addc	A, RAM_7
		jc	code_250
		sjmp	code_1E7
; ---------------------------------------------------------------------------

code_21E:				; CODE XREF: IEX6_0+E2j
		mov	A, R5
		jz	code_22F
		mov	B, A		; B-Register
		mov	A, R4
		clr	C
		subb	A, RAM_6
		mov	A, B		; B-Register
		subb	A, RAM_7
		jnc	code_250
		sjmp	code_23B
; ---------------------------------------------------------------------------

code_22F:				; CODE XREF: IEX6_0+106j
		mov	A, R4
		rrc	A
		anl	A, #7Fh
		clr	C
		subb	A, RAM_6
		clr	A
		subb	A, RAM_7
		jnc	code_250

code_23B:				; CODE XREF: IEX6_0:code_1E7j
					; IEX6_0+D1j ...
		setb	RAM_25.2

code_23D:				; CODE XREF: IEX6_0-9j
		mov	RAM_5, #0
		clr	RAM_26.2
		clr	RAM_26.3
		anl	CMEN, #0Fh	; Compare Enable Register (RMAP=0)
		orl	P4, #0F0h	; Port 4 (PDIR=0)
		orl	CMEN, #0F0h	; Compare Enable Register (RMAP=0)
		ljmp	code_5A2
; ---------------------------------------------------------------------------

code_250:				; CODE XREF: IEX6_0+F4j IEX6_0+101j ...
		mov	R2, CCL3	; Compare/Capture Register 3, Low Byte
		mov	R3, CCH3	; Compare/Capture Register 3, High Byte
		mov	C, RAM_27.2
		mov	RAM_27.1, C
		clr	RAM_27.2
		cjne	R6, #38h, code_27B ; '8'
		mov	R4, RAM_18
		mov	R5, RAM_19
		setb	RAM_27.3
		anl	CCEN, #3Fh	; Compare/Capture Enable Register
		orl	CCEN, #80h	; Compare/Capture Enable Register
		setb	P1.3		; Port 1 (PDIR=0)
		mov	A, R2
		add	A, R4
		mov	CCL3, A		; Compare/Capture Register 3, Low Byte
		mov	A, R3
		addc	A, R5
		mov	CCH3, A		; Compare/Capture Register 3, High Byte
		clr	IRCON0.5	; Interrupt Request Control Register 0
		inc	R6
		mov	R7, #1Bh
		ljmp	code_2C3
; ---------------------------------------------------------------------------

code_27B:				; CODE XREF: IEX6_0+141j
		jnc	code_296
		mov	R4, RAM_18
		mov	R5, RAM_19
		inc	R6
		cjne	R6, #1Eh, code_28E
		mov	R7, #0
		inc	RAM_40
		anl	RAM_40,	#3
		sjmp	code_2C3
; ---------------------------------------------------------------------------

code_28E:				; CODE XREF: IEX6_0+169j
		mov	A, R6
		jc	code_293
		subb	A, #1Eh

code_293:				; CODE XREF: IEX6_0+176j
		mov	R7, A
		sjmp	code_2C3
; ---------------------------------------------------------------------------

code_296:				; CODE XREF: IEX6_0:code_27Bj
		cjne	R6, #3Bh, code_23B ; ';'

code_299:				; CODE XREF: IEX6_0+BBj
		mov	R6, #0
		mov	R7, #0
		jnb	Hardware.5, code_2B0
		mov	A, P1		; Port 1 (PDIR=0)
		mov	C, ACC.2	; Accumulator
		jc	code_2AB
		jnb	RAM_26.0, code_2AE
		sjmp	code_2B5
; ---------------------------------------------------------------------------

code_2AB:				; CODE XREF: IEX6_0+18Bj
		jnb	RAM_26.0, code_2B5

code_2AE:				; CODE XREF: IEX6_0+18Dj
		setb	RAM_22.4

code_2B0:				; CODE XREF: IEX6_0+184j
		mov	A, RAM_40
		inc	A
		sjmp	code_2BB
; ---------------------------------------------------------------------------

code_2B5:				; CODE XREF: IEX6_0+190j
					; IEX6_0:code_2ABj
		clr	RAM_22.4
		cpl	RAM_26.0
		rlc	A
		rl	A

code_2BB:				; CODE XREF: IEX6_0+19Aj
		anl	A, #2
		mov	RAM_40,	A
		jnz	code_2C3
		setb	RAM_26.6

code_2C3:				; CODE XREF: IEX6_0-1Cj IEX6_0-Ej ...
		setb	RAM_26.5
		mov	A, R5
		anl	A, #0F8h
		jz	code_2CE
		clr	RAM_26.2
		clr	RAM_26.3

code_2CE:				; CODE XREF: IEX6_0+1AFj
		mov	A, R7
		jbc	RAM_26.4, code_305
		cjne	A, RAM_3C, code_305
		jnb	RAM_26.3, code_2ED
		mov	RAM_34,	RAM_30
		mov	RAM_35,	RAM_31
		mov	RAM_33,	RAM_32
		mov	RAM_7F,	RAM_56
		clr	A
		mov	RAM_30,	A
		mov	RAM_31,	A
		mov	RAM_32,	A
		mov	RAM_56,	A

code_2ED:				; CODE XREF: IEX6_0+1BCj
		mov	A, RAM_40
		clr	C
		subb	A, RAM_3D
		anl	A, #3
		mov	RAM_41,	A
		mov	A, R7
		setb	RAM_28.0
		setb	TCON.1		; Timer	Control	Register
		mov	RAM_3C,	RAM_3E
		mov	RAM_3D,	RAM_3F
		setb	RAM_26.4
		setb	RAM_26.3

code_305:				; CODE XREF: IEX6_0+1B6j IEX6_0+1B9j
		cjne	A, #0, code_37B
		jnb	RAM_26.2, code_35E
		mov	A, R2
		subb	A, RAM_36
		mov	RAM_38,	A
		mov	A, R3
		subb	A, RAM_37
		mov	RAM_39,	A
		push	RAM_18
		mov	R0, #0BEh ; '-'
		mov	A, @R0
		add	A, #2
		mov	B, A		; B-Register
		cjne	A, #0BEh, code_321 ; '-'

code_321:
		jc	code_326
		mov	B, #0B0h ; '-'  ; B-Register

code_326:				; CODE XREF: IEX6_0:code_321j
		mov	@R0, B		; B-Register
		mov	R0, B		; B-Register
		mov	@R0, RAM_38
		inc	R0
		mov	@R0, RAM_39
		mov	A, B		; B-Register
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #5	; Data Pointer Select Register
		mov	DPTR, #0F9EBh
		movx	@DPTR, A
		clr	C
		subb	A, #0B0h ; '-'
		mov	DPTR, #0F9DDh
		clr	C
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	A, DPH		; Data Pointer,	High Byte
		addc	A, #0
		mov	DPH, A		; Data Pointer,	High Byte
		mov	A, RAM_38
		movx	@DPTR, A
		mov	A, RAM_39
		inc	DPTR
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		mov	R0, #0BFh ; '¬'
		mov	A, @R0
		orl	A, #1
		mov	@R0, A
		pop	RAM_18
		setb	RAM_28.6

code_35E:				; CODE XREF: IEX6_0+1EFj
		mov	RAM_36,	R2
		mov	RAM_37,	R3
		setb	RAM_26.2
		inc	RAM_68
		mov	A, RAM_68
		setb	C
		subb	A, RAM_69
		jc	code_370
		mov	RAM_68,	#0

code_370:				; CODE XREF: IEX6_0+252j
		mov	A, RAM_69
		clr	C
		subb	A, #3
		jc	code_37A
		mov	RAM_68,	#1

code_37A:				; CODE XREF: IEX6_0+25Cj
		mov	A, R7

code_37B:				; CODE XREF: IEX6_0:code_305j
		cjne	A, RAM_42, code_382
		mov	R0, #90h ; 'Р'
		mov	@R0, RAM_40

code_382:				; CODE XREF: IEX6_0:code_37Bj
		cjne	A, #8, code_3EA
		mov	RAM_43,	RAM_40
		mov	C, RAM_27.5
		mov	RAM_2A.2, C
		setb	RAM_28.2
		setb	TCON.1		; Timer	Control	Register

		mov		A, #18h
		clr		C
		subb	A, RAM_7D
		mov		RAM_42, A

		mov	A, RAM_43
		cpl	ACC.1		; Accumulator
		rl	A
		rl	A
		add	A, #80h	; 'А'
		mov	R0, A
		mov	A, RAM_43
		jnb	ACC.0, code_3C5	; Accumulator
		mov	A, @R0
		jnb	RAM_27.6, code_3AB
		add	A, LAUNCH_UOZ_OFFSET
		cjne	A, #3Ch, code_3A7 ; '<'

code_3A7:
		jc	code_3AB
		subb	A, #3Ch	; '<'

code_3AB:				; CODE XREF: IEX6_0+286j
					; IEX6_0:code_3A7j
		mov	RAM_10,	A
		inc	R0
		mov	RAM_11,	@R0
		inc	R0
		mov	A, @R0
		jnb	RAM_27.6, code_3BE
		add	A, LAUNCH_UOZ_OFFSET
		cjne	A, #3Ch, code_3BA ; '<'

code_3BA:
		jc	code_3BE
		subb	A, #3Ch	; '<'

code_3BE:				; CODE XREF: IEX6_0+299j
					; IEX6_0:code_3BAj
		mov	RAM_12,	A
		inc	R0
		mov	RAM_13,	@R0
		sjmp	code_3EA
; ---------------------------------------------------------------------------

code_3C5:				; CODE XREF: IEX6_0+282j
		mov	A, @R0
		jnb	RAM_27.6, code_3D2
		add	A, LAUNCH_UOZ_OFFSET
		cjne	A, #3Ch, code_3CE ; '<'

code_3CE:
		jc	code_3D2
		subb	A, #3Ch	; '<'

code_3D2:				; CODE XREF: IEX6_0+2ADj
					; IEX6_0:code_3CEj
		mov	RAM_14,	A
		inc	R0
		mov	RAM_15,	@R0
		inc	R0
		mov	A, @R0
		jnb	RAM_27.6, code_3E5
		add	A, LAUNCH_UOZ_OFFSET
		cjne	A, #3Ch, code_3E1 ; '<'

code_3E1:
		jc	code_3E5
		subb	A, #3Ch	; '<'

code_3E5:				; CODE XREF: IEX6_0+2C0j
					; IEX6_0:code_3E1j
		mov	RAM_16,	A
		inc	R0
		mov	RAM_17,	@R0

code_3EA:				; CODE XREF: IEX6_0:code_382j
					; IEX6_0+2AAj
		mov	A, R7
		cjne	A, RAM_4C, code_3FA
		setb	P1.5		; Port 1 (PDIR=0)
		clr	TCON.4		; Timer	Control	Register
		clr	A
		mov	TL0, A		; Timer	0, Low Byte
		mov	TH0, A		; Timer	0, High	Byte
		setb	TCON.4		; Timer	Control	Register
		mov	A, R7

code_3FA:				; CODE XREF: IEX6_0+2D2j
		cjne	A, RAM_72, code_408
		clr	P1.5		; Port 1 (PDIR=0)
		clr	TCON.4		; Timer	Control	Register
		mov	KNOCK_LO,	TL0	; Timer	0, Low Byte
		mov	KNOCK_HI,	TH0	; Timer	0, High	Byte
		mov	A, R7

code_408:				; CODE XREF: IEX6_0:code_3FAj
		jnb		RAM_28.7, code_409
		READ_CURRENT_KNOCK_ADC

code_409:
		cjne	A, #0Bh, code_40D
		clr	P5.0		; Port 5 (PDIR=0)

code_40D:				; CODE XREF: IEX6_0:code_408j
		cjne	A, #1, code_412
		setb	P5.0		; Port 5 (PDIR=0)

code_412:				; CODE XREF: IEX6_0:code_40Dj
		mov	A, R6
		cjne	A, RAM_10, code_413
		mov	B, RAM_11	; B-Register
		clr	C
		mov	A, R4
		rlc	A
		mov	R0, A
		mov	A, R5
		rlc	A
		jz	code_433
		mul	AB
		xch	A, R0
		mov	R1, B		; B-Register
		mov	B, RAM_11	; B-Register
		mul	AB
		mov	A, R0
		add	A, B		; B-Register
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		sjmp	code_439
		
code_413:
		sjmp	code_494
; ---------------------------------------------------------------------------

code_433:				; CODE XREF: IEX6_0+306j
		mov	A, R0
		mul	AB
		mov	R0, B		; B-Register
		mov	R1, #0

code_439:				; CODE XREF: IEX6_0+318j
		mov	A, R2
		add	A, R0
		mov	R0, A
		mov	A, R3
		addc	A, R1
		jb	Options.5, code_473
		mov	R1, #90h ; 'Р'
		cjne	@R1, #3, code_45C
		anl	CMEN, #0EFh	; Compare Enable Register (RMAP=0)
		mov	CMH4, A		; Compare Register 4, High Byte	(RMAP=0)
		mov	CML4, R0	; Compare Register 4, Low Byte (RMAP=0)
		orl	CMEN, #10h	; Compare Enable Register (RMAP=0)
		mov	A, RAM_68
		jz	code_48B
		clr	P4.4		; Port 4 (PDIR=0)
		sjmp	code_48B
; ---------------------------------------------------------------------------

code_45C:				; CODE XREF: IEX6_0+32Cj
		cjne	@R1, #1, code_48B
		anl	CMEN, #7Fh	; Compare Enable Register (RMAP=0)
		mov	CMH7, A		; B-Register
		mov	CML7, R0	; Compare Register 7, Low Byte (RMAP=0)
		orl	CMEN, #80h	; Compare Enable Register (RMAP=0)
		mov	A, RAM_68
		jz	code_48B
		clr	P4.7		; Port 4 (PDIR=0)
		sjmp	code_48B
; ---------------------------------------------------------------------------

code_473:				; CODE XREF: IEX6_0+327j
		mov		B, A
		mov		A, RAM_68
		anl		CMEN, #0EFh     ; Compare Enable Register (RMAP=0)
		mov		CMH4, B         ; Compare Register 4, High Byte (RMAP=0)
		mov		CML4, R0        ; Compare Register 4, Low Byte (RMAP=0)
		orl		CMEN, #10h      ; Compare Enable Register (RMAP=0)
		jz	code_474
		clr		P4.4            ; Port 4 (PDIR=0)
		
code_474:
		anl		CMEN, #7Fh      ; Compare Enable Register (RMAP=0)
		mov		CMH7, B         ; Compare Register 7, High Byte (RMAP=0)
		mov		CML7, R0        ; Compare Register 7, Low Byte (RMAP=0)
		orl		CMEN, #80h      ; Compare Enable Register (RMAP=0)
		jz	code_48B
		clr		P4.7

code_48B:				; CODE XREF: IEX6_0+33Cj IEX6_0+340j ...
		mov	C, RAM_2A.2
		mov	A, IEN2		; Interrupt Enable Register 2
		mov	ACC.2, C	; Accumulator
		mov	IEN2, A		; Interrupt Enable Register 2
		mov	A, R6

code_494:				; CODE XREF: IEX6_0+2FAj
		cjne	A, RAM_12, code_4DB
		jb	RAM_2A.2, code_4DB
		mov	B, RAM_13	; B-Register
		clr	C
		mov	A, R4
		rlc	A
		mov	R0, A
		mov	A, R5
		rlc	A
		jz	code_4B7
		mul	AB
		xch	A, R0
		mov	R1, B		; B-Register
		mov	B, RAM_13	; B-Register
		mul	AB
		mov	A, R0
		add	A, B		; B-Register
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		sjmp	code_4BD
; ---------------------------------------------------------------------------

code_4B7:				; CODE XREF: IEX6_0+38Aj
		mov	A, R0
		mul	AB
		mov	R0, B		; B-Register
		mov	R1, #0

code_4BD:				; CODE XREF: IEX6_0+39Cj
		mov	A, R2
		add	A, R0
		mov	R0, A
		mov	A, R3
		addc	A, R1
		anl		CMEN, #0EFh     ; Compare Enable Register (RMAP=0)
		mov     CMH4, A         ; Compare Register 4, High Byte (RMAP=0)
		mov     CML4, R0        ; Compare Register 4, Low Byte (RMAP=0)
		orl     CMEN, #10h      ; Compare Enable Register (RMAP=0)
		setb    P4.4            ; Port 4 (PDIR=0)
		anl     CMEN, #7Fh      ; Compare Enable Register (RMAP=0)
		mov     CMH7, A         ; Compare Register 7, High Byte (RMAP=0)
		mov     CML7, R0        ; Compare Register 7, Low Byte (RMAP=0)
		orl     CMEN, #80h      ; Compare Enable Register (RMAP=0)
		setb    P4.7    
		mov	A, R6

code_4DB:				; CODE XREF: IEX6_0:code_494j
					; IEX6_0+37Ej
		cjne	A, RAM_14, code_4DC
		mov	B, RAM_15	; B-Register
		clr	C
		mov	A, R4
		rlc	A
		mov	R0, A
		mov	A, R5
		rlc	A
		jz	code_4FB
		mul	AB
		xch	A, R0
		mov	R1, B		; B-Register
		mov	B, RAM_15	; B-Register
		mul	AB
		mov	A, R0
		add	A, B		; B-Register
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		sjmp	code_501

code_4DC:
		sjmp	code_55C
; ---------------------------------------------------------------------------

code_4FB:				; CODE XREF: IEX6_0+3CEj
		mov	A, R0
		mul	AB
		mov	R0, B		; B-Register
		mov	R1, #0

code_501:				; CODE XREF: IEX6_0+3E0j
		mov	A, R2
		add	A, R0
		mov	R0, A
		mov	A, R3
		addc	A, R1
		jb	Options.5, code_53B
		mov	R1, #90h ; 'Р'
		cjne	@R1, #0, code_524
		anl	CMEN, #0BFh	; Compare Enable Register (RMAP=0)
		mov	CMH6, A		; B-Register
		mov	CML6, R0	; Compare Register 6, Low Byte (RMAP=0)
		orl	CMEN, #40h	; Compare Enable Register (RMAP=0)
		mov	A, RAM_68
		jz	code_553
		clr	P4.6		; Port 4 (PDIR=0)
		sjmp	code_553
; ---------------------------------------------------------------------------

code_524:				; CODE XREF: IEX6_0+3F4j
		cjne	@R1, #2, code_553
		anl	CMEN, #0DFh	; Compare Enable Register (RMAP=0)
		mov	CMH5, A		; Compare Register 5, High Byte	(RMAP=0)
		mov	CML5, R0	; Compare Register 5, Low Byte (RMAP=0)
		orl	CMEN, #20h	; Compare Enable Register (RMAP=0)
		mov	A, RAM_68
		jz	code_553
		clr	P4.5		; Port 4 (PDIR=0)
		sjmp	code_553
; ---------------------------------------------------------------------------

code_53B:				; CODE XREF: IEX6_0+3EFj
		anl     CMEN, #0BFh     ; Compare Enable Register (RMAP=0)
		mov     CMH6, A         ; Compare Register 6, High Byte (RMAP=0)
		mov     CML6, R0        ; Compare Register 6, Low Byte (RMAP=0)
		orl     CMEN, #40h      ; Compare Enable Register (RMAP=0)
		mov	A, RAM_68
		jz	code_53C
		clr     P4.6            ; Port 4 (PDIR=0)
		
code_53C:
		anl     CMEN, #0DFh     ; Compare Enable Register (RMAP=0)
		mov     CMH5, A         ; Compare Register 5, High Byte (RMAP=0)
		mov     CML5, R0        ; Compare Register 5, Low Byte (RMAP=0)
		orl     CMEN, #20h      ; Compare Enable Register (RMAP=0)
		mov	A, RAM_68
		jz	code_553
		clr     P4.5     

code_553:				; CODE XREF: IEX6_0+404j IEX6_0+408j ...
		mov	C, RAM_2A.2
		mov	A, IEN2		; Interrupt Enable Register 2
		mov	ACC.2, C	; Accumulator
		mov	IEN2, A		; Interrupt Enable Register 2
		mov	A, R6

code_55C:				; CODE XREF: IEX6_0:code_4DBj
		cjne	A, RAM_16, code_5A2
		jb	RAM_2A.2, code_5A2
		mov	B, RAM_17	; B-Register
		clr	C
		mov	A, R4
		rlc	A
		mov	R0, A
		mov	A, R5
		rlc	A
		jz	code_57F
		mul	AB
		xch	A, R0
		mov	R1, B		; B-Register
		mov	B, RAM_17	; B-Register
		mul	AB
		mov	A, R0
		add	A, B		; B-Register
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		sjmp	code_585
; ---------------------------------------------------------------------------

code_57F:				; CODE XREF: IEX6_0+452j
		mov	A, R0
		mul	AB
		mov	R0, B		; B-Register
		mov	R1, #0

code_585:				; CODE XREF: IEX6_0+464j
		mov	A, R2
		add	A, R0
		mov	R0, A
		mov	A, R3
		addc	A, R1
		anl     CMEN, #0BFh     ; Compare Enable Register (RMAP=0)
		mov     CMH6, A         ; Compare Register 6, High Byte (RMAP=0)
		mov     CML6, R0        ; Compare Register 6, Low Byte (RMAP=0)
		orl     CMEN, #40h      ; Compare Enable Register (RMAP=0)
		setb    P4.6            ; Port 4 (PDIR=0)
		anl     CMEN, #0DFh     ; Compare Enable Register (RMAP=0)
		mov     CMH5, A         ; Compare Register 5, High Byte (RMAP=0)
		mov     CML5, R0        ; Compare Register 5, Low Byte (RMAP=0)
		orl     CMEN, #20h      ; Compare Enable Register (RMAP=0)
		setb    P4.5     

code_5A2:				; CODE XREF: IEX6_0+CBj IEX6_0+D6j ...
		pop	B		; B-Register
		pop	ACC		; Accumulator
		pop	PSW		; Program Status Word
		reti
; End of function IEX6_0


; =============== S U B	R O U T	I N E =======================================


TF1_0:					; CODE XREF: TF1j
		push	PSW		; Program Status Word
		push	ACC		; Accumulator
		push	B		; B-Register
		push	DPL		; Data Pointer,	Low Byte
		push	DPH		; Data Pointer,	High Byte
		mov	PSW, #0		; Program Status Word
		push	RAM_0
		clr	IEN0.7		; Interrupt Enable Register 0
		clr	TCON.6		; Timer	Control	Register
		mov	A, TH1		; Timer	1, High	Byte
		jz	code_5C3
		mov	TL1, #0FFh	; Timer	1, Low Byte

code_5C3:				; CODE XREF: TF1_0+15j
		mov	A, TL1		; Timer	1, Low Byte
		add	A, #0CBh ; 'T'
		mov	TL1, A		; Timer	1, Low Byte
		mov	A, #0FAh ; '·'
		addc	A, #0
		mov	TH1, A		; Timer	1, High	Byte
		setb	TCON.6		; Timer	Control	Register
		setb	IEN0.7		; Interrupt Enable Register 0
		djnz	RAM_46,	code_5E4
		mov	RAM_46,	#14h
		setb	RAM_29.0
		mov	A, RAM_4A
		jz	code_5E4
		inc	A
		jz	code_5E4
		mov	RAM_4A,	A

code_5E4:				; CODE XREF: TF1_0+2Aj	TF1_0+34j ...
		jnb	RAM_2D.0, code_623
		inc	RAM_78
		mov	A, RAM_78
		xrl	A, #1
		jnz	code_5F4
		mov	S0BUF, #0	; Serial Channel 0 Buffer Register
		sjmp	code_60E
; ---------------------------------------------------------------------------

code_5F4:				; CODE XREF: TF1_0+44j
		mov	A, RAM_78
		xrl	A, #32h
		jnz	code_60E
		mov	RAM_78,	#0
		inc	RAM_51
		mov	A, RAM_51
		xrl	A, #3
		jnz	code_60E
		mov	RAM_78,	#32h ; '2'
		mov	S0RELL,	#0D0h ;	'¦' ; Serial Channel 0 Reload Reg., Low Byte
		mov	S0RELH,	#3	; Serial Channel 0 Reload Reg.,	High Byte

code_60E:				; CODE XREF: TF1_0+49j	TF1_0+4Fj ...
		mov	A, RAM_78
		xrl	A, #0BEh
		jnz	code_620
		mov	RAM_51,	#0
		mov	RAM_78,	#0
		clr	RAM_2D.0
		setb	RAM_2D.1
		setb	IEN0.4		; Interrupt Enable Register 0

code_620:				; CODE XREF: TF1_0+69j
		ljmp	code_77E
; ---------------------------------------------------------------------------

code_623:				; CODE XREF: TF1_0:code_5E4j
		jb	RAM_2D.1, code_68B
		jb	RAM_2F.1, code_64C
		jnb	S0CON.4, code_644 ; Serial Channel 0 Control Register
		jb	RAM_2F.3, code_644
		mov	A, RAM_78
		clr	C
		subb	A, #28h	; '('
		jc	code_649
		clr	S0CON.4		; Serial Channel 0 Control Register
		anl	IEN3, #0F7h	; Interrupt Enable Register 3
		clr	RAM_2F.2
		setb	RAM_2F.3
		mov	RAM_78,	#0
		sjmp	code_649
; ---------------------------------------------------------------------------

code_644:				; CODE XREF: TF1_0+80j	TF1_0+83j
		jnb	RAM_2F.3, code_649
		inc	RAM_78

code_649:				; CODE XREF: TF1_0+8Bj	TF1_0+99j ...
		jnb	RAM_2F.1, code_689

code_64C:				; CODE XREF: TF1_0+7Dj
		inc	RAM_78
		mov	A, RAM_78
		xrl	A, #14h
		jnz	code_689
		mov	RAM_78,	A
		mov	R0, #92h ; 'Т'
		inc	@R0
		mov	A, @R0
		xrl	A, #1
		jnz	code_66A
		mov	R0, #0A8h ; 'и'
		mov	S0RELL,	@R0	; Serial Channel 0 Reload Reg.,	Low Byte
		mov	R0, #91h ; 'С'
		mov	@R0, #0
		setb	S0CON.4		; Serial Channel 0 Control Register
		sjmp	code_689
; ---------------------------------------------------------------------------

code_66A:				; CODE XREF: TF1_0+B3j
		mov	A, @R0
		clr	C
		subb	A, #0FAh ; '·'
		jc	code_689
		clr	S0CON.4		; Serial Channel 0 Control Register
		clr	RAM_2F.1
		clr	RAM_2F.5
		clr	RAM_2F.6
		clr	A
		mov	RAM_79,	A
		mov	DEV_FLAGS, A
		mov	RAM_7B,	A
		mov	RAM_7C,	A
		mov	R0, #91h ; 'С'
		mov	@R0, A
		lcall	code_E3DC
		setb	S0CON.4		; Serial Channel 0 Control Register

code_689:				; CODE XREF: TF1_0:code_649j TF1_0+A9j ...
		sjmp	code_6C7
; ---------------------------------------------------------------------------

code_68B:				; CODE XREF: TF1_0:code_623j
		inc	RAM_78
		jnb	RAM_2F.1, code_6C4
		jb	S0CON.4, code_6A2 ; Serial Channel 0 Control Register
		mov	A, RAM_78
		clr	C
		subb	A, #2
		jc	code_6C4
		mov	R0, #91h ; 'С'
		mov	@R0, #0
		setb	S0CON.4		; Serial Channel 0 Control Register
		sjmp	code_6C4
; ---------------------------------------------------------------------------

code_6A2:				; CODE XREF: TF1_0+E7j
		mov	A, RAM_78
		clr	C
		subb	A, #0FEh ; '¦'
		jc	code_6C4
		clr	S0CON.4		; Serial Channel 0 Control Register
		clr	RAM_2F.1
		setb	RAM_2F.3
		setb	RAM_2F.4
		mov	RAM_78,	#0Ch
		mov	DPTR, #0F603h
		movx	A, @DPTR
		xrl	A, #0A0h
		jnz	code_6C1
		mov	RAM_51,	#6
		sjmp	code_6C4
; ---------------------------------------------------------------------------

code_6C1:				; CODE XREF: TF1_0+111j
		mov	RAM_51,	#0Eh

code_6C4:				; CODE XREF: TF1_0+E4j	TF1_0+EFj ...
		ljmp	code_77E
; ---------------------------------------------------------------------------

code_6C7:				; CODE XREF: TF1_0:code_689j
		jb	RAM_2A.6, code_71B
		mov	A, RAM_7C
		anl	A, #10h
		jnz	code_6D6
		mov	A, RAM_7C
		anl	A, #20h
		jz	code_71B

code_6D6:				; CODE XREF: TF1_0+125j
		mov	DPTR, #0F960h
		movx	A, @DPTR
		jz	code_700
		dec	A
		movx	@DPTR, A
		mov	DPTR, #0F961h
		movx	A, @DPTR
		jz	code_71B
		dec	A
		movx	@DPTR, A
		jnz	code_71B
		mov	A, RAM_7C
		anl	A, #10h
		jz	code_6F4
		clr	P4.4		; Port 4 (PDIR=0)
		clr	P4.7		; Port 4 (PDIR=0)
		sjmp	code_71B
; ---------------------------------------------------------------------------

code_6F4:				; CODE XREF: TF1_0+143j
		mov	A, RAM_7C
		anl	A, #20h
		jz	code_71B
		clr	P4.6		; Port 4 (PDIR=0)
		clr	P4.5		; Port 4 (PDIR=0)
		sjmp	code_71B
; ---------------------------------------------------------------------------

code_700:				; CODE XREF: TF1_0+131j
		orl	P4, #0F0h	; Port 4 (PDIR=0)
		mov	A, #9
		movx	@DPTR, A
		mov	DPTR, #0F962h
		movx	A, @DPTR
		jz	code_71B
		dec	A
		movx	@DPTR, A
		jnz	code_715
		anl	RAM_7C,	#0CFh
		sjmp	code_71B
; ---------------------------------------------------------------------------

code_715:				; CODE XREF: TF1_0+165j
		mov	DPTR, #0F961h
		mov	A, #8
		movx	@DPTR, A

code_71B:				; CODE XREF: TF1_0:code_6C7j
					; TF1_0+12Bj ...
		jb	RAM_2A.6, code_77E
		mov	A, RAM_7C
		anl	A, #0Fh
		jz	code_77E
		mov	DPTR, #0F95Eh
		movx	A, @DPTR
		jz	code_760
		dec	A
		movx	@DPTR, A
		mov	DPTR, #0F95Dh
		movx	A, @DPTR
		jz	code_77E
		dec	A
		movx	@DPTR, A
		jnz	code_77E
		mov	A, RAM_7C
		jnb	ACC.0, code_742	; Accumulator
		anl	CMEN, #0FBh	; Compare Enable Register (RMAP=0)
		clr	P4.2		; Port 4 (PDIR=0)
		sjmp	code_77E
; ---------------------------------------------------------------------------

code_742:				; CODE XREF: TF1_0+18Fj
		jnb	ACC.1, code_74C	; Accumulator
		anl	CMEN, #0FDh	; Compare Enable Register (RMAP=0)
		clr	P4.1		; Port 4 (PDIR=0)
		sjmp	code_77E
; ---------------------------------------------------------------------------

code_74C:				; CODE XREF: TF1_0:code_742j
		jnb	ACC.2, code_756	; Accumulator
		anl	CMEN, #0FEh	; Compare Enable Register (RMAP=0)
		clr	P4.0		; Port 4 (PDIR=0)
		sjmp	code_77E
; ---------------------------------------------------------------------------

code_756:				; CODE XREF: TF1_0:code_74Cj
		jnb	ACC.3, code_77E	; Accumulator
		anl	CMEN, #0F7h	; Compare Enable Register (RMAP=0)
		clr	P4.3		; Port 4 (PDIR=0)
		sjmp	code_77E
; ---------------------------------------------------------------------------

code_760:				; CODE XREF: TF1_0+17Fj
		orl	P4, #0Fh	; Port 4 (PDIR=0)
		mov	DPTR, #0F95Fh
		movx	A, @DPTR
		jz	code_77E
		dec	A
		movx	@DPTR, A
		jnz	code_772
		anl	RAM_7C,	#0F0h
		sjmp	code_77E
; ---------------------------------------------------------------------------

code_772:				; CODE XREF: TF1_0+1C2j
		mov	DPTR, #0F95Eh
		mov	A, #9
		movx	@DPTR, A
		mov	DPTR, #0F95Dh
		mov	A, #5
		movx	@DPTR, A

code_77E:				; CODE XREF: TF1_0:code_620j
					; TF1_0:code_6C4j ...
		jnb	RAM_28.5, code_784
		ljmp	code_83B
; ---------------------------------------------------------------------------

code_784:				; CODE XREF: TF1_0:code_77Ej
		mov	A, RAM_67
		jz	code_78B
		djnz	RAM_67,	code_799

code_78B:				; CODE XREF: TF1_0+1DDj
		mov	A, UFRXX
		clr	C
		subb	A, CRRXX
		jc	code_79C
		jnb	ACC.7, code_7A1	; Accumulator
		mov	A, #7Fh	; ''
		sjmp	code_7A1
; ---------------------------------------------------------------------------

code_799:				; CODE XREF: TF1_0+1DFj TF1_0+1FCj
		ljmp	code_83B
; ---------------------------------------------------------------------------

code_79C:				; CODE XREF: TF1_0+1E7j
		jb	ACC.7, code_7A1	; Accumulator
		mov	A, #80h	; 'А'

code_7A1:				; CODE XREF: TF1_0+1E9j TF1_0+1EEj ...
		jnz	code_7B6
		mov	A, RAM_66
		jz	code_799
		cjne	A, #0FFh, code_7AC
		sjmp	code_7AF
; ---------------------------------------------------------------------------

code_7AC:				; CODE XREF: TF1_0+1FEj
		cjne	A, #1, code_7B5

code_7AF:				; CODE XREF: TF1_0+201j
		mov	RAM_66,	#0
		ljmp	code_83B
; ---------------------------------------------------------------------------

code_7B5:				; CODE XREF: TF1_0:code_7ACj
		clr	A

code_7B6:				; CODE XREF: TF1_0:code_7A1j
		add	A, #80h	; 'А'
		mov	B, A		; B-Register
		setb	RAM_27.7
		mov	A, RAM_66
		add	A, #80h	; 'А'
		cjne	A, B, code_7C5	; B-Register
		sjmp	code_7F7
; ---------------------------------------------------------------------------

code_7C5:				; CODE XREF: TF1_0+217j
		jnc	code_7DF
		mov	DPTR, #60CCh	; Количество шагов разгона/остановки | шаг.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, RAM_66
		cjne	A, B, code_7D5	; B-Register
		sjmp	code_7F7
; ---------------------------------------------------------------------------

code_7D5:				; CODE XREF: TF1_0+227j
		inc	A
		mov	RAM_66,	A
		jnz	code_7F7
		mov	RAM_66,	#1
		sjmp	code_7F7
; ---------------------------------------------------------------------------

code_7DF:				; CODE XREF: TF1_0:code_7C5j
		mov	DPTR, #60CCh	; Количество шагов разгона/остановки | шаг.
		clr	A
		movc	A, @A+DPTR
		cpl	A
		inc	A
		mov	B, A		; B-Register
		mov	A, RAM_66
		cjne	A, B, code_7EF	; B-Register
		sjmp	code_7F7
; ---------------------------------------------------------------------------

code_7EF:				; CODE XREF: TF1_0+241j
		dec	A
		mov	RAM_66,	A
		jnz	code_7F7
		mov	RAM_66,	#0FFh

code_7F7:				; CODE XREF: TF1_0+21Aj TF1_0+22Aj ...
		mov	A, RAM_66
		jb	ACC.7, code_80B	; Accumulator
		mov	DPTR, #6137h	; Динамика разгона РХХ | Время шага, мс. - Индекс скорости
		mov	A, RAM_66
		movc	A, @A+DPTR
		mov	RAM_67,	A
		inc	CRRXX
		mov	B, #0		; B-Register
		sjmp	code_818
; ---------------------------------------------------------------------------

code_80B:				; CODE XREF: TF1_0+250j
		cpl	A
		inc	A
		mov	DPTR, #6137h	; Динамика разгона РХХ | Время шага, мс. - Индекс скорости
		movc	A, @A+DPTR
		mov	RAM_67,	A
		dec	CRRXX
		mov	B, #2		; B-Register

code_818:				; CODE XREF: TF1_0+260j
		mov	DPTR, #60CDh	; Направление движения РХХ |
		clr	A
		movc	A, @A+DPTR
		add	A, B		; B-Register
		mov	B, A		; B-Register
		mov	A, P6		; Port 6 (PDIR=0)
		mov	C, ACC.2	; Accumulator
		mov	ACC.0, C	; Accumulator
		mov	C, ACC.1	; Accumulator
		mov	ACC.1, C	; Accumulator
		anl	A, #0Bh
		add	A, B		; B-Register
		jb	ACC.1, code_838	; Accumulator
		xrl	P6, #2		; Port 6 (PDIR=0)
		ljmp	code_83B
; ---------------------------------------------------------------------------

code_838:				; CODE XREF: TF1_0+286j
		xrl	P6, #4		; Port 6 (PDIR=0)

code_83B:				; CODE XREF: TF1_0+1D8j
					; TF1_0:code_799j ...
		mov	A, RAM_32
		inc	A
		jz	code_8AB
		jnb	Options.0, code_876

		mov		DPTR, #5F02h
		clr		A
		movc	A, @A+DPTR
		mov		R0, #53h
		jnb		ACC.7, code_843
		mov		R0, #55h
		
code_843:
		clr	RAM_28.3
		
code_844:
		mov	ADCON1,	R0 ; 'S' ; A/D Converter Control Register 1
		mov	ADDATL,	#0	; A/D Converter	Data Register, Low Byte

code_84B:				; CODE XREF: TF1_0:code_84Bj
		jb	ADCON0.4, code_84B ; A/D Converter Control Register 0
		mov	A, ADDATL	; A/D Converter	Data Register, Low Byte
		mov	B, ADDATH	; A/D Converter	Data Register, High Byte
		jbc	RAM_28.3, code_844
		setb	RAM_28.3
		clr	C
		clr	IEN0.7		; Interrupt Enable Register 0
		add	A, RAM_30
		mov	RAM_30,	A
		mov	A, B		; B-Register
		addc	A, RAM_31
		mov	RAM_31,	A
		clr	A
		addc	A, RAM_56
		mov	RAM_56,	A
		inc	RAM_32
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, B		; B-Register
		mov	DPTR, #0F80Ch
		movx	@DPTR, A
		sjmp	code_8AB
; ---------------------------------------------------------------------------

code_876:				; CODE XREF: TF1_0+297j
		clr	RAM_28.3

code_878:				; CODE XREF: TF1_0+2DAj
		mov	ADCON1,	#3	; A/D Converter	Control	Register 1
		mov	ADDATL,	#0	; A/D Converter	Data Register, Low Byte

code_87E:				; CODE XREF: TF1_0:code_87Ej
		jb	ADCON0.4, code_87E ; A/D Converter Control Register 0
		mov	A, ADDATH	; A/D Converter	Data Register, High Byte
		jbc	RAM_28.3, code_878
		setb	RAM_28.3
		mov	DPTR, #0F80Ch
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	DPTR, #0A358h	; Тарировка ДМРВ
		movc	A, @A+DPTR
		clr	C
		clr	IEN0.7		; Interrupt Enable Register 0
		add	A, RAM_30
		xch	A, B		; B-Register
		inc	DPH		; Data Pointer,	High Byte
		movc	A, @A+DPTR
		addc	A, RAM_31
		jnc	code_8A2
		sjmp	code_8A9
; ---------------------------------------------------------------------------

code_8A2:				; CODE XREF: TF1_0+2F5j
		mov	RAM_30,	B	; B-Register
		mov	RAM_31,	A
		inc	RAM_32

code_8A9:				; CODE XREF: TF1_0+2F7j
		setb	IEN0.7		; Interrupt Enable Register 0

code_8AB:				; CODE XREF: TF1_0+295j TF1_0+2CBj
		jb	Hardware.1, code_pwm
		jb	Hardware.2, code_boost_pwm
		sjmp	code_8B8

code_boost_pwm:
code_pwm:
		mov		DPTR, #0F806h
		movx	A, @DPTR
		mov		R0, A
		inc	RAM_76
		anl	RAM_76,	#3Fh
		mov	A, RAM_76
		cjne	A, RAM_0, code_8B8

code_8B8:
		cpl	C
		mov	P5.2, C		; Port 5 (PDIR=0)

code_8BB:				; CODE XREF: TF1_0:code_8ABj
		jnb	P3.5, code_8CC	; Port 3 (PDIR=0)
		jbc	RAM_27.4, code_8C3
		sjmp	code_8CE
; ---------------------------------------------------------------------------

code_8C3:				; CODE XREF: TF1_0+315j
		mov	R0, #0C0h ; 'L'
		inc	@R0
		inc	R0
		inc	@R0
		inc	R0
		inc	@R0
		sjmp	code_8CE
; ---------------------------------------------------------------------------

code_8CC:				; CODE XREF: TF1_0:code_8BBj
		setb	RAM_27.4

code_8CE:				; CODE XREF: TF1_0+318j TF1_0+321j
		pop	RAM_0
		pop	DPH		; Data Pointer,	High Byte
		pop	DPL		; Data Pointer,	Low Byte
		pop	B		; B-Register
		pop	ACC		; Accumulator
		pop	PSW		; Program Status Word
		jnb	TCON.7,	code_8DF ; Timer Control Register
		setb	RAM_22.1

code_8DF:				; CODE XREF: TF1_0+331j
		reti
; End of function TF1_0


; =============== S U B	R O U T	I N E =======================================


IE0_0:					; CODE XREF: IE0j
		push	PSW		; Program Status Word
		push	ACC		; Accumulator
		push	B		; B-Register
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #0	; Data Pointer Select Register
		push	DPL		; Data Pointer,	Low Byte
		push	DPH		; Data Pointer,	High Byte
		mov	PSW, #8		; Program Status Word
		jb	RAM_28.2, code_8FB
		mov		DPTR, #5F01h
		clr		A
		movc	A, @A+DPTR
		jnb		ACC.4, code_8FB
		ljmp	code_1651
; ---------------------------------------------------------------------------

code_8FB:				; CODE XREF: IE0_0+12j	IE0_0+15j
		clr	RAM_28.2
		mov	R0, KNOCK_LO
		mov	R1, KNOCK_HI
		lcall	code_AD86
		mov	DPTR, #0F8BAh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	A, RAM_43
		rl	A
		mov	R4, A
		mov	A, #0A0h ; 'а'
		add	A, R4
		mov	R0, A
		mov	@R0, RAM_A
		inc	R0
		mov	@R0, RAM_B
		mov	RAM_8, RAM_A
		mov	RAM_9, RAM_B
		mov	DPTR, #0FF41h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F96Eh
		mov	A, RAM_43
		rl	A
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #0FA8Eh
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A
		lcall	SUB_R0R1_R2R3
		jc	code_966
		mov	DPTR, #0FA8Eh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		sjmp	code_96F
; ---------------------------------------------------------------------------

code_966:				; CODE XREF: IE0_0+79j
		mov	DPTR, #0FF41h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A

code_96F:				; CODE XREF: IE0_0+84j
		mov	DPTR, #0F966h
		mov	A, RAM_43
		rl	A
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #5F7Ch	; Коэф.	поцилиндрового фильтра шума двигателя |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_ABSR0R1_B
		mov	DPTR, #0F881h
		movx	A, @DPTR
		add	A, B		; B-Register
		mov	DPTR, #0F881h
		movx	@DPTR, A
		clr	A
		addc	A, R0
		mov	R0, A
		clr	A
		addc	A, R1
		mov	R1, A
		mov	DPTR, #0F966h
		mov	A, RAM_43
		rl	A
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	ADD_R0R1_R2R3
		mov	A, R1
		movx	@DPTR, A
		dec	DPL		; Data Pointer,	Low Byte
		mov	A, R0
		movx	@DPTR, A
		jnb	RAM_26.7, code_9CE
		mov	DPTR, #5F6Fh	; Порог	температуры для	активизации калибровки уровня шума | град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_9C0

code_9C0:
		jnc	code_9CB
		mov	DPTR, #0F965h
		movx	A, @DPTR
		cjne	A, #0FFh, code_9C9

code_9C9:
		jc	code_9D1

code_9CB:				; CODE XREF: IE0_0:code_9C0j
		ljmp	code_A8B
; ---------------------------------------------------------------------------

code_9CE:				; CODE XREF: IE0_0+D5j
		ljmp	code_A12
; ---------------------------------------------------------------------------

code_9D1:				; CODE XREF: IE0_0:code_9C9j
		mov	DPTR, #0FF41h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0F934h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #5F52h	; Коэффициент общего фильтра шума двигателя |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_ABSR0R1_B
		mov	DPTR, #0F937h
		movx	A, @DPTR
		add	A, B		; B-Register
		mov	DPTR, #0F937h
		movx	@DPTR, A
		clr	A
		addc	A, R0
		mov	R0, A
		clr	A
		addc	A, R1
		mov	R1, A
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0F934h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		lcall	code_B5E0
		ljmp	code_A8B
; ---------------------------------------------------------------------------

code_A12:				; CODE XREF: IE0_0:code_9CEj
		clr	A
		mov	DPTR, #0F965h
		movx	@DPTR, A
		mov	DPTR, #0F943h
		movx	A, @DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	A, R1
		jz	code_A29
		mov	R0, #0FFh
		mov	R1, #0Fh
		sjmp	code_A34
; ---------------------------------------------------------------------------

code_A29:				; CODE XREF: IE0_0+141j
		mov	RAM_9, RAM_8
		mov	R0, B		; B-Register
		lcall	DIV_R0R1_8
		lcall	DIV_R0R1_2

code_A34:				; CODE XREF: IE0_0+147j
		mov	DPTR, #0F96Eh
		mov	A, RAM_43
		rl	A
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FA8Eh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FF41h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #0FA92h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		jc	code_A82
		mov	DPTR, #0FA8Eh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		jnc	code_A8B
		mov	DPTR, #0F9D1h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		jc	code_A82
		sjmp	code_A8B
; ---------------------------------------------------------------------------

code_A82:				; CODE XREF: IE0_0+182j IE0_0+19Ej
		mov	R1, RAM_43
		mov	DPTR, #5EE0h
		mov	A, R1
		movc	A, @A+DPTR
		orl	RAM_71,	A

code_A8B:				; CODE XREF: IE0_0:code_9CBj
					; IE0_0+12Fj ...
		jnb	RAM_2A.3, code_A91
		ljmp	code_1502
; ---------------------------------------------------------------------------

code_A91:				; CODE XREF: IE0_0:code_A8Bj
		mov	DPTR, #0F9EBh
		movx	A, @DPTR
		clr	C
		subb	A, #0B0h ; '-'
		mov	R5, A
		mov	DPTR, #0F9DDh
		clr	C
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	A, DPH		; Data Pointer,	High Byte
		addc	A, #0
		mov	DPH, A		; Data Pointer,	High Byte
		movx	A, @DPTR
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		mov	R1, A
		mov	A, RAM_43
		jnb	ACC.0, code_AB7	; Accumulator
		mov	R2, #0
		mov	R3, #80h ; 'А'
		sjmp	code_AC0
; ---------------------------------------------------------------------------

code_AB7:				; CODE XREF: IE0_0+1CEj
		mov	DPTR, #0FA2Dh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A

code_AC0:				; CODE XREF: IE0_0+1D5j
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R2, MD0		; Multiplication/Division Register 0
		mov	A, MD1		; Multiplication/Division Register 1
		mov	R0, MD2		; Multiplication/Division Register 2
		mov	R1, MD3		; Multiplication/Division Register 3
		mov	C, ACC.7	; Accumulator
		mov	A, R0
		rlc	A
		mov	R0, A
		mov	A, R1
		rlc	A
		mov	R1, A
		mov	A, R5
		mov	DPTR, #0FA2Fh
		clr	C
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	A, DPH		; Data Pointer,	High Byte
		addc	A, #0
		mov	DPH, A		; Data Pointer,	High Byte
		mov	A, R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, R1
		movx	@DPTR, A
		mov	R0, #0BEh ; '-'
		mov	A, @R0
		clr	C
		subb	A, #0B0h ; '-'
		jz	code_AFA
		clr	C
		rrc	A

code_AFA:				; CODE XREF: IE0_0+216j
		mov	R5, A
		jnb	RAM_2B.3, code_AFE

code_AFE:
		mov	A, R5
		clr	C
		subb	A, #3
		jnc	code_B07
		add	A, #7
		clr	C

code_B07:				; CODE XREF: IE0_0+222j
		rlc	A
		add	A, #2Fh	; '/'
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	DPH, #0FAh ; '·' ; Data Pointer, High Byte
		movx	A, @DPTR
		mov	R2, A
		mov	R6, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		mov	R7, A
		mov	A, R5
		clr	C
		subb	A, #2
		jnc	code_B1F
		add	A, #7
		clr	C

code_B1F:				; CODE XREF: IE0_0+23Aj
		rlc	A
		add	A, #2Fh	; '/'
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	DPH, #0FAh ; '·' ; Data Pointer, High Byte
		movx	A, @DPTR
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		jnc	code_B3F
		clr	A
		mov	R0, A
		mov	R1, A
		mov	DPTR, #0F9EDh
		movx	@DPTR, A
		mov	DPTR, #0F9EEh
		movx	@DPTR, A
		ljmp	code_C88
; ---------------------------------------------------------------------------

code_B3F:				; CODE XREF: IE0_0+24Fj
		mov	DPTR, #0F9EEh
		movx	@DPTR, A
		mov	A, R0
		mov	DPTR, #0F9EDh
		movx	@DPTR, A
		mov	A, R5
		clr	C
		subb	A, #4
		jnc	code_B51
		add	A, #7
		clr	C

code_B51:				; CODE XREF: IE0_0+26Cj
		rlc	A
		add	A, #2Fh	; '/'
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	DPH, #0FAh ; '·' ; Data Pointer, High Byte
		movx	A, @DPTR
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		mov	R1, A
		mov	A, R5
		clr	C
		subb	A, #0
		jnc	code_B67
		add	A, #7
		clr	C

code_B67:				; CODE XREF: IE0_0+282j
		rlc	A
		add	A, #2Fh	; '/'
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	DPH, #0FAh ; '·' ; Data Pointer, High Byte
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_B84
		clr	C
		mov	A, R0
		cpl	A
		add	A, #1
		mov	R0, A
		mov	A, R1
		cpl	A
		addc	A, #0
		mov	R1, A

code_B84:				; CODE XREF: IE0_0+297j
		mov	DPTR, #0FA09h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD4, #4		; Multiplication/Division Register 4
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R2, MD0		; Multiplication/Division Register 0
		mov	R3, MD1		; Multiplication/Division Register 1
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		mov	DPTR, #0F9F3h
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A
		mov	DPTR, #0F9EDh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		jnc	code_BC0
		clr	A
		mov	R0, A
		mov	R1, A
		ljmp	code_C88
; ---------------------------------------------------------------------------

code_BC0:				; CODE XREF: IE0_0+2D8j
		mov	DPTR, #0FA03h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	MD0, #0Eh	; Multiplication/Division Register 0
		mov	MD1, #0E8h ; 'ш' ; Multiplication/Division Register 1
		mov	MD2, #0F5h ; 'ї' ; Multiplication/Division Register 2
		mov	MD3, #0CEh ; '+' ; Multiplication/Division Register 3
		mov	MD4, R6		; Multiplication/Division Register 4
		mov	MD5, R7		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	A, MD3		; Multiplication/Division Register 3
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		mov	MD0, #0		; Multiplication/Division Register 0
		mov	MD1, R0		; Multiplication/Division Register 1
		mov	MD2, R1		; Multiplication/Division Register 2
		mov	MD3, R2		; Multiplication/Division Register 3
		mov	ARCON, #1	; Arithmetic Control Register
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD2, R2		; Multiplication/Division Register 2
		mov	MD3, R3		; Multiplication/Division Register 3
		mov	MD4, R6		; Multiplication/Division Register 4
		mov	MD5, R7		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD2, R2		; Multiplication/Division Register 2
		mov	MD3, R3		; Multiplication/Division Register 3
		mov	ARCON, #1	; Arithmetic Control Register
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD2, R2		; Multiplication/Division Register 2
		mov	MD3, R3		; Multiplication/Division Register 3
		mov	MD4, R6		; Multiplication/Division Register 4
		mov	MD5, R7		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		mov	DPTR, #0FA07h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FA03h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	A, R2
		orl	A, R3
		jz	code_C88
		mov	R0, #0FFh
		mov	R1, #0FFh

code_C88:				; CODE XREF: IE0_0+25Cj IE0_0+2DDj ...
		mov	DPTR, #0F93Dh
		movx	A, @DPTR
		jnb	ACC.7, code_C99	; Accumulator
		mov	DPTR, #0FAA0h
		movx	A, @DPTR
		jb	ACC.7, code_C99	; Accumulator
		clr	A
		mov	R0, A
		mov	R1, A

code_C99:				; CODE XREF: IE0_0+3ACj IE0_0+3B3j
		mov	DPTR, #0F9F9h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F9FBh
		mov	A, RAM_43
		rl	A
		anl	A, #0FEh
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	A, DPH		; Data Pointer,	High Byte
		addc	A, #0
		mov	DPH, A		; Data Pointer,	High Byte
		mov	A, R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FA0Fh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, R1
		cjne	A, B, code_CC3	; B-Register

code_CC3:
		mov	DPTR, #0FA0Bh
		movx	A, @DPTR
		cpl	C
		mov	ACC.4, C	; Accumulator
		movx	@DPTR, A
		jnc	code_CDD
		mov	DPTR, #5EE8h
		mov	A, RAM_43
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FA0Bh
		movx	A, @DPTR
		orl	A, B		; B-Register
		sjmp	code_CEC
; ---------------------------------------------------------------------------

code_CDD:				; CODE XREF: IE0_0+3EBj
		mov	DPTR, #5EE8h
		mov	A, RAM_43
		movc	A, @A+DPTR
		cpl	A
		mov	B, A		; B-Register
		mov	DPTR, #0FA0Bh
		movx	A, @DPTR
		anl	A, B		; B-Register

code_CEC:				; CODE XREF: IE0_0+3FBj
		movx	@DPTR, A
		mov	DPTR, #0FA10h
		mov	A, RAM_43
		rl	A
		anl	A, #0FEh
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #5FBFh	; Коэффициэнт фильтра 5FBF |
		jnb	RAM_2B.1, code_D08
		mov	DPTR, #60C1h	; Коэффициэнт фильтра 60C1 |

code_D08:				; CODE XREF: IE0_0+422j
		clr	A
		movc	A, @A+DPTR
		push	ACC		; Accumulator
		cpl	A
		inc	A
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	RAM_B, R1
		mov	RAM_A, R0
		mov	DPTR, #0F9F9h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		pop	B		; B-Register
		lcall	MUL_R0R1_B
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0FA10h
		mov	A, RAM_43
		rl	A
		anl	A, #0FEh
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FA19h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, R1
		cjne	A, B, code_D44	; B-Register

code_D44:
		mov	DPTR, #0FA1Fh
		movx	A, @DPTR
		cpl	C
		mov	ACC.4, C	; Accumulator
		movx	@DPTR, A
		jnc	code_D5E
		mov	DPTR, #5EE8h
		mov	A, RAM_43
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FA1Fh
		movx	A, @DPTR
		orl	A, B		; B-Register
		sjmp	code_D6D
; ---------------------------------------------------------------------------

code_D5E:				; CODE XREF: IE0_0+46Cj
		mov	DPTR, #5EE8h
		mov	A, RAM_43
		movc	A, @A+DPTR
		cpl	A
		mov	B, A		; B-Register
		mov	DPTR, #0FA1Fh
		movx	A, @DPTR
		anl	A, B		; B-Register

code_D6D:				; CODE XREF: IE0_0+47Cj
		movx	@DPTR, A
		lcall	code_B916
		mov	MD0, R6		; Multiplication/Division Register 0
		mov	MD4, #3		; Multiplication/Division Register 4
		mov	MD1, R7		; Multiplication/Division Register 1
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R6, MD0		; Multiplication/Division Register 0
		mov	R7, MD1		; Multiplication/Division Register 1
		mov	B, MD2		; Multiplication/Division Register 2
		mov	A, MD3		; Multiplication/Division Register 3
		mov	A, R5
		clr	C
		subb	A, #5
		jnc	code_D91
		add	A, #7
		clr	C

code_D91:				; CODE XREF: IE0_0+4ACj
		rlc	A
		add	A, #2Fh	; '/'
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	DPH, #0FAh ; '·' ; Data Pointer, High Byte
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		mov	RAM_8, R6
		mov	RAM_9, R7
		lcall	ADD_R0R1_R2R3
		mov	A, B		; B-Register
		addc	A, #0
		mov	R4, A
		mov	RAM_E, R0
		mov	RAM_F, R1
		mov	A, R5
		clr	C
		subb	A, #4
		jnc	code_DB7
		add	A, #7
		clr	C

code_DB7:				; CODE XREF: IE0_0+4D2j
		rlc	A
		add	A, #2Fh	; '/'
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	DPH, #0FAh ; '·' ; Data Pointer, High Byte
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, #3		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R2, MD0		; Multiplication/Division Register 0
		mov	R3, MD1		; Multiplication/Division Register 1
		mov	B, MD2		; Multiplication/Division Register 2
		mov	A, MD3		; Multiplication/Division Register 3
		mov	A, R5
		clr	C
		subb	A, #2
		jnc	code_DE4
		add	A, #7
		clr	C

code_DE4:				; CODE XREF: IE0_0+4FFj
		rlc	A
		add	A, #2Fh	; '/'
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	DPH, #0FAh ; '·' ; Data Pointer, High Byte
		movx	A, @DPTR
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		mov	R1, A
		lcall	ADD_R0R1_R2R3
		mov	A, B		; B-Register
		addc	A, #0
		mov	B, A		; B-Register
		mov	A, R0
		mov	R0, RAM_E
		mov	R2, A
		mov	A, R1
		mov	R1, RAM_F
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		mov	A, R4
		subb	A, B		; B-Register
		mov	R4, A
		jnc	code_E1B
		clr	C
		mov	A, R0
		cpl	A
		add	A, #1
		mov	R0, A
		mov	A, R1
		cpl	A
		addc	A, #0
		mov	R1, A
		mov	A, R4
		cpl	A
		addc	A, #0
		mov	R4, A

code_E1B:				; CODE XREF: IE0_0+529j
		jz	code_E21
		mov	R0, #0FFh
		mov	R1, #0FFh

code_E21:				; CODE XREF: IE0_0:code_E1Bj
		mov	RAM_A, R0
		mov	RAM_B, R1
		mov	DPTR, #0FA07h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	DIV_R0R1_2
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD4, R2		; Multiplication/Division Register 4
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD5, R3		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	A, MD2		; Multiplication/Division Register 2
		mov	B, MD3		; Multiplication/Division Register 3
		orl	A, B		; B-Register
		jz	code_E4E
		mov	R0, #0FFh
		mov	R1, #0FFh

code_E4E:				; CODE XREF: IE0_0+568j
		mov	DPTR, #5FBCh	; Коэффициэнт фильтра 5FBC |
		jnb	RAM_2B.1, code_E57
		mov	DPTR, #60C2h	; Коэффициэнт фильтра 60C2 |

code_E57:				; CODE XREF: IE0_0+571j
		clr	A
		movc	A, @A+DPTR
		push	ACC		; Accumulator
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #5FBDh
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		lcall	code_AD86
		mov	DPTR, #0F9F5h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		pop	ACC		; Accumulator
		cpl	A
		inc	A
		mov	B, A		; B-Register
		mov	DPTR, #0F9F7h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	MUL_R0R1_B
		mov	DPTR, #0F9F5h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	ADD_R0R1_R2R3
		clr	A
		addc	A, #0
		mov	B, A		; B-Register
		mov	DPTR, #0FA1Bh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	R2, B		; B-Register
		mov	R3, #0
		mov	DPTR, #0FA1Dh
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A
		mov	A, B		; B-Register
		jz	code_EB7
		mov	R0, #0FFh
		mov	R1, #0FFh

code_EB7:				; CODE XREF: IE0_0+5D1j
		mov	DPTR, #0F93Dh
		movx	A, @DPTR
		jnb	ACC.7, code_EC1	; Accumulator
		clr	A
		mov	R0, A
		mov	R1, A

code_EC1:				; CODE XREF: IE0_0+5DBj
		mov	DPTR, #0F9F7h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		jb	RAM_2B.3, code_ED0
		ljmp	code_1502
; ---------------------------------------------------------------------------

code_ED0:				; CODE XREF: IE0_0+5EAj
		mov	DPTR, #0F93Eh
		movx	A, @DPTR
		jb	ACC.1, code_EDA	; Accumulator
		ljmp	code_1502
; ---------------------------------------------------------------------------

code_EDA:				; CODE XREF: IE0_0+5F4j
		mov	DPTR, #0FA73h
		movx	A, @DPTR
		inc	A
		jnz	code_EE2
		dec	A

code_EE2:				; CODE XREF: IE0_0+5FFj
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	DPTR, #5FDAh
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_EED	; B-Register

code_EED:
		jc	code_EF2
		ljmp	code_1507
; ---------------------------------------------------------------------------

code_EF2:				; CODE XREF: IE0_0:code_EEDj
		mov	A, RAM_43
		jnb	ACC.0, code_EFA	; Accumulator
		ljmp	code_1507
; ---------------------------------------------------------------------------

code_EFA:				; CODE XREF: IE0_0+614j
		mov	A, R5
		clr	C
		subb	A, #1
		jnc	code_F03
		add	A, #7
		clr	C

code_F03:				; CODE XREF: IE0_0+61Ej
		rlc	A
		add	A, #0B0h ; '-'
		mov	R0, A
		mov	A, R5
		clr	C
		subb	A, #5
		jnc	code_F10
		add	A, #7
		clr	C

code_F10:				; CODE XREF: IE0_0+62Bj
		rlc	A
		add	A, #0B0h ; '-'
		mov	R1, A
		mov	A, @R0
		mov	B, @R1		; B-Register
		mov	RAM_E, @R1
		clr	C
		subb	A, B		; B-Register
		mov	R2, A
		inc	R0
		mov	A, @R0
		inc	R1
		mov	B, @R1		; B-Register
		mov	RAM_F, @R1
		subb	A, B		; B-Register
		jnc	code_F30
		clr	A
		mov	DPTR, #0F9A9h
		movx	@DPTR, A
		ljmp	code_1500
; ---------------------------------------------------------------------------

code_F30:				; CODE XREF: IE0_0+646j
		jz	code_F35
		ljmp	code_1500
; ---------------------------------------------------------------------------

code_F35:				; CODE XREF: IE0_0:code_F30j
		mov	A, R2
		mov	DPTR, #0F9A9h
		movx	@DPTR, A
		mov	B, #3		; B-Register
		mul	AB
		xch	A, B		; B-Register
		jz	code_F45
		mov	B, #0FFh	; B-Register

code_F45:				; CODE XREF: IE0_0+660j
		mov	A, B		; B-Register
		add	A, #2
		mov	B, #4		; B-Register
		div	AB
		mov	DPTR, #0F9ABh
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	DPTR, #0F9A9h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		mov	DPTR, #0F9AAh
		movx	@DPTR, A
		mov	A, R5
		clr	C
		subb	A, #4
		jnc	code_F67
		add	A, #7
		clr	C

code_F67:				; CODE XREF: IE0_0+682j
		rlc	A
		add	A, #0B0h ; '-'
		mov	R0, A
		mov	A, @R0
		mov	R2, A
		inc	R0
		mov	A, @R0
		mov	R3, A
		mov	DPTR, #0F9E5h
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A
		mov	RAM_8, R6
		mov	RAM_9, R7
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #0F9AAh
		movx	A, @DPTR
		mov	R2, A
		mov	R3, #0
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0F9ACh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	A, R5
		clr	C
		subb	A, #2
		jnc	code_F9C
		add	A, #7
		clr	C

code_F9C:				; CODE XREF: IE0_0+6B7j
		rlc	A
		add	A, #0B0h ; '-'
		mov	R0, A
		mov	A, @R0
		mov	R2, A
		inc	R0
		mov	A, @R0
		mov	R3, A
		mov	DPTR, #0F9E1h
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A
		mov	RAM_8, R6
		mov	RAM_9, R7
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #0F9ABh
		movx	A, @DPTR
		mov	R2, A
		mov	R3, #0
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0F9AEh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	A, R1
		mov	C, ACC.7	; Accumulator
		mov	DPTR, #0F9ADh
		movx	A, @DPTR
		jc	code_1024
		orl	C, ACC.7	; Accumulator
		jc	code_1014
		mov	DPTR, #0F9ACh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jc	code_FF7
		mov	DPTR, #0FA21h
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A
		mov	DPTR, #0F9E5h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		sjmp	code_1065
; ---------------------------------------------------------------------------

code_FF7:				; CODE XREF: IE0_0+701j
		mov	DPTR, #0F9AEh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0FA21h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F9E1h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		sjmp	code_1065
; ---------------------------------------------------------------------------

code_1014:				; CODE XREF: IE0_0+6F3j IE0_0+746j
		mov	R0, #0
		mov	R1, #80h ; 'А'
		mov	DPTR, #0FA25h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		ljmp	code_1500
; ---------------------------------------------------------------------------

code_1024:				; CODE XREF: IE0_0+6EFj
		anl	C, ACC.0	; Accumulator
		jnc	code_1014
		mov	DPTR, #0F9ACh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_104A
		mov	DPTR, #0FA21h
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A
		mov	DPTR, #0F9E5h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		sjmp	code_1065
; ---------------------------------------------------------------------------

code_104A:				; CODE XREF: IE0_0+754j
		mov	DPTR, #0F9AEh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0FA21h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F9E1h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A

code_1065:				; CODE XREF: IE0_0+715j IE0_0+732j ...
		mov	DPTR, #0FA23h
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A
		mov	DPTR, #0FA21h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0FA27h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FA23h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	MUL_R0R1_2
		mov	RAM_B, R1
		mov	RAM_A, R0
		mov	DPTR, #0FA27h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	MD0, #0		; Multiplication/Division Register 0
		mov	MD1, #0		; Multiplication/Division Register 1
		mov	MD2, R0		; Multiplication/Division Register 2
		mov	MD3, R1		; Multiplication/Division Register 3
		mov	MD4, R2		; Multiplication/Division Register 4
		mov	MD5, R3		; Multiplication/Division Register 5
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
		mov	DPTR, #0FA25h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F942h
		movx	A, @DPTR
		jnb	ACC.0, code_10DA ; Accumulator
		mov	DPTR, #5FFAh	; Константа (Д.П.В.) 5FFA |
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #5FFBh
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		sjmp	code_10E6
; ---------------------------------------------------------------------------

code_10DA:				; CODE XREF: IE0_0+7E9j
		mov	DPTR, #5FC2h	; Константа (Д.П.В.) 5FC2 |
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #5FC3h
		clr	A
		movc	A, @A+DPTR
		mov	R1, A

code_10E6:				; CODE XREF: IE0_0+7F8j
		lcall	code_AD70
		mov	DPTR, #0F940h
		movx	A, @DPTR
		mov	DPTR, #0FA57h
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R4, MD0		; Multiplication/Division Register 0
		mov	R5, MD1		; Multiplication/Division Register 1
		mov	R6, MD2		; Multiplication/Division Register 2
		mov	R7, MD3		; Multiplication/Division Register 3
		mov	DPTR, #0F940h
		movx	A, @DPTR
		mov	DPTR, #0FA4Bh
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	A, R4
		add	A, R2
		mov	R4, A
		mov	A, R5
		addc	A, R3
		mov	R5, A
		mov	A, R6
		addc	A, #0
		mov	R6, A
		mov	A, R7
		addc	A, #0
		mov	R7, A
		mov	DPTR, #0FA25h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0F942h
		movx	A, @DPTR
		jnb	ACC.0, code_115F ; Accumulator
		mov	DPTR, #5FFAh	; Константа (Д.П.В.) 5FFA |
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5FFBh
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		sjmp	code_116B
; ---------------------------------------------------------------------------

code_115F:				; CODE XREF: IE0_0+86Ej
		mov	DPTR, #5FC2h	; Константа (Д.П.В.) 5FC2 |
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5FC3h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A

code_116B:				; CODE XREF: IE0_0+87Dj
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	A, R0
		add	A, R4
		mov	R0, A
		mov	A, R1
		addc	A, R5
		mov	R1, A
		mov	B.7, C		; B-Register
		mov	DPTR, #0F940h
		movx	A, @DPTR
		mov	DPTR, #0FA4Bh
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	C, B.7		; B-Register
		mov	A, R2
		addc	A, R6
		mov	R2, A
		mov	A, R3
		addc	A, R7
		mov	R3, A
		mov	DPTR, #0F940h
		movx	A, @DPTR
		mov	DPTR, #0FA57h
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A
		mov	DPTR, #0F941h
		movx	A, @DPTR
		jb	ACC.0, code_11BB ; Accumulator
		ljmp	code_1467
; ---------------------------------------------------------------------------

code_11BB:				; CODE XREF: IE0_0+8D5j
		mov	A, #2
		mov	DPTR, #0FA57h
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #0FA25h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #0FA3Dh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	A, R1
		jnb	ACC.7, code_121A ; Accumulator
		lcall	code_AD70
		mov	DPTR, #5FC6h	; Константа (Д.П.В.) 5FC6 |
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5FC7h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
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
		mov	B, MD3		; Multiplication/Division Register 3
		add	A, #80h	; 'А'
		mov	A, R0
		addc	A, #0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		lcall	DIV_R0R1_2
		lcall	code_AD70
		ljmp	code_1248
; ---------------------------------------------------------------------------

code_121A:				; CODE XREF: IE0_0+900j
		mov	DPTR, #5FC6h	; Константа (Д.П.В.) 5FC6 |
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5FC7h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
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
		mov	B, MD3		; Multiplication/Division Register 3
		add	A, #80h	; 'А'
		mov	A, R0
		addc	A, #0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		lcall	DIV_R0R1_2

code_1248:				; CODE XREF: IE0_0+937j
		mov	DPTR, #0FA3Fh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FA43h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	A, R1
		jnb	ACC.7, code_128F ; Accumulator
		lcall	code_AD70
		mov	RAM_A, R0
		mov	RAM_B, R1
		mov	DPTR, #5FC6h	; Константа (Д.П.В.) 5FC6 |
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #5FC7h
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		lcall	code_AD70
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	B, MD0		; Multiplication/Division Register 0
		mov	A, MD1		; Multiplication/Division Register 1
		mov	R0, MD2		; Multiplication/Division Register 2
		mov	R1, MD3		; Multiplication/Division Register 3
		lcall	code_AD70
		ljmp	code_12B7
; ---------------------------------------------------------------------------

code_128F:				; CODE XREF: IE0_0+97Bj
		mov	RAM_A, R0
		mov	RAM_B, R1
		mov	DPTR, #5FC6h	; Константа (Д.П.В.) 5FC6 |
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #5FC7h
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		lcall	code_AD70
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	B, MD0		; Multiplication/Division Register 0
		mov	A, MD1		; Multiplication/Division Register 1
		mov	R0, MD2		; Multiplication/Division Register 2
		mov	R1, MD3		; Multiplication/Division Register 3

code_12B7:				; CODE XREF: IE0_0+9ACj
		mov	DPTR, #0FA3Fh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0FA43h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	A, R1
		jnb	ACC.7, code_12D3 ; Accumulator
		lcall	code_AD70

code_12D3:				; CODE XREF: IE0_0+9EDj
		mov	DPTR, #0FA47h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FA45h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	A, R1
		jnb	ACC.7, code_131A ; Accumulator
		lcall	code_AD70
		mov	RAM_A, R0
		mov	RAM_B, R1
		mov	DPTR, #5FC6h	; Константа (Д.П.В.) 5FC6 |
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #5FC7h
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		lcall	code_AD70
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	B, MD0		; Multiplication/Division Register 0
		mov	A, MD1		; Multiplication/Division Register 1
		mov	R0, MD2		; Multiplication/Division Register 2
		mov	R1, MD3		; Multiplication/Division Register 3
		lcall	code_AD70
		ljmp	code_1342
; ---------------------------------------------------------------------------

code_131A:				; CODE XREF: IE0_0+A06j
		mov	RAM_A, R0
		mov	RAM_B, R1
		mov	DPTR, #5FC6h	; Константа (Д.П.В.) 5FC6 |
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #5FC7h
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		lcall	code_AD70
		mov	MD0, R2		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, R3		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	B, MD0		; Multiplication/Division Register 0
		mov	A, MD1		; Multiplication/Division Register 1
		mov	R0, MD2		; Multiplication/Division Register 2
		mov	R1, MD3		; Multiplication/Division Register 3

code_1342:				; CODE XREF: IE0_0+A37j
		mov	DPTR, #0FA3Fh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0FA45h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	A, R1
		jnb	ACC.7, code_135E ; Accumulator
		lcall	code_AD70

code_135E:				; CODE XREF: IE0_0+A78j
		mov	DPTR, #0FA49h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FA47h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jc	code_1380
		mov	DPTR, #0FA49h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		sjmp	code_1389
; ---------------------------------------------------------------------------

code_1380:				; CODE XREF: IE0_0+A93j
		mov	DPTR, #0FA47h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A

code_1389:				; CODE XREF: IE0_0+A9Ej
		mov	DPTR, #0FA41h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F942h
		movx	A, @DPTR
		mov	B, A		; B-Register
		jb	ACC.0, code_13B5 ; Accumulator
		mov	DPTR, #5FCEh	; Константа (Д.П.В.) 5FCE |
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5FCFh
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		mov	A, B		; B-Register
		mov	ACC.0, C	; Accumulator
		mov	DPTR, #0F942h
		movx	@DPTR, A
		ljmp	code_1500
; ---------------------------------------------------------------------------

code_13B5:				; CODE XREF: IE0_0+AB8j
		mov	DPTR, #5FCCh	; Константа (Д.П.В.) 5FCC |
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5FCDh
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_13C9
		ljmp	code_1500
; ---------------------------------------------------------------------------

code_13C9:				; CODE XREF: IE0_0+AE4j
		mov	A, B		; B-Register
		anl	A, #0F0h
		mov	DPTR, #0F942h
		movx	@DPTR, A
		mov	DPTR, #5FD0h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA63h
		movx	@DPTR, A
		mov	DPTR, #0FA65h
		movx	@DPTR, A
		mov	DPTR, #0FA67h
		movx	@DPTR, A
		mov	DPTR, #5FD1h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA64h
		movx	@DPTR, A
		mov	DPTR, #0FA66h
		movx	@DPTR, A
		mov	DPTR, #0FA68h
		movx	@DPTR, A
		mov	DPTR, #5FC8h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA41h
		movx	@DPTR, A
		mov	DPTR, #0FA43h
		movx	@DPTR, A
		mov	DPTR, #5FC9h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA42h
		movx	@DPTR, A
		mov	DPTR, #0FA44h
		movx	@DPTR, A
		mov	DPTR, #5FCAh
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA45h
		movx	@DPTR, A
		mov	DPTR, #5FCBh
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA46h
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0FA2Bh
		movx	@DPTR, A
		mov	DPTR, #0FA2Ch
		movx	@DPTR, A
		mov	DPTR, #0FA2Dh
		movx	@DPTR, A
		mov	A, #80h	; 'А'
		mov	DPTR, #0FA2Eh
		movx	@DPTR, A
		mov	B, #0Ch		; B-Register
		mov	DPTR, #0FA4Bh
		clr	A

code_1439:				; CODE XREF: IE0_0+B5Bj
		movx	@DPTR, A
		inc	DPTR
		djnz	B, code_1439	; B-Register
		mov	B, #6		; B-Register
		mov	DPTR, #0FA57h
		clr	A

code_1445:				; CODE XREF: IE0_0+B68j
		movx	@DPTR, A
		inc	DPTR
		inc	DPTR
		djnz	B, code_1445	; B-Register
		mov	B, #6		; B-Register
		mov	DPTR, #0FA58h
		mov	A, #80h	; 'А'

code_1453:				; CODE XREF: IE0_0+B76j
		movx	@DPTR, A
		inc	DPTR
		inc	DPTR
		djnz	B, code_1453	; B-Register
		clr	A
		mov	DPTR, #0FA25h
		movx	@DPTR, A
		mov	A, #80h	; 'А'
		mov	DPTR, #0FA26h
		movx	@DPTR, A
		ljmp	code_1500
; ---------------------------------------------------------------------------

code_1467:				; CODE XREF: IE0_0+8D8j
		jb	ACC.1, code_146D ; Accumulator
		ljmp	code_149B
; ---------------------------------------------------------------------------

code_146D:				; CODE XREF: IE0_0:code_1467j
		mov	DPTR, #0FA63h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	A, R0
		clr	C
		subb	A, #1
		mov	R0, A
		mov	A, R1
		subb	A, #0
		jnc	code_148E
		mov	DPTR, #0F942h
		movx	A, @DPTR
		mov	C, ACC.0	; Accumulator
		mov	ACC.1, C	; Accumulator
		mov	DPTR, #0F942h
		movx	@DPTR, A
		clr	A
		mov	R0, A

code_148E:				; CODE XREF: IE0_0+B9Ej
		mov	R1, A
		mov	DPTR, #0FA63h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		ljmp	code_1500
; ---------------------------------------------------------------------------

code_149B:				; CODE XREF: IE0_0+B8Aj
		jb	ACC.2, code_14A1 ; Accumulator
		ljmp	code_14CF
; ---------------------------------------------------------------------------

code_14A1:				; CODE XREF: IE0_0:code_149Bj
		mov	DPTR, #0FA65h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	A, R0
		clr	C
		subb	A, #1
		mov	R0, A
		mov	A, R1
		subb	A, #0
		jnc	code_14C2
		mov	DPTR, #0F942h
		movx	A, @DPTR
		mov	C, ACC.0	; Accumulator
		mov	ACC.2, C	; Accumulator
		mov	DPTR, #0F942h
		movx	@DPTR, A
		clr	A
		mov	R0, A

code_14C2:				; CODE XREF: IE0_0+BD2j
		mov	R1, A
		mov	DPTR, #0FA65h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		ljmp	code_1500
; ---------------------------------------------------------------------------

code_14CF:				; CODE XREF: IE0_0+BBEj
		jb	ACC.3, code_14D5 ; Accumulator
		ljmp	code_1500
; ---------------------------------------------------------------------------

code_14D5:				; CODE XREF: IE0_0:code_14CFj
		mov	DPTR, #0FA67h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte

code_14DC:				; CODE XREF: RESET_0-C43Aj
		movx	A, @DPTR
		mov	R1, A
		mov	A, R0
		clr	C
		subb	A, #1
		mov	R0, A
		mov	A, R1
		subb	A, #0
		jnc	code_14F6
		mov	DPTR, #0F942h
		movx	A, @DPTR
		mov	C, ACC.0	; Accumulator
		mov	ACC.3, C	; Accumulator
		mov	DPTR, #0F942h
		movx	@DPTR, A
		clr	A
		mov	R0, A

code_14F6:				; CODE XREF: IE0_0+C06j
		mov	R1, A
		mov	DPTR, #0FA67h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A

code_1500:				; CODE XREF: IE0_0+64Dj IE0_0+652j ...
		sjmp	code_1507
; ---------------------------------------------------------------------------

code_1502:				; CODE XREF: IE0_0+1AEj IE0_0+5EDj ...
		clr	A
		mov	DPTR, #0FA73h
		movx	@DPTR, A

code_1507:				; CODE XREF: IE0_0+60Fj IE0_0+617j ...
		mov	DPTR, #0FA0Bh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FA1Fh
		movx	A, @DPTR
		orl	A, B		; B-Register
		xch	A, B		; B-Register
		mov	DPTR, #0FA81h
		movx	A, @DPTR
		anl	A, B		; B-Register
		mov	DPTR, #0F8CFh
		movx	@DPTR, A
		jz	code_159E
		mov	A, RAM_43
		rl	A
		mov	DPTR, #JMP_TABLE
		jmp	@A+DPTR
JMP_TABLE:
; ---------------------------------------------------------------------------
		sjmp	code_1530
; ---------------------------------------------------------------------------
		sjmp	code_154C
; ---------------------------------------------------------------------------
		sjmp	code_1568
; ---------------------------------------------------------------------------
		sjmp	code_1584
; ---------------------------------------------------------------------------

code_1530:				; CODE XREF: IE0_0+C48j
		mov	DPTR, #0F8CFh
		movx	A, @DPTR
		jnb	ACC.0, code_159E ; Accumulator
		mov	DPTR, #0F8CEh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8CCh
		movx	A, @DPTR
		clr	C
		add	A, B		; B-Register
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		addc	A, #0
		movx	@DPTR, A
		sjmp	code_159E
; ---------------------------------------------------------------------------

code_154C:				; CODE XREF: IE0_0+C4Aj
		mov	DPTR, #0F8CFh
		movx	A, @DPTR
		jnb	ACC.1, code_159E ; Accumulator
		mov	DPTR, #0F8CEh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8CAh
		movx	A, @DPTR
		clr	C
		add	A, B		; B-Register
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		addc	A, #0
		movx	@DPTR, A
		sjmp	code_159E
; ---------------------------------------------------------------------------

code_1568:				; CODE XREF: IE0_0+C4Cj
		mov	DPTR, #0F8CFh
		movx	A, @DPTR
		jnb	ACC.2, code_159E ; Accumulator
		mov	DPTR, #0F8CEh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8C8h
		movx	A, @DPTR
		clr	C
		add	A, B		; B-Register
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		addc	A, #0
		movx	@DPTR, A
		sjmp	code_159E
; ---------------------------------------------------------------------------

code_1584:				; CODE XREF: IE0_0+C4Ej
		mov	DPTR, #0F8CFh
		movx	A, @DPTR
		jnb	ACC.3, code_159E ; Accumulator
		mov	DPTR, #0F8CEh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8C6h
		movx	A, @DPTR
		clr	C
		add	A, B		; B-Register
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		addc	A, #0
		movx	@DPTR, A

code_159E:				; CODE XREF: IE0_0+C3Fj IE0_0+C54j ...
		mov	A, RAM_43
		jb	ACC.0, code_15B6 ; Accumulator
		mov	DPTR, #0F93Dh
		movx	A, @DPTR
		jb	ACC.7, code_15B6 ; Accumulator
		mov	DPTR, #0FA78h
		movx	A, @DPTR
		inc	A
		jnz	code_15B3
		sjmp	code_15B9
; ---------------------------------------------------------------------------

code_15B3:				; CODE XREF: IE0_0+CCFj
		ljmp	code_164D
; ---------------------------------------------------------------------------

code_15B6:				; CODE XREF: IE0_0+CC0j IE0_0+CC7j
		ljmp	code_1651
; ---------------------------------------------------------------------------

code_15B9:				; CODE XREF: IE0_0+CD1j
		mov	DPTR, #0F8CCh
		movx	A, @DPTR
		mov	B, A		; B-Register
		inc	DPTR
		movx	A, @DPTR
		xch	A, B		; B-Register
		mov	DPTR, #0FA79h
		movx	@DPTR, A
		inc	DPTR
		xch	A, B		; B-Register
		movx	@DPTR, A
		mov	R0, B		; B-Register
		mov	R1, A
		mov	DPTR, #0F8CAh
		movx	A, @DPTR
		mov	B, A		; B-Register
		inc	DPTR
		movx	A, @DPTR
		xch	A, B		; B-Register
		mov	DPTR, #0FA7Bh
		movx	@DPTR, A
		inc	DPTR
		xch	A, B		; B-Register
		movx	@DPTR, A
		xch	A, B		; B-Register
		clr	C
		add	A, R0
		mov	R0, A
		xch	A, B		; B-Register
		addc	A, R1
		mov	R1, A
		mov	DPTR, #0F8C8h
		movx	A, @DPTR
		mov	B, A		; B-Register
		inc	DPTR
		movx	A, @DPTR
		xch	A, B		; B-Register
		mov	DPTR, #0FA7Dh
		movx	@DPTR, A
		inc	DPTR
		xch	A, B		; B-Register
		movx	@DPTR, A
		xch	A, B		; B-Register
		add	A, R0
		mov	R0, A
		xch	A, B		; B-Register
		addc	A, R1
		mov	R1, A
		mov	DPTR, #0F8C6h
		movx	A, @DPTR
		mov	B, A		; B-Register
		inc	DPTR
		movx	A, @DPTR
		xch	A, B		; B-Register
		mov	DPTR, #0FA7Fh
		movx	@DPTR, A
		inc	DPTR
		xch	A, B		; B-Register
		movx	@DPTR, A
		xch	A, B		; B-Register
		add	A, R0
		mov	R0, A
		xch	A, B		; B-Register
		addc	A, R1
		mov	R1, A
		jnc	code_1623
		mov	R0, #0FFh
		mov	R1, #0FFh

code_1623:				; CODE XREF: IE0_0+D3Dj
		mov	A, R0
		mov	DPTR, #0FA83h
		movx	@DPTR, A
		mov	A, R1
		inc	DPTR
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F8CCh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #0F8CAh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #0F8C8h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #0F8C6h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		mov	A, #37h	; '7'

code_164D:				; CODE XREF: IE0_0:code_15B3j
		mov	DPTR, #0FA78h
		movx	@DPTR, A

code_1651:				; CODE XREF: IE0_0+18j
					; IE0_0:code_15B6j
		jbc	RAM_28.0, code_1657
		ljmp	code_2471
; ---------------------------------------------------------------------------

code_1657:				; CODE XREF: IE0_0:code_1651j
		jnb	Options.0, code_1737  

;Работать по ДАД или дросселю
		mov	C, RAM_23.5
		orl	C, RAM_24.5
		jc	code_1666
		lcall	code_E8CF

code_1666:				; CODE XREF: IE0_0+D81j
		mov	DPTR, #5F02h
		clr		A
		movc	A, @A+DPTR
		
		jnb		ACC.1, dad_gbc
		jnb		ACC.2, table_gbc
		lcall	CALC_DAD_VALUE

table_gbc:
		lcall	CALC_TABLE_GBC
		jmp	code_1BD6

dad_gbc:
		lcall	CALC_DAD_VALUE
		lcall	CALC_DAD_GBC
		jmp	code_1BD6
; ---------------------------------------------------------------------------

code_1737:				; CODE XREF: IE0_0+D7Aj
		mov	A, RAM_33
		jnz	code_173E
		ljmp	code_17BA
; ---------------------------------------------------------------------------

code_173E:				; CODE XREF: IE0_0+E59j
		rr	A
		anl	A, #7Fh
		mov	B, A		; B-Register
		mov	A, RAM_34
		add	A, B		; B-Register
		mov	RAM_34,	A
		mov	A, RAM_35
		addc	A, #0
		mov	RAM_35,	A
		jnc	code_1757
		mov	RAM_34,	#0FFh
		mov	RAM_35,	#0FFh

code_1757:				; CODE XREF: IE0_0+E6Fj
		mov	MD0, RAM_34	; Multiplication/Division Register 0
		mov	MD1, RAM_35	; Multiplication/Division Register 1
		mov	MD4, RAM_33	; Multiplication/Division Register 4
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		jb	RAM_29.4, code_179F
		clr	C
		mov	A, R0
		subb	A, #0E8h ; 'ш'
		mov	R0, A
		mov	A, R1
		subb	A, #3
		jnc	code_177E
		clr	A
		mov	R0, A

code_177E:				; CODE XREF: IE0_0+E9Aj
		mov	R1, A
		mov	A, R1
		jnz	code_17AF
		jb	RAM_2A.3, code_17AF
		mov	DPTR, #6062h	; Минимальный расход воздуха для диагностики ДМРВ | кг/час
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R0
		clr	C
		mov	RAM_23.6, C
		subb	A, B		; B-Register
		jnc	code_17AF
		mov	DPTR, #0F80Ch
		movx	A, @DPTR
		clr	C
		subb	A, #7
		mov	RAM_23.6, C
		clr	RAM_24.6

code_179F:				; CODE XREF: IE0_0+E8Fj
		mov	R0, #0
		mov	R1, #0
		mov	DPTR, #0F808h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		ljmp	code_17BA
; ---------------------------------------------------------------------------

code_17AF:				; CODE XREF: IE0_0+EA0j IE0_0+EA2j ...
		clr	RAM_23.6
		mov	DPTR, #0F808h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A

code_17BA:				; CODE XREF: IE0_0+E5Bj IE0_0+ECCj
		jnb	RAM_28.5, code_17D2

code_17BD:				; CODE XREF: IE0_0+EF6j
		mov	DPTR, #5F71h	; К.Д.К. GBC на	оборотах выше 5010 |
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F949h
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F989h
		movx	@DPTR, A
		mov	DPTR, #0FAACh
		movx	@DPTR, A
		ljmp	code_1847
; ---------------------------------------------------------------------------

code_17D2:				; CODE XREF: IE0_0:code_17BAj
		mov	C, RAM_23.5
		orl	C, RAM_24.5
		jc	code_17BD
		lcall	code_E8CF
		jb	RAM_25.6, code_1809
		jnb	RAM_2D.5, code_1809
		mov	DPTR, #0FA94h
		movx	A, @DPTR
		jnb	ACC.0, code_1809 ; Accumulator
		mov	DPTR, #0FAACh
		movx	A, @DPTR
		inc	A
		cjne	A, #7, code_17F0

code_17F0:
		jc	code_17F4
		mov	A, #7

code_17F4:				; CODE XREF: IE0_0:code_17F0j
		mov	B, A		; B-Register
		movx	@DPTR, A
		mov	DPTR, #7856h	; Коэффициент Д.К.GBC при переходе от ХХ к нагрузке. | Коэффициент коррекции - Hомер цикла
		mov	A, B		; B-Register
		movc	A, @A+DPTR
		mov	DPTR, #0F949h
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F989h
		movx	@DPTR, A
		ljmp	code_1847
; ---------------------------------------------------------------------------

code_1809:				; CODE XREF: IE0_0+EFBj IE0_0+EFEj ...
		clr	A
		mov	DPTR, #0FAACh
		movx	@DPTR, A
		mov	DPTR, #0F98Ch
		movx	A, @DPTR
		clr	C
		subb	A, R2
		lcall	ABS_ACC
		cjne	A, #2, code_181A

code_181A:
		jc	code_1827
		mov	DPTR, #5F71h	; К.Д.К. GBC на	оборотах выше 5010 |
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F949h
		movx	@DPTR, A
		sjmp	code_1847
; ---------------------------------------------------------------------------

code_1827:				; CODE XREF: IE0_0:code_181Aj
		mov	DPTR, #5F72h	; Число	циклов динамической коррекции |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F989h
		movx	A, @DPTR
		inc	A
		cjne	A, B, code_1836	; B-Register

code_1836:
		jc	code_1843
		mov	DPTR, #6074h	; Коэффициент динамической коррекции GBC |
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F949h
		movx	@DPTR, A
		sjmp	code_1847
; ---------------------------------------------------------------------------

code_1843:				; CODE XREF: IE0_0:code_1836j
		mov	DPTR, #0F989h
		movx	@DPTR, A

code_1847:				; CODE XREF: IE0_0+EEFj IE0_0+F26j ...
		mov	DPTR, #0F808h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #6063h	; Максимальный расход воздуха для диагностики ДМРВ | кг/час
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		jz	code_1862
		clr	C
		subb	A, B		; B-Register
		cpl	C
		mov	RAM_24.6, C
		sjmp	code_1864
; ---------------------------------------------------------------------------

code_1862:				; CODE XREF: IE0_0+F78j
		clr	RAM_24.6

code_1864:				; CODE XREF: IE0_0+F80j
		mov	C, RAM_23.6
		orl	C, RAM_24.6
		jnc	code_18C5
		mov	C, RAM_23.5
		orl	C, RAM_24.5
		jc	code_18A5
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		mov	R3, A
		mov	DPTR, #726Dh	; Цикловое наполнение при аварии ДМРВ |	Цикловое наполнение, мг/цикл - Обороты коленвала, об/мин - Положение дросселя,%
		mov	R2, RPM_RT
		lcall	GET_3D_VALUE
		mov	B, A		; B-Register
		mov	DPTR, #63ACh	; Коррекция предельного	GBC | Коэффициент коррекции - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		jnb	RAM_2B.1, code_189F
		mov	DPTR, #8F98h	; Коррекция аварийного ЦH на ХХ	| Коэффициент коррекции	- Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		lcall	DIV_R0R1_4
		ljmp	code_19BF
; ---------------------------------------------------------------------------

code_189F:				; CODE XREF: IE0_0+FABj
		lcall	DIV_R0R1_8
		ljmp	code_19BF
; ---------------------------------------------------------------------------

code_18A5:				; CODE XREF: IE0_0+F8Ej
		mov	DPTR, #60DFh	; GB при одновременном отказе ДМРВ и ДПДЗ | кг/час
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #63ACh	; Коррекция предельного	GBC | Коэффициент коррекции - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		lcall	DIV_R0R1_8
		lcall	DIV_R0R1_8
		mov	DPTR, #0F808h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A

code_18C5:				; CODE XREF: IE0_0+F88j
		mov	A, R1
		anl	A, #0FEh
		jz	code_18CE
		mov	A, #0FFh
		sjmp	code_18D2
; ---------------------------------------------------------------------------

code_18CE:				; CODE XREF: IE0_0+FE8j
		mov	A, R1
		rrc	A
		mov	A, R0
		rrc	A

code_18D2:				; CODE XREF: IE0_0+FECj
		mov	DPTR, #0FF48h
		movx	@DPTR, A
		mov	DPTR, #0F808h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	A, RAM_38
		mov	B, RAM_39	; B-Register
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	MD0, A		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, B		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD2, R2		; Multiplication/Division Register 2
		mov	MD3, R3		; Multiplication/Division Register 3
		mov	MD4, #0E8h ; 'ш' ; Multiplication/Division Register 4
		mov	MD5, #3		; Multiplication/Division Register 5
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
		mov	DPTR, #0F945h
		movx	A, @DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		lcall	MUL_R0R1_2
		mov	DPTR, #6073h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		mov	DPTR, #6072h	; Максимальное GBC | мг./цикл
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		lcall	code_AD29
		mov	DPTR, #0F864h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		jb	RAM_29.3, code_1947
		ljmp	code_19A2
; ---------------------------------------------------------------------------

code_1947:				; CODE XREF: IE0_0+1061j
		mov	DPTR, #0FA9Bh
		movx	A, @DPTR
		jnb	ACC.0, code_1959 ; Accumulator
		mov	DPTR, #0F830h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		sjmp	code_19A2
; ---------------------------------------------------------------------------

code_1959:				; CODE XREF: IE0_0+106Bj
		mov	DPTR, #0F82Ch
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #60D3h	; Время	действия послепускового	К.Д.К. GBC | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9D4h
		movx	A, @DPTR
		cjne	A, B, code_1973	; B-Register

code_1973:
		jnc	code_197C
		mov	DPTR, #5F68h	; Коэффициент динамической коррекции GBC после пуска |
		clr	A
		movc	A, @A+DPTR
		sjmp	code_198A
; ---------------------------------------------------------------------------

code_197C:				; CODE XREF: IE0_0:code_1973j
		jb	RAM_2B.1, code_1985
		mov	DPTR, #0F949h
		movx	A, @DPTR
		sjmp	code_198A
; ---------------------------------------------------------------------------

code_1985:				; CODE XREF: IE0_0:code_197Cj
		mov	DPTR, #60E4h	; Коэффициент динамической коррекции GBC для ХХ	|
		clr	A
		movc	A, @A+DPTR

code_198A:				; CODE XREF: IE0_0+109Aj IE0_0+10A3j
		mov	B, A		; B-Register
		lcall	MUL_ABSR0R1_B
		mov	DPTR, #0F882h
		movx	A, @DPTR
		add	A, B		; B-Register
		mov	DPTR, #0F882h
		movx	@DPTR, A
		clr	A
		addc	A, R0
		mov	R0, A
		clr	A
		addc	A, R1
		mov	R1, A
		lcall	ADD_R0R1_R2R3

code_19A2:				; CODE XREF: IE0_0+1064j IE0_0+1077j
		mov	DPTR, #0F82Ch
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F830h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	A, R2
		anl	A, R3
		cjne	A, #0FFh, code_19BB
		sjmp	code_19BF
; ---------------------------------------------------------------------------

code_19BB:				; CODE XREF: IE0_0+10D6j
		mov	R0, RAM_A
		mov	R1, RAM_B

code_19BF:				; CODE XREF: IE0_0+FBCj IE0_0+FC2j ...
		mov	DPTR, #0F82Eh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #6064h	; Минимум для квантования GBC |	мг./цикл
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #6065h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		clr	A
		jc	code_19F2
		mov	DPTR, #6066h	; Шаг квантования GBC |	мг./цикл
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	DIV_R0R1_8
		lcall	MUL_R0R1_B
		mov	A, R1
		jnz	code_19F0
		mov	A, R0
		cjne	A, #0F0h, code_19EE ; 'Ё'

code_19EE:
		jc	code_19F2

code_19F0:				; CODE XREF: IE0_0+1108j
		mov	A, #0F0h ; 'Ё'

code_19F2:				; CODE XREF: IE0_0+10F8j
					; IE0_0:code_19EEj
		mov	R2, A
		mov	DPTR, #0F9BCh
		movx	A, @DPTR
		clr	C
		subb	A, R2
		lcall	ABS_ACC
		mov	DPTR, #0F9BDh
		movx	@DPTR, A
		mov	A, R2
		mov	DPTR, #0F9BCh
		movx	@DPTR, A
		anl	A, #0FEh
		mov	B, A		; B-Register
		rr	A
		mov	DPTR, #0F936h
		movx	@DPTR, A
		mov	A, B		; B-Register
		mov	DPTR, #6BC8h	; Динамическая коррекция GTC по	GBC | Коэффициент коррекции - Цикловое наполнение, мг/цикл
		movc	A, @A+DPTR
		mov	R0, A
		mov	A, B		; B-Register
		inc	A
		movc	A, @A+DPTR
		mov	R1, A
		mov	DPTR, #0F9A5h
		movx	A, @DPTR
		jz	code_1A3F
		mov	DPTR, #0F9BAh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F83Eh
		movx	@DPTR, A
		mov	DPTR, #0F83Dh
		movx	@DPTR, A
		mov	DPTR, #0F840h
		movx	@DPTR, A
		mov	DPTR, #0F83Fh
		movx	@DPTR, A
		clr	RAM_27.0
		ljmp	code_1BD6
; ---------------------------------------------------------------------------

code_1A3F:				; CODE XREF: IE0_0+113Ej
		mov	DPTR, #8F4Ah	; Коэффициент пленки по	температуре | Коэффициент коррекции - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	R4, A
		mov	DPTR, #8FE6h	; Коэффициент пленки по	температуре 2 |	Коэффициент коррекции -	Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	R5, A
		mov	DPTR, #0F9B8h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F89Dh
		movx	A, @DPTR
		inc	A
		jz	code_1A5E
		movx	@DPTR, A

code_1A5E:				; CODE XREF: IE0_0+117Bj
		mov	DPTR, #0F9BDh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #5FAAh	; Cтационарность по GBC	для запрета расчетов пленки |
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_1A6C	; B-Register

code_1A6C:
		jc	code_1A79
		mov	R0, #0
		mov	R1, #0
		mov	C, RAM_2C.0
		jnc	code_1A97
		ljmp	code_1B1A
; ---------------------------------------------------------------------------

code_1A79:				; CODE XREF: IE0_0:code_1A6Cj
		mov	DPTR, #0F9BAh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		mov	A, R0
		orl	A, R1
		jnz	code_1A90
		mov	C, RAM_2C.0
		jnc	code_1A97
		ljmp	code_1B1A
; ---------------------------------------------------------------------------

code_1A90:				; CODE XREF: IE0_0+11A7j
		mov	RAM_2C.0, C
		jnc	code_1A97
		ljmp	code_1B1A
; ---------------------------------------------------------------------------

code_1A97:				; CODE XREF: IE0_0+1194j IE0_0+11ABj ...
		mov	DPTR, #0F9A1h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F9B8h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0F9BAh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		jnb	RAM_27.0, code_1AB9
		mov	B, R5		; B-Register
		sjmp	code_1ABB
; ---------------------------------------------------------------------------

code_1AB9:				; CODE XREF: IE0_0+11D2j
		mov	B, R4		; B-Register

code_1ABB:				; CODE XREF: IE0_0+11D7j
		mov	A, #0FFh
		clr	C
		subb	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #0F83Fh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		jnb	RAM_27.0, code_1AEF
		lcall	code_AD70
		lcall	MUL_R0R1_B
		mov	DPTR, #0F9A1h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_1AE4
		clr	RAM_27.0

code_1AE4:				; CODE XREF: IE0_0+1200j
		lcall	code_AD70
		mov	A, R0
		orl	A, R1
		jnz	code_1AED
		clr	RAM_27.0

code_1AED:				; CODE XREF: IE0_0+1209j
		sjmp	code_1B04
; ---------------------------------------------------------------------------

code_1AEF:				; CODE XREF: IE0_0+11EBj
		lcall	MUL_R0R1_B
		mov	DPTR, #0F9A1h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	ADD_R0R1_R2R3
		jnc	code_1B04
		mov	R1, #0FFh
		mov	R0, #0FFh

code_1B04:				; CODE XREF: IE0_0:code_1AEDj
					; IE0_0+121Ej
		mov	DPTR, #0F83Fh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		jnb	RAM_27.0, code_1B15
		mov	B, R5		; B-Register
		ljmp	code_1B96
; ---------------------------------------------------------------------------

code_1B15:				; CODE XREF: IE0_0+122Dj
		mov	B, R4		; B-Register
		ljmp	code_1B96
; ---------------------------------------------------------------------------

code_1B1A:				; CODE XREF: IE0_0+1196j IE0_0+11ADj ...
		lcall	code_AD70
		mov	DPTR, #0F9A1h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F9B8h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0F9BAh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		jnb	RAM_27.0, code_1B3F
		mov	B, R5		; B-Register
		sjmp	code_1B41
; ---------------------------------------------------------------------------

code_1B3F:				; CODE XREF: IE0_0+1258j
		mov	B, R4		; B-Register

code_1B41:				; CODE XREF: IE0_0+125Dj
		mov	A, #0FFh
		clr	C
		subb	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #0F83Fh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		jnb	RAM_27.0, code_1B71
		lcall	code_AD70
		lcall	MUL_R0R1_B
		mov	DPTR, #0F9A1h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	ADD_R0R1_R2R3
		jnc	code_1B6C
		mov	R1, #0
		mov	R0, #0

code_1B6C:				; CODE XREF: IE0_0+1286j
		lcall	code_AD70
		sjmp	code_1B84
; ---------------------------------------------------------------------------

code_1B71:				; CODE XREF: IE0_0+1271j
		lcall	MUL_R0R1_B
		mov	DPTR, #0F9A1h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_1B84
		setb	RAM_27.0

code_1B84:				; CODE XREF: IE0_0+128Fj IE0_0+12A0j
		mov	DPTR, #0F83Fh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		jnb	RAM_27.0, code_1B94
		mov	B, R5		; B-Register
		sjmp	code_1B96
; ---------------------------------------------------------------------------

code_1B94:				; CODE XREF: IE0_0+12ADj
		mov	B, R4		; B-Register

code_1B96:				; CODE XREF: IE0_0+1232j IE0_0+1237j ...
		jnb	RAM_27.0, code_1BAA
		lcall	code_AD70
		lcall	MUL_R0R1_B
		mov	DPTR, #0F83Dh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		sjmp	code_1BB6
; ---------------------------------------------------------------------------

code_1BAA:				; CODE XREF: IE0_0:code_1B96j
		lcall	MUL_R0R1_B
		mov	DPTR, #0F83Dh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A

code_1BB6:				; CODE XREF: IE0_0+12C8j
		mov	DPTR, #0F83Fh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	A, R0
		orl	A, R1
		jz	code_1BCD
		mov	C, RAM_27.0
		mov	A, R1
		rrc	A
		mov	R1, A
		mov	C, ACC.0	; Accumulator
		mov	A, R0
		rrc	A
		mov	R0, A

code_1BCD:				; CODE XREF: IE0_0+12E1j
		mov	DPTR, #0F9A3h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A

code_1BD6:				; CODE XREF: IE0_0+E54j IE0_0+115Cj
		jb	RAM_28.5, code_1BDC
		jnb	RAM_2A.3, code_1BDF

code_1BDC:				; CODE XREF: IE0_0:code_1BD6j
		ljmp	code_1D75
; ---------------------------------------------------------------------------

code_1BDF:				; CODE XREF: IE0_0+12F9j
		mov	DPTR, #0F98Ch
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		movc	A, @A+DPTR
		mov	R3, A		
		mov	R2, RPM_RT
		
		; Базовое цикловое наполнение |	Цикловое наполнение, мг/цикл - Обороты коленвала, об/мин - Положение дросселя,%
		GET_3D_RAM_WITH_INTERPOLATION 75EFh, CAPTURE_GBC_MODE
				
		mov	R2, A
		
		;===========================   Поиск максимума для GBC и дельта дросселя для доп. топлива
		; mov		R0, #0C3h
		; xch		A, @R0
		; inc		R0
		; xch		A, @R0
		; inc		R0
		; xch		A, @R0
		; inc		R0
		; xch		A, @R0
		; mov		B, #0

; FIND_MAX_GBC_START:
		; mov		A, R2
		; clr		C
		; subb	A, @R0
		; jc		NEXT_STEP
		; cjne	A, B, code_124D
; code_124D:
		; jc		NEXT_STEP
		; mov		B, A
; NEXT_STEP:
		; dec		R0
		; cjne	R0, #0C3h, FIND_MAX_GBC_START
		
		;=============================================================================================
		
		mov	DPTR, #0F8B8h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F98Ch
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_1C05
		ljmp	code_1CB9
; ---------------------------------------------------------------------------

code_1C05:				; CODE XREF: IE0_0+1320j
		jb	RAM_28.5, code_1C41
		cpl	A
		add	A, #1
		mov	B, A		; B-Register
		mov	DPTR, #5F74h	; Зона нечувствительности по дросселю |	%
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_1C15	; B-Register

code_1C15:
		jnc	code_1C3C
		mov	B, R2		; B-Register
		mov	DPTR, #0F8ABh
		movx	A, @DPTR
		xch	A, B		; B-Register
		mov	DPTR, #0F8ABh
		movx	@DPTR, A
		xch	A, B		; B-Register
		clr	C
		subb	A, B		; B-Register
		jz	code_1C41
		jc	code_1C41
		mov	B, A		; B-Register
		mov	DPTR, #5F73h	; Экстраполирующий коэффициент пересчета GBC для обеднения |
		clr	A
		movc	A, @A+DPTR
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		lcall	DIV_R0R1_4
		sjmp	code_1C54
; ---------------------------------------------------------------------------

code_1C3C:				; CODE XREF: IE0_0:code_1C15j
		mov	A, R2
		mov	DPTR, #0F8ABh
		movx	@DPTR, A

code_1C41:				; CODE XREF: IE0_0:code_1C05j
					; IE0_0+1348j ...
		mov	DPTR, #0F98Dh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #5F75h	; Коэффициент уменьшения GTCDL 1 при обеднении |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B

code_1C54:				; CODE XREF: IE0_0+135Aj
		mov	DPTR, #0F98Fh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F98Dh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jc	code_1C76
		mov	DPTR, #0F98Fh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		sjmp	code_1C89
; ---------------------------------------------------------------------------

code_1C76:				; CODE XREF: IE0_0+1389j
		mov	DPTR, #0F98Dh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #5F76h	; Коэффициент уменьшения GTCDL 2 при обеднении |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B

code_1C89:				; CODE XREF: IE0_0+1394j
		mov	DPTR, #0F98Dh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F97Bh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0F99Fh
		movx	A, @DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0F97Bh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F97Dh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		ljmp	code_1D96
; ---------------------------------------------------------------------------

code_1CB9:				; CODE XREF: IE0_0+1322j
		jb	RAM_28.5, code_1CF5
		mov	B, A		; B-Register
		mov	DPTR, #6054h	; Зона нечувствительности по дросселю |	%
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_1CC6	; B-Register

code_1CC6:
		jnc	code_1CF0
		mov	B, R2		; B-Register
		mov	DPTR, #0F8ABh
		movx	A, @DPTR
		xch	A, B		; B-Register
		mov	DPTR, #0F8ABh
		movx	@DPTR, A
		clr	C
		subb	A, B		; B-Register
		jz	code_1CF5
		jc	code_1CF5
		mov	B, A		; B-Register
		mov	DPTR, #0F87Eh
		movx	@DPTR, A
		
		; Экстраполирующий коэффициент пересчета GBC для обогащения | Коэффициент коррекции - Температура, град.С
		GET_RAM_BY_INDEX 8393h, TWAT_RT, CAPTURE_EXTR_GBC_MODE
		
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		lcall	DIV_R0R1_2
		sjmp	code_1D10
; ---------------------------------------------------------------------------

code_1CF0:				; CODE XREF: IE0_0:code_1CC6j
		mov	A, R2
		mov	DPTR, #0F8ABh
		movx	@DPTR, A

code_1CF5:				; CODE XREF: IE0_0:code_1CB9j
					; IE0_0+13F7j ...
		mov	DPTR, #0F944h
		movx	A, @DPTR
		jb	ACC.0, code_1D4E ; Accumulator
		mov	DPTR, #0F97Bh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0F99Fh
		movx	A, @DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		sjmp	code_1D45
; ---------------------------------------------------------------------------

code_1D10:				; CODE XREF: IE0_0+140Ej
		mov	DPTR, #0F97Dh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F97Bh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jc	code_1D32
		mov	DPTR, #0F97Dh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		sjmp	code_1D45
; ---------------------------------------------------------------------------

code_1D32:				; CODE XREF: IE0_0+1445j
		mov	DPTR, #0F97Bh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #5F6Ch	; Коэффициент уменьшения GTCDR 2 при обогащении	|
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B

code_1D45:				; CODE XREF: IE0_0+142Ej IE0_0+1450j
		mov	DPTR, #0F97Bh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A

code_1D4E:				; CODE XREF: IE0_0+1419j
		mov	DPTR, #0F98Dh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #5F76h	; Коэффициент уменьшения GTCDL 2 при обеднении |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0F98Dh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F98Fh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		sjmp	code_1D96
; ---------------------------------------------------------------------------

code_1D96:				; CODE XREF: IE0_0+13D6j IE0_0+1493j
		jnb		Options.0, END_CALC_ADD_FIELD
		call	CALC_DAD_ADD_FIELD
		sjmp		END_CALC_ADD_FIELD

code_1D75:				; CODE XREF: IE0_0:code_1BDCj
		clr	A
		mov	DPTR, #0F97Bh
		movx	@DPTR, A
		inc		DPL
		movx	@DPTR, A
		inc		DPL
		movx	@DPTR, A
		inc		DPL
		movx	@DPTR, A
		mov	DPTR, #0F98Dh
		movx	@DPTR, A
		inc		DPL
		movx	@DPTR, A
		inc		DPL
		movx	@DPTR, A
		inc		DPL
		movx	@DPTR, A
		
		clr	A
		mov	DPTR, #0F981h
		movx	@DPTR, A
		inc		DPL
		movx	@DPTR, A

END_CALC_ADD_FIELD:				; CODE XREF: IE0_0+13D6j IE0_0+1493j
		mov	DPTR, #0F98Ch
		movx	A, @DPTR
		mov	DPTR, #0F8B8h
		movx	@DPTR, A
		mov	DPTR, #0F82Eh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #6064h	; Минимум для квантования GBC |	мг./цикл
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #6065h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		clr	A
		jc	code_1DD1
		mov	DPTR, #6066h	; Шаг квантования GBC |	мг./цикл
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	DIV_R0R1_8
		lcall	MUL_R0R1_B
		mov	A, R1
		jnz	code_1DCF
		mov	A, R0
		cjne	A, #0F0h, code_1DCD ; 'Ё'

code_1DCD:
		jc	code_1DD1

code_1DCF:				; CODE XREF: IE0_0+14E7j
		mov	A, #0F0h ; 'Ё'

code_1DD1:				; CODE XREF: IE0_0+14D7j
					; IE0_0:code_1DCDj
		mov	GBC_RT,	A
		add	A, #4
		swap	A
		rl	A
		anl	A, #1Fh
		mov	GBC_RT_32, A
		mov	A, GBC_RT
		add	A, #8
		anl	A, #0F0h
		mov	B, A		; B-Register
		mov	A, RPM_RT
		add	A, #8
		anl	A, #0F0h
		swap	A
		xch	A, B		; B-Register
		add	A, B		; B-Register
		mov	RPM_GBC_3D_RT, A
		mov	DPTR, #0F82Eh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		jb	RAM_2A.6, code_1DFF
		ljmp	code_2423
; ---------------------------------------------------------------------------

code_1DFF:				; CODE XREF: IE0_0+1519j
		jb	RAM_2A.5, code_1E05
		ljmp	code_1F56
; ---------------------------------------------------------------------------

code_1E05:				; CODE XREF: IE0_0:code_1DFFj
		mov	DPTR, #0F89Eh
		movx	A, @DPTR
		inc	A
		jz	code_1E0D
		movx	@DPTR, A

code_1E0D:				; CODE XREF: IE0_0+152Aj
		mov	DPTR, #0F887h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F888h
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #710Bh	; Малая	цикловая подача	| Цикловая подача топлива, мг/цикл - Температура, град.С
		lcall	GET_2D_INTERPOLATION
		mov	R0, #0
		mov	R1, A
		mov	DPTR, #8A99h	; Обороты полного выхода из режима пуска | Обороты, об/мин - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, #4		; B-Register
		div	AB
		mov	B, A		; B-Register
		mov	DPTR, #7132h	; Коррекция по RPM | Коэффициент коррекции - Обороты коленвала,	об/мин
		mov	A, B		; B-Register
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		add	A, #8
		anl	A, #0F0h
		swap	A
		mov	DPTR, #7A77h	; Коррекция по дросселю	| Коэффициент коррекции	- Положение дросселя, %
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #8C00h	; Коррекция по температуре ОЖ |	Коэффициент коррекции -	Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0FF40h
		movx	A, @DPTR
		mov	B, A		; B-Register
		jb	ACC.7, code_1E65 ; Accumulator
		lcall	MUL_R0R1_B
		lcall	MUL_R0R1_2

code_1E65:				; CODE XREF: IE0_0+157Cj
		mov	DPTR, #0F89Bh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F887h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F888h
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #710Bh	; Малая	цикловая подача	| Цикловая подача топлива, мг/цикл - Температура, град.С
		lcall	GET_2D_INTERPOLATION
		mov	R0, #0
		mov	R1, A
		mov	DPTR, #0F8AFh
		movx	A, @DPTR
		mov	DPTR, #7132h	; Коррекция по RPM | Коэффициент коррекции - Обороты коленвала,	об/мин
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		add	A, #8
		anl	A, #0F0h
		swap	A
		mov	DPTR, #7A77h	; Коррекция по дросселю	| Коэффициент коррекции	- Положение дросселя, %
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0F89Eh
		movx	A, @DPTR
		cjne	A, #3Fh, code_1EAD ; '?'

code_1EAD:
		jc	code_1EB1
		mov	A, #3Fh	; '?'

code_1EB1:				; CODE XREF: IE0_0:code_1EADj
		mov	DPTR, #8A59h	; Коррекция по времени прокрутки | Коэффициент коррекции - Hомер цикла
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0FF40h
		movx	A, @DPTR
		mov	B, A		; B-Register
		jb	ACC.7, code_1EC9 ; Accumulator
		lcall	MUL_R0R1_B
		lcall	MUL_R0R1_2

code_1EC9:				; CODE XREF: IE0_0+15E0j
		jnb	RAM_2A.1, code_1F3B
		mov	DPTR, #6059h	; Пусковой период | тактов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F829h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_1EE1
		clr	A
		mov	DPTR, #0F829h
		movx	@DPTR, A

code_1EE1:				; CODE XREF: IE0_0+15FAj
		mov	DPTR, #6058h	; Число	тактов с большей подачей | тактов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F829h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		dec	A
		clr	C
		subb	A, B		; B-Register
		jnc	code_1F3B
		mov	DPTR, #0F887h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F888h
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #7179h	; Большая цикловая подача | Цикловая подача топлива, мг/цикл - Температура, град.С
		lcall	GET_2D_INTERPOLATION
		mov	R0, #0
		mov	R1, A
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		add	A, #8
		anl	A, #0F0h
		swap	A
		mov	DPTR, #7A77h	; Коррекция по дросселю	| Коэффициент коррекции	- Положение дросселя, %
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0F89Eh
		movx	A, @DPTR
		cjne	A, #3Fh, code_1F22 ; '?'

code_1F22:
		jc	code_1F26
		mov	A, #3Fh	; '?'

code_1F26:				; CODE XREF: IE0_0:code_1F22j
		mov	DPTR, #8A59h	; Коррекция по времени прокрутки | Коэффициент коррекции - Hомер цикла
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0FF40h
		movx	A, @DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		lcall	MUL_R0R1_2

code_1F3B:				; CODE XREF: IE0_0:code_1EC9j
					; IE0_0+1612j
		mov	DPTR, #0F837h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FF53h
		movx	A, @DPTR
		mov	C, ACC.0	; Accumulator
		cpl	C
		anl	C, Options.7
		anl	C, Hardware.5
		jc	code_1F53
		setb	RAM_2A.0

code_1F53:				; CODE XREF: IE0_0+166Fj
		ljmp	code_20C5
; ---------------------------------------------------------------------------

code_1F56:				; CODE XREF: IE0_0+1522j
		mov	DPTR, #0F9A6h
		movx	A, @DPTR
		clr	C
		subb	A, RPM
		jc	code_1F7D
		
		;Блокировка топлива по давлению
		jnb		Options.0, no_dad_fuel_cutoff
		mov		DPTR, #5F8Ch
		clr		A
		movc	A, @A+DPTR
		clr		C
		subb	A, PRESS_HI
		jc	code_1F7D
		
no_dad_fuel_cutoff:
		mov	DPTR, #0F9B7h
		movx	A, @DPTR
		clr	C
		subb	A, RPM
		jc	code_1F96
		mov	RAM_69,	A
		cjne	A, #7, code_1F6D

code_1F6D:
		jnc	code_1F77
		mov	DPTR, #5F16h
		movc	A, @A+DPTR
		mov	LAUNCH_UOZ_OFFSET, A
		sjmp	code_1F7A
; ---------------------------------------------------------------------------

code_1F77:				; CODE XREF: IE0_0:code_1F6Dj
		mov	LAUNCH_UOZ_OFFSET, #0

code_1F7A:				; CODE XREF: IE0_0+1695j
		jnb	RAM_2B.3, code_1FA4

code_1F7D:				; CODE XREF: IE0_0+167Dj IE0_0+16C2j
		mov	R0, #0
		mov	R1, #0
		mov	DPTR, #0F987h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FF51h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		ljmp	code_217F
; ---------------------------------------------------------------------------

code_1F96:				; CODE XREF: IE0_0+1686j
		mov	RAM_69,	#0
		clr	A
		mov	DPTR, #5F16h
		movc	A, @A+DPTR
		mov	LAUNCH_UOZ_OFFSET, A
		setb	RAM_2B.3
		sjmp	code_1F7D
; ---------------------------------------------------------------------------

code_1FA4:				; CODE XREF: IE0_0:code_1F7Aj
		mov	A, ALF_2
		add	A, #80h	; 'А'
		mov	B, A		; B-Register
		clr	A
		addc	A, #0
		mov	MD0, #0		; Multiplication/Division Register 0
		mov	MD1, R0		; Multiplication/Division Register 1
		mov	MD2, R1		; Multiplication/Division Register 2
		mov	MD3, #0		; Multiplication/Division Register 3
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
		mov	DPTR, #0F97Fh
		movx	A, @DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		lcall	MUL_R0R1_2
		mov	DPTR, #0F837h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F89Bh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_1FFA
		mov	DPTR, #0F837h
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A

code_1FFA:				; CODE XREF: IE0_0+170Fj
		mov	DPTR, #0FAA3h
		jb	RAM_27.0, code_2003
		mov	DPTR, #0FAA4h

code_2003:				; CODE XREF: IE0_0+171Dj
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F836h
		movx	@DPTR, A
		mov	DPTR, #0F83Dh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		jnb	RAM_27.0, code_204A
		lcall	MUL_R0R1_B
		lcall	code_ADA2
		lcall	MUL_R0R1_2
		mov	RAM_B, RAM_9
		mov	RAM_A, RAM_8
		mov	DPTR, #0F83Bh
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F839h
		movx	@DPTR, A
		mov	DPTR, #0F83Ah
		movx	@DPTR, A
		mov	DPTR, #0F837h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		jnc	code_2048
		clr	A
		mov	R0, A
		mov	R1, A

code_2048:				; CODE XREF: IE0_0+1763j
		sjmp	code_2071
; ---------------------------------------------------------------------------

code_204A:				; CODE XREF: IE0_0+1733j
		lcall	MUL_R0R1_B
		lcall	code_ADA2
		lcall	MUL_R0R1_2
		mov	DPTR, #0F839h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F83Bh
		movx	@DPTR, A
		mov	DPTR, #0F83Ch
		movx	@DPTR, A
		mov	DPTR, #0F837h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	ADD_R0R1_R2R3

code_2071:				; CODE XREF: IE0_0:code_2048j
		mov	DPTR, #0F97Bh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0F981h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0F98Dh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_2090
		clr	A
		mov	R0, A
		mov	R1, A
		sjmp	code_20AF
; ---------------------------------------------------------------------------

code_2090:				; CODE XREF: IE0_0+17A9j
		jb	RAM_2B.3, code_20AF
		mov	DPTR, #0F8B1h
		movx	A, @DPTR
		jz	code_20AF
		dec	A
		movx	@DPTR, A
		mov	DPTR, #7CD7h	; Добавка топлива на первых 4 тактах | Добавка % - Цикловое наполнение,	мг/цикл
		mov	A, GBC_RT_32
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	RAM_A, RAM_8
		mov	RAM_B, RAM_9
		lcall	MUL_R0R1_B
		lcall	ADD_R0R1_R2R3

code_20AF:				; CODE XREF: IE0_0+17AEj
					; IE0_0:code_2090j ...
		mov	A, R0
		orl	A, R1
		jnz	code_20B0
		ljmp	code_216C
		
code_20B0:
		mov		C, Hardware.5
		jb		Options.7, code_20B1
		anl		C, RAM_2A.7
code_20B1:
		jc		code_20BD
		setb	RAM_2A.0
		sjmp	code_20C5

code_20BD:				; CODE XREF: IE0_0+17D3j
		mov	DPTR, #0FF53h
		movx	A, @DPTR
		mov	C, ACC.0	; Accumulator
		mov	RAM_2A.0, C

code_20C5:				; CODE XREF: IE0_0:code_1F53j
					; IE0_0+17D8j
		jnb	RAM_2A.0, code_20CB
		lcall	DIV_R0R1_2

code_20CB:				; CODE XREF: IE0_0:code_20C5j
		mov	RAM_A, RAM_8
		mov	RAM_B, RAM_9
		mov	B, RAM_6F	; B-Register
		cpl	B.7		; B-Register
		lcall	MUL_R0R1_B
		mov	A, RAM_6F
		jnb	ACC.7, code_20E7 ; Accumulator
		lcall	ADD_R0R1_R2R3
		jnc	code_20E7
		mov	R0, #0FFh
		mov	R1, #0FFh

code_20E7:				; CODE XREF: IE0_0+17FBj IE0_0+1801j
		mov	RAM_A, RAM_8
		mov	RAM_B, RAM_9
		mov	B, RAM_4F	; B-Register
		cpl	B.7		; B-Register
		lcall	MUL_R0R1_B
		mov	A, RAM_4F
		jnb	ACC.7, code_2103 ; Accumulator
		lcall	ADD_R0R1_R2R3
		jnc	code_2103
		mov	R0, #0FFh
		mov	R1, #0FFh

code_2103:				; CODE XREF: IE0_0+1817j IE0_0+181Dj
		CALC_INJ_STAT
		mov	DPTR, #0FF51h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	RAM_E, RAM_8
		mov	RAM_F, RAM_9
		mov	R2, RPM_RT
		mov	R3, GBC_RT
		mov	DPTR, #0A071h	; Расчетное разряжение в ресивере | Точка разряжения - Обороты коленвала, об/мин - Цикловое наполнение,мг/цикл
		lcall	GET_3D_VALUE
		mov	RAM_A, A
		mov	DPTR, #0FAB1h
		movx	@DPTR, A
		anl	A, #0F8h
		rr	A
		rr	A
		rr	A
		mov	DPTR, #0FAB2h
		movx	@DPTR, A
		mov	DPTR, #0A051h	; Коэффициент коррекции	времени	впрыска	| Коэффициент коррекции	- Точка	разряжения
		lcall	GET_2D_VALUE
		mov	DPTR, #0FAB3h
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	RAM_8, RAM_E
		mov	RAM_9, RAM_F
		lcall	MUL_R0R1_B
		mov	DPTR, #0F987h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	A, R0
		orl	A, R1
		jz	code_217F
		mov	R2, RAM_50
		mov	R3, #0
		lcall	ADD_R0R1_R2R3
		jnb	RAM_2A.0, code_216C
		mov	DPTR, #60D9h	; Добавка при работе в попарно-паралельном режиме | мсек.
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	R3, #0
		lcall	ADD_R0R1_R2R3

code_216C:				; CODE XREF: IE0_0:code_20BAj
					; IE0_0+187Ej
		setb	C
		mov	DPTR, #5FA8h	; Минимальное время впрыска | мсек.
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		subb	A, R0
		mov	A, #1
		movc	A, @A+DPTR
		mov	R3, A
		subb	A, R1
		jc	code_217F
		mov	A, R2
		mov	R0, A
		mov	A, R3
		mov	R1, A

code_217F:				; CODE XREF: IE0_0+16B3j IE0_0+1875j ...
		mov	DPTR, #0F841h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	B, #10h		; B-Register
		lcall	MUL_R0R1_B
		mov	MD0, B		; Multiplication/Division Register 0
		mov	MD1, R0		; Multiplication/Division Register 1
		mov	MD2, R1		; Multiplication/Division Register 2
		mov	MD3, #0		; Multiplication/Division Register 3
		mov	MD4, #0Ch	; Multiplication/Division Register 4
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
		mov	A, R0
		orl	A, R1
		jnz	code_21B7
		ljmp	code_224F
; ---------------------------------------------------------------------------

code_21B7:				; CODE XREF: IE0_0+18D2j
		mov	A, RAM_41
		mov	C, RAM_2A.0
		mov	ACC.2, C	; Accumulator
		mov	DPTR, #0A558h	; Последовательность работы форсунок
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		jnb	B.0, code_21E6	; B-Register
		mov	A, RAM_7C
		jb	ACC.2, code_21E6 ; Accumulator
		anl	CMEN, #0FEh	; Compare Enable Register (RMAP=0)
		clr	IEN0.7		; Interrupt Enable Register 0
		clr	P4.0		; Port 4 (PDIR=0)
		mov	CCL1, A		; Compare/Capture Register 1, Low Byte
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, CCL1		; Compare/Capture Register 1, Low Byte
		add	A, R0
		mov	R2, A
		mov	A, CCH1		; Compare/Capture Register 1, High Byte
		addc	A, R1
		mov	CMH0, A		; Compare Register 0, High Byte	(RMAP=0)
		mov	CML0, R2	; Compare Register 0, Low Byte (RMAP=0)
		orl	CMEN, #1	; Compare Enable Register (RMAP=0)
		setb	P4.0		; Port 4 (PDIR=0)

code_21E6:				; CODE XREF: IE0_0+18E3j IE0_0+18E8j
		jnb	B.1, code_2209	; B-Register
		mov	A, RAM_7C
		jb	ACC.1, code_2209 ; Accumulator
		anl	CMEN, #0FDh	; Compare Enable Register (RMAP=0)
		clr	IEN0.7		; Interrupt Enable Register 0
		clr	P4.1		; Port 4 (PDIR=0)
		mov	CCL1, A		; Compare/Capture Register 1, Low Byte
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, CCL1		; Compare/Capture Register 1, Low Byte
		add	A, R0
		mov	R2, A
		mov	A, CCH1		; Compare/Capture Register 1, High Byte
		addc	A, R1
		mov	CMH1, A		; Compare Register 1, High Byte	(RMAP=0)
		mov	CML1, R2	; Compare Register 1, Low Byte (RMAP=0)
		orl	CMEN, #2	; Compare Enable Register (RMAP=0)
		setb	P4.1		; Port 4 (PDIR=0)

code_2209:				; CODE XREF: IE0_0:code_21E6j
					; IE0_0+190Bj
		jnb	B.2, code_222C	; B-Register
		mov	A, RAM_7C
		jb	ACC.0, code_222C ; Accumulator
		anl	CMEN, #0FBh	; Compare Enable Register (RMAP=0)
		clr	IEN0.7		; Interrupt Enable Register 0
		clr	P4.2		; Port 4 (PDIR=0)
		mov	CCL1, A		; Compare/Capture Register 1, Low Byte
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, CCL1		; Compare/Capture Register 1, Low Byte
		add	A, R0
		mov	R2, A
		mov	A, CCH1		; Compare/Capture Register 1, High Byte
		addc	A, R1
		mov	CMH2, A		; Compare Register 2, High Byte	(RMAP=0)
		mov	CML2, R2	; Compare Register 2, Low Byte (RMAP=0)
		orl	CMEN, #4	; Compare Enable Register (RMAP=0)
		setb	P4.2		; Port 4 (PDIR=0)

code_222C:				; CODE XREF: IE0_0:code_2209j
					; IE0_0+192Ej
		jnb	B.3, code_224F	; B-Register
		mov	A, RAM_7C
		jb	ACC.3, code_224F ; Accumulator
		anl	CMEN, #0F7h	; Compare Enable Register (RMAP=0)
		clr	IEN0.7		; Interrupt Enable Register 0
		clr	P4.3		; Port 4 (PDIR=0)
		mov	CCL1, A		; Compare/Capture Register 1, Low Byte
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, CCL1		; Compare/Capture Register 1, Low Byte
		add	A, R0
		mov	R2, A
		mov	A, CCH1		; Compare/Capture Register 1, High Byte
		addc	A, R1
		mov	CMH3, A		; Compare Register 3, High Byte	(RMAP=0)
		mov	CML3, R2	; Compare Register 3, Low Byte (RMAP=0)
		orl	CMEN, #8	; Compare Enable Register (RMAP=0)
		setb	P4.3		; Port 4 (PDIR=0)

code_224F:				; CODE XREF: IE0_0+18D4j
					; IE0_0:code_222Cj ...
		mov	DPTR, #0FF51h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #60D4h	; Цикловая добавка времени впрыска для иммитатора | мсек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R0
		clr	C
		subb	A, B		; B-Register
		mov	R2, A
		mov	A, R1
		subb	A, #0
		mov	R3, A
		jnc	code_226E
		mov	R2, #0
		mov	R3, #0

code_226E:				; CODE XREF: IE0_0+1988j
		mov	DPTR, #0FF54h
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A
		mov	DPTR, #0F939h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0F939h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		jnb	RAM_2A.0, code_2295
		mov	R3, #6
		mov	R2, #50h ; 'P'
		sjmp	code_22A1
; ---------------------------------------------------------------------------

code_2295:				; CODE XREF: IE0_0+19ACj
		mov	DPTR, #60FEh	; Вес 1	импульса ДРТ в еденицах	времени	впрыска	| мсек.
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #60FFh
		clr	A
		movc	A, @A+DPTR
		mov	R3, A

code_22A1:				; CODE XREF: IE0_0+19B3j
		lcall	SUB_R0R1_R2R3
		jc	code_22D0
		mov	DPTR, #0F939h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		anl	CLRMSK,	#0FDh	; Compare Clear	Mask Register
		mov	CC4EN, #0Fh	; Compare/Capture 4 Enable Register
		clr	IEN0.7		; Interrupt Enable Register 0
		setb	P5.1		; Port 5 (PDIR=0)
		mov	CCL4, A		; Compare/Capture Register 4, Low Byte
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, CCL4		; Compare/Capture Register 4, Low Byte
		add	A, #94h	; 'Ф'
		mov	R2, A
		mov	A, CCH4		; Compare/Capture Register 4, High Byte
		addc	A, #0
		mov	COMCLRH, A	; Compare Clear	Register, High Byte
		mov	COMCLRL, R2	; Compare Clear	Register, Low Byte
		mov	CC4EN, #98h ; 'Ш' ; Compare/Capture 4 Enable Register
		orl	CLRMSK,	#2	; Compare Clear	Mask Register

code_22D0:				; CODE XREF: IE0_0+19C4j
		jb	RAM_2A.3, code_22EF
		mov	DPTR, #0F82Eh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0F8F5h
		movx	A, @DPTR
		add	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		addc	A, R1
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		addc	A, #0
		jc	code_22EF
		movx	@DPTR, A

code_22EF:				; CODE XREF: IE0_0:code_22D0j
					; IE0_0+1A0Cj
		jnb	Options.6, code_22FE
		jnb	RAM_28.5, code_2301
		clr	A
		mov	DPTR, #0F993h
		movx	@DPTR, A
		mov	DPTR, #0F994h
		movx	@DPTR, A

code_22FE:				; CODE XREF: IE0_0:code_22EFj
		ljmp	code_2423
; ---------------------------------------------------------------------------

code_2301:				; CODE XREF: IE0_0+1A12j
		mov	DPTR, #0F97Bh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		
		mov     DPTR, #0F981h
		movx    A, @DPTR
		mov     R2, A
		inc     DPL             ; Data Pointer, Low Byte
		movx    A, @DPTR
		mov     R3, A
		lcall   ADD_R0R1_R2R3

		mov	A, R0
		orl	A, R1
		jnz	code_2321
		clr	A
		mov	DPTR, #0F993h
		movx	@DPTR, A
		mov	DPTR, #0F994h
		movx	@DPTR, A
		mov	DPTR, #0F87Fh
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A
		ljmp	code_2423
; ---------------------------------------------------------------------------

code_2321:				; CODE XREF: IE0_0+1A2Cj
		mov	DPTR, #0F87Fh
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		jnb	RAM_2A.0, code_232E
		lcall	DIV_R0R1_2

code_232E:				; CODE XREF: IE0_0+1A48j
		mov	RAM_A, RAM_8
		mov	RAM_B, RAM_9
		mov	B, RAM_6F	; B-Register
		cpl	B.7		; B-Register
		lcall	MUL_R0R1_B
		mov	A, RAM_6F
		jnb	ACC.7, code_234A ; Accumulator
		lcall	ADD_R0R1_R2R3
		jnc	code_234A
		mov	R0, #0FFh
		mov	R1, #0FFh

code_234A:				; CODE XREF: IE0_0+1A5Ej IE0_0+1A64j
		CALC_INJ_STAT
		mov	R2, RAM_50
		mov	R3, #0
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0F993h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	B, #10h		; B-Register
		lcall	MUL_R0R1_B
		mov	MD0, B		; Multiplication/Division Register 0
		mov	MD1, R0		; Multiplication/Division Register 1
		mov	MD2, R1		; Multiplication/Division Register 2
		mov	MD3, #0		; Multiplication/Division Register 3
		mov	MD4, #0Ch	; Multiplication/Division Register 4
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

code_238C:				; CODE XREF: IE0_0+1A3Ej
		mov	A, R0
		orl	A, R1
		jnz	code_2393
		ljmp	code_2423
; ---------------------------------------------------------------------------

code_2393:				; CODE XREF: IE0_0+1AAEj
		mov	A, RAM_7C
		anl	A, #1
		jnz	code_23B7
		jnb	P4.2, code_23B7	; Port 4 (PDIR=0)
		anl	CMEN, #0FBh	; Compare Enable Register (RMAP=0)
		clr	IEN0.7		; Interrupt Enable Register 0
		clr	P4.2		; Port 4 (PDIR=0)
		mov	CCL1, A		; Compare/Capture Register 1, Low Byte
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, CCL1		; Compare/Capture Register 1, Low Byte
		add	A, R0
		mov	R2, A
		mov	A, CCH1		; Compare/Capture Register 1, High Byte
		addc	A, R1
		mov	CMH2, A		; Compare Register 2, High Byte	(RMAP=0)
		mov	CML2, R2	; Compare Register 2, Low Byte (RMAP=0)
		orl	CMEN, #4	; Compare Enable Register (RMAP=0)
		setb	P4.2		; Port 4 (PDIR=0)

code_23B7:				; CODE XREF: IE0_0+1AB7j IE0_0+1AB9j
		mov	A, RAM_7C
		anl	A, #2
		jnz	code_23DB
		jnb	P4.1, code_23DB	; Port 4 (PDIR=0)
		anl	CMEN, #0FDh	; Compare Enable Register (RMAP=0)
		clr	IEN0.7		; Interrupt Enable Register 0
		clr	P4.1		; Port 4 (PDIR=0)
		mov	CCL1, A		; Compare/Capture Register 1, Low Byte
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, CCL1		; Compare/Capture Register 1, Low Byte
		add	A, R0
		mov	R2, A
		mov	A, CCH1		; Compare/Capture Register 1, High Byte
		addc	A, R1
		mov	CMH1, A		; Compare Register 1, High Byte	(RMAP=0)
		mov	CML1, R2	; Compare Register 1, Low Byte (RMAP=0)
		orl	CMEN, #2	; Compare Enable Register (RMAP=0)
		setb	P4.1		; Port 4 (PDIR=0)

code_23DB:				; CODE XREF: IE0_0+1ADBj IE0_0+1ADDj
		mov	A, RAM_7C
		anl	A, #4
		jnz	code_23FF
		jnb	P4.0, code_23FF	; Port 4 (PDIR=0)
		anl	CMEN, #0FEh	; Compare Enable Register (RMAP=0)
		clr	IEN0.7		; Interrupt Enable Register 0
		clr	P4.0		; Port 4 (PDIR=0)
		mov	CCL1, A		; Compare/Capture Register 1, Low Byte
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, CCL1		; Compare/Capture Register 1, Low Byte
		add	A, R0
		mov	R2, A
		mov	A, CCH1		; Compare/Capture Register 1, High Byte
		addc	A, R1
		mov	CMH0, A		; Compare Register 0, High Byte	(RMAP=0)
		mov	CML0, R2	; Compare Register 0, Low Byte (RMAP=0)
		orl	CMEN, #1	; Compare Enable Register (RMAP=0)
		setb	P4.0		; Port 4 (PDIR=0)

code_23FF:				; CODE XREF: IE0_0+1AFFj IE0_0+1B01j
		mov	A, RAM_7C
		anl	A, #8
		jnz	code_2423
		jnb	P4.3, code_2423	; Port 4 (PDIR=0)
		anl	CMEN, #0F7h	; Compare Enable Register (RMAP=0)
		clr	IEN0.7		; Interrupt Enable Register 0
		clr	P4.3		; Port 4 (PDIR=0)
		mov	CCL1, A		; Compare/Capture Register 1, Low Byte
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, CCL1		; Compare/Capture Register 1, Low Byte
		add	A, R0
		mov	R2, A
		mov	A, CCH1		; Compare/Capture Register 1, High Byte
		addc	A, R1
		mov	CMH3, A		; Compare Register 3, High Byte	(RMAP=0)
		mov	CML3, R2	; Compare Register 3, Low Byte (RMAP=0)
		orl	CMEN, #8	; Compare Enable Register (RMAP=0)
		setb	P4.3		; Port 4 (PDIR=0)

code_2423:				; CODE XREF: IE0_0+151Cj
					; IE0_0:code_22FEj ...
		clr	A
		mov	DPTR, #0F944h
		movx	@DPTR, A
		mov	A, RAM_43
		jnz	code_246B
		mov	DPTR, #0F93Eh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	C, ACC.0	; Accumulator
		mov	DPTR, #0FA71h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	A, R0
		addc	A, #0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		jnc	code_244B
		mov	R0, #0FFh
		mov	R1, #0FFh

code_244B:				; CODE XREF: IE0_0+1B65j
		mov	DPTR, #0FA71h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #5FD8h
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5FD9h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		mov	A, B		; B-Register
		mov	ACC.1, C	; Accumulator
		mov	DPTR, #0F93Eh
		movx	@DPTR, A

code_246B:				; CODE XREF: IE0_0+1B4Aj
		mov	DPTR, #0F899h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A

code_2471:				; CODE XREF: IE0_0+D74j
		setb	RAM_28.4
		mov	DPSEL, #0	; Data Pointer Select Register
		pop	DPH		; Data Pointer,	High Byte
		pop	DPL		; Data Pointer,	Low Byte
		pop	DPSEL		; Data Pointer Select Register
		pop	B		; B-Register
		pop	ACC		; Accumulator
		pop	PSW		; Program Status Word
		reti
; End of function IE0_0

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR RESET_0

code_2483:				; CODE XREF: RESET_0-A7AFj
					; RESET_0-A741j ...
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	A, IP0		; Interrupt Priority Register 0
		jnb	ACC.6, code_2496 ; Accumulator
		mov	A, ALF_2
		xrl	A, #55h
		jnz	code_2493
		ljmp	code_2522
; ---------------------------------------------------------------------------

code_2493:				; CODE XREF: RESET_0-C554j
		ljmp	code_25D2
; ---------------------------------------------------------------------------

code_2496:				; CODE XREF: RESET_0-C55Bj
		mov	IP0, #0		; Interrupt Priority Register 0
		mov	WDTREL,	#80h ; 'А' ; Watchdog Timer Reload Register
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	SYSCON,	#0	; System Control Register
		mov	SP, #SP_VALUE	; Stack	Pointer
		mov	PSW, #0		; Program Status Word
		mov	P1, #0FFh	; Port 1 (PDIR=0)
		mov	P3, #0FFh	; Port 3 (PDIR=0)
		mov	P4, #0FFh	; Port 4 (PDIR=0)
		mov	P5, #0BFh ; '¬' ; Port 5 (PDIR=0)
		mov	P6, #0FFh	; Port 6 (PDIR=0)
		mov	P9, #0A8h ; 'и' ; Port 9 (PDIR=0)
		mov	DPTR, #0F8C2h
		movx	A, @DPTR
		xrl	A, #55h
		jnz	code_24CF
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		jb	ACC.5, code_24CF ; Accumulator
		setb	RAM_2D.3
		ljmp	code_25D2
; ---------------------------------------------------------------------------

code_24CF:				; CODE XREF: RESET_0-C521j
					; RESET_0-C51Bj
		lcall	code_CD3A
		lcall	code_CB58
		mov	DPTR, #0F9BEh
		movx	A, @DPTR
		xrl	A, #55h
		jz	code_24E3
		lcall	code_CC0C
		lcall	code_CAC7

code_24E3:				; CODE XREF: RESET_0-C507j
		setb	RAM_2D.0
		clr	A
		mov	DPTR, #0F4B7h
		movx	@DPTR, A
		jnb	RAM_2D.2, code_2506
		mov	DPTR, #0F9BEh
		movx	A, @DPTR
		mov	B, A		; B-Register
		xrl	A, #55h
		jz	code_2506
		mov	A, B		; B-Register
		xrl	A, #0AAh
		jnz	code_2501
		mov	A, R7
		jnb	ACC.3, code_2504 ; Accumulator

code_2501:				; CODE XREF: RESET_0-C4E7j
		lcall	code_BC1A

code_2504:				; CODE XREF: RESET_0-C4E4j
		setb	RAM_2D.0

code_2506:				; CODE XREF: RESET_0-C4F8j
					; RESET_0-C4EDj
		mov	DPTR, #5F00h
		clr	A
		movc	A, @A+DPTR
		jnb	ACC.2, code_2507
		mov	A, #5Fh	; '_'
		mov	DPTR, #0F9A7h
		movx	@DPTR, A
		mov	A, #6Fh	; 'O'
		mov	DPTR, #0F9A8h
		movx	@DPTR, A
		sjmp code_2508
		
code_2507:		
		mov	A, #5Fh	; '_'
		mov	DPTR, #0F9A7h
		movx	@DPTR, A
		mov	A, #4Fh	; 'O'
		mov	DPTR, #0F9A8h
		movx	@DPTR, A

code_2508:
		clr		A	; 'O'
		mov	DPTR, #0F999h
		movx	@DPTR, A
		
		lcall	code_EA42
		clr	A
		mov	RAM_22,	A
		mov	RAM_23,	A
		mov	RAM_24,	A
		mov	RAM_25,	A
		mov	DPTR, #0F9BEh
		movx	@DPTR, A

code_2522:				; CODE XREF: RESET_0-C552j
		clr	P5.1		; Port 5 (PDIR=0)
		clr	A
		mov	DPTR, #0F9C2h
		movx	@DPTR, A
		mov	DPTR, #0F8C2h
		movx	A, @DPTR
		xrl	A, #55h
		jz	code_2548
		mov	R0, #0ABh ; 'л'
		mov	A, @R0
		cjne	A, #0A5h, code_2539 ; 'е'
		sjmp	code_2548
; ---------------------------------------------------------------------------

code_2539:				; CODE XREF: RESET_0-C4AEj
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F4B9h
		movx	@DPTR, A
		lcall	code_B354

code_2548:				; CODE XREF: RESET_0-C4B3j
					; RESET_0-C4ABj
		lcall	code_C50D
		lcall	code_C50D
		clr	A
		mov	@R0, A
		mov	ALF_2, A
		mov	B, #3		; B-Register
		lcall	code_A5A0
		mov	R0, A
		clr	C
		subb	A, #0DAh ; '-'
		jc	code_25AB
		mov	A, R0
		clr	C
		subb	A, #0E7h ; 'ч'
		jnc	code_25AB
		mov	B, #0		; B-Register
		lcall	code_A5A0
		mov	R0, A
		clr	C
		subb	A, #0AAh ; 'к'
		jc	code_25AB
		mov	A, R0
		clr	C
		subb	A, #0B2h ; '-'
		jnc	code_25AB
		mov	B, #4		; B-Register
		lcall	code_A5A0
		mov	R0, A
		clr	C
		subb	A, #0F2h ; 'Є'
		jc	code_25AB
		mov	A, R0
		clr	C
		subb	A, #0FEh ; '¦'
		jnc	code_25AB
		mov	B, #1		; B-Register
		lcall	code_A5A0
		mov	R0, A
		clr	C
		subb	A, #12h
		jc	code_25AB
		mov	A, R0
		clr	C
		subb	A, #1Eh
		jnc	code_25AB
		mov	B, #2		; B-Register
		lcall	code_A5A0
		clr	C
		subb	A, #60h	; '`'
		jc	code_25AB
		mov	ALF_2, #55h ; 'U'
		ljmp	code_14DC
; ---------------------------------------------------------------------------

code_25AB:				; CODE XREF: RESET_0-C486j
					; RESET_0-C480j ...
		lcall	code_C311
		lcall	code_C32E
		lcall	code_C368
		lcall	code_C3A3
		lcall	code_C34B
		lcall	code_C3FA
		lcall	code_C88B
		mov	A, R5
		xrl	A, #55h
		jnz	code_25CC
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		jnb	ACC.1, code_25CF ; Accumulator

code_25CC:				; CODE XREF: RESET_0-C41Fj
		lcall	code_C688

code_25CF:				; CODE XREF: RESET_0-C419j
		lcall	code_D15C

code_25D2:				; CODE XREF: RESET_0:code_2493j
					; RESET_0-C516j ...
		mov	WDTREL,	#0E2h ;	'т' ; Watchdog Timer Reload Register
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	SP, #SP_VALUE	; Stack	Pointer
		mov	SYSCON,	#0	; System Control Register
		mov	PSW, #0		; Program Status Word
		mov	CCEN, #0	; Compare/Capture Enable Register
		mov	CMEN, #0	; Compare Enable Register (RMAP=0)
		mov	CC4EN, #0	; Compare/Capture 4 Enable Register
		anl	RAM_2D,	#1Fh
		mov	R0, #2Ch ; ','

code_25F2:				; CODE XREF: RESET_0-C3EEj
		mov	@R0, #0
		djnz	R0, code_25F2
		mov	R0, #2Eh ; '.'

code_25F8:				; CODE XREF: RESET_0-C3E6j
		mov	@R0, #0
		inc	R0
		mov	A, R0
		jnz	code_25F8
		orl	IP1, #80h	; Interrupt Priority Register 1
		mov	P0, #0FFh	; Port 0 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		mov	P1, #1Ch	; Port 1 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		mov	P2, #0		; Port 2 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		mov	P3, #39h ; '9'  ; Port 3 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		mov	P4, #0		; Port 4 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		mov	P5, #20h ; ' '  ; Port 5 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		mov	P6, #0D0h ; '¦' ; Port 6 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		mov	P9, #0		; Port 9 (PDIR=0)
		orl	SYSCON,	#40h	; System Control Register
		clr	A
		mov	ADCON0,	A	; A/D Converter	Control	Register 0
		mov	ADCON1,	A	; A/D Converter	Control	Register 1
		mov	ADDATL,	A	; A/D Converter	Data Register, Low Byte
		mov	ADDATH,	A	; A/D Converter	Data Register, High Byte
		mov	ARCON, A	; Arithmetic Control Register
		mov	CCL1, A		; Compare/Capture Register 1, Low Byte
		mov	CCH1, A		; Compare/Capture Register 1, High Byte
		mov	CCL2, A		; Compare/Capture Register 2, Low Byte
		mov	CCH2, A		; Compare/Capture Register 2, High Byte
		mov	CCL3, A		; Compare/Capture Register 3, Low Byte
		mov	CCH3, A		; Compare/Capture Register 3, High Byte
		mov	CCL4, A		; Compare/Capture Register 4, Low Byte
		mov	CCH4, A		; Compare/Capture Register 4, High Byte
		mov	CMEN, A		; Compare Enable Register (RMAP=0)
		mov	CML0, A		; Compare Register 0, Low Byte (RMAP=0)
		mov	CMH0, A		; Compare Register 0, High Byte	(RMAP=0)
		mov	CML1, A		; Compare Register 1, Low Byte (RMAP=0)
		mov	CMH1, A		; Compare Register 1, High Byte	(RMAP=0)
		mov	CML2, A		; Compare Register 2, Low Byte (RMAP=0)
		mov	CMH2, A		; Compare Register 2, High Byte	(RMAP=0)
		mov	CML3, A		; Compare Register 3, Low Byte (RMAP=0)
		mov	CMH3, A		; Compare Register 3, High Byte	(RMAP=0)
		mov	CML4, A		; Compare Register 4, Low Byte (RMAP=0)
		mov	CMH4, A		; Compare Register 4, High Byte	(RMAP=0)
		mov	CML5, A		; Compare Register 5, Low Byte (RMAP=0)
		mov	CMH5, A		; Compare Register 5, High Byte	(RMAP=0)
		mov	CML6, A		; Compare Register 6, Low Byte (RMAP=0)
		mov	CMH6, A		; Compare Register 6, High Byte	(RMAP=0)
		mov	CML7, A		; Compare Register 7, Low Byte (RMAP=0)
		mov	CMH7, A		; Compare Register 7, High Byte	(RMAP=0)
		mov	CRCL, A		; Comp./Rel./Capt. Reg.	Low Byte
		mov	CRCH, A		; Comp./Rel./Capt. Reg.	High Byte
		mov	PCON, A		; Power	Control	Register
		mov	S0BUF, A	; Serial Channel 0 Buffer Register
		mov	S1BUF, A	; Serial Channel 1 Buffer Register
		mov	S0CON, A	; Serial Channel 0 Control Register
		mov	TCON, A		; Timer	Control	Register
		mov	TL0, A		; Timer	0, Low Byte
		mov	TH0, A		; Timer	0, High	Byte
		mov	TL1, A		; Timer	1, Low Byte
		mov	TH1, A		; Timer	1, High	Byte
		mov	TL2, A		; Timer	2, Low Byte
		mov	TH2, A		; Timer	2, High	Byte
		mov	PRSC, #0D5h ; '-' ; Prescaler Control Register
		mov	TMOD, #15h	; Timer	Mode Register
		setb	TCON.2		; Timer	Control	Register
		setb	TCON.0		; Timer	Control	Register
		mov	T2CON, #85h ; 'Е' ; Timer 2 Control Register
		mov	IEN3, #0	; Interrupt Enable Register 3
		mov	CTCON, #0C3h ; '+' ; Compare Timer Control Register
		mov	CT1CON,	#43h ; 'C' ; Compare Timer 1 Control Register
		mov	CTRELH,	#0	; Compare Timer	Rel. Reg., High	Byte (RMAP=0)
		mov	CTRELL,	#0	; Compare Timer	Rel. Reg., Low Byte (RMAP=0)
		orl	SYSCON,	#10h	; System Control Register
		mov	CTRELH,	#0FEh ;	'¦' ; Compare Timer Rel. Reg., High Byte (RMAP=0)
		mov	CTRELL,	#0Ch	; Compare Timer	Rel. Reg., Low Byte (RMAP=0)
		anl	SYSCON,	#0EFh	; System Control Register
		mov	CMSEL, #0	; Compare Input	Select (RMAP=0)
		mov	CCEN, #4Ch ; 'L' ; Compare/Capture Enable Register
		mov	CC4EN, #0	; Compare/Capture 4 Enable Register
		clr	IEN0.2		; Interrupt Enable Register 0
		clr	IEN1.1		; Interrupt Enable Register 1
		mov	A, IP0		; Interrupt Priority Register 0
		anl	A, #40h
		jz	code_26CD
		mov	DPTR, #0F9B0h
		movx	A, @DPTR
		xrl	A, #55h
		jz	code_26CD
		setb	RAM_22.5

code_26CD:				; CODE XREF: RESET_0-C321j
					; RESET_0-C319j
		mov	IP1, #2Ch ; ',' ; Interrupt Priority Register 1
		mov	IP0, #34h ; '4' ; Interrupt Priority Register 0
		lcall	code_C1B9
		mov	DPTR, #0F8C2h
		movx	A, @DPTR
		cjne	A, #55h, code_26E0 ; 'U'
		ljmp	code_2741
; ---------------------------------------------------------------------------

code_26E0:				; CODE XREF: RESET_0-C308j
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		jb	ACC.1, code_2720 ; Accumulator
		mov	R0, #1
		mov	R1, #0
		mov	DPTR, #0FD00h

code_26EE:				; CODE XREF: RESET_0-C2E9j
		clr	C
		movx	A, @DPTR
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		inc	DPTR
		mov	A, DPH		; Data Pointer,	High Byte
		cjne	A, #0FFh, code_26EE
		mov	R2, #40h ; '@'
		mov	DPTR, #0F4D2h

code_2701:				; CODE XREF: RESET_0-C2D8j
		clr	C
		movx	A, @DPTR
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		inc	DPTR
		djnz	R2, code_2701
		mov	DPTR, #0F8FEh
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		mov	A, R0
		orl	A, R1
		jz	code_2720
		setb	RAM_22.6
		sjmp	code_2722
; ---------------------------------------------------------------------------

code_2720:				; CODE XREF: RESET_0-C2FEj
					; RESET_0-C2C8j
		clr	RAM_22.6

code_2722:				; CODE XREF: RESET_0-C2C4j
		mov	B, #34h	; '4'   ; B-Register
		mov	DPTR, #0F900h
		clr	A

code_2729:				; CODE XREF: RESET_0-C2B7j
		movx	@DPTR, A
		inc	DPTR
		djnz	B, code_2729	; B-Register
		mov	DPTR, #0F800h

code_2731:				; CODE XREF: RESET_0-C2ACj
		clr	A
		movx	@DPTR, A
		inc	DPTR
		mov	A, DPL		; Data Pointer,	Low Byte
		jnz	code_2731
		clr	A
		mov	DPTR, #0F997h
		movx	@DPTR, A
		mov	DPTR, #0F4B8h
		movx	@DPTR, A

code_2741:				; CODE XREF: RESET_0-C305j
		clr	A
		mov	DPTR, #0F965h
		movx	@DPTR, A
		mov	DPTR, #0F985h
		movx	@DPTR, A
		mov	DPTR, #0F986h
		movx	@DPTR, A
		mov	DPTR, #0F98Bh
		movx	@DPTR, A
		mov	DPTR, #60E6h	; Начальное минимальное	время между циклами детонации |	сек.
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F953h
		movx	@DPTR, A
		mov	DPTR, #609Dh	; Начальный период восстановления УОЗ |	сек.
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F954h
		movx	@DPTR, A
		mov	DPTR, #5F50h	; Начальный порог детонации |
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F943h
		movx	@DPTR, A
		mov	DPTR, #5F53h	; Начальная фаза начала	измерения детонации | гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F946h
		movx	@DPTR, A
		mov	DPTR, #5F54h	; Начальная фаза окончания измерения детонации | гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F947h
		movx	@DPTR, A
		mov	DPTR, #0F955h
		mov	A, #5
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		mov	C, RAM_22.6
		orl	C, ACC.1	; Accumulator
		anl	C, /RAM_22.5
		mov	DPTR, #5F51h	; Начальный средний уровень шума двигателя | уровень
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F934h
		movx	@DPTR, A
		mov	DPTR, #0F966h
		movx	@DPTR, A
		mov	DPTR, #0F968h
		movx	@DPTR, A
		mov	DPTR, #0F96Ah
		movx	@DPTR, A
		mov	DPTR, #0F96Ch
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F935h
		movx	@DPTR, A
		mov	DPTR, #0F967h
		movx	@DPTR, A
		mov	DPTR, #0F969h
		movx	@DPTR, A
		mov	DPTR, #0F96Bh
		movx	@DPTR, A
		mov	DPTR, #0F96Dh
		movx	@DPTR, A
		mov	DPTR, #0F934h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #60E7h	; Начальный относительный порог	детонации |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	A, R1
		jz	code_27DF
		mov	R0, #0FFh
		mov	R1, #0Fh
		sjmp	code_27E9
; ---------------------------------------------------------------------------

code_27DF:				; CODE XREF: RESET_0-C20Bj
		mov	RAM_1, R0
		mov	R0, B		; B-Register
		lcall	DIV_R0R1_8
		lcall	DIV_R0R1_2

code_27E9:				; CODE XREF: RESET_0-C205j
		mov	DPTR, #0FA92h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F9D1h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		setb	RAM_2C.2
		lcall	FLAGS_INIT
		clr	A
		mov	RAM_67,	A
		mov	RAM_66,	A
		mov	DPTR, #0F828h
		movx	@DPTR, A
		mov	DPTR, #0F9B0h
		movx	@DPTR, A
		mov	DPTR, #0F9C3h
		movx	@DPTR, A
		mov	DPTR, #0F9CEh
		movx	@DPTR, A
		mov	DPTR, #0F9CFh
		movx	@DPTR, A
		mov	DPTR, #0F9D0h
		movx	@DPTR, A
		mov	DPTR, #0F9C4h
		movx	@DPTR, A
		mov	DPTR, #0F9C5h
		movx	@DPTR, A
		mov	DPTR, #0F9C6h
		movx	@DPTR, A
		mov	DPTR, #0F9C7h
		movx	@DPTR, A
		mov	DPTR, #0F9C8h
		movx	@DPTR, A
		mov	DPTR, #0F9C9h
		movx	@DPTR, A
		mov	DPTR, #0F4C9h
		movx	@DPTR, A
		mov	DPTR, #0FA8Ch
		movx	@DPTR, A
		mov	DPTR, #0F95Bh
		movx	@DPTR, A
		mov	DPTR, #0F95Ch
		movx	@DPTR, A
		mov	DPTR, #0FA8Dh
		movx	@DPTR, A
		mov	DPTR, #0F99Dh
		movx	@DPTR, A
		mov	DPTR, #0F99Eh
		movx	@DPTR, A
		mov	DPTR, #0F97Ah
		movx	@DPTR, A
		mov	DPTR, #0F936h
		movx	@DPTR, A
		mov	DPTR, #0F944h
		movx	@DPTR, A
		mov	DPTR, #0FA94h
		movx	@DPTR, A
		mov	DPTR, #0FA96h
		movx	@DPTR, A
		mov	DPTR, #0F9A0h
		movx	@DPTR, A
		mov	DPTR, #0FA97h
		movx	@DPTR, A
		mov	DPTR, #0F93Ch
		movx	@DPTR, A
		mov	DPTR, #0FA9Bh
		movx	@DPTR, A
		mov	DPTR, #0F94Ch
		movx	@DPTR, A
		mov	DPTR, #0F976h
		movx	@DPTR, A
		mov	DPTR, #0FF46h
		movx	@DPTR, A
		mov	DPTR, #0F9A0h
		movx	@DPTR, A
		mov	DPTR, #0FAA5h
		movx	@DPTR, A
		mov	DPTR, #0FAA6h
		movx	@DPTR, A
		mov	DPTR, #0FF57h
		movx	@DPTR, A
		mov	DPTR, #0FF3Dh
		movx	@DPTR, A
		
		mov	DPTR, #0F9D7h
		movx	@DPTR, A
		
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		setb	ACC.6		; Accumulator
		movx	@DPTR, A
		mov	A, #0FFh
		mov	RAM_5A,	A
		mov	DPTR, #0F9CAh
		movx	@DPTR, A
		mov	DPTR, #0F9CBh
		movx	@DPTR, A
		mov	DPTR, #0FA81h
		movx	@DPTR, A
		mov	DPTR, #6061h	; Фаза впрыска на пуске	| гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FF47h
		movx	@DPTR, A
		mov	DPTR, #5FF8h
		clr	A
		movc	A, @A+DPTR
		mov	RAM_3C,	A
		mov	RAM_3E,	A
		mov	DPTR, #5FF9h
		clr	A
		movc	A, @A+DPTR
		mov	RAM_3D,	A
		mov	RAM_3F,	A
		mov	DPTR, #5F71h	; К.Д.К. GBC на	оборотах выше 5010 |
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F949h
		movx	@DPTR, A
		mov		DPTR, #608Dh    ; Начальная задержка отключения топливоподачи, сек.
		clr		A
		movc	A, @A+DPTR
		mov		DPTR, #0FF3Eh
		movx	@DPTR, A
		mov	DPTR, #5F86h	; Ожидаемая температура	ОГ в точке росы	| град.С
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F893h
		movx	@DPTR, A
		mov	DPTR, #0F895h
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F88Fh
		movx	@DPTR, A
		mov	DPTR, #0F97Bh
		movx	@DPTR, A
		inc		DPL
		movx	@DPTR, A
		inc		DPL
		movx	@DPTR, A
		inc		DPL
		movx	@DPTR, A
		
		mov	DPTR, #0F981h
		movx	@DPTR, A
		inc		DPL
		movx	@DPTR, A
		
		mov	DPTR, #0F98Dh
		movx	@DPTR, A
		mov	DPTR, #0F98Eh
		movx	@DPTR, A
		mov	DPTR, #0F98Fh
		movx	@DPTR, A
		mov	DPTR, #0F990h
		movx	@DPTR, A
		mov	DPTR, #0F993h
		movx	@DPTR, A
		mov	DPTR, #0F994h
		movx	@DPTR, A
		mov	DPTR, #0F98Ch
		movx	@DPTR, A
		mov	DPTR, #0F99Bh
		movx	@DPTR, A
		mov	DPTR, #0F99Ch
		movx	@DPTR, A
		mov	DPTR, #0F9A3h
		movx	@DPTR, A
		mov	DPTR, #0F9A4h
		movx	@DPTR, A
		mov	DPTR, #0F9A1h
		movx	@DPTR, A
		mov	DPTR, #0F9A2h
		movx	@DPTR, A
		mov	DPTR, #0F9C0h
		movx	@DPTR, A
		mov	DPTR, #0F9D3h
		movx	@DPTR, A
		mov	DPTR, #0F936h
		movx	@DPTR, A
		mov	DPTR, #0F9D4h
		movx	@DPTR, A
		mov	DPTR, #0F94Ah
		movx	@DPTR, A
		mov	DPTR, #0F94Bh
		movx	@DPTR, A
		mov	DPTR, #0FF49h
		movx	@DPTR, A
		mov	DPTR, #0FF4Ah
		movx	@DPTR, A
		mov	DPTR, #0FF4Bh
		movx	@DPTR, A
		mov	DPTR, #0FF4Ch
		movx	@DPTR, A
		mov	DPTR, #0FA0Bh
		movx	@DPTR, A
		mov	DPTR, #0FA1Fh
		movx	@DPTR, A
		mov	DPTR, #0F8CFh
		movx	@DPTR, A
		mov	DPTR, #0FA79h
		movx	@DPTR, A
		mov	DPTR, #0FA7Ah
		movx	@DPTR, A
		mov	DPTR, #0FA7Bh
		movx	@DPTR, A
		mov	DPTR, #0FA7Ch
		movx	@DPTR, A
		mov	DPTR, #0FA7Dh
		movx	@DPTR, A
		mov	DPTR, #0FA7Eh
		movx	@DPTR, A
		mov	DPTR, #0FA7Fh
		movx	@DPTR, A
		mov	DPTR, #0FA80h
		movx	@DPTR, A
		mov	DPTR, #0FA78h
		movx	@DPTR, A
		mov	DPTR, #0FA87h
		movx	@DPTR, A
		mov	DPTR, #0FA88h
		movx	@DPTR, A
		mov	DPTR, #0FA89h
		movx	@DPTR, A
		mov	DPTR, #0FA8Ah
		movx	@DPTR, A
		mov	DPTR, #0FA82h
		movx	@DPTR, A
		mov	DPTR, #0FA83h
		movx	@DPTR, A
		mov	DPTR, #0FA84h
		movx	@DPTR, A
		mov	DPTR, #0FA85h
		movx	@DPTR, A
		mov	DPTR, #0FA86h
		movx	@DPTR, A
		mov	DPTR, #0FAA1h
		movx	@DPTR, A
		mov	DPTR, #0FA10h
		movx	@DPTR, A
		inc		DPL
		;mov	DPTR, #0FA11h
		movx	@DPTR, A
		inc		DPL
		;mov	DPTR, #0FA12h
		movx	@DPTR, A
		inc		DPL
		;mov	DPTR, #0FA13h
		movx	@DPTR, A
		inc		DPL
		;mov	DPTR, #0FA14h
		movx	@DPTR, A
		inc		DPL
		;mov	DPTR, #0FA15h
		movx	@DPTR, A
		inc		DPL
		;mov	DPTR, #0FA16h
		movx	@DPTR, A
		inc		DPL
		;mov	DPTR, #0FA17h
		movx	@DPTR, A
		mov	DPTR, #0FA0Eh
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0FA71h
		movx	@DPTR, A
		inc		DPL
		;mov	DPTR, #0FA72h
		movx	@DPTR, A
		inc		DPL
		;mov	DPTR, #0FA73h
		movx	@DPTR, A
		mov	DPTR, #0FA75h
		movx	@DPTR, A
		mov	DPTR, #0F93Eh
		movx	@DPTR, A
		mov	A, #80h	; 'А'
		mov	DPTR, #0F93Dh
		movx	@DPTR, A
		mov	R0, #0BEh ; '-'
		mov	@R0, #0B0h ; '-'
		mov	R0, #0BFh ; '¬'
		mov	A, @R0
		orl	A, #0FEh
		mov	@R0, A
		mov	A, #0FFh
		mov	DPTR, #0F830h
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	@DPTR, A
		mov	A, #20h	; ' '
		mov	DPTR, #0F843h
		movx	@DPTR, A
		mov	A, #0FFh
		mov	DPTR, #0F835h
		movx	@DPTR, A
		mov	DPTR, #6067h	; Начальное положение ДПДЗ | В
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F8B2h
		movx	@DPTR, A
		mov	DPTR, #0F827h
		movx	@DPTR, A
		mov	RAM_6E,	#0
		mov	DPTR, #60A4h	; Начальное значение коррекции времени впрыска |
		clr	A
		movc	A, @A+DPTR
		mov	RAM_6F,	A
		setb	RAM_2E.0
		clr	A
		mov	DPTR, #0F806h
		movx	@DPTR, A
		
		mov	DPTR, #0F9D7h
		movx	@DPTR, A
		
		mov		DPTR, #RAM_CAPTURE_MODE
		movx	@DPTR, A
		setb	RAM_2B.0
		setb	RAM_2A.3
		setb	RAM_2A.4
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		mov	C, RAM_22.5
		orl	C, /ACC.1	; Accumulator
		orl	C, /RAM_22.6
		jc	code_2A42
		setb	RAM_2C.2
		clr	A
		mov	DPTR, #0F9BFh
		movx	@DPTR, A

code_2A42:				; CODE XREF: RESET_0-BFA9j
		setb	RAM_2A.1
		clr	RAM_2B.7
		lcall	code_ACED
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		mov	C, RAM_22.5
		orl	C, ACC.1	; Accumulator
		orl	C, RAM_22.6
		jnc	code_2A62
		lcall	code_A80E
		mov	A, #80h	; 'А'
		mov	DPTR, #0FF40h
		movx	@DPTR, A
		mov	DPTR, #0F97Fh
		movx	@DPTR, A

code_2A62:				; CODE XREF: RESET_0-BF8Fj
		mov	DPTR, #5F97h	; Минимальное KGBC |
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #5F98h	; Максимальное KGBC |
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		mov	DPTR, #0FF40h
		movx	A, @DPTR
		lcall	code_AD03
		mov	DPTR, #0FF40h
		movx	@DPTR, A
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		mov	C, RAM_22.5
		orl	C, ACC.1	; Accumulator
		orl	C, RAM_22.6
		jc	code_2A8D
		mov	DPTR, #60DEh
		clr	A
		movc	A, @A+DPTR
		jb	ACC.0, code_2A9C ; Accumulator

code_2A8D:				; CODE XREF: RESET_0-BF5Fj
		mov	B, #40h	; '@'   ; B-Register
		mov	DPTR, #0F4D2h
		clr	A

code_2A94:				; CODE XREF: RESET_0-BF4Cj
		movx	@DPTR, A
		inc	DPTR
		djnz	B, code_2A94	; B-Register
		lcall	code_DAD4

code_2A9C:				; CODE XREF: RESET_0-BF58j
		lcall	code_B345
		clr	A
		mov	DPTR, #0F4D8h
		movx	@DPTR, A
		mov	DPTR, #0F518h
		movx	@DPTR, A
		mov	B, #20h	; ' '   ; B-Register
		mov	DPTR, #0FF40h
		movx	A, @DPTR
		mov	DPTR, #0F8D0h

code_2AB2:				; CODE XREF: RESET_0-BF2Ej
		movx	@DPTR, A
		inc	DPTR
		djnz	B, code_2AB2	; B-Register
		mov	DPTR, #0F4D6h
		movx	A, @DPTR
		mov	C, ACC.7	; Accumulator
		clr	A
		mov	ACC.0, C	; Accumulator
		mov	DPTR, #0FF53h
		movx	@DPTR, A
		mov	B, #4		; B-Register
		lcall	code_A5A0
		mov	DPTR, #0F80Bh
		movx	@DPTR, A
		mov	R1, A
		swap	A
		rl	A
		anl	A, #0E0h
		mov	R3, A
		mov	A, R1
		rr	A
		rr	A
		rr	A
		anl	A, #1Fh
		mov	R2, A
		mov	DPTR, #6104h	; Тарировка ДТОЖ | Температура,	град.С - Напряжение АЦП	ДТОЖ
		lcall	GET_2D_INTERPOLATION
		clr	C
		subb	A, #14h
		jnc	code_2AE8
		mov	A, #0

code_2AE8:				; CODE XREF: RESET_0-BEFEj
		mov	TWAT, A
		mov	DPTR, #0F99Bh
		movx	@DPTR, A
		mov	DPTR, #0F9C7h
		movx	@DPTR, A
		mov	DPTR, #609Ch	; Коэффициент квантования ДТОЖ |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, TWAT
		mul	AB
		add	A, #40h	; '@'
		jnc	code_2B02
		inc	B		; B-Register

code_2B02:				; CODE XREF: RESET_0-BEE4j
		jnb	B.7, code_2B09	; B-Register
		mov	A, #0F0h ; 'Ё'
		sjmp	code_2B15
; ---------------------------------------------------------------------------

code_2B09:				; CODE XREF: RESET_0:code_2B02j
		mov	C, ACC.7	; Accumulator
		mov	A, B		; B-Register
		rlc	A
		cjne	A, #0F0h, code_2B11 ; 'Ё'

code_2B11:
		jc	code_2B15
		mov	A, #0F0h ; 'Ё'

code_2B15:				; CODE XREF: RESET_0-BEDBj
					; RESET_0:code_2B11j
		mov	DPTR, #0FF4Dh
		movx	@DPTR, A
		swap	A
		anl	A, #0Fh
		mov	DPTR, #0FF4Eh
		movx	@DPTR, A
		mov	A, TWAT
		add	A, #3
		mov	B, #5		; B-Register
		div	AB
		cjne	A, #24h, code_2B2B ; '$'

code_2B2B:
		jc	code_2B2F
		mov	A, #24h	; '$'

code_2B2F:				; CODE XREF: RESET_0:code_2B2Bj
		mov	TWAT_RT, A
		mov	A, TWAT
		mov	B, #5		; B-Register
		div	AB
		cjne	A, #24h, code_2B3A ; '$'

code_2B3A:
		jc	code_2B3E
		mov	A, #24h	; '$'

code_2B3E:				; CODE XREF: RESET_0:code_2B3Aj
		mov	DPTR, #0F887h
		movx	@DPTR, A
		mov	A, B		; B-Register
		mov	B, #33h	; '3'   ; B-Register
		mul	AB
		mov	DPTR, #0F888h
		movx	@DPTR, A
		lcall	code_ED6D
		mov	A, #3
		mov	DPTR, #0F8B0h
		movx	@DPTR, A
		mov	B, #1		; B-Register
		lcall	code_A5A0
		mov	B, A		; B-Register
		mov	DPTR, #0F827h
		movx	A, @DPTR
		xch	A, B		; B-Register
		clr	C
		subb	A, B		; B-Register
		jc	code_2B81
		mov	B, A		; B-Register
		mov	DPTR, #6068h	; Коэффициент тарировки	ДПДЗ | %/В
		clr	A
		movc	A, @A+DPTR
		mul	AB
		mov	R0, B		; B-Register
		mov	DPTR, #606Ah	; Максимальное положение дросселя | %
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_2B83
		add	A, B		; B-Register
		mov	R0, A
		sjmp	code_2B83
; ---------------------------------------------------------------------------

code_2B81:				; CODE XREF: RESET_0-BE7Cj
		mov	R0, #0

code_2B83:				; CODE XREF: RESET_0-BE68j
					; RESET_0-BE63j
		mov	A, R0
		mov	THR_CODE, A
		mov	DPTR, #0F98Ch
		movx	@DPTR, A
		mov	DPTR, #0F8B8h
		movx	@DPTR, A
		mov	B, #0		; B-Register
		lcall	code_A5A0
		mov	DPTR, #0F80Dh
		movx	@DPTR, A
		mov	DPTR, #0F951h
		movx	@DPTR, A
		mov	R1, A
		clr	A
		mov	DPTR, #0F950h
		movx	@DPTR, A
		mov	DPTR, #60BAh	; Минимальное напряжение бортовой сети | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		cjne	A, B, code_2BAD	; B-Register

code_2BAD:
		jc	code_2BC0
		mov	DPTR, #60BBh	; Максимальное напряжение бортовой сети	| В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		cjne	A, B, code_2BBA	; B-Register

code_2BBA:
		jnc	code_2BC0
		mov	RAM_4B,	R1
		sjmp	code_2BC7
; ---------------------------------------------------------------------------

code_2BC0:				; CODE XREF: RESET_0:code_2BADj
					; RESET_0:code_2BBAj
		mov	DPTR, #60BFh	; Напряжение 1 бортовой	сети при ошибке	| В
		clr	A
		movc	A, @A+DPTR
		mov	RAM_4B,	A

code_2BC7:				; CODE XREF: RESET_0-BE24j
		mov	DPTR, #60BCh	; Смещение при квантовании напряжения |	В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, RAM_4B
		clr	C
		subb	A, B		; B-Register
		jnc	code_2BD6
		clr	A

code_2BD6:				; CODE XREF: RESET_0-BE0Fj
		mov	B, A		; B-Register
		mov	DPTR, #60BDh	; Коэффициент квантования напряжения | В
		clr	A
		movc	A, @A+DPTR
		mul	AB
		jnb	B.7, code_2BE5	; B-Register
		mov	A, #0FFh
		sjmp	code_2BE9
; ---------------------------------------------------------------------------

code_2BE5:				; CODE XREF: RESET_0-BE04j
		rlc	A
		mov	A, B		; B-Register
		rlc	A

code_2BE9:				; CODE XREF: RESET_0-BDFFj
		mov	DPTR, #0F978h
		movx	@DPTR, A
		mov	DPTR, #71D8h	; Динамическая производительность форсунки | Добавочное	время впрыска -	Бортовое напряжение
		lcall	code_AFA0
		mov	RAM_50,	A
		clr	A
		mov	DPTR, #0F9B1h
		movx	@DPTR, A
		mov	DPTR, #0F9B2h
		movx	@DPTR, A
		mov	DPTR, #0F9B5h
		movx	@DPTR, A
		mov	A, #3
		mov	DPTR, #0F9B3h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #2Eh	; '.'
		movx	@DPTR, A
		
		jb	Options.0, code_2C2D
		
		mov	B, #3		; B-Register
		lcall	code_A5A0
		mov	R0, A
		clr	C
		subb	A, #28h	; '('
		jc	code_2C2D
		mov	A, R0
		clr	C
		subb	A, #3Ch	; '<'
		jnc	code_2C2D
		mov	A, R0
		mov	DPTR, #0F9B1h
		movx	@DPTR, A
		mov	DPTR, #5FA6h	; Смещение напр. ДМРВ для диагностики ДПКВ | В
		clr	A
		movc	A, @A+DPTR
		add	A, R0
		mov	DPTR, #0F9B2h
		movx	@DPTR, A

code_2C2D:				; CODE XREF: RESET_0-BDCCj
					; RESET_0-BDC6j
		mov	DPTR, #8F71h	; Блокировка расчетов пленки после пуска | Время блокировки, сек. - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	DPTR, #0F9A5h
		movx	@DPTR, A
		mov	DPTR, #87E4h	; Состав смеси на ХХ | Отношение воздух/топливо	- Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	ALF_1, A
		mov	ALF_2, A
		jnb	Hardware.1, code_2C5C
		setb	RAM_2B.6
		mov	DPTR, #60D1h	; Температура холодной продувки	| град.С
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, TWAT
		mov	DPTR, #60CEh	; Время	холодной продувки | сек.
		jnc	code_2C56
		mov	DPTR, #60CFh	; Время	горячей	продувки | сек.

code_2C56:				; CODE XREF: RESET_0-BD91j
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F868h
		movx	@DPTR, A

code_2C5C:				; CODE XREF: RESET_0-BDA1j
		orl	P6, #20h	; Port 6 (PDIR=0)
		mov	RAM_46,	#14h
		clr	RAM_29.0
		mov	TL1, #0CBh ; 'T' ; Timer 1, Low Byte
		mov	TH1, #0FAh ; '·' ; Timer 1, High Byte
		setb	TCON.6		; Timer	Control	Register
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		setb	IEN0.0		; Interrupt Enable Register 0
		setb	IEN0.3		; Interrupt Enable Register 0
		setb	IEN0.2		; Interrupt Enable Register 0
		mov	DPTR, #0F8C2h
		movx	A, @DPTR
		xrl	A, #55h
		jz	code_2C96
		jnb	RAM_22.6, code_2C87
		lcall	code_B354
		lcall	code_B3AD

code_2C87:				; CODE XREF: RESET_0-BD64j
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		mov	C, RAM_22.6
		orl	C, ACC.1	; Accumulator
		jnc	code_2C96
		lcall	code_ACB0
		sjmp	code_2CAA
; ---------------------------------------------------------------------------

code_2C96:				; CODE XREF: RESET_0-BD66j
					; RESET_0-BD53j
		mov	A, TWAT
		mov	DPTR, #0F80Ah
		movx	@DPTR, A
		mov	DPTR, #6AA1h	; Положение РХХ	при пуске | Шаги РХХ - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	UFRXX, A
		mov	DPTR, #0F9C1h
		movx	A, @DPTR
		mov	CRRXX, A

code_2CAA:				; CODE XREF: RESET_0-BD4Ej
		mov	A, UFRXX
		mov	R0, A
		mov	R1, #0
		lcall	code_ADA2
		mov	DPTR, #0F845h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	A, #55h	; 'U'
		mov	DPTR, #0F8C2h
		movx	@DPTR, A
		lcall	code_B090
		mov	DPTR, #605Ch	; Обороты блокировки впрыска | об./мин
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F9A6h
		movx	@DPTR, A
		mov	DPTR, #0F9B7h
		movx	@DPTR, A
		mov	RAM_68,	#0FFh
		mov	RAM_69,	#0FFh
		mov	RAM_4A,	#0
		setb	IEN1.5		; Interrupt Enable Register 1
		setb	IEN0.7		; Interrupt Enable Register 0

code_2CDE:				; CODE XREF: RESET_0:code_2CDEj
					; RESET_0-8BECj
		jnb	RAM_29.0, code_2CDE
		clr	RAM_29.0
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	C, RAM_2B.1
		mov	RAM_2C.1, C
		mov	C, RAM_2B.5
		mov	RAM_2C.3, C
		lcall	FLAGS_INIT
		jnb	Options.4, code_2D0E
		jb	RAM_25.6, code_2D0E
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #6075h	; Скорость входа в режим Launch, км/ч |	км/час
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_2D06	; B-Register

code_2D06:
		jc	code_2D18
		clr	A
		mov	RAM_4A,	A
		sjmp	code_2D23
; ---------------------------------------------------------------------------

code_2D0E:				; CODE XREF: RESET_0-BCF0j
					; RESET_0-BCEDj
		clr	A
		mov	RAM_4A,	A

code_2D0F:
		mov	DPTR, #0F9A6h
		movx	A, @DPTR
		sjmp	code_2D34
; ---------------------------------------------------------------------------

code_2D18:				; CODE XREF: RESET_0:code_2D06j
		mov		A, RAM_4A
		inc		A
		jz		code_2D0F
		dec		A
		jnz	code_2D1E
		inc	RAM_4A

code_2D1E:				; CODE XREF: RESET_0-BCC8j
		rr	A
		rr	A
		rr	A
		anl	A, #1Fh

code_2D23:				; CODE XREF: RESET_0-BCD7j
		mov	B, A
		
		; Обороты блокировки впрыска на	лаунче | Обороты, об/мин - Время с начала движения
		GET_RAM_BY_INDEX 7AA7h, B, CAPTURE_LAUNCH_CUTOFF_MODE
		
		mov	B, A		; B-Register
		mov	DPTR, #0F9A6h
		movx	A, @DPTR
		cjne	A, B, code_2D30	; B-Register

code_2D30:
		jc	code_2D34
		mov	A, B		; B-Register

code_2D34:				; CODE XREF: RESET_0-BCCDj
					; RESET_0:code_2D30j
		mov	DPTR, #0F9B7h
		movx	@DPTR, A
		jnb	Options.0, code_2D53
		jnb	RAM_2B.0, code_2D50
		mov		DPTR, #5F02h
		clr		A
		movc	A, @A+DPTR
		mov		B, #53h
		jnb		ACC.7, code_2D35
		mov		B, #55h
code_2D35:
		lcall	code_A5A0
		mov	DPTR, #0F80Ch
		movx	@DPTR, A

code_2D48:				; CODE XREF: RESET_0-BC95j
		clr	RAM_28.4
		lcall	CALC_DAD_ENGINE_STOP
		jb	RAM_28.4, code_2D48

code_2D50:				; CODE XREF: RESET_0-BCA7j
		lcall	DIAG_DAD

code_2D53:				; CODE XREF: RESET_0-BCAAj
		mov	R0, #93h ; 'У'
		mov	A, @R0
		mov	DPTR, #0F93Ch
		movx	@DPTR, A
		mov	DPTR, #65D3h	; Фаза начала измерения	детонации | Положение КВ, град.	- Обороты коленвала, об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	DPTR, #0F946h
		movx	@DPTR, A
		mov	DPTR, #65F3h	; Фаза окончания измерения детонации | Положение КВ, град. - Обороты коленвала,	об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	DPTR, #0F947h
		movx	@DPTR, A
		mov	DPTR, #0F946h
		movx	A, @DPTR
		cjne	A, #1Eh, code_2D75

code_2D75:
		jc	code_2D79
		mov	A, #1Dh

code_2D79:				; CODE XREF: RESET_0:code_2D75j
		movx	@DPTR, A
		clr	C
		subb	A, #0Bh
		jnc	code_2D81
		add	A, #1Eh

code_2D81:				; CODE XREF: RESET_0-BC65j
		mov	R0, A
		mov	DPTR, #0F947h
		movx	A, @DPTR
		cjne	A, #1Eh, code_2D89

code_2D89:
		jc	code_2D8D
		mov	A, #1Dh

code_2D8D:				; CODE XREF: RESET_0:code_2D89j
		movx	@DPTR, A
		clr	C
		subb	A, #0Bh
		jnc	code_2D95
		add	A, #1Eh

code_2D95:				; CODE XREF: RESET_0-BC51j
		mov	R2, A
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	RAM_72,	R2
		mov	RAM_4C,	R0
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	DPTR, #6088h	; Температура разрешения динамической коррекции	|
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_2DA6

code_2DA6:
		jc	code_2DAB
		clr	A
		sjmp	code_2DD2
; ---------------------------------------------------------------------------

code_2DAB:				; CODE XREF: RESET_0:code_2DA6j
		mov	DPTR, #0F97Bh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0F981h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		call	ADD_R0R1_R2R3
		
		mov     DPTR, #9034h
		mov     A, RPM_RT_32
		movc    A, @A+DPTR
		mov     B, A

		lcall	MUL_R0R1_B
		mov	A, R1
		jz	code_2DC3
		mov	R0, #0FFh

code_2DC3:				; CODE XREF: RESET_0-BC23j
		mov	DPTR, #5FABh	; Максимальное смещение	УОЗ по Д.К. | гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R0
		cjne	A, B, code_2DCE	; B-Register

code_2DCE:
		jc	code_2DD2
		mov	A, B		; B-Register

code_2DD2:				; CODE XREF: RESET_0-BC39j
					; RESET_0:code_2DCEj
		mov	DPTR, #0F938h
		movx	@DPTR, A
		jbc	RAM_26.5, code_2E29
		mov	A, RAM_5A
		inc	A
		jz	code_2DE4
		mov	RAM_5A,	A
		mov	DPTR, #0FA95h
		movx	@DPTR, A

code_2DE4:				; CODE XREF: RESET_0-BC06j
		jb	RAM_2B.0, code_2E52
		mov	A, RAM_5A
		cjne	A, #16h, code_2DEC

code_2DEC:
		jc	code_2E52
		setb	RAM_2B.0
		clr	RAM_26.1
		clr	A
		mov	RPM_XX,	A
		mov	RPM_1, A
		mov	RPM, A
		mov	RPM_RT,	A
		mov	RPM_RT_32, A
		mov	RAM_38,	A
		mov	RAM_39,	A
		mov	DPTR, #0F873h
		movx	@DPTR, A
		mov	DPTR, #0F89Eh
		movx	@DPTR, A
		mov	DPTR, #0F94Ch
		movx	@DPTR, A
		mov	DPTR, #0F94Ah
		movx	@DPTR, A
		mov	DPTR, #0F94Bh
		movx	@DPTR, A
		mov	DPTR, #0FF49h
		movx	@DPTR, A
		mov	DPTR, #0FF4Ah
		movx	@DPTR, A
		anl	CMEN, #0Fh	; Compare Enable Register (RMAP=0)
		orl	P4, #0F0h	; Port 4 (PDIR=0)
		orl	CMEN, #0F0h	; Compare Enable Register (RMAP=0)
		ljmp	code_2FCD
; ---------------------------------------------------------------------------

code_2E29:				; CODE XREF: RESET_0-BC0Cj
		jnb	RAM_2B.0, code_2E4F
		mov	A, RAM_5A
		cjne	A, #0Bh, code_2E31

code_2E31:
		jnc	code_2E4F
		mov	DPTR, #0F873h
		movx	A, @DPTR
		inc	A
		jz	code_2E3B
		movx	@DPTR, A

code_2E3B:				; CODE XREF: RESET_0-BBAAj
		mov	DPTR, #606Fh	; Время	задержки синхронизации | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F873h
		movx	A, @DPTR
		cjne	A, B, code_2E49	; B-Register

code_2E49:
		jc	code_2E4F
		setb	RAM_26.1
		clr	RAM_2B.0

code_2E4F:				; CODE XREF: RESET_0:code_2E29j
					; RESET_0:code_2E31j ...
		mov	RAM_5A,	#0

code_2E52:				; CODE XREF: RESET_0:code_2DE4j
					; RESET_0:code_2DECj ...
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	R2, RAM_1C
		mov	R3, RAM_1D
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, R2
		orl	A, R3
		jnz	code_2E61
		ljmp	code_2FCD
; ---------------------------------------------------------------------------

code_2E61:				; CODE XREF: RESET_0-BB86j
		clr	RAM_28.4
		mov	MD0, #30h ; '0' ; Multiplication/Division Register 0
		mov	MD1, #82h ; 'В' ; Multiplication/Division Register 1
		mov	MD2, #0		; Multiplication/Division Register 2
		mov	MD3, #0		; Multiplication/Division Register 3
		mov	MD4, R2		; Multiplication/Division Register 4
		mov	MD5, R3		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		jb	RAM_28.4, code_2E52
		mov	A, R2
		orl	A, R3
		jz	code_2E90
		mov	R0, #0FFh
		mov	R1, #0FFh

code_2E90:				; CODE XREF: RESET_0-BB58j
		mov	DPTR, #0FF49h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		jbc	RAM_28.6, code_2E9F
		ljmp	code_2FCD
; ---------------------------------------------------------------------------

code_2E9F:				; CODE XREF: RESET_0-BB49j
					; RESET_0-BB10j
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	R2, RAM_38
		mov	R3, RAM_39
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, R2
		orl	A, R3
		jnz	code_2EAE
		ljmp	code_2FCD
; ---------------------------------------------------------------------------

code_2EAE:				; CODE XREF: RESET_0-BB39j
		clr	RAM_28.4
		mov	MD0, #40h ; '@' ; Multiplication/Division Register 0
		mov	MD1, #42h ; 'B' ; Multiplication/Division Register 1
		mov	MD2, #0Fh	; Multiplication/Division Register 2
		mov	MD3, #0		; Multiplication/Division Register 3
		mov	MD4, R2		; Multiplication/Division Register 4
		mov	MD5, R3		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		jb	RAM_28.4, code_2E9F
		mov	A, R2
		orl	A, R3
		jz	code_2EDD
		mov	R0, #0FFh
		mov	R1, #0FFh

code_2EDD:				; CODE XREF: RESET_0-BB0Bj
		mov	DPTR, #0F94Ah
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #0F94Ah
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		lcall	SUB_R0R1_R2R3
		jc	code_2F02
		mov	A, R1
		jz	code_2EFA

code_2EF7:				; CODE XREF: RESET_0:code_2F02j
		clr	A
		sjmp	code_2F0B
; ---------------------------------------------------------------------------

code_2EFA:				; CODE XREF: RESET_0-BAEDj
		mov	A, R0
		jnb	ACC.7, code_2F0B ; Accumulator
		mov	A, #7Fh	; ''
		sjmp	code_2F0B
; ---------------------------------------------------------------------------

code_2F02:				; CODE XREF: RESET_0-BAF0j
		cjne	R1, #0FFh, code_2EF7
		mov	A, R0
		jb	ACC.7, code_2F0B ; Accumulator
		mov	A, #80h	; 'А'

code_2F0B:				; CODE XREF: RESET_0-BAEAj
					; RESET_0-BAE7j ...
		mov		B, A            ; B-Register
		mov		DPTR, #0F94Ch
		movx	A, @DPTR
		xch		A, B            ; B-Register
		mov		DPTR, #0F94Ch
		movx	@DPTR, A
		clr		C
		subb	A, B            ; B-Register
		mov		DPTR, #0FF5Fh
		movx	@DPTR, A
		mov		R0, A

		; mov	DPTR, #0F94Ch
		; movx	@DPTR, A
		; mov	C, ACC.7	; Accumulator
		; mov	DPTR, #0FF45h
		; movx	A, @DPTR
		; rlc	A
		; mov	DPTR, #0FF45h
		; movx	@DPTR, A
		
		jnb		RAM_2B.1, CALC_DI_UOZ ; Признак ХХ
		mov		DPTR, #60A5h    ; Отклонение оборотов для блокировки интегратора | об/мин.
		clr		A
		movc	A, @A+DPTR
		mov		B, A            ; B-Register
		mov		A, DELTA_RPM_XX
		lcall	ABS_ACC
		clr		C
		subb	A, B            ; B-Register
		jnc		CALC_DI_UOZ
		clr		A
		sjmp	SAVE_DI_UOZ

CALC_DI_UOZ:
		mov		A, R0
		mov		DPTR, #0A5ABh   ; Интегральное смещение УОЗ 2 | Добавка УОЗ - Интегральная ошибка оборотов
		jnb		ACC.7, CALC_DI_UOZ_1 ; Accumulator
		cpl		A
		inc		A
		mov		DPTR, #0A5A0h   ; Интегральное смещение УОЗ 1 | Добавка УОЗ - Интегральная ошибка оборотов

CALC_DI_UOZ_1:
		cjne	A, #0Ah, CALC_DI_UOZ_2

CALC_DI_UOZ_2:
		jc		CALC_DI_UOZ_3
		mov		A, #0Ah

CALC_DI_UOZ_3:
		movc	A, @A+DPTR

SAVE_DI_UOZ:
		mov		DPTR, #0FF60h
		movx	@DPTR, A

		mov	DPTR, #0F94Ah
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	A, R0
		add	A, #1
		mov	B, A		; B-Register
		mov	A, R1
		addc	A, #0
		jc	code_2F30
		rrc	A
		jz	code_2F35

code_2F30:				; CODE XREF: RESET_0-BAB7j
		mov	RPM_XX,	#0FFh
		sjmp	code_2F3A
; ---------------------------------------------------------------------------

code_2F35:				; CODE XREF: RESET_0-BAB4j
		mov	A, B		; B-Register
		rrc	A
		mov	RPM_XX,	A

code_2F3A:				; CODE XREF: RESET_0-BAAFj
		mov	A, R0
		add	A, #4
		mov	B, A		; B-Register
		mov	A, R1
		addc	A, #0
		jc	code_2F55
		rrc	A
		xch	A, B		; B-Register
		rrc	A
		xch	A, B		; B-Register
		clr	C
		rrc	A
		xch	A, B		; B-Register
		rrc	A
		xch	A, B		; B-Register
		clr	C
		rrc	A
		jz	code_2F59

code_2F55:				; CODE XREF: RESET_0-BAA0j
		mov	A, #0FFh
		sjmp	code_2F5C
; ---------------------------------------------------------------------------

code_2F59:				; CODE XREF: RESET_0-BA8Fj
		mov	A, B		; B-Register
		rrc	A

code_2F5C:				; CODE XREF: RESET_0-BA8Bj
		mov	B, A		; B-Register
		subb	A, RPM
		jnc	code_2F63
		clr	A

code_2F63:				; CODE XREF: RESET_0-BA82j
		mov	DPTR, #0FA74h
		movx	@DPTR, A
		mov	RPM, B		; B-Register
		mov	A, RPM
		cjne	A, #1Fh, code_2F6F

code_2F6F:
		jc	code_2F73
		mov	A, #1Fh

code_2F73:				; CODE XREF: RESET_0:code_2F6Fj
		mov	DPTR, #0F8AFh
		movx	@DPTR, A
		mov	A, R0
		add	A, #3
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		jc	code_2F9F

code_2F81:				; CODE XREF: RESET_0-BA49j
		clr	RAM_28.4
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD4, #6		; Multiplication/Division Register 4
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R2, MD0		; Multiplication/Division Register 0
		mov	R3, MD1		; Multiplication/Division Register 1
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		jb	RAM_28.4, code_2F81
		mov	A, R3
		jz	code_2FA4

code_2F9F:				; CODE XREF: RESET_0-BA63j
		mov	RPM_1, #0FFh
		sjmp	code_2FA6
; ---------------------------------------------------------------------------

code_2FA4:				; CODE XREF: RESET_0-BA45j
		mov	RPM_1, R2

code_2FA6:				; CODE XREF: RESET_0-BA40j
		mov	DPTR, #613Ch	; Квантование оборотов | Точка квантования - Обороты двигателя
		mov	A, RPM
		movc	A, @A+DPTR
		mov	RPM_RT,	A
		add	A, #4
		swap	A
		rl	A
		anl	A, #1Fh
		mov	RPM_RT_32, A
		mov	A, RPM_RT
		add	A, #8
		anl	A, #0F0h
		swap	A
		mov	B, A		; B-Register
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		add	A, #8
		anl	A, #0F0h
		add	A, B		; B-Register
		mov	RPM_THR_3D_RT, A

code_2FCD:				; CODE XREF: RESET_0-BBBCj
					; RESET_0-BB84j ...
		jnb	RAM_2B.0, code_2FD3
		ljmp	code_3026
; ---------------------------------------------------------------------------

code_2FD3:				; CODE XREF: RESET_0:code_2FCDj
		mov	DPTR, #0F95Bh
		movx	A, @DPTR
		jnb	RAM_29.1, code_2FDE
		inc	A
		jz	code_2FDE
		movx	@DPTR, A

code_2FDE:				; CODE XREF: RESET_0-BA0Bj
					; RESET_0-BA07j
		mov	B, A		; B-Register
		mov	DPTR, #9CC7h	; Максимальное время работы стартера | Время, сек. - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		cjne	A, B, code_2FE9	; B-Register

code_2FE9:
		jnc	code_2FF5
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		clr	ACC.6		; Accumulator
		movx	@DPTR, A
		ljmp	code_3026
; ---------------------------------------------------------------------------

code_2FF5:				; CODE XREF: RESET_0:code_2FE9j
		mov	B, RPM_XX	; B-Register
		mov	DPTR, #9CEEh	; Обороты отключения стартера |	Обороты, об/мин	- Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		cjne	A, B, code_3001	; B-Register

code_3001:
		jc	code_300A
		clr	A
		mov	DPTR, #0F95Ch
		movx	@DPTR, A
		sjmp	code_3026
; ---------------------------------------------------------------------------

code_300A:				; CODE XREF: RESET_0:code_3001j
		mov	DPTR, #0F95Ch
		movx	A, @DPTR
		inc	A
		jz	code_3012
		movx	@DPTR, A

code_3012:				; CODE XREF: RESET_0-B9D3j
		mov	B, A		; B-Register
		mov	DPTR, #9D15h	; Время	работы стартера	после порога откл...  |	Время, сек. - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		cjne	A, B, code_301D	; B-Register

code_301D:
		jnc	code_3026
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		clr	ACC.6		; Accumulator
		movx	@DPTR, A

code_3026:				; CODE XREF: RESET_0-BA12j
					; RESET_0-B9F0j ...
		mov	A, RPM_THR_3D_RT
		mov	DPTR, #7AC7h	; Номер	зоны по	оборотам/дросселю | Зона - Обороты коленвала, об/мин - Положение дросселя,%
		movc	A, @A+DPTR
		mov	C, ACC.4	; Accumulator
		anl	C, /RAM_2C.2
		mov	RAM_26.7, C
		mov	DPTR, #0F933h
		movx	@DPTR, A
		anl	A, #0Fh
		dec	DPL
		;mov	DPTR, #0F932h
		movx	@DPTR, A
		mov	C, RAM_23.5
		orl	C, RAM_24.5
		jnc	code_304E
		mov	R3, GBC_RT
		mov	R2, RPM_RT
		mov	DPTR, #6813h	; Поправка ЦH при аварии ДПДЗ |	Коэффициент коррекции -	Обороты	коленвала, об/мин - Цикловое наполнение,мг/цикл
		lcall	GET_3D_VALUE
		sjmp	code_305D
; ---------------------------------------------------------------------------

code_304E:				; CODE XREF: RESET_0-B9A2j
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		mov	R3, A
		mov	R2, RPM_RT
		
		; Поправка циклового наполнения	| Коэффициент коррекции	- Обороты коленвала, об/мин - Положение	дросселя,%
		GET_3D_RAM_WITH_INTERPOLATION 7CF7h, CAPTURE_KGBC_MODE

code_305D:				; CODE XREF: RESET_0-B996j
		mov	DPTR, #0F945h
		movx	@DPTR, A
		mov	DPTR, #0FAA2h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	R2, RPM_RT
		mov	DPTR, #0F87Dh
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #852Fh	; Динамическая коррекция GTC по	оборотам и ТОЖ 1 | Коэффициент коррекции - Обороты коленвала, об/мин - Температура ОЖ, градусов
		jb	B.0, code_307B	; B-Register
		mov	DPTR, #736Dh	; Динамическая коррекция GTC по	оборотам и ТОЖ 2 | Коэффициент коррекции - Обороты коленвала, об/мин - Температура ОЖ, градусов
code_307B:				; CODE XREF: RESET_0-B96Cj
		lcall	GET_3D_VALUE
		mov	B, A		; B-Register
		mov	DPTR, #0F89Dh
		movx	A, @DPTR
		mov	R1, A
		mov	R0, #0
		mov	A, B		; B-Register
		lcall	code_AD03
		mov	R2, A
		mov	DPTR, #0FAA2h
		movx	A, @DPTR
		mov	DPTR, #0FAA3h
		jb	ACC.0, code_309B ; Accumulator
		mov	DPTR, #0FAA4h

code_309B:				; CODE XREF: RESET_0-B951j
		mov	A, R2
		movx	@DPTR, A

code_30A0:				; CODE XREF: RESET_0-B949j
		mov	DPTR, #5F01h
		clr	A
		movc	A, @A+DPTR
		jnb	ACC.5, code_30AB ; Accumulator
		ljmp	code_372E
; ---------------------------------------------------------------------------

code_30AB:				; CODE XREF: RESET_0-B93Dj
		mov	DPTR, #9822h
		clr	A
		movc	A, @A+DPTR
		cjne	A, RPM,	code_30B3

code_30B3:
		jc	code_30BC
		mov	B, #0		; B-Register
		mov	A, #0
		sjmp	code_30FD
; ---------------------------------------------------------------------------

code_30BC:				; CODE XREF: RESET_0:code_30B3j
		mov	A, #1
		movc	A, @A+DPTR
		cjne	A, RPM,	code_30C2

code_30C2:
		jc	code_30CB
		mov	B, #1		; B-Register
		mov	A, #2
		sjmp	code_30FD
; ---------------------------------------------------------------------------

code_30CB:				; CODE XREF: RESET_0:code_30C2j
		mov	A, #2
		movc	A, @A+DPTR
		cjne	A, RPM,	code_30D1

code_30D1:
		jc	code_30DA
		mov	B, #2		; B-Register
		mov	A, #4
		sjmp	code_30FD
; ---------------------------------------------------------------------------

code_30DA:				; CODE XREF: RESET_0:code_30D1j
		mov	A, #3
		movc	A, @A+DPTR
		cjne	A, RPM,	code_30E0

code_30E0:
		jc	code_30E9
		mov	B, #4		; B-Register
		mov	A, #6
		sjmp	code_30FD
; ---------------------------------------------------------------------------

code_30E9:				; CODE XREF: RESET_0:code_30E0j
		mov	A, #4
		movc	A, @A+DPTR
		cjne	A, RPM,	code_30EF

code_30EF:
		jc	code_30F8
		mov	B, #8		; B-Register
		mov	A, #8
		sjmp	code_30FD
; ---------------------------------------------------------------------------

code_30F8:				; CODE XREF: RESET_0:code_30EFj
		mov	A, #0Ah
		mov	B, #10h		; B-Register

code_30FD:				; CODE XREF: RESET_0-B928j
					; RESET_0-B919j ...
		mov	DPTR, #0F940h
		movx	@DPTR, A
		mov	A, B		; B-Register
		mov	DPTR, #0F941h
		movx	@DPTR, A
		anl	A, #0Fh
		jz	code_3123
		mov	DPTR, #0F942h
		movx	A, @DPTR
		jnb	ACC.0, code_3123 ; Accumulator
		jnb	ACC.1, code_3123 ; Accumulator
		jnb	ACC.2, code_3123 ; Accumulator
		jnb	ACC.3, code_3123 ; Accumulator
		mov	DPTR, #0F93Eh
		movx	A, @DPTR
		setb	ACC.0		; Accumulator
		sjmp	code_3129
; ---------------------------------------------------------------------------

code_3123:				; CODE XREF: RESET_0-B8D9j
					; RESET_0-B8D3j ...
		mov	DPTR, #0F93Eh
		movx	A, @DPTR
		clr	ACC.0		; Accumulator

code_3129:				; CODE XREF: RESET_0-B8C1j
		movx	@DPTR, A
		mov	DPTR, #9694h	; Начальный порог неравномерности 1 | Нестабильность, 1/сек^2 -	Обороты, об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	DPTR, #0F94Eh
		movx	@DPTR, A
		mov	DPTR, #96B4h	; Начальный порог неравномерности 2 | Нестабильность, 1/сек^2 -	Обороты, об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	DPTR, #0F94Fh
		movx	@DPTR, A
		mov	DPTR, #0F942h
		movx	A, @DPTR
		mov	B, A		; B-Register
		jb	ACC.0, code_3152 ; Accumulator
		mov	DPTR, #0F94Fh
		movx	A, @DPTR
		ljmp	code_319E
; ---------------------------------------------------------------------------

code_3152:				; CODE XREF: RESET_0-B89Ej
		mov	DPTR, #0F941h
		movx	A, @DPTR
		anl	A, #1Fh
		jnz	code_315E
		clr	A
		ljmp	code_319E
; ---------------------------------------------------------------------------

code_315E:				; CODE XREF: RESET_0-B88Aj
		jnb	ACC.0, code_3165 ; Accumulator
		clr	A
		ljmp	code_319E
; ---------------------------------------------------------------------------

code_3165:				; CODE XREF: RESET_0:code_315Ej
		jnb	ACC.1, code_3176 ; Accumulator
		jnb	B.1, code_316F	; B-Register
		clr	A
		ljmp	code_319E
; ---------------------------------------------------------------------------

code_316F:				; CODE XREF: RESET_0-B87Aj
		mov	DPTR, #0F94Eh
		movx	A, @DPTR
		ljmp	code_319E
; ---------------------------------------------------------------------------

code_3176:				; CODE XREF: RESET_0:code_3165j
		jnb	ACC.2, code_3185 ; Accumulator
		jnb	B.2, code_317F	; B-Register
		clr	A
		sjmp	code_319E
; ---------------------------------------------------------------------------

code_317F:				; CODE XREF: RESET_0-B869j
		mov	DPTR, #0F94Eh
		movx	A, @DPTR
		sjmp	code_319E
; ---------------------------------------------------------------------------

code_3185:				; CODE XREF: RESET_0:code_3176j
		jnb	ACC.3, code_3194 ; Accumulator
		jnb	B.3, code_318E	; B-Register
		clr	A
		sjmp	code_319E
; ---------------------------------------------------------------------------

code_318E:				; CODE XREF: RESET_0-B85Aj
		mov	DPTR, #0F94Eh
		movx	A, @DPTR
		sjmp	code_319E
; ---------------------------------------------------------------------------

code_3194:				; CODE XREF: RESET_0:code_3185j
		jnb	B.3, code_319A	; B-Register
		clr	A
		sjmp	code_319E
; ---------------------------------------------------------------------------

code_319A:				; CODE XREF: RESET_0:code_3194j
		mov	DPTR, #0F94Eh
		movx	A, @DPTR

code_319E:				; CODE XREF: RESET_0-B893j
					; RESET_0-B887j ...
		mov	DPTR, #0F94Dh
		movx	@DPTR, A
		mov	DPTR, #0F942h
		movx	A, @DPTR
		jb	ACC.0, code_31CF ; Accumulator
		clr	A
		mov	DPTR, #0FA69h
		movx	@DPTR, A
		mov	DPTR, #0FA6Bh
		movx	@DPTR, A
		mov	DPTR, #0FA6Dh
		movx	@DPTR, A
		mov	DPTR, #0FA6Fh
		movx	@DPTR, A
		mov	A, #80h	; 'А'
		mov	DPTR, #0FA6Ah
		movx	@DPTR, A
		mov	DPTR, #0FA6Ch
		movx	@DPTR, A
		mov	DPTR, #0FA6Eh
		movx	@DPTR, A
		mov	DPTR, #0FA70h
		movx	@DPTR, A
		ljmp	code_330D
; ---------------------------------------------------------------------------

code_31CF:				; CODE XREF: RESET_0-B83Cj
		mov	DPTR, #0FA59h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0FA69h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F942h
		movx	A, @DPTR
		jnb	ACC.1, code_3233 ; Accumulator
		mov	DPTR, #0FA5Bh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0FA59h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		lcall	code_AE09
		mov	DPTR, #60FCh
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #0FA5Bh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		jc	code_323C
		mov	DPTR, #0F942h
		movx	A, @DPTR
		clr	ACC.1		; Accumulator
		movx	@DPTR, A
		mov	DPTR, #5FD0h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA63h
		movx	@DPTR, A
		mov	DPTR, #5FD1h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA64h
		movx	@DPTR, A

code_3233:				; CODE XREF: RESET_0-B7FDj
		mov	DPTR, #0FA59h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A

code_323C:				; CODE XREF: RESET_0-B7CAj
		mov	DPTR, #0FA6Bh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F942h
		movx	A, @DPTR
		jnb	ACC.2, code_3297 ; Accumulator
		mov	DPTR, #0FA5Dh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0FA59h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		lcall	code_AE09
		mov	DPTR, #60FCh
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #60FDh
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #0FA5Dh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		jc	code_32A0
		mov	DPTR, #0F942h
		movx	A, @DPTR
		clr	ACC.2		; Accumulator
		movx	@DPTR, A
		mov	DPTR, #5FD0h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA65h
		movx	@DPTR, A
		mov	DPTR, #5FD1h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA66h
		movx	@DPTR, A

code_3297:				; CODE XREF: RESET_0-B799j
		mov	DPTR, #0FA59h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A

code_32A0:				; CODE XREF: RESET_0-B766j
		mov	DPTR, #0FA6Dh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F942h
		movx	A, @DPTR
		jnb	ACC.3, code_32FB ; Accumulator
		mov	DPTR, #0FA5Fh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0FA59h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		lcall	code_AE09
		mov	DPTR, #60FCh
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #60FDh
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #0FA5Fh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		jc	code_3304
		mov	DPTR, #0F942h
		movx	A, @DPTR
		clr	ACC.3		; Accumulator
		movx	@DPTR, A
		mov	DPTR, #5FD0h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA67h
		movx	@DPTR, A
		mov	DPTR, #5FD1h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA68h
		movx	@DPTR, A

code_32FB:				; CODE XREF: RESET_0-B735j
		mov	DPTR, #0FA59h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A

code_3304:				; CODE XREF: RESET_0-B702j
		mov	DPTR, #0FA6Fh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A

code_330D:				; CODE XREF: RESET_0-B816j
		mov	A, RPM
		cjne	A, #80h, code_3312 ; 'А'

code_3312:
		jc	code_3316
		mov	A, #7Fh	; ''

code_3316:				; CODE XREF: RESET_0:code_3312j
		mov	DPTR, #9827h	; Зона детектора от оборотов | Hомер зоны - Обороты, об/мин
		movc	A, @A+DPTR
		mov	DPTR, #0F93Fh
		movx	@DPTR, A
		swap	A
		anl	A, #0Fh
		mov	B, A		; B-Register
		mov	DPTR, #0FA69h
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		jnc	code_3340
		ljmp	code_336D
; ---------------------------------------------------------------------------

code_3340:				; CODE XREF: RESET_0-B6A7j
		mov	DPTR, #0F93Fh
		movx	A, @DPTR
		swap	A
		anl	A, #0F0h
		mov	MD0, A		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, #0		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	A, MD0		; Multiplication/Division Register 0
		mov	R0, MD1		; Multiplication/Division Register 1
		mov	R1, MD2		; Multiplication/Division Register 2
		mov	B, MD3		; Multiplication/Division Register 3
		add	A, #80h	; 'А'
		mov	A, R0
		addc	A, #0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		lcall	ADD_R0R1_R2R3
		ljmp	code_339D
; ---------------------------------------------------------------------------

code_336D:				; CODE XREF: RESET_0-B6A5j
		lcall	code_AD70
		mov	DPTR, #0F93Fh
		movx	A, @DPTR
		swap	A
		anl	A, #0F0h
		mov	MD0, A		; Multiplication/Division Register 0
		mov	MD4, R0		; Multiplication/Division Register 4
		mov	MD1, #0		; Multiplication/Division Register 1
		mov	MD5, R1		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	A, MD0		; Multiplication/Division Register 0
		mov	R0, MD1		; Multiplication/Division Register 1
		mov	R1, MD2		; Multiplication/Division Register 2
		mov	B, MD3		; Multiplication/Division Register 3
		add	A, #80h	; 'А'
		mov	A, R0
		addc	A, #0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		lcall	code_AD70

code_339D:				; CODE XREF: RESET_0-B678j
		mov	DPTR, #5FEAh
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	R3, A
		lcall	code_AD29
		mov	DPTR, #5FECh
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	R3, A
		lcall	code_AD35
		mov	DPTR, #0FA2Dh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F93Dh
		movx	A, @DPTR
		mov	R4, A
		mov	DPTR, #5FD2h	; Нижний порог диагностики пропусков по	RPM | об/мин
		clr	A
		movc	A, @A+DPTR
		cjne	A, RPM,	code_33D1

code_33D1:
		mov	A, R4
		mov	ACC.0, C	; Accumulator
		mov	R4, A
		mov	DPTR, #5FD3h	; Верхний порог	диагностики пропусков по RPM | об/мин
		clr	A
		movc	A, @A+DPTR
		cjne	A, RPM,	code_33DD

code_33DD:
		cpl	C
		mov	A, R4
		mov	ACC.1, C	; Accumulator
		mov	R4, A
		mov	DPTR, #5FD6h	; Стационарность по GBC	|
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9BDh
		movx	A, @DPTR
		cjne	A, B, code_33F0	; B-Register

code_33F0:
		mov	A, R4
		mov	ACC.2, C	; Accumulator
		mov	R4, A
		mov	DPTR, #5FD5h	; Стационарность по RPM	| об/мин/цикл
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FA74h
		movx	A, @DPTR
		cjne	A, B, code_3402	; B-Register

code_3402:
		mov	A, R4
		mov	ACC.3, C	; Accumulator
		mov	R4, A
		mov	DPTR, #9BA7h	; Порог	по GBC | Порог - Обороты коленвала, об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F82Eh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	DIV_R0R1_8
		mov	A, R1
		jz	code_341F
		mov	R0, #0FFh

code_341F:				; CODE XREF: RESET_0-B5C7j
		mov	A, R0
		cjne	A, B, code_3423	; B-Register

code_3423:
		cpl	C
		mov	A, R4
		mov	ACC.4, C	; Accumulator
		mov	C, RAM_2B.3
		cpl	C
		mov	ACC.5, C	; Accumulator
		mov	R4, A
		mov	DPTR, #5FD7h	; Задержка диагностики после пуска | сек
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9D4h
		movx	A, @DPTR
		cjne	A, B, code_343B	; B-Register

code_343B:
		cpl	C
		mov	A, R4
		mov	ACC.6, C	; Accumulator
		mov	R4, A
		anl	A, #7Fh
		cjne	A, #7Fh, code_3463 ; ''
		mov	DPTR, #0FA75h
		movx	A, @DPTR
		inc	A
		jnz	code_344D
		dec	A

code_344D:				; CODE XREF: RESET_0-B598j
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	A, R4
		jnb	ACC.7, code_346F ; Accumulator
		mov	DPTR, #5FDBh
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_345C	; B-Register

code_345C:
		jnc	code_346F
		mov	A, R4
		clr	ACC.7		; Accumulator
		sjmp	code_346B
; ---------------------------------------------------------------------------

code_3463:				; CODE XREF: RESET_0-B5A0j
		clr	A
		mov	DPTR, #0FA75h
		movx	@DPTR, A
		mov	A, R4
		setb	ACC.7		; Accumulator

code_346B:				; CODE XREF: RESET_0-B581j
		mov	DPTR, #0F93Dh
		movx	@DPTR, A

code_346F:				; CODE XREF: RESET_0-B591j
					; RESET_0:code_345Cj
		mov	DPTR, #0FAA0h
		movx	A, @DPTR
		mov	R4, A
		mov	DPTR, #5F94h
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_347C

code_347C:
		mov	A, R4
		mov	ACC.0, C	; Accumulator
		mov	R4, A
		mov	DPTR, #5F95h
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_3488

code_3488:
		cpl	C
		mov	A, R4
		mov	ACC.1, C	; Accumulator
		mov	R4, A
		mov	DPTR, #5FFCh
		clr	A
		movc	A, @A+DPTR
		cjne	A, GBC_RT, code_3495

code_3495:
		mov	A, R4
		mov	ACC.2, C	; Accumulator
		mov	R4, A
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		cjne	A, #1, code_34A0

code_34A0:
		mov	A, R4
		mov	ACC.3, C	; Accumulator
		mov	R4, A
		mov	C, RAM_2B.3
		cpl	C
		mov	ACC.4, C	; Accumulator
		mov	R4, A
		mov	DPTR, #0F93Dh
		movx	A, @DPTR
		mov	C, ACC.1	; Accumulator
		mov	A, R4
		mov	ACC.5, C	; Accumulator
		anl	A, #3Fh
		cjne	A, #3Fh, code_34B8 ; '?'

code_34B8:
		cpl	C
		mov	ACC.7, C	; Accumulator
		mov	DPTR, #0FAA0h
		movx	@DPTR, A
		mov	R2, RPM_RT
		mov	R3, GBC_RT
		mov	DPTR, #9BC7h	; Hеравномерность от режима | Коэффициент неравномерности - Обороты коленвала, об/мин -	Цикловое наполнение,мг/цикл
		lcall	GET_3D_VALUE
		mov	DPTR, #0F8CEh
		movx	@DPTR, A
		jnb	RAM_2A.6, code_34D8
		mov	DPTR, #0FAA1h
		movx	A, @DPTR
		anl	A, #4
		jz	code_34DB

code_34D8:				; CODE XREF: RESET_0-B515j
		ljmp	code_372E
; ---------------------------------------------------------------------------

code_34DB:				; CODE XREF: RESET_0-B50Cj
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		mov	B, A		; B-Register
		anl	A, #1
		jz	code_34E7
		sjmp	code_34EA
; ---------------------------------------------------------------------------

code_34E7:				; CODE XREF: RESET_0-B4FFj
		ljmp	code_3686
; ---------------------------------------------------------------------------

code_34EA:				; CODE XREF: RESET_0-B4FDj
		mov	A, B		; B-Register
		anl	A, #0FEh
		movx	@DPTR, A
		mov	DPTR, #0FA83h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	DIV_R0R1_4
		mov	A, R0
		mov	DPTR, #0FA85h
		movx	@DPTR, A
		mov	A, R1
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #0FA83h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #5FDCh	; Порог	1 детектора (общая неравномерность) |
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		clr	A
		inc	DPTR
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jc	code_3526
		mov	DPTR, #0FAA1h
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A
		clr	RAM_2B.4
		sjmp	code_3560
; ---------------------------------------------------------------------------

code_3526:				; CODE XREF: RESET_0-B4C9j
		mov	DPTR, #0FAA1h
		movx	A, @DPTR
		anl	A, #0FDh
		movx	@DPTR, A
		setb	RAM_2B.4
		mov	DPTR, #0FA87h
		movx	A, @DPTR
		jz	code_3537
		dec	A
		movx	@DPTR, A

code_3537:				; CODE XREF: RESET_0-B4AFj
		mov	DPTR, #0FA88h
		movx	A, @DPTR
		jz	code_353F
		dec	A
		movx	@DPTR, A

code_353F:				; CODE XREF: RESET_0-B4A7j
		mov	DPTR, #0FA89h
		movx	A, @DPTR
		jz	code_3547
		dec	A
		movx	@DPTR, A

code_3547:				; CODE XREF: RESET_0-B49Fj
		mov	DPTR, #0FA8Ah
		movx	A, @DPTR
		jz	code_354F
		dec	A
		movx	@DPTR, A

code_354F:				; CODE XREF: RESET_0-B497j
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		anl	A, #1Fh
		movx	@DPTR, A
		mov	DPTR, #0FAA1h
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A
		ljmp	code_362F
; ---------------------------------------------------------------------------

code_3560:				; CODE XREF: RESET_0-B4BEj
		mov	DPTR, #0FA79h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #5FDEh	; Порог	2 детектора (по	каждому	цилиндру) |
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		clr	A
		inc	DPTR
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jc	code_3580
		mov	DPTR, #0FA87h
		movx	A, @DPTR
		inc	A
		jz	code_3580
		movx	@DPTR, A

code_3580:				; CODE XREF: RESET_0-B46Cj
					; RESET_0-B465j
		mov	DPTR, #0FA7Bh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		jc	code_3596
		mov	DPTR, #0FA88h
		movx	A, @DPTR
		inc	A
		jz	code_3596
		movx	@DPTR, A

code_3596:				; CODE XREF: RESET_0-B456j
					; RESET_0-B44Fj
		mov	DPTR, #0FA7Dh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		jc	code_35AC
		mov	DPTR, #0FA89h
		movx	A, @DPTR
		inc	A
		jz	code_35AC
		movx	@DPTR, A

code_35AC:				; CODE XREF: RESET_0-B440j
					; RESET_0-B439j
		mov	DPTR, #0FA7Fh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		jc	code_35C2
		mov	DPTR, #0FA8Ah
		movx	A, @DPTR
		inc	A
		jz	code_35C2
		movx	@DPTR, A

code_35C2:				; CODE XREF: RESET_0-B42Aj
					; RESET_0-B423j
		mov	DPTR, #0FA85h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #0FA79h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		jc	code_35E1
		orl	A, #20h
		sjmp	code_35E3
; ---------------------------------------------------------------------------

code_35E1:				; CODE XREF: RESET_0-B407j
		anl	A, #0DFh

code_35E3:				; CODE XREF: RESET_0-B403j
		movx	@DPTR, A
		mov	DPTR, #0FA7Bh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		jc	code_35FA
		orl	A, #40h
		sjmp	code_35FC
; ---------------------------------------------------------------------------

code_35FA:				; CODE XREF: RESET_0-B3EEj
		anl	A, #0BFh

code_35FC:				; CODE XREF: RESET_0-B3EAj
		movx	@DPTR, A
		mov	DPTR, #0FA7Dh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		jc	code_3613
		orl	A, #80h
		sjmp	code_3615
; ---------------------------------------------------------------------------

code_3613:				; CODE XREF: RESET_0-B3D5j
		anl	A, #7Fh

code_3615:				; CODE XREF: RESET_0-B3D1j
		movx	@DPTR, A
		mov	DPTR, #0FA7Fh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	SUB_R0R1_R2R3
		mov	DPTR, #0FAA1h
		movx	A, @DPTR
		jc	code_362C
		orl	A, #1
		sjmp	code_362E
; ---------------------------------------------------------------------------

code_362C:				; CODE XREF: RESET_0-B3BCj
		anl	A, #0FEh

code_362E:				; CODE XREF: RESET_0-B3B8j
		movx	@DPTR, A

code_362F:				; CODE XREF: RESET_0-B485j
		mov	DPTR, #5FE0h	; Циклов с пропусками до отключения цилиндра |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FA87h
		movx	A, @DPTR
		cjne	A, B, code_363D	; B-Register

code_363D:
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		jc	code_3647
		orl	A, #2
		sjmp	code_3649
; ---------------------------------------------------------------------------

code_3647:				; CODE XREF: RESET_0-B3A1j
		anl	A, #0FDh

code_3649:				; CODE XREF: RESET_0-B39Dj
		movx	@DPTR, A
		mov	DPTR, #0FA88h
		movx	A, @DPTR
		cjne	A, B, code_3651	; B-Register

code_3651:
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		jc	code_365B
		orl	A, #4
		sjmp	code_365D
; ---------------------------------------------------------------------------

code_365B:				; CODE XREF: RESET_0-B38Dj
		anl	A, #0FBh

code_365D:				; CODE XREF: RESET_0-B389j
		movx	@DPTR, A
		mov	DPTR, #0FA89h
		movx	A, @DPTR
		cjne	A, B, code_3665	; B-Register

code_3665:
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		jc	code_366F
		orl	A, #8
		sjmp	code_3671
; ---------------------------------------------------------------------------

code_366F:				; CODE XREF: RESET_0-B379j
		anl	A, #0F7h

code_3671:				; CODE XREF: RESET_0-B375j
		movx	@DPTR, A
		mov	DPTR, #0FA8Ah
		movx	A, @DPTR
		cjne	A, B, code_3679	; B-Register

code_3679:
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		jc	code_3683
		orl	A, #10h
		sjmp	code_3685
; ---------------------------------------------------------------------------

code_3683:				; CODE XREF: RESET_0-B365j
		anl	A, #0EFh

code_3685:				; CODE XREF: RESET_0-B361j
		movx	@DPTR, A

code_3686:				; CODE XREF: RESET_0:code_34E7j
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		rr	A
		anl	A, #70h
		mov	B, A		; B-Register
		mov	DPTR, #0FAA1h
		movx	A, @DPTR
		mov	C, ACC.0	; Accumulator
		mov	B.7, C		; B-Register
		mov	A, B		; B-Register
		jz	code_36BD
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A
		mov	DPTR, #0F9C6h
		movx	A, @DPTR
		orl	A, B		; B-Register
		jnb	RAM_2A.0, code_36CA
		mov	C, B.4		; B-Register
		orl	C, B.6		; B-Register
		jnc	code_36B3
		orl	A, #50h

code_36B3:				; CODE XREF: RESET_0-B333j
		mov	C, B.5		; B-Register
		orl	C, B.7		; B-Register
		jnc	code_36CA
		orl	A, #0A0h
		sjmp	code_36CA
; ---------------------------------------------------------------------------

code_36BD:				; CODE XREF: RESET_0-B349j
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		anl	A, #7Fh
		movx	@DPTR, A
		mov	DPTR, #0F9C6h
		movx	A, @DPTR
		anl	A, #0Fh

code_36CA:				; CODE XREF: RESET_0-B33Aj
					; RESET_0-B32Bj ...
		movx	@DPTR, A
		mov	DPTR, #0FA82h
		movx	A, @DPTR
		rr	A
		anl	A, #0Fh
		swap	A
		anl	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #0FAA1h
		movx	A, @DPTR
		anl	A, #0Fh
		orl	A, B		; B-Register
		mov	B, A		; B-Register
		jz	code_36FA
		jnb	RAM_2A.0, code_36FA
		rlc	A
		jnc	code_36EB
		setb	B.5		; B-Register

code_36EB:				; CODE XREF: RESET_0-B2FBj
		rlc	A
		jnc	code_36F0
		setb	B.4		; B-Register

code_36F0:				; CODE XREF: RESET_0-B2F6j
		rlc	A
		jnc	code_36F5
		setb	B.7		; B-Register

code_36F5:				; CODE XREF: RESET_0-B2F1j
		rlc	A
		jnc	code_36FA
		setb	B.6		; B-Register

code_36FA:				; CODE XREF: RESET_0-B301j
					; RESET_0-B2FFj ...
		mov	DPTR, #0FAA1h
		movx	A, @DPTR
		anl	A, #0Fh
		orl	A, B		; B-Register
		movx	@DPTR, A
		swap	A
		anl	A, #0Fh
		mov	B, #0		; B-Register
		rrc	A
		jnc	code_370E
		setb	B.0		; B-Register

code_370E:				; CODE XREF: RESET_0-B2D8j
		rrc	A
		jnc	code_3713
		setb	B.2		; B-Register

code_3713:				; CODE XREF: RESET_0-B2D3j
		rrc	A
		jnc	code_3718
		setb	B.3		; B-Register

code_3718:				; CODE XREF: RESET_0-B2CEj
		rrc	A
		jnc	code_371D
		setb	B.1		; B-Register

code_371D:				; CODE XREF: RESET_0-B2C9j
		mov	A, RAM_7C
		orl	A, B		; B-Register
		mov	RAM_7C,	A
		mov	A, B		; B-Register
		jz	code_372E
		mov	DPTR, #0FAA1h
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A

code_372E:				; CODE XREF: RESET_0-B93Aj
					; RESET_0:code_34D8j ...
		mov	B, #4		; B-Register
		lcall	code_A5A0
		mov	DPTR, #0F80Bh
		movx	@DPTR, A
		mov	DPTR, #0F813h
		lcall	code_AF6E
		mov	B, #8		; B-Register
		lcall	code_A5A0
		mov	DPTR, #0F80Eh
		movx	@DPTR, A
		mov	DPTR, #0F819h
		lcall	code_AF6E
		mov	B, #0		; B-Register
		lcall	code_A5A0
		mov	DPTR, #0F80Dh
		movx	@DPTR, A
		mov	R0, A
		mov	DPTR, #60CAh	; Напряжение отключения	питания	| В
		clr	A
		movc	A, @A+DPTR
		cjne	A, RAM_0, code_3761

code_3761:
		jc	code_3781
		jb	RAM_29.4, code_379B
		mov	DPTR, #5FF1h	; Задержка отключения питания |	c
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FA8Dh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_3776	; B-Register

code_3776:
		jc	code_379B
		setb	RAM_29.4
		clr	A
		mov	DPTR, #0F87Ch
		movx	@DPTR, A
		sjmp	code_379B
; ---------------------------------------------------------------------------

code_3781:				; CODE XREF: RESET_0:code_3761j
		jnb	RAM_29.4, code_3794
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		setb	ACC.6		; Accumulator
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F95Bh
		movx	@DPTR, A
		mov	DPTR, #0F95Ch
		movx	@DPTR, A

code_3794:				; CODE XREF: RESET_0:code_3781j
		clr	RAM_29.4
		clr	A
		mov	DPTR, #0FA8Dh
		movx	@DPTR, A

code_379B:				; CODE XREF: RESET_0-B27Fj
					; RESET_0:code_3776j ...
		mov	DPTR, #5F6Eh	; Коэффициент динамической коррекции UACC |
		clr	A
		movc	A, @A+DPTR
		cpl	A
		inc	A
		mov	B, A		; B-Register
		mov	DPTR, #0F950h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	MUL_R0R1_B
		mov	DPTR, #5F6Eh	; Коэффициент динамической коррекции UACC |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F80Dh
		movx	A, @DPTR
		mul	AB
		mov	R2, A
		mov	R3, B		; B-Register
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0F950h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #60BAh	; Минимальное напряжение бортовой сети | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		cjne	A, B, code_37D6	; B-Register

code_37D6:
		jc	code_37F2
		mov	DPTR, #60BBh	; Максимальное напряжение бортовой сети	| В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		cjne	A, B, code_37E3	; B-Register

code_37E3:
		jnc	code_3815
		clr	RAM_23.0
		clr	RAM_24.0
		clr	A
		mov	DPTR, #0F9C3h
		movx	@DPTR, A
		mov	RAM_4B,	R1
		sjmp	code_3851
; ---------------------------------------------------------------------------

code_37F2:				; CODE XREF: RESET_0:code_37D6j
		jb	RAM_29.4, code_3833
		jb	RAM_23.0, code_3833
		mov	DPTR, #5FAFh	; Период диагностики уровня борт. напряжения | циклов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9C3h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_3808	; B-Register

code_3808:
		jc	code_3833
		setb	RAM_23.0
		clr	RAM_24.0
		clr	A
		mov	DPTR, #0F9C3h
		movx	@DPTR, A
		sjmp	code_3833
; ---------------------------------------------------------------------------

code_3815:				; CODE XREF: RESET_0:code_37E3j
		jb	RAM_24.0, code_3833
		mov	DPTR, #5FAFh	; Период диагностики уровня борт. напряжения | циклов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9C3h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_3828	; B-Register

code_3828:
		jc	code_3833
		clr	RAM_23.0
		setb	RAM_24.0
		clr	A
		mov	DPTR, #0F9C3h
		movx	@DPTR, A

code_3833:				; CODE XREF: RESET_0:code_37F2j
					; RESET_0-B1EDj ...
		mov	DPTR, #60BEh	; Граничные обороты выбора напряжения при ошибке | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, RPM
		cjne	A, B, code_383F	; B-Register

code_383F:
		jnc	code_384A
		mov	DPTR, #60BFh	; Напряжение 1 бортовой	сети при ошибке	| В
		clr	A
		movc	A, @A+DPTR
		mov	RAM_4B,	A
		sjmp	code_3851
; ---------------------------------------------------------------------------

code_384A:				; CODE XREF: RESET_0:code_383Fj
		mov	DPTR, #60C0h	; Напряжение 2 бортовой	сети при ошибке	| В
		clr	A
		movc	A, @A+DPTR
		mov	RAM_4B,	A

code_3851:				; CODE XREF: RESET_0-B1F2j
					; RESET_0-B19Aj
		mov	DPTR, #60BCh	; Смещение при квантовании напряжения |	В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, RAM_4B
		clr	C
		subb	A, B		; B-Register
		jnc	code_3860
		clr	A

code_3860:				; CODE XREF: RESET_0-B185j
		mov	B, A		; B-Register
		mov	DPTR, #60BDh	; Коэффициент квантования напряжения | В
		clr	A
		movc	A, @A+DPTR
		mul	AB
		jnb	B.7, code_386F	; B-Register
		mov	A, #0FFh
		sjmp	code_3873
; ---------------------------------------------------------------------------

code_386F:				; CODE XREF: RESET_0-B17Aj
		rlc	A
		mov	A, B		; B-Register
		rlc	A

code_3873:				; CODE XREF: RESET_0-B175j
		mov	DPTR, #0F978h
		movx	@DPTR, A
		mov	DPTR, #71D8h	; Динамическая производительность форсунки | Добавочное	время впрыска -	Бортовое напряжение
		lcall	code_AFA0
		mov	RAM_50,	A
		mov	DPTR, #0F850h
		movx	@DPTR, A
		mov	B, #1		; B-Register
		lcall	code_A5A0
		mov	DPTR, #0F8A9h
		movx	@DPTR, A
		mov	DPTR, #0F81Dh
		lcall	code_AF6E
		mov	DPTR, #0F812h
		movx	A, @DPTR
		jnz	code_38A5
		mov	A, B		; B-Register
		mov	DPTR, #0F825h
		movx	@DPTR, A
		mov	DPTR, #0F826h
		movx	@DPTR, A
		sjmp	code_38C5
; ---------------------------------------------------------------------------

code_38A5:				; CODE XREF: RESET_0-B14Bj
		mov	DPTR, #0F825h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_38B6
		mov	A, B		; B-Register
		mov	DPTR, #0F825h
		movx	@DPTR, A
		sjmp	code_38C5
; ---------------------------------------------------------------------------

code_38B6:				; CODE XREF: RESET_0-B136j
		mov	DPTR, #0F826h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_38C5
		mov	A, B		; B-Register
		mov	DPTR, #0F826h
		movx	@DPTR, A

code_38C5:				; CODE XREF: RESET_0-B13Fj
					; RESET_0-B12Ej ...
		mov	DPTR, #0F812h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, #20h, code_38D2 ; ' '
		clr	A
		movx	@DPTR, A
		sjmp	code_38D5
; ---------------------------------------------------------------------------

code_38D2:				; CODE XREF: RESET_0-B117j
		ljmp	code_3B2A
; ---------------------------------------------------------------------------

code_38D5:				; CODE XREF: RESET_0-B112j
		mov	A, DEV_FLAGS
		anl	A, #80h
		jz	code_38DE
		ljmp	code_3989
; ---------------------------------------------------------------------------

code_38DE:				; CODE XREF: RESET_0-B109j
		mov	DPTR, #0F813h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	code_AD94
		mov	A, R0
		add	A, #80h	; 'А'
		mov	A, R1
		addc	A, #0
		mov	R1, A
		mov	DPTR, #60B5h	; Задержка контроля температуры	двигателя после	пуска |	сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F873h
		movx	A, @DPTR
		cjne	A, B, code_38FF	; B-Register

code_38FF:
		jc	code_391B
		mov	DPTR, #60B1h	; Мин. напряжение АЦП ДТОЖ для диагностики | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		cjne	A, B, code_390C	; B-Register

code_390C:
		jc	code_396E
		mov	DPTR, #60B2h	; Макс.	напряжение АЦП ДТОЖ для	диагностики | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		cjne	A, B, code_3919	; B-Register

code_3919:
		jnc	code_3974

code_391B:				; CODE XREF: RESET_0:code_38FFj
		mov	A, R1
		swap	A
		rl	A
		anl	A, #0E0h
		mov	R3, A
		mov	A, R1
		rr	A
		rr	A
		rr	A
		anl	A, #1Fh
		mov	R2, A
		mov	DPTR, #6104h	; Тарировка ДТОЖ | Температура,	град.С - Напряжение АЦП	ДТОЖ
		lcall	GET_2D_INTERPOLATION
		clr	C
		subb	A, #14h
		jnc	code_3935
		mov	A, #0

code_3935:				; CODE XREF: RESET_0-B0B1j
		mov	TWAT, A
		mov	DPTR, #0F9C8h
		movx	@DPTR, A
		clr	RAM_23.3
		clr	RAM_24.3
		mov	B, A		; B-Register
		mov	DPTR, #0F9C9h
		movx	A, @DPTR
		jnz	code_3989
		mov	DPTR, #5FB6h
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_394F	; B-Register

code_394F:
		jnc	code_3989
		mov	DPTR, #0F9C7h
		movx	A, @DPTR
		xch	A, B		; B-Register
		clr	C
		subb	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #5FB5h
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_3964	; B-Register

code_3964:
		jnc	code_3989
		mov	A, #1
		mov	DPTR, #0F9C9h
		movx	@DPTR, A
		sjmp	code_3989
; ---------------------------------------------------------------------------

code_396E:				; CODE XREF: RESET_0:code_390Cj
		setb	RAM_23.3
		clr	RAM_24.3
		sjmp	code_3978
; ---------------------------------------------------------------------------

code_3974:				; CODE XREF: RESET_0:code_3919j
		clr	RAM_23.3
		setb	RAM_24.3

code_3978:				; CODE XREF: RESET_0-B070j
		mov	DPTR, #0F8ACh
		movx	A, @DPTR
		anl	A, #0F0h
		swap	A
		mov	B, A		; B-Register
		mov	DPTR, #7DF7h	; Расчетная температура	при аварии ДТОЖ	| Температура, град.С -	Время работы двигателя,	сек.
		mov	A, B		; B-Register
		movc	A, @A+DPTR
		mov	TWAT, A

code_3989:				; CODE XREF: RESET_0-B107j
					; RESET_0-B09Dj ...
		mov	A, TWAT
		add	A, #2
		mov	B, #5		; B-Register
		div	AB
		cjne	A, #24h, code_3994 ; '$'

code_3994:
		jc	code_3998
		mov	A, #24h	; '$'

code_3998:				; CODE XREF: RESET_0:code_3994j
		mov	TWAT_RT, A
		mov	DPTR, #609Ch	; Коэффициент квантования ДТОЖ |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, TWAT
		mul	AB
		add	A, #40h	; '@'
		jnc	code_39AA
		inc	B		; B-Register

code_39AA:				; CODE XREF: RESET_0-B03Cj
		jnb	B.7, code_39B1	; B-Register
		mov	A, #0F0h ; 'Ё'
		sjmp	code_39BD
; ---------------------------------------------------------------------------

code_39B1:				; CODE XREF: RESET_0:code_39AAj
		mov	C, ACC.7	; Accumulator
		mov	A, B		; B-Register
		rlc	A
		cjne	A, #0F0h, code_39B9 ; 'Ё'

code_39B9:
		jc	code_39BD
		mov	A, #0F0h ; 'Ё'

code_39BD:				; CODE XREF: RESET_0-B033j
					; RESET_0:code_39B9j
		mov	DPTR, #0F87Dh
		movx	@DPTR, A
		swap	A
		anl	A, #0Fh
		mov	DPTR, #0F880h
		movx	@DPTR, A
		mov	A, TWAT
		mov	B, #5		; B-Register
		div	AB
		cjne	A, #24h, code_39D1 ; '$'

code_39D1:
		jc	code_39D5
		mov	A, #24h	; '$'

code_39D5:				; CODE XREF: RESET_0:code_39D1j
		mov	DPTR, #0F887h
		movx	@DPTR, A
		mov	A, B		; B-Register
		mov	B, #33h	; '3'   ; B-Register
		mul	AB
		mov	DPTR, #0F888h
		movx	@DPTR, A
		lcall	code_ED6D
		mov	A, #3
		mov	DPTR, #0F8B0h
		movx	@DPTR, A
		jb	Hardware.4, code_39D6
		jmp		code_3A66

code_39D6:
		mov	DPTR, #0F819h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	code_AD94
		mov	DPTR, #60B8h	; Задержка контроля температуры	воздуха	после пуска | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8ACh
		movx	A, @DPTR
		cjne	A, B, code_3A09	; B-Register

code_3A09:
		jc	code_3A25
		mov	DPTR, #60B6h	; Мин. напряжение АЦП ДТВ для диагностики | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		cjne	A, B, code_3A16	; B-Register

code_3A16:
		jc	code_3A36
		mov	DPTR, #60B7h	; Макс.	напряжение АЦП ДТВ для диагностики | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		cjne	A, B, code_3A23	; B-Register

code_3A23:
		jnc	code_3A3C

code_3A25:				; CODE XREF: RESET_0:code_3A09j
		mov	A, R1
		mov	DPTR, #6126h	; Тарировка ДТВ	| Температура, град.С -	Напряжение АЦП ДТВ
		lcall	code_AF7B
		mov	DPTR, #0F93Bh
		movx	@DPTR, A
		clr	RAM_23.2
		clr	RAM_24.2
		sjmp	code_3A49
; ---------------------------------------------------------------------------

code_3A36:				; CODE XREF: RESET_0:code_3A16j
		setb	RAM_23.2
		clr	RAM_24.2
		sjmp	code_3A40
; ---------------------------------------------------------------------------

code_3A3C:				; CODE XREF: RESET_0:code_3A23j
		clr	RAM_23.2
		setb	RAM_24.2

code_3A40:				; CODE XREF: RESET_0-AFA8j
		mov	DPTR, #60B9h	; Расчетная температура	при аварии ДТВ | град.С
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F93Bh
		movx	@DPTR, A

code_3A49:				; CODE XREF: RESET_0-AFAEj
		mov	DPTR, #0F93Bh
		movx	A, @DPTR
		mov	B, #5		; B-Register
		div	AB
		cjne	A, #24h, code_3A54 ; '$'

code_3A54:
		jc	code_3A58
		mov	A, #24h	; '$'

code_3A58:				; CODE XREF: RESET_0:code_3A54j
		mov	DPTR, #0F931h
		movx	@DPTR, A
		mov		R2, A
		mov	A, B		; B-Register
		mov	B, #33h	; '3'   ; B-Register
		mul	AB
		mov	DPTR, #0F8F1h
		movx	@DPTR, A
		mov		R3, A
		
		mov		DPTR, #8508h
		lcall	GET_2D_INTERPOLATION
		mov		DPTR, #0F8AAh
		movx	@DPTR, A

code_3A66:				; CODE XREF: RESET_0-AFF6j
		mov	DPTR, #0F825h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F826h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #6069h	; Ширина полосы	адаптации ДПДЗ | В
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_3AA8
		mov	DPTR, #0F81Dh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	code_AD94
		mov	A, R0
		add	A, #80h	; 'А'
		mov	A, R1
		addc	A, #0
		mov	R1, A
		mov	DPTR, #0F8B2h
		movx	A, @DPTR
		clr	C
		subb	A, R1
		jc	code_3AA8
		jz	code_3AA8
		mov	A, R1
		inc	A
		mov	DPTR, #0F827h
		movx	@DPTR, A
		mov	DPTR, #0F8B2h
		movx	@DPTR, A
		sjmp	code_3AC8
; ---------------------------------------------------------------------------

code_3AA8:				; CODE XREF: RESET_0-AF65j
					; RESET_0-AF4Aj ...
		jnb	Options.1, code_3AC8
		mov	DPTR, #0F805h
		movx	A, @DPTR
		jnz	code_3AC8
		mov	DPTR, #6067h	; Начальное положение ДПДЗ | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8B2h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_3AC8
		add	A, B		; B-Register
		inc	A
		mov	DPTR, #0F8B2h
		movx	@DPTR, A

code_3AC8:				; CODE XREF: RESET_0-AF3Cj
					; RESET_0:code_3AA8j ...
		mov	DPTR, #606Bh	; Минимальное напряжение ДПДЗ |	В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		clr	C
		subb	A, B		; B-Register
		jc	code_3AF1
		mov	DPTR, #606Ch	; Максимальное напряжение ДПДЗ | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		clr	C
		subb	A, B		; B-Register
		jnc	code_3B0C
		clr	RAM_23.5
		clr	RAM_24.5
		clr	A
		mov	DPTR, #0F995h
		movx	@DPTR, A
		mov	DPTR, #0F996h
		movx	@DPTR, A
		sjmp	code_3B25
; ---------------------------------------------------------------------------

code_3AF1:				; CODE XREF: RESET_0-AF0Fj
		mov	DPTR, #0F995h
		movx	A, @DPTR
		inc	A
		jz	code_3AF9
		movx	@DPTR, A

code_3AF9:				; CODE XREF: RESET_0-AEECj
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #5FF2h	; Период для диагностики ДПДЗ |	циклов
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_3B04	; B-Register

code_3B04:
		jnc	code_3B25
		setb	RAM_23.5
		clr	RAM_24.5
		sjmp	code_3B25
; ---------------------------------------------------------------------------

code_3B0C:				; CODE XREF: RESET_0-AF02j
		mov	DPTR, #0F996h
		movx	A, @DPTR
		inc	A
		jz	code_3B14
		movx	@DPTR, A

code_3B14:				; CODE XREF: RESET_0-AED1j
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #5FF2h	; Период для диагностики ДПДЗ |	циклов
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_3B1F	; B-Register

code_3B1F:
		jnc	code_3B25
		clr	RAM_23.5
		setb	RAM_24.5

code_3B25:				; CODE XREF: RESET_0-AEF3j
					; RESET_0:code_3B04j ...
		lcall	code_B967
		setb	RAM_29.3

code_3B2A:				; CODE XREF: RESET_0:code_38D2j
		jb Options.0, code_3B9A
		jnb	RAM_2A.3, code_3B9A
		jb	RAM_26.6, code_3B9A
		jb	RAM_22.6, code_3B9A
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		jb	ACC.1, code_3B9A ; Accumulator
		jnb	RAM_2D.3, code_3B9A
		mov	DPTR, #0F4E0h
		movx	A, @DPTR
		jnz	code_3B9A
		mov	DPTR, #0F4E8h
		movx	A, @DPTR
		jnz	code_3B9A
		mov	DPTR, #0F9B1h
		movx	A, @DPTR
		jz	code_3B9A
		mov	DPTR, #0F9B3h
		movx	A, @DPTR
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		mov	R1, A
		mov	B, #3		; B-Register
		lcall	code_A5A0
		mov	R3, A
		mov	DPTR, #0F9B1h
		movx	A, @DPTR
		xch	A, R3
		lcall	code_B6AB
		mov	R3, A
		mov	DPTR, #0F9B1h
		movx	@DPTR, A
		mov	A, R2
		mov	DPTR, #0F9B3h
		movx	@DPTR, A
		inc	DPTR
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F9B2h
		movx	A, @DPTR
		clr	C
		subb	A, R3
		jnc	code_3B9A
		mov	DPTR, #0F9B5h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	R3, A
		mov	DPTR, #5FA7h	; Период для диагностики ДПКВ |	сек.
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, R3
		jnc	code_3B9F
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		mov	C, P1.3		; Port 1 (PDIR=0)
		jc	code_3B97
		setb	ACC.3		; Accumulator
		sjmp	code_3B99
; ---------------------------------------------------------------------------

code_3B97:				; CODE XREF: RESET_0-AE51j
		setb	ACC.2		; Accumulator

code_3B99:				; CODE XREF: RESET_0-AE4Dj
		movx	@DPTR, A

code_3B9A:				; CODE XREF: RESET_0:code_3B2Aj
					; RESET_0-AEB5j ...
		clr	A
		mov	DPTR, #0F9B5h
		movx	@DPTR, A

code_3B9F:				; CODE XREF: RESET_0-AE59j
		mov	B, #2		; B-Register
		lcall	code_E7C6
		mov	DPTR, #0FAA8h
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	DPTR, #0F811h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		mov	B, #80h	; 'А'   ; B-Register
		jc	code_3BC4
		mul	AB
		add	A, #80h	; 'А'
		mov	A, B		; B-Register
		addc	A, #0
		cpl	A
		inc	A
		mov	B, A		; B-Register
		sjmp	code_3BCF
; ---------------------------------------------------------------------------

code_3BC4:				; CODE XREF: RESET_0-AE2Dj
		cpl	A
		inc	A
		mul	AB
		add	A, #80h	; 'А'
		mov	A, B		; B-Register
		addc	A, #0
		mov	B, A		; B-Register

code_3BCF:				; CODE XREF: RESET_0-AE20j
		mov	DPTR, #0F811h
		movx	A, @DPTR
		add	A, B		; B-Register
		mov	R0, A
		mov	DPTR, #0F811h
		movx	@DPTR, A
		mov	B, #4		; B-Register
		mul	AB
		mov	DPTR, #0F964h
		movx	@DPTR, A
		jb	RAM_29.7, code_3BF8
		mov	DPTR, #5FE7h	; Напряжение переключения Lean-Rich 2 |	В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		jb	RAM_2C.7, code_3C09
		mov	DPTR, #5FE8h	; Напряжение переключения Rich-Lean 2 |	В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		sjmp	code_3C09
; ---------------------------------------------------------------------------

code_3BF8:				; CODE XREF: RESET_0-AE00j
		mov	DPTR, #609Eh	; Напряжение переключения Rich-Lean | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		jb	RAM_2C.7, code_3C09
		mov	DPTR, #609Fh	; Напряжение переключения Lean-Rich | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_3C09:				; CODE XREF: RESET_0-ADF6j
					; RESET_0-ADECj ...
		mov	A, R0
		clr	C
		subb	A, B		; B-Register
		cpl	C
		mov	RAM_2C.7, C
		jb	Hardware.0, code_3C16
		ljmp	code_3D83
; ---------------------------------------------------------------------------

code_3C16:				; CODE XREF: RESET_0-ADD2j
		jb	RAM_2B.3, code_3C6A
		mov	DPTR, #60D5h	; Мин. напряжение АЦП ДК для диагностики | В
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, R0
		jc	code_3C6A
		jb	RAM_23.4, code_3C67
		jnb	RAM_29.1, code_3C67
		mov	DPTR, #0F810h
		movx	A, @DPTR
		jb	ACC.2, code_3C32 ; Accumulator
		jnb	ACC.1, code_3C49 ; Accumulator

code_3C32:				; CODE XREF: RESET_0-ADB6j
		jnb	RAM_2B.4, code_3C6A
		mov	DPTR, #0F8C3h
		movx	A, @DPTR
		mov	B, A		; B-Register
		inc	A
		movx	@DPTR, A
		mov	DPTR, #5F90h	; Время	для фиксации ошибки ДК | сек.
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_3C45	; B-Register

code_3C45:
		jnc	code_3C67
		sjmp	code_3C5E
; ---------------------------------------------------------------------------

code_3C49:				; CODE XREF: RESET_0-ADB3j
		jnb	RAM_2A.6, code_3C67
		mov	DPTR, #0F8C3h
		movx	A, @DPTR
		mov	B, A		; B-Register
		inc	A
		movx	@DPTR, A
		mov	DPTR, #5FA1h	; Период диагн.	ошибки низкого уровня ДК | циклов
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_3C5C	; B-Register

code_3C5C:
		jnc	code_3C67

code_3C5E:				; CODE XREF: RESET_0-AD9Bj
		setb	RAM_23.4
		mov	DPTR, #0F810h
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A

code_3C67:				; CODE XREF: RESET_0-ADC0j
					; RESET_0-ADBDj ...
		ljmp	code_3D83
; ---------------------------------------------------------------------------

code_3C6A:				; CODE XREF: RESET_0:code_3C16j
					; RESET_0-ADC2j ...
		mov	DPTR, #60D6h	; Макс.	напряжение АЦП ДК для диагностики | В
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, R0
		jnc	code_3CBB
		jb	RAM_24.4, code_3CB8
		jnb	RAM_29.1, code_3CB8
		mov	DPTR, #0F810h
		movx	A, @DPTR
		jb	ACC.2, code_3C83 ; Accumulator
		jnb	ACC.1, code_3C9A ; Accumulator

code_3C83:				; CODE XREF: RESET_0-AD65j
		jnb	RAM_2B.4, code_3CBB
		mov	DPTR, #0F8C3h
		movx	A, @DPTR
		mov	B, A		; B-Register
		inc	A
		movx	@DPTR, A
		mov	DPTR, #5F90h	; Время	для фиксации ошибки ДК | сек.
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_3C96	; B-Register

code_3C96:
		jnc	code_3CB8
		sjmp	code_3CAF
; ---------------------------------------------------------------------------

code_3C9A:				; CODE XREF: RESET_0-AD62j
		jnb	RAM_2A.6, code_3CB8
		mov	DPTR, #0F8C3h
		movx	A, @DPTR
		mov	B, A		; B-Register
		inc	A
		movx	@DPTR, A
		mov	DPTR, #5FA2h	; Период диагн.	ошибки высокого	уровня ДК | циклов
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_3CAD	; B-Register

code_3CAD:
		jnc	code_3CB8

code_3CAF:				; CODE XREF: RESET_0-AD4Aj
		setb	RAM_24.4
		mov	DPTR, #0F810h
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A

code_3CB8:				; CODE XREF: RESET_0-AD6Fj
					; RESET_0-AD6Cj ...
		ljmp	code_3D83
; ---------------------------------------------------------------------------

code_3CBB:				; CODE XREF: RESET_0-AD71j
					; RESET_0:code_3C83j
		clr	RAM_23.4
		clr	RAM_24.4
		clr	A
		mov	DPTR, #0F8C3h
		movx	@DPTR, A
		mov	DPTR, #0F810h
		movx	A, @DPTR
		jb	ACC.2, code_3CEA ; Accumulator
		jnb	ACC.1, code_3CEA ; Accumulator
		jnb	RAM_29.1, code_3CEA
		mov	DPTR, #5F92h	; Максимальное время работы подогревателя до готовности	| сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8C5h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_3CE1	; B-Register

code_3CE1:
		jc	code_3CEA
		mov	DPTR, #0F810h
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A

code_3CEA:				; CODE XREF: RESET_0-AD1Aj
					; RESET_0-AD17j ...
		jnb	RAM_2A.3, code_3CF9
		clr	A
		mov	DPTR, #0F810h
		movx	@DPTR, A
		mov	DPTR, #0F8C5h
		movx	@DPTR, A
		ljmp	code_3D9A
; ---------------------------------------------------------------------------

code_3CF9:				; CODE XREF: RESET_0:code_3CEAj
		mov	DPTR, #5F81h	; Минимальное напряжение готовности | В
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, R0
		mov	B.0, C		; B-Register
		mov	DPTR, #5F82h	; Максимальное напряжение готовности | В
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, R0
		orl	C, /B.0		; B-Register
		cpl	C
		jnc	code_3D1A
		mov	DPTR, #0F810h
		movx	A, @DPTR
		clr	ACC.7		; Accumulator
		movx	@DPTR, A
		jb	ACC.0, code_3D53 ; Accumulator
		sjmp	code_3D45
; ---------------------------------------------------------------------------

code_3D1A:				; CODE XREF: RESET_0-ACD6j
		mov	DPTR, #0F810h
		movx	A, @DPTR
		setb	ACC.7		; Accumulator
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F8C4h
		movx	@DPTR, A
		mov	DPTR, #5F83h	; Задержка готовности |	сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F803h
		movx	A, @DPTR
		inc	A
		jz	code_3D35
		movx	@DPTR, A

code_3D35:				; CODE XREF: RESET_0-ACB0j
		cjne	A, B, code_3D38	; B-Register

code_3D38:
		jc	code_3D83
		clr	RAM_25.3
		mov	DPTR, #0F810h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		sjmp	code_3D83
; ---------------------------------------------------------------------------

code_3D45:				; CODE XREF: RESET_0-ACCAj
					; RESET_0-AC66j
		clr	A
		mov	DPTR, #0F803h
		movx	@DPTR, A
		mov	DPTR, #0F810h
		movx	A, @DPTR
		anl	A, #0FEh
		movx	@DPTR, A
		sjmp	code_3D83
; ---------------------------------------------------------------------------

code_3D53:				; CODE XREF: RESET_0-ACCDj
		mov	DPTR, #0F810h
		movx	A, @DPTR
		jnb	ACC.2, code_3D7E ; Accumulator
		jnb	RAM_2B.4, code_3D7E
		jb	RAM_2C.2, code_3D7E
		jnb	RAM_29.7, code_3D7E
		jnb	RAM_29.1, code_3D83
		mov	DPTR, #5F91h	; Макс.	время неакт. ДК	- диаг.	нагревателя | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8C4h
		movx	A, @DPTR
		inc	A
		jz	code_3D75
		movx	@DPTR, A

code_3D75:				; CODE XREF: RESET_0-AC70j
		cjne	A, B, code_3D78	; B-Register

code_3D78:
		jc	code_3D83
		setb	RAM_25.3
		sjmp	code_3D45
; ---------------------------------------------------------------------------

code_3D7E:				; CODE XREF: RESET_0-AC8Bj
					; RESET_0-AC88j ...
		clr	A
		mov	DPTR, #0F8C4h
		movx	@DPTR, A

code_3D83:				; CODE XREF: RESET_0-ADCFj
					; RESET_0:code_3C67j ...
		jb	RAM_2C.2, code_3D9A
		mov	DPTR, #5F96h	; Температура разрешения обучения | град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_3D8E

code_3D8E:
		mov	DPTR, #0F810h
		movx	A, @DPTR
		anl	C, ACC.2	; Accumulator
		anl	C, /ACC.0	; Accumulator
		jnc	code_3D9A
		setb	RAM_25.3

code_3D9A:				; CODE XREF: RESET_0-ACECj
					; RESET_0:code_3D83j ...
		mov	C, RAM_23.5
		orl	C, RAM_24.5
		jc	code_3E01
		mov	DPTR, #0F8A9h
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #606Bh	; Минимальное напряжение ДПДЗ |	В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		clr	C
		subb	A, B		; B-Register
		jc	code_3E0E
		mov	DPTR, #606Ch	; Максимальное напряжение ДПДЗ | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		clr	C
		subb	A, B		; B-Register
		jnc	code_3E0E
		mov	DPTR, #0F827h
		movx	A, @DPTR
		xch	A, R1
		clr	C
		subb	A, R1
		jc	code_3DE1
		mov	B, A		; B-Register
		mov	DPTR, #6068h	; Коэффициент тарировки	ДПДЗ | %/В
		clr	A
		movc	A, @A+DPTR
		mul	AB
		mov	R0, B		; B-Register
		mov	DPTR, #606Ah	; Максимальное положение дросселя | %
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_3DE3
		add	A, B		; B-Register
		mov	R0, A
		sjmp	code_3DE3
; ---------------------------------------------------------------------------

code_3DE1:				; CODE XREF: RESET_0-AC1Cj
		mov	R0, #0

code_3DE3:				; CODE XREF: RESET_0-AC08j
					; RESET_0-AC03j
		mov	DPTR, #606Dh	; Скорость изменения положения дросселя	| %/сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F824h
		movx	A, @DPTR
		clr	C
		subb	A, R0
		lcall	ABS_ACC
		clr	C
		subb	A, B		; B-Register
		jnc	code_3DFA
		mov	THR_CODE, R0

code_3DFA:				; CODE XREF: RESET_0-ABECj
		mov	A, R0
		mov	DPTR, #0F824h
		movx	@DPTR, A
		sjmp	code_3E22
; ---------------------------------------------------------------------------

code_3E01:				; CODE XREF: RESET_0-AC44j
		mov	DPTR, #6067h	; Начальное положение ДПДЗ | В
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F827h
		movx	@DPTR, A
		mov	DPTR, #0F8B2h
		movx	@DPTR, A

code_3E0E:				; CODE XREF: RESET_0-AC32j
					; RESET_0-AC25j
		jb	RAM_2A.4, code_3E1F
		mov	DPTR, #9D3Ch	; Иммитатор ДПДЗ при аварии | Положение	дросселя % - Обороты коленвала,	об/мин - Цикловое наполнение,мг/цикл
		mov	R2, RPM_RT
		mov	R3, GBC_RT
		lcall	GET_3D_VALUE
		mov	THR_CODE, A
		sjmp	code_3E22
; ---------------------------------------------------------------------------

code_3E1F:				; CODE XREF: RESET_0:code_3E0Ej
		mov	THR_CODE, #0

code_3E22:				; CODE XREF: RESET_0-ABE3j
					; RESET_0-ABC5j
		mov	C, RAM_23.5
		orl	C, RAM_24.5
		orl	C, RAM_23.6
		orl	C, RAM_24.6
		jc	code_3E58
		jnb	RAM_29.1, code_3E38
		mov	DPTR, #0F843h
		movx	A, @DPTR
		add	A, #1
		jc	code_3E38
		movx	@DPTR, A

code_3E38:				; CODE XREF: RESET_0-ABB6j
					; RESET_0-ABADj
		mov	R2, RPM_RT
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		mov	R3, A
		push	ACC
		
		; Базовое цикловое наполнение |	Цикловое наполнение, мг/цикл - Обороты коленвала, об/мин - Положение дросселя,%
		GET_3D_RAM_WITH_INTERPOLATION 75EFh, CAPTURE_GBC_MODE
		
		mov	R3, A
		pop		ACC
		mov	R4, A
		
		mov	A, RPM_THR_3D_RT
		mov	R2, A
		mov	DPTR, #62ACh	; Зона барокоррекции | Зона барокоррекции - Обороты коленвала, об/мин -	Положение дросселя,%
		movc	A, @A+DPTR
		jnz	code_3E62

code_3E58:				; CODE XREF: RESET_0-ABB8j
		mov	DPTR, #0FA9Bh
		movx	A, @DPTR
		clr	ACC.0		; Accumulator
		movx	@DPTR, A
		ljmp	code_408F
; ---------------------------------------------------------------------------

code_3E62:				; CODE XREF: RESET_0-AB8Cj
		jb	ACC.7, code_3E71 ; Accumulator
		mov	B, A		; B-Register
		mov	DPTR, #0FA9Bh
		movx	A, @DPTR
		clr	ACC.0		; Accumulator
		movx	@DPTR, A
		ljmp	code_3F41
; ---------------------------------------------------------------------------

code_3E71:				; CODE XREF: RESET_0:code_3E62j
		clr	A
		mov	DPTR, #0F82Ah
		movx	@DPTR, A
		mov	DPTR, #6076h	; Длина	фильтра	барокоррекции |	сек.
		clr	A
		movc	A, @A+DPTR
		clr	C
		rrc	A
		mov	DPTR, #0F896h
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F897h
		movx	@DPTR, A
		mov	B, #7		; B-Register
		mov	A, R2
		clr	C
		subb	A, #10h
		jc	code_3E98
		mov	DPTR, #62ACh	; Зона барокоррекции | Зона барокоррекции - Обороты коленвала, об/мин -	Положение дросселя,%
		movc	A, @A+DPTR
		jb	ACC.7, code_3E98 ; Accumulator
		clr	B.0		; B-Register

code_3E98:				; CODE XREF: RESET_0-AB55j
					; RESET_0-AB4Fj
		mov	A, R2
		swap	A
		add	A, #10h
		jc	code_3EA8
		swap	A
		mov	DPTR, #62ACh	; Зона барокоррекции | Зона барокоррекции - Обороты коленвала, об/мин -	Положение дросселя,%
		movc	A, @A+DPTR
		jb	ACC.7, code_3EA8 ; Accumulator
		clr	B.1		; B-Register

code_3EA8:				; CODE XREF: RESET_0-AB46j
					; RESET_0-AB3Fj
		mov	A, R2
		clr	C
		subb	A, #10h
		jc	code_3EBE
		mov	A, R2
		swap	A
		add	A, #10h
		jc	code_3EBE
		swap	A
		mov	DPTR, #62ACh	; Зона барокоррекции | Зона барокоррекции - Обороты коленвала, об/мин -	Положение дросселя,%
		movc	A, @A+DPTR
		jb	ACC.7, code_3EC3 ; Accumulator
		sjmp	code_3ECE
; ---------------------------------------------------------------------------

code_3EBE:				; CODE XREF: RESET_0-AB36j
					; RESET_0-AB30j
		mov	A, B		; B-Register
		cjne	A, #7, code_3ECE

code_3EC3:				; CODE XREF: RESET_0-AB29j
		mov	DPTR, #0FA9Bh
		movx	A, @DPTR
		setb	ACC.0		; Accumulator
		movx	@DPTR, A
		mov	R4, #0FFh
		sjmp	code_3F00
; ---------------------------------------------------------------------------

code_3ECE:				; CODE XREF: RESET_0-AB26j
					; RESET_0-AB22j
		mov	A, R4
		clr	C
		subb	A, #8
		anl	A, #0Fh
		mov	R0, A
		mov	A, #7
		clr	C
		subb	A, RPM_RT
		anl	A, #0Fh
		mov	R1, A
		mov	A, R1
		clr	C
		subb	A, R0
		jnc	code_3EE7
		jnb	B.1, code_3EEA	; B-Register
		sjmp	code_3EED
; ---------------------------------------------------------------------------

code_3EE7:				; CODE XREF: RESET_0-AB02j
		jnb	B.0, code_3EED	; B-Register

code_3EEA:				; CODE XREF: RESET_0-AB00j
		mov	A, R1
		sjmp	code_3EEE
; ---------------------------------------------------------------------------

code_3EED:				; CODE XREF: RESET_0-AAFDj
					; RESET_0:code_3EE7j
		mov	A, R0

code_3EEE:				; CODE XREF: RESET_0-AAF7j
		mov	B, A		; B-Register
		mov	DPTR, #0FA9Bh
		movx	A, @DPTR
		clr	ACC.0		; Accumulator
		movx	@DPTR, A
		mov	A, B		; B-Register
		swap	A
		mov	R4, A
		jnz	code_3F00
		ljmp	code_40A4
; ---------------------------------------------------------------------------

code_3F00:				; CODE XREF: RESET_0-AB16j
					; RESET_0-AAE7j
		mov	B, R3		; B-Register
		mov	DPTR, #0FF40h
		movx	A, @DPTR
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		mov	DPTR, #63ACh	; Коррекция предельного	GBC | Коэффициент коррекции - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		lcall	DIV_R0R1_4
		mov	A, R4
		inc	A
		jz	code_3F3E
		dec	A
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	R2, RAM_0
		mov	R3, RAM_1
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	DPTR, #0F82Ch
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, R4
		cpl	A
		inc	A
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		lcall	ADD_R0R1_R2R3

code_3F3E:				; CODE XREF: RESET_0-AAC8j
		ljmp	code_40A8
; ---------------------------------------------------------------------------

code_3F41:				; CODE XREF: RESET_0-AB74j
		mov	A, B		; B-Register
		cjne	A, #20h, code_3F46 ; ' '

code_3F46:
		jc	code_3F4A
		mov	A, #20h	; ' '

code_3F4A:				; CODE XREF: RESET_0:code_3F46j
		mov	R4, A
		mov	DPTR, #5F96h	; Температура разрешения обучения | град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_3F53

code_3F53:
		jc	code_3F58
		ljmp	code_408F
; ---------------------------------------------------------------------------

code_3F58:				; CODE XREF: RESET_0:code_3F53j
		mov	DPTR, #0F88Dh
		movx	A, @DPTR
		clr	C
		subb	A, R4
		jz	code_3F68
		mov	A, R4
		mov	DPTR, #0F88Dh
		movx	@DPTR, A
		ljmp	code_408F
; ---------------------------------------------------------------------------

code_3F68:				; CODE XREF: RESET_0-AA84j
		mov	B, R3		; B-Register
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	DPTR, #0F82Ch
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		setb	IEN0.7		; Interrupt Enable Register 0
		lcall	code_AD86

code_3F7A:				; CODE XREF: RESET_0-AA3Ej
		mov	DPTR, #63ACh	; Коррекция предельного	GBC | Коэффициент коррекции - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mul	AB
		clr	RAM_28.4
		mov	MD0, #0		; Multiplication/Division Register 0
		mov	MD1, #0		; Multiplication/Division Register 1
		mov	MD2, R0		; Multiplication/Division Register 2
		mov	MD3, R1		; Multiplication/Division Register 3
		mov	MD4, A		; Multiplication/Division Register 4
		mov	MD5, B		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	A, MD0		; Multiplication/Division Register 0
		mov	R2, MD1		; Multiplication/Division Register 1
		mov	R3, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	R3, MD4		; Multiplication/Division Register 4
		mov	R3, MD5		; Multiplication/Division Register 5
		jb	RAM_28.4, code_3F7A
		jnb	ACC.7, code_3FAB ; Accumulator
		inc	R2

code_3FAB:				; CODE XREF: RESET_0-AA3Bj
		mov	DPTR, #0F896h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	A, R0
		add	A, R2
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		mov	DPTR, #0F896h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F82Ah
		movx	A, @DPTR
		jnz	code_3FD5
		mov	A, R2
		mov	DPTR, #0F88Ah
		movx	@DPTR, A
		mov	DPTR, #0F88Bh
		movx	@DPTR, A
		sjmp	code_400D
; ---------------------------------------------------------------------------

code_3FD5:				; CODE XREF: RESET_0-AA1Aj
		mov	DPTR, #0F88Ah
		movx	A, @DPTR
		clr	C
		subb	A, R2
		jc	code_3FE4
		mov	A, R2
		mov	DPTR, #0F88Ah
		movx	@DPTR, A
		sjmp	code_3FF1
; ---------------------------------------------------------------------------

code_3FE4:				; CODE XREF: RESET_0-AA07j
		mov	DPTR, #0F88Bh
		movx	A, @DPTR
		clr	C
		subb	A, R2
		jnc	code_3FF1
		mov	A, R2
		mov	DPTR, #0F88Bh
		movx	@DPTR, A

code_3FF1:				; CODE XREF: RESET_0-AA00j
					; RESET_0-A9F8j
		mov	DPTR, #0F88Ah
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F88Bh
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #60E1h	; Максимальное отклонение KGBC для адаптации |
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_400D
		ljmp	code_408F
; ---------------------------------------------------------------------------

code_400D:				; CODE XREF: RESET_0-AA0Fj
					; RESET_0-A9DAj
		mov	DPTR, #6076h	; Длина	фильтра	барокоррекции |	сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F82Ah
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_401F	; B-Register
		sjmp	code_4022
; ---------------------------------------------------------------------------

code_401F:				; CODE XREF: RESET_0-A9C8j
		ljmp	code_40A4
; ---------------------------------------------------------------------------

code_4022:				; CODE XREF: RESET_0-A9C5j
					; RESET_0-A9A8j
		clr	RAM_28.4
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD4, B		; Multiplication/Division Register 4
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R2, MD0		; Multiplication/Division Register 0
		mov	A, MD1		; Multiplication/Division Register 1
		mov	A, MD2		; Multiplication/Division Register 2
		mov	A, MD3		; Multiplication/Division Register 3
		jb	RAM_28.4, code_4022
		mov	DPTR, #0F8D0h
		mov	A, R4
		dec	A
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	A, DPH		; Data Pointer,	High Byte
		addc	A, #0
		mov	DPH, A		; Data Pointer,	High Byte
		mov	A, R2
		movx	@DPTR, A
		mov	DPTR, #0F843h
		movx	A, @DPTR
		cjne	A, #0Ah, code_4055

code_4055:
		jc	code_408F
		clr	A
		movx	@DPTR, A
		mov	R0, #10h
		mov	R1, #0
		mov	B, #20h	; ' '   ; B-Register
		mov	DPTR, #0F8D0h

code_4063:				; CODE XREF: RESET_0-A977j
		movx	A, @DPTR
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		inc	DPTR
		djnz	B, code_4063	; B-Register
		lcall	code_AD94
		mov	DPTR, #5F97h	; Минимальное KGBC |
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #5F98h	; Максимальное KGBC |
		clr	A
		movc	A, @A+DPTR
		xch	A, R1
		lcall	code_AD03
		mov	DPTR, #0FF40h
		movx	@DPTR, A
		mov	B, #20h	; ' '   ; B-Register
		mov	DPTR, #0F8D0h

code_408A:				; CODE XREF: RESET_0-A956j
		movx	@DPTR, A
		inc	DPTR
		djnz	B, code_408A	; B-Register

code_408F:				; CODE XREF: RESET_0-AB83j
					; RESET_0-AA8Dj ...
		clr	A
		mov	DPTR, #0F82Ah
		movx	@DPTR, A
		mov	DPTR, #6076h	; Длина	фильтра	барокоррекции |	сек.
		clr	A
		movc	A, @A+DPTR
		clr	C
		rrc	A
		mov	DPTR, #0F896h
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F897h
		movx	@DPTR, A

code_40A4:				; CODE XREF: RESET_0-AAE5j
					; RESET_0:code_401Fj
		mov	R0, #0FFh
		mov	R1, #0FFh

code_40A8:				; CODE XREF: RESET_0:code_3F3Ej
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	DPTR, #0F830h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		setb	IEN0.7		; Interrupt Enable Register 0
		clr	RAM_29.1
		clr	RAM_29.2
		mov	DPTR, #0F898h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	DPTR, #0F804h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, #32h, code_411A ; '2'
		clr	A
		movx	@DPTR, A
		jnb	RAM_29.7, code_40D0
		lcall	code_B6C7

code_40D0:				; CODE XREF: RESET_0-A918j
		setb	RAM_29.1
		jb	RAM_2B.0, code_40DD
		mov	DPTR, #0F8ACh
		movx	A, @DPTR
		inc	A
		jz	code_40DD
		movx	@DPTR, A

code_40DD:				; CODE XREF: RESET_0-A910j
					; RESET_0-A908j
		mov	DPTR, #0F965h
		movx	A, @DPTR
		inc	A
		jz	code_40E5
		movx	@DPTR, A

code_40E5:				; CODE XREF: RESET_0-A900j
		jnb	RAM_2D.6, code_410B
		mov	DPTR, #5F88h	; Шаг уменьшения уставки оборотов при кондиционировании	| об/мин
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F84Fh
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_40F9
		clr	A

code_40F9:				; CODE XREF: RESET_0-A8ECj
		mov	B, A		; B-Register
		mov	DPTR, #5F58h	; Минимальное смещение оборотов	при кондиционировании |	об/мин
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_4103	; B-Register

code_4103:
		jnc	code_4107
		mov	A, B		; B-Register

code_4107:				; CODE XREF: RESET_0:code_4103j
		mov	DPTR, #0F84Fh
		movx	@DPTR, A

code_410B:				; CODE XREF: RESET_0:code_40E5j
		mov	DPTR, #0F805h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, #3Ch, code_411A ; '<'
		clr	A
		movx	@DPTR, A
		setb	RAM_29.2
		clr	RAM_22.5

code_411A:				; CODE XREF: RESET_0-A91Dj
					; RESET_0-A8D1j
		jnb	RAM_29.1, code_4125
		mov	DPTR, #0F807h
		movx	A, @DPTR
		inc	A
		jz	code_4125
		movx	@DPTR, A

code_4125:				; CODE XREF: RESET_0:code_411Aj
					; RESET_0-A8C0j
		jnb	RAM_29.1, code_4133
		jb	RAM_2A.3, code_4133
		mov	DPTR, #0F9D4h
		movx	A, @DPTR
		inc	A
		jz	code_4133
		movx	@DPTR, A

code_4133:				; CODE XREF: RESET_0:code_4125j
					; RESET_0-A8BAj ...
		jb	RAM_29.5, code_418F
		jb	RAM_29.4, code_4143
		clr	A
		mov	DPTR, #0F87Ch
		movx	@DPTR, A
		clr	RAM_29.5
		ljmp	code_42E0
; ---------------------------------------------------------------------------

code_4143:				; CODE XREF: RESET_0-A8ACj
		mov	DPTR, #60AAh	; Время	анализа	состояния ключа	зажигания | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F87Ch
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		clr	C
		subb	A, B		; B-Register
		jc	code_4178
		lcall	code_B2D4
		mov	DPTR, #5FE6h	; Время	контроля 2 напряжения питания |
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA8Bh
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F87Ch
		movx	@DPTR, A
		setb	RAM_29.5
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		clr	ACC.4		; Accumulator
		movx	@DPTR, A
		lcall	code_EA42
		lcall	code_AC0E
		anl	P6, #0DFh	; Port 6 (PDIR=0)

code_4178:				; CODE XREF: RESET_0-A88Fj
					; RESET_0-A850j ...
		mov	DPTR, #60CAh	; Напряжение отключения	питания	| В
		clr	A
		movc	A, @A+DPTR
		mov	RAM_0, A
		mov	B, #0		; B-Register
		lcall	code_A5A0
		cjne	A, RAM_0, code_4188

code_4188:
		jc	code_418C
		sjmp	code_41D5
; ---------------------------------------------------------------------------

code_418C:				; CODE XREF: RESET_0:code_4188j
		ljmp	code_42E0
; ---------------------------------------------------------------------------

code_418F:				; CODE XREF: RESET_0:code_4133j
		jb	RAM_29.4, code_4194
		sjmp	code_4178
; ---------------------------------------------------------------------------

code_4194:				; CODE XREF: RESET_0:code_418Fj
		mov	DPTR, #0FA8Bh
		movx	A, @DPTR
		dec	A
		jz	code_419E
		movx	@DPTR, A
		sjmp	code_4178
; ---------------------------------------------------------------------------

code_419E:				; CODE XREF: RESET_0-A849j
		mov	DPTR, #0F47Dh
		movx	A, @DPTR
		anl	A, #8
		jnz	code_4178
		mov	DPTR, #0F4B7h
		movx	A, @DPTR
		xrl	A, #2
		jz	code_41D5
		mov	DPTR, #60C9h	; Время	задержки отключения питания | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F87Ch
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		clr	C
		subb	A, B		; B-Register
		jc	code_4178
		mov	DPTR, #0F47Dh
		movx	A, @DPTR
		orl	A, #8
		movx	@DPTR, A
		mov	RAM_2F,	#0
		setb	RAM_2D.0
		lcall	code_C1B9
		lcall	code_CC92
		ljmp	code_42E0
; ---------------------------------------------------------------------------

code_41D5:				; CODE XREF: RESET_0-A858j
					; RESET_0-A836j
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	DPTR, #0F9D4h
		movx	A, @DPTR
		jz	code_41E9
		mov	DPTR, #0F9BFh
		movx	A, @DPTR
		mov	C, RAM_29.7
		mov	ACC.0, C	; Accumulator
		mov	DPTR, #0F9BFh
		movx	@DPTR, A

code_41E9:				; CODE XREF: RESET_0-A807j
		mov	WDTREL,	#80h ; 'А' ; Watchdog Timer Reload Register
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		lcall	code_B345
		mov	R0, #1
		mov	R1, #0
		mov	DPTR, #0FD00h

code_41FA:				; CODE XREF: RESET_0-A7DDj
		clr	C
		movx	A, @DPTR
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		inc	DPTR
		mov	A, DPH		; Data Pointer,	High Byte
		cjne	A, #0FFh, code_41FA
		mov	R2, #40h ; '@'
		mov	DPTR, #0F4D2h

code_420D:				; CODE XREF: RESET_0-A7CCj
		clr	C
		movx	A, @DPTR
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		inc	DPTR
		djnz	R2, code_420D
		mov	DPTR, #0F8FEh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #60CAh	; Напряжение отключения	питания	| В
		clr	A
		movc	A, @A+DPTR
		mov	RAM_0, A
		mov	B, #0		; B-Register
		lcall	code_A5A0
		cjne	A, RAM_0, code_4231

code_4231:
		jc	code_4236
		ljmp	code_2483
; ---------------------------------------------------------------------------

code_4236:				; CODE XREF: RESET_0:code_4231j
		mov	CCEN, #0	; Compare/Capture Enable Register
		mov	CC4EN, #0	; Compare/Capture 4 Enable Register
		mov	A, #55h	; 'U'
		lcall	code_C8F4
		mov	DPTR, #0FA59h
		lcall	code_C967
		lcall	code_C90D
		lcall	code_C92A
		mov	SYSCON,	#0	; System Control Register
		jnb	RAM_2D.2, code_4260
		push	TWAT_RT
		lcall	code_BC1A
		pop	TWAT_RT
		mov	A, #55h	; 'U'
		mov	DPTR, #0F9BEh
		movx	@DPTR, A

code_4260:				; CODE XREF: RESET_0-A792j
		mov	R7, #0FFh
		lcall	code_CC33
		jnb	RAM_2D.2, code_426E
		lcall	code_CAED
		lcall	code_CB2F

code_426E:				; CODE XREF: RESET_0-A77Dj
		lcall	code_CC67
		lcall	code_CBF0
		mov	A, #0AAh ; 'к'
		mov	DPTR, #0F9BEh
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F804h
		movx	@DPTR, A
		mov	DPTR, #0F87Ch
		movx	@DPTR, A

code_4283:				; CODE XREF: RESET_0-A738j
					; RESET_0-A720j
		mov	R3, #69h ; 'i'
		mov	R4, #0

code_4287:				; CODE XREF: RESET_0:code_4287j
					; RESET_0-A759j
		djnz	R4, code_4287
		djnz	R3, code_4287
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	DPTR, #60CAh	; Напряжение отключения	питания	| В
		clr	A
		movc	A, @A+DPTR
		mov	RAM_0, A
		mov	B, #0		; B-Register
		lcall	code_A5A0
		cjne	A, RAM_0, code_429F

code_429F:
		jc	code_42A4
		ljmp	code_2483
; ---------------------------------------------------------------------------

code_42A4:				; CODE XREF: RESET_0:code_429Fj
		mov	DPTR, #0F804h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, #32h, code_4283 ; '2'
		clr	A
		movx	@DPTR, A
		mov	DPTR, #0A2B1h	; Время	контроля напряжения | Время, сек - Температура,	град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F87Ch
		movx	A, @DPTR
		inc	A
		jz	code_42BF
		movx	@DPTR, A

code_42BF:				; CODE XREF: RESET_0-A726j
		clr	C
		subb	A, B		; B-Register
		jc	code_4283
		mov	DPTR, #0F9A8h
		movx	A, @DPTR
		clr	ACC.6		; Accumulator
		movx	@DPTR, A
		lcall	code_EA42
		clr	A
		mov	DPTR, #0F8C2h
		movx	@DPTR, A
		mov	R0, #0ABh ; 'л'
		mov	@R0, #0A5h ; 'е'
		orl	P9, #1		; Port 9 (PDIR=0)

code_42DA:				; CODE XREF: RESET_0-A704j
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		sjmp	code_42DA
; ---------------------------------------------------------------------------

code_42E0:				; CODE XREF: RESET_0-A8A2j
					; RESET_0:code_418Cj ...
		; mov	DPTR, #0F887h
		; movx	A, @DPTR
		; mov		R2, A
		; mov	DPTR, #0F888h
		; movx	A, @DPTR
		; mov		R3, A
		
		; ; Коррекция УОЗ	по температуре ОЖ | Поправка УОЗ, гр.п.к.в. - Температура, град.С
		; GET_2D_RAM_WITH_INTERPOLATION 6EC8h, CAPTURE_KTWATUOZ_MODE
		
		GET_RAM_BY_INDEX 6EC8h, TWAT_RT, CAPTURE_KTWATUOZ_MODE
		
		jnb		Hardware.4, code_42E2
		push	ACC
		; mov	B, A		; B-Register
		; mov	DPTR, #0F931h
		; movx	A, @DPTR
		; mov		R2, A
		; mov	DPTR, #0F8F1h
		; movx	A, @DPTR
		; mov		R3, A
		
		; ; Коррекция УОЗ	по температуре воздуха | Поправка УОЗ, гр.п.к.в. - Температура,	град.С
		; GET_2D_RAM_WITH_INTERPOLATION 84BAh, CAPTURE_KTAIRUOZ_MODE
		
		mov		DPTR, #0F931h
		movx	A, @DPTR
		mov	B, A		; B-Register

		GET_RAM_BY_INDEX 84BAh, B, CAPTURE_KTAIRUOZ_MODE
		
		pop		B
		
		add	A, B		; B-Register
code_42E2:
		mov	DPTR, #0F802h
		movx	@DPTR, A
		jb	RAM_29.5, code_4369
		jb	RAM_2A.6, code_4363
		jnb	RAM_2B.0, code_4360
		mov	A, RAM_7C
		anl	A, #0Fh
		anl	CMEN, #0F0h	; Compare Enable Register (RMAP=0)
		jnz	code_4315
		orl	P4, #0Fh	; Port 4 (PDIR=0)

code_4315:				; CODE XREF: RESET_0-A6D2j
		mov	DPTR, #0F9A8h
		movx	A, @DPTR
		clr	ACC.4		; Accumulator
		movx	@DPTR, A
		clr	RAM_29.6
		mov	DPTR, #0F810h
		movx	A, @DPTR
		anl	A, #0FDh
		movx	@DPTR, A
		mov	A, RAM_79
		anl	A, #8
		jz	code_4331
		mov	C, RAM_2E.3
		jnc	code_4349
		sjmp	code_4353
; ---------------------------------------------------------------------------

code_4331:				; CODE XREF: RESET_0-A6B9j
		mov	DPTR, #606Eh	; Время	работы бензонасоса до пуска | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F828h
		movx	A, @DPTR
		jnb	RAM_29.1, code_4343
		inc	A
		jnz	code_4343
		dec	A

code_4343:				; CODE XREF: RESET_0-A6A6j
					; RESET_0-A6A2j
		movx	@DPTR, A
		clr	C
		subb	A, B		; B-Register
		jc	code_4353

code_4349:				; CODE XREF: RESET_0-A6B5j
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		clr	ACC.3		; Accumulator
		movx	@DPTR, A
		ljmp	code_43FE
; ---------------------------------------------------------------------------

code_4353:				; CODE XREF: RESET_0-A6B3j
					; RESET_0-A69Bj
		jnb	RAM_2D.3, code_435D
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		setb	ACC.3		; Accumulator
		movx	@DPTR, A

code_435D:				; CODE XREF: RESET_0:code_4353j
		ljmp	code_43FE
; ---------------------------------------------------------------------------

code_4360:				; CODE XREF: RESET_0-A6DCj
		ljmp	code_443F
; ---------------------------------------------------------------------------

code_4363:				; CODE XREF: RESET_0-A6DFj
		jb	RAM_2B.0, code_4369
		ljmp	code_4536
; ---------------------------------------------------------------------------

code_4369:				; CODE XREF: RESET_0-A6E2j
					; RESET_0:code_4363j
		clr	RAM_2A.6
		clr	RAM_26.1
		anl	P9, #0BFh	; Port 9 (PDIR=0)
		setb	RAM_2A.3
		setb	RAM_2A.4
		setb	RAM_2A.1
		mov	DPTR, #605Ch	; Обороты блокировки впрыска | об./мин
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F9A6h
		movx	@DPTR, A
		mov	DPTR, #0F9B7h
		movx	@DPTR, A
		mov	RAM_68,	#0FFh
		mov	RAM_69,	#0FFh
		mov	RAM_4A,	#0
		clr	A
		mov	DPTR, #0F810h
		movx	@DPTR, A
		mov	DPTR, #0F8C5h
		movx	@DPTR, A
		mov	A, DEV_FLAGS
		anl	A, #2
		jnz	code_43A4
		mov	DPTR, #6061h	; Фаза впрыска на пуске	| гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FF47h
		movx	@DPTR, A

code_43A4:				; CODE XREF: RESET_0-A649j
		mov	DPTR, #6070h	; Цилиндровое GBC на пуске | мг./цикл
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F82Ch
		movx	@DPTR, A
		mov	DPTR, #6071h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F82Dh
		movx	@DPTR, A
		jb	RAM_29.4, code_43C1
		mov	DPTR, #6AA1h	; Положение РХХ	при пуске | Шаги РХХ - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	UFRXX, A

code_43C1:				; CODE XREF: RESET_0-A62Cj
		clr	A
		mov	DPTR, #0F84Ah
		movx	@DPTR, A
		mov	DPTR, #0F89Eh
		movx	@DPTR, A
		mov	RPM_XX,	A
		mov	DPTR, #0F841h
		movx	@DPTR, A
		mov	DPTR, #0F842h
		movx	@DPTR, A
		mov	DPTR, #0F837h
		movx	@DPTR, A
		mov	DPTR, #0F838h
		movx	@DPTR, A
		mov	DPTR, #0F89Bh
		movx	@DPTR, A
		mov	DPTR, #0F89Ch
		movx	@DPTR, A
		mov	DPTR, #0F82Eh
		movx	@DPTR, A
		mov	DPTR, #0F82Fh
		movx	@DPTR, A
		mov	DPTR, #0F808h
		movx	@DPTR, A
		mov	DPTR, #0F809h
		movx	@DPTR, A
		mov	DPTR, #0F89Dh
		movx	@DPTR, A
		lcall	code_ACD9
		lcall	code_ACED

code_43FE:				; CODE XREF: RESET_0-A692j
					; RESET_0:code_435Dj
		mov	A, TWAT
		mov	DPTR, #0F80Ah
		movx	@DPTR, A
		mov	A, DEV_FLAGS
		anl	A, #4
		jnz	code_4418
		mov	DPTR, #0F8AFh
		movx	A, @DPTR
		mov	DPTR, #71A0h	; УОЗ на пуске | УОЗ, гр.п.к.в.	- Обороты коленвала, об/мин
		movc	A, @A+DPTR
		mov	UOZXX_1, A

code_4418:				; CODE XREF: RESET_0-A5DAj
		mov	R0, #80h ; 'А'
		mov	RAM_14,	@R0
		inc	R0
		mov	RAM_15,	@R0
		inc	R0
		mov	RAM_16,	@R0
		inc	R0
		mov	RAM_17,	@R0
		inc	R0
		mov	RAM_10,	@R0
		inc	R0
		mov	RAM_11,	@R0
		inc	R0
		mov	RAM_12,	@R0
		inc	R0
		mov	RAM_13,	@R0
		mov	LAUNCH_UOZ_OFFSET, #0
		
		mov		DPTR, #8FBFh    ; время действия поправки ALF после пуска (прогрев)
		mov		A, TWAT_RT
		movc	A, @A+DPTR
		mov		DPTR, #0F890h
		movx	@DPTR, A

		ljmp	code_4FBB
; ---------------------------------------------------------------------------

code_4437:				; CODE XREF: RESET_0-A57Fj
					; RESET_0-A546j
		clr	A
		mov	DPTR, #0F872h
		movx	@DPTR, A

code_443C:				; CODE XREF: RESET_0-A581j
		ljmp	code_4527
; ---------------------------------------------------------------------------

code_443F:				; CODE XREF: RESET_0:code_4360j
		mov	A, RAM_79
		anl	A, #8
		setb	C
		jz	code_4453
		mov	C, RAM_2E.3
		jc	code_4453
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		clr	ACC.3		; Accumulator
		movx	@DPTR, A
		sjmp	code_445D
; ---------------------------------------------------------------------------

code_4453:				; CODE XREF: RESET_0-A59Ej
					; RESET_0-A59Aj
		jnb	RAM_2D.3, code_445D
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		setb	ACC.3		; Accumulator
		movx	@DPTR, A

code_445D:				; CODE XREF: RESET_0-A591j
					; RESET_0:code_4453j
		mov	DPTR, #0F872h
		movx	A, @DPTR
		jnz	code_443C
		jb	RAM_23.0, code_4437
		mov	DPTR, #0F887h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F888h
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #7152h	; Асинхронная цикловая подача |	Цикловая подача	топлива, мг/цикл - Температура,	град.С
		lcall	GET_2D_INTERPOLATION
		mov	B, A		; B-Register
		mov	DPTR, #0F997h
		movx	A, @DPTR
		jnb	ACC.0, code_4486 ; Accumulator
		mov	DPTR, #8C4Eh	; Коррекция GTCA по ТОЖ	| Коэффициент коррекции	- Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mul	AB

code_4486:				; CODE XREF: RESET_0-A566j
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		add	A, #8
		anl	A, #0F0h
		swap	A
		mov	DPTR, #7A77h	; Коррекция по дросселю	| Коэффициент коррекции	- Положение дросселя, %
		movc	A, @A+DPTR
		mul	AB
		mov	A, B		; B-Register
		mov	DPTR, #0F872h
		movx	@DPTR, A
		jz	code_4437
		mov	R1, A
		mov	R0, #0
		mov	R3, A
		mov	R2, #0
		mov	B, RAM_6F	; B-Register
		cpl	B.7		; B-Register
		lcall	MUL_R0R1_B
		mov	A, RAM_6F
		jnb	ACC.7, code_44BA ; Accumulator
		lcall	ADD_R0R1_R2R3
		jnc	code_44BA
		mov	R0, #0FFh
		mov	R1, #0FFh

code_44BA:				; CODE XREF: RESET_0-A534j
					; RESET_0-A52Ej
		CALC_INJ_STAT
		mov	R2, RAM_50
		mov	R3, #0
		lcall	ADD_R0R1_R2R3
		mov	B, #10h		; B-Register
		lcall	MUL_R0R1_B

code_44D1:				; CODE XREF: RESET_0-A4EDj
		clr	RAM_28.4
		mov	MD0, B		; Multiplication/Division Register 0
		mov	MD1, R0		; Multiplication/Division Register 1
		mov	MD2, R1		; Multiplication/Division Register 2
		mov	MD3, #0		; Multiplication/Division Register 3
		mov	MD4, #0Ch	; Multiplication/Division Register 4
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R2, MD0		; Multiplication/Division Register 0
		mov	R3, MD1		; Multiplication/Division Register 1
		mov	A, MD2		; Multiplication/Division Register 2
		mov	A, MD3		; Multiplication/Division Register 3
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		jb	RAM_28.4, code_44D1
		anl	CMEN, #0F0h	; Compare Enable Register (RMAP=0)
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	A, RAM_7C
		anl	A, #0Fh
		jnz	code_4506
		anl	P4, #0F0h	; Port 4 (PDIR=0)

code_4506:				; CODE XREF: RESET_0-A4E1j
		mov	CCL1, A		; Compare/Capture Register 1, Low Byte
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, CCL1		; Compare/Capture Register 1, Low Byte
		add	A, R2
		mov	R2, A
		mov	A, CCH1		; Compare/Capture Register 1, High Byte
		addc	A, R3
		mov	CMH0, A		; Compare Register 0, High Byte	(RMAP=0)
		mov	CMH1, A		; Compare Register 1, High Byte	(RMAP=0)
		mov	CMH2, A		; Compare Register 2, High Byte	(RMAP=0)
		mov	CMH3, A		; Compare Register 3, High Byte	(RMAP=0)
		mov	CML0, R2	; Compare Register 0, Low Byte (RMAP=0)
		mov	CML1, R2	; Compare Register 1, Low Byte (RMAP=0)
		mov	CML2, R2	; Compare Register 2, Low Byte (RMAP=0)
		mov	CML3, R2	; Compare Register 3, Low Byte (RMAP=0)
		orl	CMEN, #0Fh	; Compare Enable Register (RMAP=0)
		orl	P4, #0Fh	; Port 4 (PDIR=0)

code_4527:				; CODE XREF: RESET_0:code_443Cj
		jb	Options.2, code_4531
		mov	DPTR, #0F997h
		movx	A, @DPTR
		setb	ACC.0		; Accumulator
		movx	@DPTR, A

code_4531:				; CODE XREF: RESET_0:code_4527j
		clr	A
		mov	DPTR, #0F829h
		movx	@DPTR, A

code_4536:				; CODE XREF: RESET_0-A67Cj
		jnb	RAM_2A.3, code_4563
		mov	DPTR, #8A99h	; Обороты полного выхода из режима пуска | Обороты, об/мин - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, RPM_XX
		clr	C
		subb	A, B		; B-Register
		jnc	code_455F
		mov	DPTR, #605Ah	; Обороты начала выхода	из режима пуска	| об/мин
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, RPM_XX
		clr	C
		subb	A, B		; B-Register
		mov	RAM_2A.1, C
		jc	code_4571
		clr	A
		mov	DPTR, #0F872h
		movx	@DPTR, A
		sjmp	code_4571
; ---------------------------------------------------------------------------

code_455F:				; CODE XREF: RESET_0-A49Cj
		clr	RAM_2A.3
		clr	RAM_2A.1

code_4563:				; CODE XREF: RESET_0:code_4536j
		jnb	RAM_29.1, code_456E
		mov	DPTR, #0F9A5h
		movx	A, @DPTR
		jz	code_456E
		dec	A
		movx	@DPTR, A

code_456E:				; CODE XREF: RESET_0:code_4563j
					; RESET_0-A478j
		ljmp	code_45B1
; ---------------------------------------------------------------------------

code_4571:				; CODE XREF: RESET_0-A48Cj
					; RESET_0-A485j
		mov	A, DEV_FLAGS
		anl	A, #4
		jnz	code_4585
		mov	DPTR, #0F8AFh
		movx	A, @DPTR
		mov	DPTR, #71A0h	; УОЗ на пуске | УОЗ, гр.п.к.в.	- Обороты коленвала, об/мин
		movc	A, @A+DPTR
		mov	UOZXX_1, A

code_4585:				; CODE XREF: RESET_0-A46Dj
		mov	A, DEV_FLAGS
		anl	A, #20h
		jnz	code_4593
		mov	DPTR, #6AA1h	; Положение РХХ	при пуске | Шаги РХХ - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	UFRXX, A

code_4593:				; CODE XREF: RESET_0-A459j
		lcall	code_ACD9
		lcall	code_ACED
		mov	DPTR, #0F872h
		movx	A, @DPTR
		jz	code_45AA
		mov	A, P4		; Port 4 (PDIR=0)
		cpl	A
		anl	A, #0Fh
		jnz	code_45AE
		mov	DPTR, #0F872h
		movx	@DPTR, A

code_45AA:				; CODE XREF: RESET_0-A445j
		setb	RAM_2A.5
		setb	RAM_2A.6

code_45AE:				; CODE XREF: RESET_0-A43Ej
		ljmp	code_4F2C
; ---------------------------------------------------------------------------

code_45B1:				; CODE XREF: RESET_0:code_456Ej
		mov	DPTR, #63D3h	; Зона детонации
		mov	A, RPM_THR_3D_RT
		movc	A, @A+DPTR
		mov	C, RAM_2B.5
		anl	C, ACC.1	; Accumulator
		orl	C, ACC.0	; Accumulator
		mov	RAM_2B.5, C
		jnb	RAM_2B.1, code_45D4
		mov	DPTR, #0F887h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F888h
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #87E4h	; Состав смеси на ХХ | Отношение воздух/топливо	- Температура, град.С
		lcall	GET_2D_INTERPOLATION
		sjmp	code_45D7
; ---------------------------------------------------------------------------

code_45D4:				; CODE XREF: RESET_0-A423j
		lcall	CALC_ALF

code_45D7:				; CODE XREF: RESET_0-A410j
		mov	ALF_1, A
		mov	A, DEV_FLAGS
		anl	A, #4
		jnz	code_45E2
		lcall	code_E954

code_45E2:				; CODE XREF: RESET_0-A405j
		mov	A, DEV_FLAGS
		anl	A, #2
		jnz	code_45F2
		
		; Фаза впрыска | Фаза, гр.п.к.в. - Обороты коленвала, об/мин - Цикловое	наполнение,мг/цикл
		GET_RAM_BY_INDEX 64D3h, RPM_GBC_3D_RT, CAPTURE_FAZA_MODE

		mov	DPTR, #0FF47h
		movx	@DPTR, A

code_45F2:				; CODE XREF: RESET_0-A3FCj
		mov	R2, RPM_RT
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		mov	R3, A
		mov	DPTR, #7E07h	; Коррекция порога детонации | Коэффициент коррекции - Обороты коленвала, об/мин - Положение дросселя,%
		lcall	GET_3D_VALUE
		mov	R2, A
		mov	DPTR, #7BC7h	; Граница детонации | Порог шума - Обороты коленвала, об/мин
		mov	A, RPM_1
		anl	A, #0FEh
		mov	B, A		; B-Register
		movc	A, @A+DPTR
		mov	R0, A
		mov	A, B		; B-Register
		inc	A
		movc	A, @A+DPTR
		mov	R1, A
		mov	B, R2		; B-Register
		lcall	MUL_R0R1_2
		lcall	MUL_R0R1_B
		mov	DPTR, #0F8BAh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F934h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #8F2Ah	; Относительный	порог детонации	| Порог	детонации - Номер точки
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	A, R1
		jz	code_4640
		mov	R0, #0FFh
		mov	R1, #0Fh
		sjmp	code_464B
; ---------------------------------------------------------------------------

code_4640:				; CODE XREF: RESET_0-A3AAj
		mov	RAM_1, RAM_0
		mov	R0, B		; B-Register
		lcall	DIV_R0R1_8
		lcall	DIV_R0R1_2

code_464B:				; CODE XREF: RESET_0-A3A4j
		mov	DPTR, #0FA92h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		lcall	DIV_R0R1_2
		mov	DPTR, #0F9D1h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #7F07h	; Порог	детонации |  - Обороты коленвала, об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	DPTR, #0F943h
		movx	@DPTR, A
		mov	DPTR, #7F27h	; Минимальное время между циклами детонации | сек. - Обороты коленвала,	об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	DPTR, #0F953h
		movx	@DPTR, A
		mov	DPTR, #7F47h	; Период восстановления	УОЗ | сек. - Обороты коленвала,	об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	DPTR, #0F954h
		movx	@DPTR, A
		mov		A, #80h
		jnb		Hardware.4, code_46B8
		mov	R2, RPM_RT
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		mov	R3, A
		mov	DPTR, #8C75h	; Множитель коррекции по ТВОЗД | Коэффициент коррекции - Обороты коленвала, об/мин - Положение дросселя,%
		lcall	GET_3D_VALUE
		mov	R4, A
		mov	DPTR, #0F931h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F8F1h
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #900Dh	; Коэффициент весовой коррекции	по ТВОЗД | Коэффициент коррекции - Температура воздуха,	град.С
		lcall	GET_2D_INTERPOLATION
		clr	C
		subb	A, #80h	; 'А'
		jnc	code_46AF
		cpl	A
		inc	A
		mov	B, R4		; B-Register
		mul	AB
		mov	A, #80h	; 'А'
		clr	C
		subb	A, B		; B-Register
		sjmp	code_46B8
; ---------------------------------------------------------------------------

code_46AF:				; CODE XREF: RESET_0-A341j
		mov	B, R4		; B-Register
		mul	AB
		add	A, #80h	; 'А'
		mov	A, B		; B-Register
		addc	A, #80h	; 'А'

code_46B8:				; CODE XREF: RESET_0-A335j
		mov	DPTR, #0F8F0h
		movx	@DPTR, A
		mov	DPTR, #0F87Dh
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0FF4Dh
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #6713h	; Коэффициент весовой коррекции	от ТОЖ | Коэффициент коррекции - Текущая ТОЖ, град - ТОЖ при пуске,град
		lcall	GET_3D_VALUE
		mov	DPTR, #0FF4Fh
		movx	@DPTR, A
		mov	R2, RPM_RT
		mov	R3, GBC_RT
		mov	DPTR, #8193h	; Весовая коррекция топливоподачи | Коэффициент	коррекции - Обороты коленвала, об/мин -	Положение дросселя,%
		lcall	GET_3D_VALUE
		mov	R4, A
		mov	DPTR, #0FF4Fh
		movx	A, @DPTR
		clr	C
		subb	A, #80h	; 'А'
		jnc	code_46F0
		cpl	A
		inc	A
		mov	B, R4		; B-Register
		mul	AB
		mov	A, #80h	; 'А'
		clr	C
		subb	A, B		; B-Register
		sjmp	code_46F9
; ---------------------------------------------------------------------------

code_46F0:				; CODE XREF: RESET_0-A300j
		mov	B, R4		; B-Register
		mul	AB
		add	A, #80h	; 'А'
		mov	A, B		; B-Register
		addc	A, #80h	; 'А'

code_46F9:				; CODE XREF: RESET_0-A2F4j
		mov	B, A		; B-Register
		mov	DPTR, #0F8F0h
		movx	A, @DPTR
		mul	AB
		add	A, #40h	; '@'
		jnc	code_4706
		inc	B		; B-Register

code_4706:				; CODE XREF: RESET_0-A2E0j
		jnb	B.7, code_470D	; B-Register
		mov	A, #0FFh
		sjmp	code_4712
; ---------------------------------------------------------------------------

code_470D:				; CODE XREF: RESET_0:code_4706j
		mov	C, ACC.7	; Accumulator
		mov	A, B		; B-Register
		rlc	A

code_4712:				; CODE XREF: RESET_0-A2D7j
		mov	DPTR, #0F97Fh
		movx	@DPTR, A
		mov	C, RAM_23.6
		orl	C, RAM_24.6
		orl	C, RAM_23.5
		orl	C, RAM_24.5
		jc	code_4720
		jmp code_4830
code_4720:
		lcall	code_E984
		mov	A, DEV_FLAGS
		anl	A, #20h
		jnz	code_4731
		mov	DPTR, #6F0Fh	; Положение РХХ	при отказе ДПДЗ	| Положение РХХ	- Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	UFRXX, A

code_4731:				; CODE XREF: RESET_0-A2BBj
		jnb	RAM_2A.4, code_4745
		mov	DPTR, #8A99h	; Обороты полного выхода из режима пуска | Обороты, об/мин - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, RPM_XX
		clr	C
		subb	A, B		; B-Register
		jc	code_4745
		clr	RAM_2A.4

code_4745:				; CODE XREF: RESET_0:code_4731j
					; RESET_0-A2A1j
		mov	DPTR, #8AC0h	; Положение закрытого дросселя,	таблица	| Положение дросселя,% -
		jnb	RAM_2B.1, code_475D
		mov	DPTR, #8AE0h	; Положение открытого дросселя,	таблица	| Положение дросселя,% -
code_475D:
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, THR_CODE
		clr	C
		subb	A, B		; B-Register
		jc	code_476F
		ljmp	code_4822
; ---------------------------------------------------------------------------

code_476F:				; CODE XREF: RESET_0-A28Dj
					; RESET_0-A278j
		setb	RAM_2B.1
		mov	A, DEV_FLAGS
		anl	A, #4
		jnz	code_478A

		GET_UOZ_XX

code_478A:				; CODE XREF: RESET_0-A26Dj
		; Желаемые обороты ХХ |	Обороты, об/мин	- Температура, град.С
		GET_RAM_BY_INDEX 6F56h, TWAT_RT, CAPTURE_RPM_XX_MODE
		
		mov	DPTR, #0F849h
		movx	@DPTR, A
		clr	C
		subb	A, RPM_XX
		jc	code_47A0
		jnb	ACC.7, code_47A5 ; Accumulator
		mov	A, #7Fh	; ''
		sjmp	code_47A5
; ---------------------------------------------------------------------------

code_47A0:				; CODE XREF: RESET_0-A24Bj
		jb	ACC.7, code_47A5 ; Accumulator
		mov	A, #80h	; 'А'

code_47A5:				; CODE XREF: RESET_0-A249j
					; RESET_0-A244j ...
		mov	DELTA_RPM_XX, A
		mov	A, DEV_FLAGS
		anl	A, #4
		jnz	code_4803
		
		call CALC_DUOZ_REGXX
		
		add	A, UOZXX_2		; B-Register
		mov	UOZXX_1, A

code_4803:				; CODE XREF: RESET_0-A237j
		mov	DPTR, #60E9h	; Граница включения подачи топлива | об./мин
		jb	RAM_2B.3, code_4814
		mov	DPTR, #60EAh	; Граница отключения подачи топлива | об./мин

code_4814:				; CODE XREF: RESET_0-A1D8j
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, RPM_1
		cjne	A, B, code_4819	; B-Register

code_4819:
		cpl	C
		mov	RAM_2B.3, C
		jnb	RAM_2B.3, code_4824
		ljmp	code_4FBB
; ---------------------------------------------------------------------------

code_4822:				; CODE XREF: RESET_0-A28Bj
					; RESET_0-A276j
		clr	RAM_2B.1

code_4824:				; CODE XREF: RESET_0-A1C6j
		mov	C, RAM_23.5
		orl	C, RAM_24.5
		jnc	code_482D
		ljmp	code_4E1C
; ---------------------------------------------------------------------------

code_482D:				; CODE XREF: RESET_0-A1BAj
		ljmp	code_4EC3
; ---------------------------------------------------------------------------

code_4830:				; CODE XREF: RESET_0:code_475Aj
		jb	RAM_2A.3, code_4878
		jb	RAM_29.7, code_4878
		mov	DPTR, #0F80Ah
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #5F7Eh	; Верхний порог	температуры ОЖ для точки росы |	град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_4844	; B-Register

code_4844:
		jnc	code_484A
		setb	RAM_29.7
		sjmp	code_4878
; ---------------------------------------------------------------------------

code_484A:				; CODE XREF: RESET_0:code_4844j
		mov	DPTR, #5F7Dh	; Нижний порог температуры ОЖ для точки	росы | град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_4852	; B-Register

code_4852:
		jnc	code_4862
		mov	DPTR, #0F9BFh
		movx	A, @DPTR
		jnb	ACC.0, code_4862 ; Accumulator
		mov	DPTR, #5F7Fh	; Порог	1 суммарной массы воздуха для точки росы | кг.
		clr	A
		movc	A, @A+DPTR
		sjmp	code_4867
; ---------------------------------------------------------------------------

code_4862:				; CODE XREF: RESET_0:code_4852j
					; RESET_0-A18Aj
		mov	DPTR, #5F80h	; Порог	2 суммарной массы воздуха для точки росы | кг.
		clr	A
		movc	A, @A+DPTR

code_4867:				; CODE XREF: RESET_0-A182j
		mov	DPTR, #0F8F2h
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	DPTR, #0F8F7h
		movx	A, @DPTR
		cjne	A, B, code_4874	; B-Register

code_4874:
		jc	code_4878
		setb	RAM_29.7

code_4878:				; CODE XREF: RESET_0:code_4830j
					; RESET_0-A1AFj ...
		jnb	Hardware.0, code_48AE
		jb	RAM_2B.0, code_48AE
		mov	DPTR, #5F89h	; Напряжение отключения	нагрузок при отказе РР | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F80Dh
		movx	A, @DPTR
		cjne	A, B, code_488C	; B-Register

code_488C:
		jnc	code_48AE
		mov	DPTR, #5F8Ah	; Температура ОЖ для разрешения	отключения нагревателя | град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_4896

code_4896:
		jnc	code_48AE
		jb	RAM_29.7, code_489E
		ljmp	code_48D7
; ---------------------------------------------------------------------------

code_489E:				; CODE XREF: RESET_0-A14Aj
		mov	DPTR, #5F87h	; Температура ОГ для отключения	нагревателя | град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F895h
		movx	A, @DPTR
		cjne	A, B, code_48AC	; B-Register

code_48AC:
		jc	code_48C1

code_48AE:				; CODE XREF: RESET_0:code_4878j
					; RESET_0-A167j ...
		mov	DPTR, #0F9A8h
		movx	A, @DPTR
		clr	ACC.4		; Accumulator
		movx	@DPTR, A
		clr	RAM_29.6
		mov	DPTR, #0F810h
		movx	A, @DPTR
		anl	A, #0FDh
		movx	@DPTR, A
		ljmp	code_494A
; ---------------------------------------------------------------------------

code_48C1:				; CODE XREF: RESET_0:code_48ACj
					; RESET_0-A101j ...
		jb	RAM_22.3, code_48CB
		mov	DPTR, #0F9A8h
		movx	A, @DPTR
		setb	ACC.4		; Accumulator
		movx	@DPTR, A

code_48CB:				; CODE XREF: RESET_0:code_48C1j
		setb	RAM_29.6
		mov	DPTR, #0F810h
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A
		ljmp	code_494A
; ---------------------------------------------------------------------------

code_48D7:				; CODE XREF: RESET_0-A147j
		mov	DPTR, #0F810h
		movx	A, @DPTR
		jb	ACC.0, code_48E3 ; Accumulator
		jb	RAM_25.3, code_48E3
		sjmp	code_48C1
; ---------------------------------------------------------------------------

code_48E3:				; CODE XREF: RESET_0-A107j
					; RESET_0-A104j
		mov	DPTR, #0F978h
		movx	A, @DPTR
		mov	B, A		; B-Register
		swap	A
		anl	A, #0Fh
		mov	R2, A
		mov	A, B		; B-Register
		anl	A, #0Fh
		swap	A
		mov	R3, A
		mov	DPTR, #7F8Eh	; Время	паузы нагревателя | Время,сек. - Бортовое напряжение
		lcall	GET_2D_INTERPOLATION
		mov	B, A		; B-Register
		mov	DPTR, #0F963h
		movx	@DPTR, A
		jz	code_48C1
		jnb	RAM_29.6, code_4928
		mov	DPTR, #0F8F3h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	DPTR, #5F93h	; Время	включения нагревателя |	сек.
		clr	A
		movc	A, @A+DPTR
		xch	A, B		; B-Register
		cjne	A, B, code_4916	; B-Register

code_4916:
		jc	code_494A
		mov	DPTR, #0F9A8h
		movx	A, @DPTR
		clr	ACC.4		; Accumulator
		movx	@DPTR, A
		clr	RAM_29.6
		clr	A
		mov	DPTR, #0F8F4h
		movx	@DPTR, A
		sjmp	code_494A
; ---------------------------------------------------------------------------

code_4928:				; CODE XREF: RESET_0-A0E1j
		mov	DPTR, #0F8F4h
		movx	A, @DPTR
		inc	A
		jz	code_4930
		movx	@DPTR, A

code_4930:				; CODE XREF: RESET_0-A0B5j
		mov	DPTR, #0F8F4h
		movx	A, @DPTR
		cjne	A, B, code_4937	; B-Register

code_4937:
		jc	code_494A
		jb	RAM_22.3, code_4943
		mov	DPTR, #0F9A8h
		movx	A, @DPTR
		setb	ACC.4		; Accumulator
		movx	@DPTR, A

code_4943:				; CODE XREF: RESET_0-A0A9j
		setb	RAM_29.6
		clr	A
		mov	DPTR, #0F8F3h
		movx	@DPTR, A

code_494A:				; CODE XREF: RESET_0-A124j
					; RESET_0-A10Ej ...
		mov	A, DEV_FLAGS
		anl	A, #40h
		jnz	code_4980
		mov	DPTR, #0F887h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F888h
		movx	A, @DPTR
		mov	R3, A
		
		; Желаемые обороты ХХ |	Обороты, об/мин	- Температура, град.С
		GET_2D_RAM_WITH_INTERPOLATION 6F56h, CAPTURE_RPM_XX_MODE

		mov	B, A		; B-Register
		mov	DPTR, #0F84Fh
		movx	A, @DPTR
		add	A, B		; B-Register
		jnc	code_496E
		mov	A, #0FFh
		sjmp	code_4984
; ---------------------------------------------------------------------------

code_496E:				; CODE XREF: RESET_0-A07Aj
		mov	B, A		; B-Register
		mov	DPTR, #0F9D4h
		movx	A, @DPTR
		mov	DPTR, #9094h	; Смещение оборотов ХХ по времени | Обороты, об/мин - Время работы двигателя, сек.
		movc	A, @A+DPTR
		add	A, B		; B-Register
		jnc	code_4984
		mov	A, #0FFh
		sjmp	code_4984
; ---------------------------------------------------------------------------

code_4980:				; CODE XREF: RESET_0-A094j
		mov	DPTR, #0F849h
		movx	A, @DPTR

code_4984:				; CODE XREF: RESET_0-A076j
					; RESET_0-A068j ...
		mov	B, A		; B-Register
		mov	R0, B		; B-Register
		jb	RAM_2D.6, code_4992
		mov	DPTR, #6086h	; Коэффициент 1	переходного режима |
		clr	A
		movc	A, @A+DPTR
		sjmp	code_4997
; ---------------------------------------------------------------------------

code_4992:				; CODE XREF: RESET_0-A05Aj
		mov	DPTR, #5F57h	; Коэффициент 1	переходного режима КОHДИЦ. |
		clr	A
		movc	A, @A+DPTR

code_4997:				; CODE XREF: RESET_0-A052j
		mul	AB
		mov	A, R0
		add	A, B		; B-Register
		jnc	code_499F
		mov	A, #0FFh

code_499F:				; CODE XREF: RESET_0-A047j
		mov	DPTR, #0F847h
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	DPTR, #6087h	; Коэффициент 2	переходного режима |
		clr	A
		movc	A, @A+DPTR
		mul	AB
		mov	DPTR, #0F847h
		movx	A, @DPTR
		add	A, B		; B-Register
		jnc	code_49B5
		mov	A, #0FFh

code_49B5:				; CODE XREF: RESET_0-A031j
		mov	DPTR, #0F848h
		movx	@DPTR, A
		mov	B, #0		; B-Register
		mov	A, DEV_FLAGS
		anl	A, #40h
		jnz	code_49D3
		jnb	Options.4, code_49CB
		jb	RAM_25.6, code_49CB
		jnb	RAM_2D.5, code_49D3

code_49CB:				; CODE XREF: RESET_0-A020j
					; RESET_0-A01Dj
		mov	DPTR, #756Dh	; Смещение оборотов ХХ в движении | Обороты, об/мин - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_49D3:				; CODE XREF: RESET_0-A022j
					; RESET_0-A01Aj
		mov	A, R0
		add	A, B		; B-Register
		jnc	code_49DD
		jb	B.7, code_49DD	; B-Register
		mov	A, #0FFh

code_49DD:				; CODE XREF: RESET_0-A00Cj
					; RESET_0-A00Aj
		mov	DPTR, #0F849h
		movx	@DPTR, A
		
		GET_UOZ_XX
		
		jnb	RAM_2B.1, code_4A26
		mov	DPTR, #8AE0h	; Положение открытого дросселя,	таблица	| Положение дросселя,% -
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, THR_CODE
		clr	C
		subb	A, B		; B-Register
		jc	code_4A10
		mov	A, #1
		mov	DPTR, #0F97Ah
		movx	@DPTR, A
		ljmp	code_4A7B
; ---------------------------------------------------------------------------

code_4A10:				; CODE XREF: RESET_0-9FDDj
		jb	RAM_2C.2, code_4A20
		mov	DPTR, #0F848h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, RPM_XX
		clr	C
		subb	A, B		; B-Register
		jnc	code_4A23

code_4A20:				; CODE XREF: RESET_0:code_4A10j
		ljmp	code_4B76
; ---------------------------------------------------------------------------

code_4A23:				; CODE XREF: RESET_0-9FC4j
		ljmp	code_4B85
; ---------------------------------------------------------------------------

code_4A26:				; CODE XREF: RESET_0-9FEDj
		mov	A, RAM_6B
		jz	code_4A56
		mov	DPTR, #8AE0h	; Положение открытого дросселя,	таблица	| Положение дросселя,% -
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, THR_CODE
		clr	C
		subb	A, B		; B-Register
		jnc	code_4A7B
		mov	DPTR, #0F847h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, RPM_XX
		clr	C
		subb	A, B		; B-Register
		jnc	code_4A49

code_4A46:				; CODE XREF: RESET_0:code_4A68j
					; RESET_0-9F6Cj
		ljmp	code_4B24
; ---------------------------------------------------------------------------

code_4A49:				; CODE XREF: RESET_0-9F9Ej
		mov	A, RAM_6B
		clr	C
		subb	A, #2
		jnc	code_4A53
		ljmp	code_4B8D
; ---------------------------------------------------------------------------

code_4A53:				; CODE XREF: RESET_0-9F94j
		ljmp	code_4C33
; ---------------------------------------------------------------------------

code_4A56:				; CODE XREF: RESET_0-9FBAj
		mov	DPTR, #8AC0h	; Положение закрытого дросселя,	таблица	| Положение дросселя,% -
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, THR_CODE
		clr	C
		subb	A, B		; B-Register
		jc	code_4A68
		ljmp	code_4AC7
; ---------------------------------------------------------------------------

code_4A68:				; CODE XREF: RESET_0-9F7Fj
		jb	RAM_2C.2, code_4A46
		mov	DPTR, #0F848h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, RPM_XX
		clr	C
		subb	A, B		; B-Register
		jc	code_4A46
		ljmp	code_4B85
; ---------------------------------------------------------------------------

code_4A7B:				; CODE XREF: RESET_0-9FD5j
					; RESET_0-9FABj
		mov	A, RAM_6B
		inc	A
		mov	DPTR, #0F97Ah
		movx	@DPTR, A
		mov	DPTR, #0FA94h
		movx	A, @DPTR
		setb	ACC.0		; Accumulator
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0FA96h
		movx	@DPTR, A
		mov	DPTR, #0FF46h
		movx	@DPTR, A
		clr	RAM_2B.1
		mov	RAM_6B,	#0
		clr	RAM_25.7
		clr	A
		mov	DPTR, #0F986h
		movx	@DPTR, A
		mov	DPTR, #0F97Ah
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #9054h	; GTCDR	при переходе от	ХХ к рабочим режимам | Коэффициент добавки - Состояние отсечки ПХХ
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #8796h	; Коэффициент коррекции	GTCDR при переходе от TWAT | Коэффициент коррекции - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		lcall	DIV_R0R1_8
		mov	DPTR, #0F97Bh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F944h
		movx	A, @DPTR
		setb	ACC.0		; Accumulator
		movx	@DPTR, A

code_4AC7:				; CODE XREF: RESET_0-9F7Dj
		mov	DPTR, #0FA94h
		movx	A, @DPTR
		jb	ACC.0, code_4AD5 ; Accumulator
		mov	DPTR, #5F6Bh	; Коэффициент уменьшения GTCDR 1 при обогащении	|
		clr	A
		movc	A, @A+DPTR
		sjmp	code_4ADF
; ---------------------------------------------------------------------------

code_4AD5:				; CODE XREF: RESET_0-9F17j
		mov	DPTR, #0F97Ah
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #9074h	; Коэффициент уменьшения GTC 1 при выходе из ХХ	| мг/цикл - Состояние отсечки ПХХ
		movc	A, @A+DPTR

code_4ADF:				; CODE XREF: RESET_0-9F0Fj
		mov	DPTR, #0F99Fh
		movx	@DPTR, A
		mov	DPTR, #0FA94h
		movx	A, @DPTR
		jb	ACC.0, code_4AF1 ; Accumulator
		clr	A
		mov	DPTR, #0FA96h
		movx	@DPTR, A
		sjmp	code_4B0C
; ---------------------------------------------------------------------------

code_4AF1:				; CODE XREF: RESET_0-9EFBj
		mov	DPTR, #0FA96h
		movx	A, @DPTR
		inc	A
		jz	code_4AF9
		movx	@DPTR, A

code_4AF9:				; CODE XREF: RESET_0-9EECj
		mov	B, A		; B-Register
		mov	DPTR, #5FF6h	; Время	перехода с ХХ на рабочие режимы	| cек.
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_4B03	; B-Register

code_4B03:
		jnc	code_4B0C
		mov	DPTR, #0FA94h
		movx	A, @DPTR
		setb	ACC.1		; Accumulator
		movx	@DPTR, A

code_4B0C:				; CODE XREF: RESET_0-9EF3j
					; RESET_0:code_4B03j
		mov	DPTR, #60D8h	; Время	3 прогрева | сек
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9D4h
		movx	A, @DPTR
		cjne	A, B, code_4B1A	; B-Register

code_4B1A:
		jc	code_4B1E
		clr	RAM_2C.2

code_4B1E:				; CODE XREF: RESET_0:code_4B1Aj
		lcall	CALC_UGB_RXX
		ljmp	code_4CFA
; ---------------------------------------------------------------------------

code_4B24:				; CODE XREF: RESET_0:code_4A46j
		mov	RAM_6B,	#0
		setb	RAM_2B.1
		jbc	RAM_2A.4, code_4B61
		mov	DPTR, #0F849h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, RPM_XX
		mov	DPTR, #0F84Ah
		movx	@DPTR, A
		clr	C
		subb	A, B		; B-Register
		jnc	code_4B47
		mov	DPTR, #0F849h
		movx	A, @DPTR
		mov	DPTR, #0F84Ah
		movx	@DPTR, A
		sjmp	code_4B76
; ---------------------------------------------------------------------------

code_4B47:				; CODE XREF: RESET_0-9EA7j
		jnb	RAM_2C.2, code_4B76
		mov	DPTR, #0F847h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, RPM_XX
		cjne	A, B, code_4B55	; B-Register

code_4B55:
		jc	code_4B76
		mov	DPTR, #0F847h
		movx	A, @DPTR
		mov	DPTR, #0F84Ah
		movx	@DPTR, A
		sjmp	code_4B76
; ---------------------------------------------------------------------------

code_4B61:				; CODE XREF: RESET_0-9EB9j
		mov	DPTR, #608Fh	; Смещение оборотов ХХ после пуска | об/мин
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F849h
		movx	A, @DPTR
		add	A, B		; B-Register
		jnc	code_4B72
		mov	A, #0FFh

code_4B72:				; CODE XREF: RESET_0-9E74j
		mov	DPTR, #0F84Ah
		movx	@DPTR, A

code_4B76:				; CODE XREF: RESET_0:code_4A20j
					; RESET_0-9E9Dj ...
					
		lcall	CLEAR_ADD_FUEL
		lcall	CALC_ADAPTATION_RXX
		lcall	ADAPTATION_RXX
		lcall	CALC_UGB_BY_CRRXX
		ljmp	code_4D05
; ---------------------------------------------------------------------------

code_4B85:				; CODE XREF: RESET_0:code_4A23j
					; RESET_0-9F6Aj
		mov	RAM_6B,	#1
		clr	RAM_2B.1
		mov	RAM_6C,	#0
		
		mov		DPTR, #6F36h   ; задержка отключения топливоподачи
		mov		A, RPM_RT_32
		movc	A, @A+DPTR
		mov		DPTR, #0FF3Eh
		movx	@DPTR, A


code_4B8D:				; CODE XREF: RESET_0-9F92j
		lcall	CLEAR_ADD_FUEL
		mov	A, DEV_FLAGS
		anl	A, #4
		jnz	code_4BBE
		mov	DPTR, #0F844h
		movx	A, @DPTR
		add	A, #80h	; 'А'
		mov	B, A		; B-Register
		mov	A, UOZXX_2
		add	A, #80h	; 'А'
		cjne	A, B, code_4BAA	; B-Register
		mov	UOZXX_1, UOZXX_2
		sjmp	code_4BBE
; ---------------------------------------------------------------------------

code_4BAA:				; CODE XREF: RESET_0-9E40j
		jnc	code_4BB6
		mov	A, B		; B-Register
		dec	A
		clr	C
		subb	A, #80h	; 'А'
		mov	UOZXX_1, A
		sjmp	code_4BBE
; ---------------------------------------------------------------------------

code_4BB6:				; CODE XREF: RESET_0:code_4BAAj
		mov	A, B		; B-Register
		inc	A
		clr	C
		subb	A, #80h	; 'А'
		mov	UOZXX_1, A

code_4BBE:				; CODE XREF: RESET_0-9E4Ej
					; RESET_0-9E3Aj ...
		jb	Hardware.6, code_4C15
		mov	DPTR, #608Ah	; Температура разрешения отключения топлива | град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, TWAT
		clr	C
		subb	A, B		; B-Register
		jc	code_4C15
		mov	DPTR, #5F77h	; Температура ОГ запрета отключения топлива | град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F894h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_4BF1
		mov	DPTR, #6050h	; Скорость автомобиля для запрета отключения топлива | км/ч.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_4BF1
		sjmp	code_4C15
; ---------------------------------------------------------------------------

code_4BF1:				; CODE XREF: RESET_0-9E05j
					; RESET_0-9DF5j
		mov	DPTR, #60EAh	; Граница отключения подачи топлива | об./мин
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, RPM_1
		clr	C
		subb	A, B		; B-Register
		jnc	code_4C1B
		jnb	Options.4, code_4C1B
		jb	RAM_25.6, code_4C1B
		mov	DPTR, #607Bh	; Скорость разрешения отключения топлива | км/час
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_4C1B

code_4C15:				; CODE XREF: RESET_0:code_4BBEj
					; RESET_0-9E15j ...
		lcall	CALC_UGB_RXX
		ljmp	code_4CFA
; ---------------------------------------------------------------------------

code_4C1B:				; CODE XREF: RESET_0-9DE5j
					; RESET_0-9DE3j ...
		mov		DPTR, #0FF3Eh
		movx	A, @DPTR
		mov	B, A		; B-Register
		inc	RAM_6C
		mov	A, RAM_6C
		clr	C
		subb	A, B		; B-Register
		jc	code_4C15
		mov	RAM_6B,	#2
		clr	RAM_2B.1
		mov	RAM_6C,	#0

code_4C33:				; CODE XREF: RESET_0:code_4A53j
		lcall	code_B8B6
		mov	R2, UGB
		mov	A, DEV_FLAGS
		anl	A, #20h
		jnz	code_4C41
		lcall	CalcUFRXX

code_4C41:				; CODE XREF: RESET_0-9DA6j
		mov	A, DEV_FLAGS
		anl	A, #4
		jnz	code_4C4A
		mov	UOZXX_1, UOZXX_2

code_4C4A:				; CODE XREF: RESET_0-9D9Dj
		mov	A, RAM_6B
		cjne	A, #2, code_4C51
		sjmp	code_4C54
; ---------------------------------------------------------------------------

code_4C51:				; CODE XREF: RESET_0-9D96j
		cjne	A, #4, code_4C66

code_4C54:				; CODE XREF: RESET_0-9D93j
		mov	DPTR, #608Eh	; Задержка коррекции УОЗ при отключении	топливоподачи |	сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		inc	RAM_6C
		mov	A, RAM_6C
		clr	C
		subb	A, B		; B-Register
		jc	code_4C74
		inc	RAM_6B

code_4C66:				; CODE XREF: RESET_0:code_4C51j
		mov	A, DEV_FLAGS
		anl	A, #4
		jnz	code_4C74
		mov	DPTR, #6FC4h	; УОЗ при отключении подачи топлива | УОЗ, град.п.к.в -	Обороты	коленвала, об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	UOZXX_1, A

code_4C74:				; CODE XREF: RESET_0-9D80j
					; RESET_0-9D78j
		jnb	Options.4, code_4CD7
		jb	RAM_25.6, code_4CD7
		mov	A, RAM_6B
		cjne	A, #2, code_4C81
		sjmp	code_4C84
; ---------------------------------------------------------------------------

code_4C81:				; CODE XREF: RESET_0-9D66j
		cjne	A, #3, code_4CAD

code_4C84:				; CODE XREF: RESET_0-9D63j
		mov	DPTR, #607Bh	; Скорость разрешения отключения топлива | км/час
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_4CD7
		mov	DPTR, #60E9h	; Граница включения подачи топлива | об./мин
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, RPM_1
		clr	C
		subb	A, B		; B-Register
		jnc	code_4CD7
		mov	A, RAM_6B
		add	A, #2
		mov	RAM_6B,	A
		lcall	CALC_UGB_RXX
		sjmp	code_4CFA
; ---------------------------------------------------------------------------

code_4CAD:				; CODE XREF: RESET_0:code_4C81j
		mov	DPTR, #607Bh	; Скорость разрешения отключения топлива | км/час
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_4CD0
		mov	DPTR, #60EAh	; Граница отключения подачи топлива | об./мин
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, RPM_1
		clr	C
		subb	A, B		; B-Register
		jnc	code_4CD0
		lcall	CALC_UGB_RXX
		sjmp	code_4CFA
; ---------------------------------------------------------------------------

code_4CD0:				; CODE XREF: RESET_0-9D27j
					; RESET_0-9D19j
		mov	A, RAM_6B
		clr	C
		subb	A, #2
		mov	RAM_6B,	A

code_4CD7:				; CODE XREF: RESET_0:code_4C74j
					; RESET_0-9D6Bj ...
		clr	RAM_2B.4
		lcall	CLEAR_ADD_FUEL
		lcall	code_B027
		setb	RAM_2B.3
		clr	RAM_2A.5
		setb	RAM_2A.6
		mov	DPTR, #0FF53h
		movx	A, @DPTR
		mov	C, RAM_22.4
		mov	ACC.0, C	; Accumulator
		movx	@DPTR, A
		lcall	code_ACD9
		mov	A, #4
		mov	DPTR, #0F8B1h
		movx	@DPTR, A
		ljmp	code_4FBB
; ---------------------------------------------------------------------------

code_4CFA:				; CODE XREF: RESET_0-9EC1j
					; RESET_0-9DCAj ...
		mov	R2, UGB
		mov	A, DEV_FLAGS
		anl	A, #20h
		jnz	code_4D05
		lcall	CalcUFRXX

code_4D05:				; CODE XREF: RESET_0-9E60j
					; RESET_0-9CE2j
		jnb	Hardware.1, code_4D7D
		mov	A, RAM_7B
		anl	A, #4
		jnz	code_4D7D
		mov	DPTR, #60D1h	; Температура холодной продувки	| град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, TWAT
		clr	C
		subb	A, B		; B-Register
		jc	code_4D7D
		jnb	RAM_29.2, code_4D2A
		mov	DPTR, #0F868h
		movx	A, @DPTR
		jz	code_4D2A
		dec	A
		mov	DPTR, #0F868h
		movx	@DPTR, A

code_4D2A:				; CODE XREF: RESET_0-9CC6j
					; RESET_0-9CBFj
		mov	DPTR, #0F868h
		movx	A, @DPTR
		jnb	Hardware.0, code_4D34
		jb	RAM_2B.7, code_4D7D

code_4D34:				; CODE XREF: RESET_0-9CB4j
		jnb	RAM_2B.6, code_4D6E
		jnz	code_4D56
		mov	A, RAM_7B
		anl	A, #4
		jnz	code_4D47
		clr		A
		mov	DPTR, #0F806h
		movx	@DPTR, A

code_4D47:				; CODE XREF: RESET_0-9CA5j
		mov	DPTR, #60D0h	; Время	между продувками | сек.
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F868h
		movx	@DPTR, A
		clr	RAM_2B.6
		clr	RAM_2B.4
		sjmp	code_4D7D
; ---------------------------------------------------------------------------

code_4D56:				; CODE XREF: RESET_0-9CABj
		mov	A, RAM_7B
		anl	A, #4
		jnz	code_4D6C
		mov	DPTR, #746Dh	; Степень продувки | Степень продувки -	Обороты	коленвала, об/мин - Цикловое наполнение,мг/цикл
		mov	R2, RPM_RT
		mov	R3, GBC_RT
		lcall	GET_3D_VALUE
		mov	DPTR, #0F806h
		movx	@DPTR, A

code_4D6C:				; CODE XREF: RESET_0-9C88j
		sjmp	code_4D7D
; ---------------------------------------------------------------------------

code_4D6E:				; CODE XREF: RESET_0:code_4D34j
		jnz	code_4D7D
		mov	DPTR, #60CFh	; Время	горячей	продувки | сек.
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F868h
		movx	@DPTR, A
		clr	RAM_2B.4
		setb	RAM_2B.6

code_4D7D:				; CODE XREF: RESET_0:code_4D05j
					; RESET_0-9CD6j ...
		mov	C, RAM_23.6
		orl	C, RAM_24.6
		orl	C, RAM_23.5
		orl	C, RAM_24.5
		jnc	code_4D95
		mov	A, RAM_7B
		anl	A, #4
		jnz	code_4D95
		clr		A
		mov	DPTR, #0F806h
		movx	@DPTR, A

code_4D95:				; CODE XREF: RESET_0-9C5Dj
					; RESET_0-9C57j
		jnb	Hardware.0, code_4E16 ; 0 - ДК

code_4D9B:				; CODE XREF: RESET_0:code_4D95j
		mov	DPTR, #60A3h	; Температура включения	регулирования |	град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, TWAT
		clr	C
		subb	A, B		; B-Register
		jc	code_4E16
		mov	DPTR, #5FA5h	; Порог	температуры для	отключения регулирования | град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, TWAT
		clr	C
		subb	A, B		; B-Register
		jnc	code_4E16
		mov	DPTR, #60A0h	; Температура изменения	времени	прогрева | град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F80Ah
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_4DD0
		mov	DPTR, #60A1h	; Время	прогрева при низкой температуре	| сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		sjmp	code_4DD7
; ---------------------------------------------------------------------------

code_4DD0:				; CODE XREF: RESET_0-9C1Dj
		mov	DPTR, #60A2h	; Время	прогрева при высокой температуре | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_4DD7:				; CODE XREF: RESET_0-9C14j
		mov	DPTR, #0F807h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_4E16
		mov	DPTR, #0F810h
		movx	A, @DPTR
		jnb	ACC.0, code_4E16 ; Accumulator
		mov	DPTR, #63D3h	; Зона регулирования | Зона - Обороты коленвала, об/мин	- Цикловое наполнение,мг/цикл
		mov	A, RPM_GBC_3D_RT
		movc	A, @A+DPTR
		jnb	ACC.2, code_4E16 ; Accumulator
		mov	C, RAM_23.4
		orl	C, RAM_24.4
		orl	C, RAM_25.4
		orl	C, RAM_25.5
		orl	C, RAM_25.3
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		orl	C, ACC.7	; Accumulator
		orl	C, /RAM_29.7
		jc	code_4E16
		jb	RAM_2B.1, code_4E10
		lcall	code_E924
		jb	RAM_2B.2, code_4E22
		
code_4E10:
		mov	ALF_1, #80h ; 'А'
		lcall	code_A5B1
		ljmp	code_4EC3
; ---------------------------------------------------------------------------

code_4E16:				; CODE XREF: RESET_0:code_4D98j
					; RESET_0-9C04j ...
		jb	RAM_2B.1, code_4E1C ; признак ХХ
		lcall	code_E924

code_4E1C:				; CODE XREF: RESET_0-A1B8j
					; RESET_0-9BD5j ...
		jnb	RAM_2B.1, code_4E22
		ljmp	code_4EC1
; ---------------------------------------------------------------------------

code_4E22:				; CODE XREF: RESET_0:code_4E1Cj
		mov	DPTR, #607Dh	; Начальная температура	прогретого двигателя | град.С
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #6A53h	; Базовый состав смеси | Отношение воздух/топливо - Температура, град.С
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, ALF_1
		clr	C
		subb	A, B		; B-Register
		jnc	code_4E35
		clr	A

code_4E35:				; CODE XREF: RESET_0-9BB0j
		mov	R1, A
		mov	DPTR, #0F887h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F888h
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #6A7Ah	; Коррекция базового состава смеси | Коэффициент коррекции - Температура, град.С
		lcall	GET_2D_INTERPOLATION
		mov	B, R1		; B-Register
		mul	AB
		mov	R1, B		; B-Register
		mov	DPTR, #0F887h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F888h
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #6A53h	; Базовый состав смеси | Отношение воздух/топливо - Температура, град.С
		lcall	GET_2D_INTERPOLATION
		add	A, R1
		mov	ALF_1, A
		jb	RAM_2B.5, code_4E64
		clr	A
		sjmp	code_4E8D
; ---------------------------------------------------------------------------

code_4E64:				; CODE XREF: RESET_0-9B84j
		mov	R0, #0ACh ; 'м'
		mov	A, @R0
		mov	B, A		; B-Register
		inc	R0
		mov	A, @R0
		cjne	A, B, code_4E6E	; B-Register

code_4E6E:
		jc	code_4E72
		mov	B, A		; B-Register

code_4E72:				; CODE XREF: RESET_0:code_4E6Ej
		inc	R0
		mov	A, @R0
		cjne	A, B, code_4E77	; B-Register

code_4E77:
		jc	code_4E7B
		mov	B, A		; B-Register

code_4E7B:				; CODE XREF: RESET_0:code_4E77j
		inc	R0
		mov	A, @R0
		cjne	A, B, code_4E80	; B-Register

code_4E80:
		jc	code_4E84
		mov	B, A		; B-Register

code_4E84:				; CODE XREF: RESET_0:code_4E80j
		mov	A, B		; B-Register
		cjne	A, #1Fh, code_4E89

code_4E89:
		jc	code_4E8D
		mov	A, #1Fh

code_4E8D:				; CODE XREF: RESET_0-9B80j
					; RESET_0:code_4E89j
		mov	DPTR, #0FF50h
		movx	@DPTR, A
		mov	DPTR, #0A318h	; Обогащение при детонации | Добавка к ALF - Уровень детонации
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, ALF_1
		clr	C
		subb	A, B		; B-Register
		jc	code_4EBE
		mov	ALF_1, A
		mov	DPTR, #5F8Eh	; Температура ОГ для защиты нейтрализатора | град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F895h
		movx	A, @DPTR
		cjne	A, B, code_4EAE	; B-Register

code_4EAE:
		jc	code_4EC1
		mov	DPTR, #5F8Fh	; Коррекция состава смеси для защиты нейтрализатора |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, ALF_1
		clr	C
		subb	A, B		; B-Register
		jnc	code_4EBF

code_4EBE:				; CODE XREF: RESET_0-9B46j
		clr	A

code_4EBF:				; CODE XREF: RESET_0-9B26j
		mov	ALF_1, A

code_4EC1:				; CODE XREF: RESET_0-9BC3j
					; RESET_0:code_4EAEj
		clr	RAM_2B.4

code_4EC3:				; CODE XREF: RESET_0:code_482Dj
					; RESET_0-9BCFj
		jnb	Hardware.3, code_4EEB
		jnb	RAM_2B.5, code_4EEB
		mov	C, RAM_23.6
		orl	C, RAM_24.6
		jc	code_4EEB
		mov	DPTR, #5F70h	; Температура включения	контроля детонации | град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_4ED7

code_4ED7:
		jnc	code_4EEB
		mov	DPTR, #0F933h
		movx	A, @DPTR
		jnb	ACC.5, code_4EE5 ; Accumulator
		lcall	code_B526
		sjmp	code_4EE8
; ---------------------------------------------------------------------------

code_4EE5:				; CODE XREF: RESET_0-9B05j
		lcall	code_B402

code_4EE8:				; CODE XREF: RESET_0-9AFFj
		lcall	code_B63F

code_4EEB:				; CODE XREF: RESET_0:code_4EC3j
					; RESET_0-9B1Cj ...
		lcall	code_AFFC
		clr	RAM_2B.3
		clr	RAM_2A.5
		setb	RAM_2A.6
		mov	DPTR, #782Fh	; Ограничение состава смеси по температуре | Отношение воздух/топливо -	Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		clr	C
		subb	A, ALF_1
		jnc	code_4F04
		mov	ALF_1, B	; B-Register

code_4F04:				; CODE XREF: RESET_0-9AE3j
		mov		DPTR, #0F890h
		movx	A, @DPTR
		jnz		code_4F05
		setb	RAM_2A.7
		sjmp		code_4FA7

code_4F05:
		jnb		RAM_29.1, code_4F06
		dec		A
		movx	@DPTR, A

code_4F06:
		mov		DPTR, #60D2h
		clr		A
		movc	A, @A+DPTR
		xch		A, ALF_1
		clr		C
		subb	A, ALF_1
		jnc		code_4F07
		clr		A
code_4F07:
		mov		ALF_1, A

code_4FA7:
		mov	DPTR, #0F89Bh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #8A32h	; Коэффициент уменьшения GTC после пуска | мг/цикл - Время, сек
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R0
		clr	C
		subb	A, B		; B-Register
		mov	R0, A
		mov	A, R1
		subb	A, #0
		mov	R1, A
		jnc	code_4F23
		clr	A
		mov	R0, A
		mov	R1, A

code_4F23:				; CODE XREF: RESET_0-9AC4j
		mov	DPTR, #0F89Bh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A

code_4F2C:				; CODE XREF: RESET_0:code_45AEj
		mov	A, DEV_FLAGS
		anl	A, #1
		jnz	code_4F38
		lcall	code_AFC2
		mov	ALF_2, ALF_1

code_4F38:				; CODE XREF: RESET_0-9AB2j
		jb	RAM_23.5, code_4F86
		jb	RAM_24.5, code_4F86
		jb	RAM_23.6, code_4F86
		jb	RAM_24.6, code_4F86
		jb	RAM_23.4, code_4F86
		jb	RAM_24.4, code_4F86
		jb	RAM_25.3, code_4F86
		jb	RAM_25.4, code_4F86
		jb	RAM_25.5, code_4F86
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		jb	ACC.7, code_4F86 ; Accumulator
		jnb	Hardware.0, code_4F86
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		mov	R3, A
		mov	R2, RPM_RT
		mov	DPTR, #0FD00h
		lcall	GET_3D_RAM_VALUE
		jnb	RAM_2B.4, code_4F88
		mov	B, A		; B-Register
		mov	A, RAM_6E
		jb	ACC.7, code_4F7E ; Accumulator
		add	A, B		; B-Register
		jnc	code_4F88
		mov	A, #0F0h ; 'Ё'
		sjmp	code_4F8F
; ---------------------------------------------------------------------------

code_4F7E:				; CODE XREF: RESET_0-9A6Fj
		add	A, B		; B-Register
		jc	code_4F88
		mov	A, #0Fh
		sjmp	code_4F8F
; ---------------------------------------------------------------------------

code_4F86:				; CODE XREF: RESET_0:code_4F38j
					; RESET_0-9AA7j ...
		mov	A, #80h	; 'А'

code_4F88:				; CODE XREF: RESET_0-9A76j
					; RESET_0-9A6Aj ...
		mov	R0, #0Fh
		mov	R1, #0F0h ; 'Ё'
		lcall	code_AD03

code_4F8F:				; CODE XREF: RESET_0-9A66j
					; RESET_0-9A5Ej
		mov	B, A		; B-Register
		mov	A, DEV_FLAGS
		anl	A, #10h
		jnz	code_4F9A
		mov	RAM_6F,	B	; B-Register

code_4F9A:				; CODE XREF: RESET_0-9A4Dj
		jb	RAM_2B.1, code_4FA3
		mov	A, RAM_6B
		jnz	code_4FA3
		sjmp	code_4FB8
; ---------------------------------------------------------------------------

code_4FA3:				; CODE XREF: RESET_0:code_4F9Aj
					; RESET_0-9A43j
		mov	R2, RPM_RT
		mov	R3, GBC_RT
		; Начальная коррекция времени впрыска ХХ | Коэффициент коррекции - Обороты коленвала, об/мин - Цикловое	наполнение,мг/цикл
		GET_3D_RAM_WITH_INTERPOLATION 8E2Ah, CAPTURE_TINJ_MODE
		
		mov	R0, #0Fh
		mov	R1, #0F0h ; 'Ё'
		lcall	code_AD03
		mov	RAM_4F,	A
		sjmp	code_4FBB
; ---------------------------------------------------------------------------

code_4FB8:				; CODE XREF: RESET_0-9A41j
		mov	RAM_4F,	#80h ; 'А'

code_4FBB:				; CODE XREF: RESET_0-A5AEj
					; RESET_0-A1C3j ...
		lcall	BOOST_CONTROL
		mov	A, DEV_FLAGS
		jb		ACC.2, code_4FCF
		jnb		ACC.3, code_4FCF
		mov	DPTR, #0F88Fh
		movx	A, @DPTR
		add	A, UOZXX_1
		mov	UOZXX_1, A

code_4FCF:				; CODE XREF: RESET_0-9A23j
					; RESET_0-9A1Dj
		mov	A, UOZXX_1
		jnb	ACC.7, code_4FD5 ; Accumulator
		clr	A

code_4FD5:				; CODE XREF: RESET_0-9A11j
		mov	DPTR, #0FAADh
		movx	@DPTR, A
		mov	DPTR, #0F938h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, UOZXX_1
		add	A, #0Ah
		clr	C
		subb	A, B		; B-Register
		jnc	code_4FEA
		clr	C
		clr	A

code_4FEA:				; CODE XREF: RESET_0-99FCj
		subb	A, #0Ah
		mov	UOZXX_1, A
		lcall	code_B73C
		jnb	RAM_29.3, code_5041
		jb	RAM_2B.1, code_5041
		mov	A, DEV_FLAGS
		anl	A, #4
		jnz	code_5041
		mov	DPTR, #5FA4h	; Период скорости изменения УОЗ	|
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F886h
		movx	A, @DPTR
		inc	A
		jz	code_500F
		mov	DPTR, #0F886h
		movx	@DPTR, A

code_500F:				; CODE XREF: RESET_0-99D9j
		cjne	A, B, code_5012	; B-Register

code_5012:
		jnc	code_5019
		mov	B, #0		; B-Register
		sjmp	code_5025
; ---------------------------------------------------------------------------

code_5019:				; CODE XREF: RESET_0:code_5012j
		clr	A
		mov	DPTR, #0F886h
		movx	@DPTR, A
		mov	DPTR, #6080h	; Макс.	скорость изменения УОЗ | град./сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_5025:				; CODE XREF: RESET_0-99CBj
		mov	A, UOZXX_1
		add	A, #80h	; 'А'
		mov	R0, A
		mov	DPTR, #0F844h
		movx	A, @DPTR
		add	A, #80h	; 'А'
		clr	C
		subb	A, R0
		jnc	code_5041
		movx	A, @DPTR
		add	A, #80h	; 'А'
		add	A, B		; B-Register
		clr	C
		subb	A, R0
		jnc	code_5041
		add	A, UOZXX_1
		mov	UOZXX_1, A

code_5041:				; CODE XREF: RESET_0-99F1j
					; RESET_0-99EEj ...
		mov	A, UOZXX_1
		mov	DPTR, #0F844h
		movx	@DPTR, A
		mov	B, A		; B-Register
		jb	ACC.7, code_5060 ; Accumulator
		mov	DPTR, #0F9A0h
		movx	A, @DPTR
		jb	ACC.7, code_505C ; Accumulator
		add	A, B		; B-Register
		jnb	ACC.7, code_505A ; Accumulator
		mov	A, #7Fh	; ''

code_505A:				; CODE XREF: RESET_0-998Dj
		sjmp	code_5072
; ---------------------------------------------------------------------------

code_505C:				; CODE XREF: RESET_0-9992j
		add	A, B		; B-Register
		sjmp	code_5072
; ---------------------------------------------------------------------------

code_5060:				; CODE XREF: RESET_0-9999j
		mov	DPTR, #0F9A0h
		movx	A, @DPTR
		jnb	ACC.7, code_5070 ; Accumulator
		add	A, B		; B-Register
		jb	ACC.7, code_506E ; Accumulator
		mov	A, #80h	; 'А'

code_506E:				; CODE XREF: RESET_0-9979j
		sjmp	code_5072
; ---------------------------------------------------------------------------

code_5070:				; CODE XREF: RESET_0-997Ej
		add	A, B		; B-Register

code_5072:				; CODE XREF: RESET_0:code_505Aj
					; RESET_0-9984j ...
		mov	R2, A
		mov	DPTR, #607Eh	; Минимальный реализуемый УОЗ |	гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #0FAADh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #5F8Bh	; Максимальное опережение динамической корекции	| гр.п.кв.
		clr	A
		movc	A, @A+DPTR
		add	A, B		; B-Register
		mov	R1, A
		mov	A, R2
		lcall	code_AD14
		mov	R0, A
		mov	DPTR, #0F8C1h
		movx	@DPTR, A
		mov	DPTR, #0FAAAh
		movx	A, @DPTR
		mov	R4, A
		mov	DPTR, #60D7h	; Условие 2-го ограничения по температуре | град.
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_509D

code_509D:
		mov	A, R4
		mov	ACC.0, C	; Accumulator
		mov	R4, A
		mov	DPTR, #60E8h	; Условие 2-го ограничения по оборотам ХХ | об/мин
		clr	A
		movc	A, @A+DPTR
		cjne	A, RPM_XX, code_50A9

code_50A9:
		cpl	C
		mov	A, R4
		mov	ACC.1, C	; Accumulator
		mov	R4, A
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #60F8h	; Условие 2-го ограничения по скорости | км/ч.
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_50BC	; B-Register

code_50BC:
		cpl	C
		mov	A, R4
		mov	ACC.2, C	; Accumulator
		mov	C, RAM_25.6
		cpl	C
		mov	ACC.3, C	; Accumulator
		mov	C, RAM_2B.1
		cpl	C
		mov	ACC.4, C	; Accumulator
		mov	C, RAM_2A.3
		cpl	C
		mov	ACC.5, C	; Accumulator
		mov	R4, A
		anl	A, #3Fh
		cjne	A, #3Fh, code_50D8 ; '?'

code_50D8:
		cpl	C
		mov	ACC.7, C	; Accumulator
		mov	DPTR, #0FAAAh
		movx	@DPTR, A
		jnc	code_50E8
		mov	DPTR, #60F9h	; Максимальный реализуемый УОЗ номер 2 | гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		sjmp	code_50F9
; ---------------------------------------------------------------------------

code_50E8:				; CODE XREF: RESET_0-9903j
		mov	DPTR, #607Fh	; Максимальный реализуемый УОЗ номер 1 | гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FAABh
		movx	A, @DPTR
		cjne	A, B, code_50F6	; B-Register

code_50F6:
		jnc	code_50F9
		inc	A

code_50F9:				; CODE XREF: RESET_0-98FCj
					; RESET_0:code_50F6j
		mov	DPTR, #0FAABh
		movx	@DPTR, A
		mov	R1, A
		mov	DPTR, #607Eh	; Минимальный реализуемый УОЗ |	гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #0F8C1h
		movx	A, @DPTR
		lcall	code_AD14
		mov	UOZXX_1, A
		mov	DPTR, #0F8C1h
		movx	@DPTR, A
		mov	A, RAM_3D
		cjne	A, #4, code_511A

code_511A:
		jnc	code_5123
		mov	A, RAM_3C
		cjne	A, #1Eh, code_5121

code_5121:
		jc	code_5126

code_5123:				; CODE XREF: RESET_0:code_511Aj
		ljmp	code_25D2
; ---------------------------------------------------------------------------

code_5126:				; CODE XREF: RESET_0:code_5121j
		mov	A, RAM_3C
		cjne	A, RAM_3E, code_51A8
		mov	DPTR, #605Fh	; Минимальная фаза впрыска | гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #6060h	; Максимальная фаза впрыска | гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		mov	B, RPM_1	; B-Register
		mov	DPTR, #605Eh	; Коррекция задержки фазы при 10240 об/мин | гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mul	AB
		mov	DPTR, #0FF47h
		movx	A, @DPTR
		add	A, #3Ch	; '<'
		clr	C
		subb	A, B		; B-Register
		jnc	code_514D
		add	A, #78h	; 'x'

code_514D:				; CODE XREF: RESET_0-9899j
		clr	C
		subb	A, #0Bh
		jnc	code_5154
		add	A, #78h	; 'x'

code_5154:				; CODE XREF: RESET_0-9892j
		lcall	code_AD03
		mov	R0, A
		mov	DPTR, #0F959h
		movx	@DPTR, A
		mov	A, RAM_3D
		cpl	ACC.1		; Accumulator
		mov	B, #1Eh		; B-Register
		mul	AB
		add	A, RAM_3C
		mov	R1, A
		mov	DPTR, #0F95Ah
		movx	@DPTR, A
		clr	C
		subb	A, RAM_0
		jz	code_51A8
		jc	code_5186
		cjne	A, #3Ch, code_5175 ; '<'

code_5175:
		jc	code_5182
		mov	A, R1
		inc	A
		cjne	A, #78h, code_517C ; 'x'

code_517C:
		jc	code_5180
		subb	A, #78h	; 'x'

code_5180:				; CODE XREF: RESET_0:code_517Cj
		sjmp	code_5199
; ---------------------------------------------------------------------------

code_5182:				; CODE XREF: RESET_0:code_5175j
		mov	A, R1
		dec	A
		sjmp	code_5199
; ---------------------------------------------------------------------------

code_5186:				; CODE XREF: RESET_0-9872j
		cpl	A
		inc	A
		cjne	A, #3Ch, code_518B ; '<'

code_518B:
		jc	code_5197
		mov	A, R1
		clr	C
		subb	A, #1
		jnc	code_5195
		add	A, #78h	; 'x'

code_5195:				; CODE XREF: RESET_0-9851j
		sjmp	code_5199
; ---------------------------------------------------------------------------

code_5197:				; CODE XREF: RESET_0:code_518Bj
		mov	A, R1
		inc	A

code_5199:				; CODE XREF: RESET_0:code_5180j
					; RESET_0-985Ej ...
		mov	B, #1Eh		; B-Register
		div	AB
		cpl	ACC.1		; Accumulator
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	RAM_3E,	B	; B-Register
		mov	RAM_3F,	A
		setb	IEN0.7		; Interrupt Enable Register 0

code_51A8:				; CODE XREF: RESET_0-98BAj
					; RESET_0-9874j
		mov	DPTR, #0F9A0h
		movx	A, @DPTR
		mov	DPTR, #0FAA6h
		movx	@DPTR, A
		mov	DPTR, #0F978h
		movx	A, @DPTR
		mov	R2, RPM_RT
		mov	R3, A
		mov	DPTR, #5F00h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #9194h	; Время	накопления для попарно-параллельного режима | Время накопления,	мс. - Обороты коленвала, об/мин	- Бортовое напряжение
		jb	ACC.1, code_51C5 ; Accumulator
		mov	DPTR, #8B00h	; Время	накопления | Время накопления, мс. - Обороты коленвала,	об/мин - Бортовое напряжение

code_51C5:				; CODE XREF: RESET_0-9823j
		lcall	GET_3D_VALUE
		mov	DPTR, #0F84Dh
		movx	@DPTR, A
		mov	B, #15h		; B-Register
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		lcall	DIV_R0R1_2
		mov	RAM_44,	R0
		mov	RAM_45,	R1
		mov	DPTR, #0FF58h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	B, RPM_1	; B-Register
		mov	DPTR, #605Dh	; Коррекция задержки УОЗ при 10240 об/мин | гр.п.к.в.
		clr	A
		movc	A, @A+DPTR
		mul	AB
		mov	A, B		; B-Register
		add	A, UOZXX_1
		mov	R2, A
		mov	DPTR, #0F84Dh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F94Ah
		jnb	RAM_2A.3, code_5200
		mov	DPTR, #0FF49h

code_5200:				; CODE XREF: RESET_0-97E8j
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	MUL_R0R1_B
		mov	A, R1
		jz	code_520E
		mov	R0, #0FFh

code_520E:				; CODE XREF: RESET_0-97D8j
		mov	A, R0
		mov	B, #7Bh	; '{'   ; B-Register
		mul	AB
		mov	A, B		; B-Register
		clr	C
		mov	R0, #0Eh
		jb	Options.5, code_520F
		mov	R0, #6
		cjne	A, #0Eh, code_520F
		
code_520F:
		mov	RAM_27.5, C
		mov	R1, #0AEh ; 'о'
		lcall	code_AD03
		mov	B, #6		; B-Register
		div	AB
		mov	DPTR, #0F800h
		movx	@DPTR, A
		
		cjne	A, #7, code_5272
code_5272:
		jc		code_5276
		mov		A, #7
code_5276:
		mov		RAM_7D, A

		mov	A, B		; B-Register
		rl	A
		mov	DPTR, #0F801h
		movx	@DPTR, A
		mov	R0, #80h ; 'А'

code_5234:				; CODE XREF: RESET_0:code_52CCj
		mov	R3, #2Fh ; '/'
		mov	A, R0
		clr	C
		subb	A, #80h	; 'А'
		jnb	ACC.2, code_523F ; Accumulator
		mov	R3, #11h

code_523F:				; CODE XREF: RESET_0-97A8j
		rr	A
		rr	A
		mov	R1, #0ACh ; 'м'
		add	A, R1
		mov	R1, A
		mov	A, @R1
		mov	B, A		; B-Register
		mov	DPTR, #0FAA6h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_5256
		mov	B, #0		; B-Register
		sjmp	code_525A
; ---------------------------------------------------------------------------

code_5256:				; CODE XREF: RESET_0-9793j
		cpl	A
		inc	A
		mov	B, A		; B-Register

code_525A:				; CODE XREF: RESET_0-978Ej
		mov	A, B		; B-Register
		mov	DPTR, #0FAA7h
		movx	@DPTR, A
		mov	A, #90h	; 'Р'
		clr	C
		subb	A, R2
		jnb	RAM_2B.5, code_5269
		add	A, B		; B-Register

code_5269:				; CODE XREF: RESET_0-977Ej
		clr	C
		subb	A, #84h	; 'Д'
		jnc	code_5279
		mov	B, A		; B-Register
		mov	A, R3
		add	A, #27h	; '''
		mov	R3, A
		mov	A, B		; B-Register
		clr	C
		subb	A, #4

code_5279:				; CODE XREF: RESET_0-9776j
		mov	B, #0Ch		; B-Register
		div	AB
		add	A, R3
		cjne	A, #3Ch, code_5281 ; '<'

code_5281:
		jc	code_5285
		subb	A, #3Ch	; '<'

code_5285:				; CODE XREF: RESET_0:code_5281j
		mov	R3, A
		mov	R4, A
		mov	R1, B		; B-Register
		mov	DPTR, #0F801h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, R1
		clr	C
		subb	A, B		; B-Register
		jnc	code_5298
		add	A, #0Ch
		dec	R4

code_5298:				; CODE XREF: RESET_0-974Fj
		mov	DPTR, #5ED0h
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		movc	A, @A+DPTR
		mov	R1, A
		mov	DPTR, #0F800h
		movx	A, @DPTR
		xch	A, R4
		clr	C
		subb	A, R4
		jnc	code_52B1
		add	A, #3Ch	; '<'
		sjmp	code_52B8
; ---------------------------------------------------------------------------

code_52B1:				; CODE XREF: RESET_0-9737j
		cjne	A, #3Ch, code_52B4 ; '<'

code_52B4:
		jc	code_52B8
		subb	A, #3Ch	; '<'

code_52B8:				; CODE XREF: RESET_0-9733j
					; RESET_0:code_52B4j
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	@R0, A
		inc	R0
		mov	@R0, B		; B-Register
		inc	R0
		mov	@R0, RAM_3
		inc	R0
		mov	@R0, RAM_1
		setb	IEN0.7		; Interrupt Enable Register 0
		inc	R0
		cjne	R0, #90h, code_52CC ; 'Р'
		sjmp	code_52CF
; ---------------------------------------------------------------------------

code_52CC:				; CODE XREF: RESET_0-971Bj
		ljmp	code_5234
; ---------------------------------------------------------------------------

code_52CF:				; CODE XREF: RESET_0-9718j
		mov	C, RAM_2D.6
		mov	DPTR, #5EF9h
		clr	A
		movc	A, @A+DPTR
		jnb		ACC.3, code_539B
		jc	code_5361
		jnb	RAM_2D.7, code_5354
		mov	DPTR, #71C4h
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		sjmp	code_535B

code_5354:				; CODE XREF: RESET_0+302Cj
		mov	DPTR, #71C5h
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_535B:				; CODE XREF: RESET_0+3036j
		mov	A, TWAT
		cjne	A, B, code_5360	; B-Register

code_5360:
		cpl	C

code_5361:				; CODE XREF: RESET_0+302Aj
		jnb	RAM_2B.1, code_5399
		jb	RAM_2D.7, code_5399
		jnc	code_5399
		mov	DPTR, #71C6h
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FF3Dh
		movx	A, @DPTR
		jnz	code_5391
		mov	DPTR, #71C7h
		clr	A
		movc	A, @A+DPTR
		add	A, UFRXX
		mov	UFRXX,	A
		mov	R0, A
		mov	R1, #0
		lcall	MUL_R0R1_16
		mov	DPTR, #0F845h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		lcall	code_AC02
		clr	A

code_5391:				; CODE XREF: RESET_0+3058j
		inc	A
		cjne	A, B, code_5396	; B-Register

code_5396:
		cpl	C
		jnc	code_539A

code_5399:				; CODE XREF: RESET_0+3026j
					; RESET_0:code_5361j ...
		clr	A

code_539A:				; CODE XREF: RESET_0+307Bj
		mov	DPTR, #0FF3Dh
		movx	@DPTR, A
		mov	RAM_2D.7, C
		mov	DPTR, #0F9A8h
		movx	A, @DPTR
		mov	ACC.7, C	; Accumulator
		movx	@DPTR, A
		clr		C
		
code_539B:
		mov	A, RAM_79
		anl	A, #2
		jz	code_53B4
		mov	C, RAM_2E.1
		sjmp	code_5333
; ---------------------------------------------------------------------------

code_53B4:
		orl	C, RAM_23.3
		orl	C, RAM_24.3
		jc	code_52FA
		jnb	RAM_28.1, code_52ED
		mov	DPTR, #60C7h	; Температура выключения вентилятора | град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		sjmp	code_52F4
; ---------------------------------------------------------------------------

code_52ED:				; CODE XREF: RESET_0-9701j
		mov	DPTR, #60C8h	; Температура включения	вентилятора | град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_52F4:				; CODE XREF: RESET_0-96F7j
		mov	A, TWAT
		cjne	A, B, code_52F9	; B-Register

code_52F9:
		cpl	C

code_52FA:				; CODE XREF: RESET_0-9703j
		jnb	RAM_2B.1, code_5332
		jb	RAM_28.1, code_5332
		jnc	code_5332
		mov	DPTR, #60EEh	; Задержка включения вентилятора | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8BFh
		movx	A, @DPTR
		jnz	code_532B
		mov	DPTR, #60EDh	; Смещение РХХ при включения вентилятора | шаг.
		clr	A
		movc	A, @A+DPTR
		add	A, UFRXX
		mov	UFRXX, A
		mov	R0, A
		mov	R1, #0
		lcall	code_ADA2
		mov	DPTR, #0F845h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		lcall	code_AC02
		clr	A

code_532B:				; CODE XREF: RESET_0-96D5j
		inc	A
		cjne	A, B, code_532F	; B-Register

code_532F:
		cpl	C
		jnc	code_5333

code_5332:				; CODE XREF: RESET_0:code_52FAj
					; RESET_0-96E5j ...
		clr	A

code_5333:				; CODE XREF: RESET_0-970Bj
					; RESET_0-96B2j
		mov	DPTR, #0F8BFh
		movx	@DPTR, A
		mov	RAM_28.1, C
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		mov	ACC.7, C	; Accumulator
		movx	@DPTR, A
		mov	A, RAM_79
		anl	A, #4
		jz	code_5350
		mov	C, RAM_2E.2
		jnc	code_5392
		ljmp	code_541E
; ---------------------------------------------------------------------------

code_5350:				; CODE XREF: RESET_0-969Bj
		mov	DPTR, #5F89h	; Напряжение отключения	нагрузок при отказе РР | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F80Dh
		movx	A, @DPTR
		cjne	A, B, code_535E	; B-Register

code_535E:
		jnc	code_53D6
		jb	RAM_2D.6, code_536C
		mov	DPTR, #5FBAh	; Температура запрета включения	кондиционера | град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		sjmp	code_5373
; ---------------------------------------------------------------------------

code_536C:				; CODE XREF: RESET_0-9682j
		mov	DPTR, #5FBBh	; Температура принудительного отключения кондиционера |	град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_5373:				; CODE XREF: RESET_0-9678j
		mov	A, TWAT
		cjne	A, B, code_5378	; B-Register

code_5378:
		jnc	code_53D6
		mov	B, #6		; B-Register
		lcall	code_A5A0
		mov	C, ACC.7	; Accumulator
		cpl	C
		mov	DPTR, #0F86Fh
		movx	A, @DPTR
		rlc	A
		movx	@DPTR, A
		jz	code_5394
		cpl	A
		jz	code_53D6
		mov	C, RAM_2D.6
		jc	code_5394

code_5392:				; CODE XREF: RESET_0-9697j
		sjmp	code_53D6
; ---------------------------------------------------------------------------

code_5394:				; CODE XREF: RESET_0-9659j
					; RESET_0-9652j
		mov	DPTR, #5F60h	; Задержка включения после пуска двигателя | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9D4h
		movx	A, @DPTR
		cjne	A, B, code_53A2	; B-Register

code_53A2:
		jc	code_53D6
		mov	C, RAM_2D.6
		jc	code_53B1
		mov	DPTR, #5F5Dh	; Граница включения по дросселю	| %
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		sjmp	code_53B8
; ---------------------------------------------------------------------------

code_53B1:				; CODE XREF: RESET_0-963Cj
		mov	DPTR, #5F5Eh	; Граница отключения по	дросселю | %
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_53B8:				; CODE XREF: RESET_0-9633j
		mov	A, THR_CODE
		cjne	A, B, code_53BD	; B-Register

code_53BD:
		jc	code_541E
		mov	DPTR, #5F61h	; Задержка отключения кондиционера | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F870h
		movx	A, @DPTR
		cjne	A, B, code_53CD	; B-Register

code_53CD:
		jnc	code_53D6
		inc	A
		mov	DPTR, #0F870h
		movx	@DPTR, A
		sjmp	code_542E
; ---------------------------------------------------------------------------

code_53D6:				; CODE XREF: RESET_0:code_535Ej
					; RESET_0:code_5378j ...
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		mov	C, ACC.5	; Accumulator
		orl	C, RAM_2D.6
		jnc	code_541C
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		clr	ACC.5		; Accumulator
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F871h
		movx	@DPTR, A
		mov	DPTR, #0F84Fh
		movx	@DPTR, A
		mov	DPTR, #5FE5h	; Скорость принудительного отключения кондиционера | км/ч.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		cjne	A, B, code_53FE	; B-Register

code_53FE:
		jnc	code_5415
		jnb	RAM_29.1, code_541C
		mov	DPTR, #5FE4h	; Максимальное время непрерывной работы	кондиционера | минут
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FA8Ch
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_5413	; B-Register

code_5413:
		jc	code_541C

code_5415:				; CODE XREF: RESET_0:code_53FEj
		clr	RAM_2D.6
		clr	A
		mov	DPTR, #0FA8Ch
		movx	@DPTR, A

code_541C:				; CODE XREF: RESET_0-9604j
					; RESET_0-95E2j ...
		sjmp	code_5492
; ---------------------------------------------------------------------------

code_541E:				; CODE XREF: RESET_0-9695j
					; RESET_0:code_53BDj
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		jb	ACC.5, code_5492 ; Accumulator
		clr	A
		mov	DPTR, #0F870h
		movx	@DPTR, A
		mov	DPTR, #0FA8Ch
		movx	@DPTR, A

code_542E:				; CODE XREF: RESET_0-960Ej
		jnb	RAM_2B.1, code_5471
		mov	DPTR, #5F5Fh	; Задержка адаптации ХХ	при вкл	кондиционера | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F871h
		movx	A, @DPTR
		jnz	code_5467
		mov	DPTR, #5F5Ch	; Смещение РХХ при включении кондиционера | шаг.
		clr	A
		movc	A, @A+DPTR
		add	A, UFRXX
		mov	UFRXX, A
		mov	DPTR, #5F5Bh	; Температура включения	дополнительного	смещения РХХ | град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_544F

code_544F:
		jnc	code_545A
		mov	DPTR, #5F5Ah	; Дополнительное смещение РХХ |	шаг.
		clr	A
		movc	A, @A+DPTR
		add	A, UFRXX
		mov	UFRXX, A

code_545A:				; CODE XREF: RESET_0:code_544Fj
		mov	DPTR, #5F59h	; Начальное смещение оборотов при включении кондиционера | об/мин
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0F84Fh
		movx	@DPTR, A
		lcall	code_AC02
		clr	A

code_5467:				; CODE XREF: RESET_0-95A6j
		inc	A
		mov	DPTR, #0F871h
		movx	@DPTR, A
		cjne	A, B, code_546F	; B-Register

code_546F:
		jc	code_5492

code_5471:				; CODE XREF: RESET_0:code_542Ej
		jb	RAM_2B.1, code_5484
		mov	DPTR, #5FE3h	; Скорость возобновления кондиционирования | км/ч.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		cjne	A, B, code_5482	; B-Register

code_5482:
		jc	code_5492

code_5484:				; CODE XREF: RESET_0:code_5471j
		clr	A
		mov	DPTR, #0F871h
		movx	@DPTR, A
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		setb	ACC.5		; Accumulator
		movx	@DPTR, A
		setb	RAM_2D.6

code_5492:				; CODE XREF: RESET_0:code_541Cj
					; RESET_0-95C0j ...
		mov	DPTR, #60E0h	; Обороты отключения контроля детонации	| об/мин
		clr	A
		movc	A, @A+DPTR
		cjne	A, RPM_1, code_549A

code_549A:
		mov	RAM_28.5, C
		mov	DPTR, #605Ah	; Обороты начала выхода	из режима пуска	| об/мин
		clr	A
		movc	A, @A+DPTR
		cjne	A, RPM_XX, code_54A4

code_54A4:
		jnc	code_54BB
		mov	C, RAM_25.2
		mov	DPTR, #0F98Bh
		movx	A, @DPTR
		addc	A, #0
		cjne	A, #0Ah, code_54B1

code_54B1:
		jc	code_54B7
		setb	RAM_22.0
		sjmp	code_54BB
; ---------------------------------------------------------------------------

code_54B7:				; CODE XREF: RESET_0:code_54B1j
		mov	DPTR, #0F98Bh
		movx	@DPTR, A

code_54BB:				; CODE XREF: RESET_0:code_54A4j
					; RESET_0-952Dj
		mov	RAM_5B,	RAM_22
		mov	DPTR, #5FA0h	; Порог	запрета	диагностики датчика фаз	| об/мин.
		clr	A
		movc	A, @A+DPTR
		cjne	A, RPM_XX, code_54C6

code_54C6:
		jc	code_54CB
		anl	RAM_5B,	#0EFh

code_54CB:				; CODE XREF: RESET_0:code_54C6j
		jnb	RAM_2A.3, code_54D1
		anl	RAM_5B,	#0EFh

code_54D1:				; CODE XREF: RESET_0:code_54CBj
		mov	DPTR, #60DAh
		clr	A
		movc	A, @A+DPTR
		anl	RAM_5B,	A
		mov	DPTR, #60DBh
		clr	A
		movc	A, @A+DPTR
		anl	RAM_23,	A
		mov	DPTR, #60DCh
		clr	A
		movc	A, @A+DPTR
		anl	RAM_24,	A
		mov	DPTR, #60DDh
		clr	A
		movc	A, @A+DPTR
		anl	RAM_25,	A
		mov	DPTR, #5FADh
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		anl	A, B		; B-Register
		movx	@DPTR, A
		jnb	RAM_29.2, code_5507
		mov	A, #0FEh ; '¦'
		anl	RAM_22,	A
		clr	A
		mov	DPTR, #0F98Bh
		movx	@DPTR, A

code_5507:				; CODE XREF: RESET_0-94E7j
					; RESET_0-94A2j
		clr	RAM_28.4
		mov	DPTR, #0F82Eh
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	B, RPM		; B-Register
		lcall	MUL_R0R1_B
		mov	A, ALF_2
		add	A, #80h	; 'А'
		mov	R2, A
		clr	A
		addc	A, #0
		mov	MD0, B		; Multiplication/Division Register 0
		mov	MD1, R0		; Multiplication/Division Register 1
		mov	MD2, R1		; Multiplication/Division Register 2
		mov	MD3, #0		; Multiplication/Division Register 3
		mov	MD4, R2		; Multiplication/Division Register 4
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
		jb	RAM_28.4, code_5507
		mov	B, RAM_6F	; B-Register
		mov	R2, RAM_0
		mov	R3, RAM_1
		cpl	B.7		; B-Register
		lcall	MUL_R0R1_B
		mov	A, RAM_6F
		jnb	ACC.7, code_5557 ; Accumulator
		lcall	ADD_R0R1_R2R3

code_5557:				; CODE XREF: RESET_0-9491j
		mov	B, #0E9h ; 'щ'  ; B-Register
		lcall	MUL_R0R1_B
		mov	R4, B		; B-Register
		jnb	RAM_2B.3, code_5568
		mov	R0, #0
		mov	R1, #0
		mov	R4, #0

code_5568:				; CODE XREF: RESET_0-9483j
		mov	DPTR, #0F862h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		mov	B, A		; B-Register
		jz	code_55AC

code_5579:				; CODE XREF: RESET_0-943Dj
		clr	RAM_28.4
		mov	DPTR, #0F862h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	MD0, R4		; Multiplication/Division Register 0
		mov	MD1, R0		; Multiplication/Division Register 1
		mov	MD2, R1		; Multiplication/Division Register 2
		mov	MD3, #0		; Multiplication/Division Register 3
		mov	MD4, B		; Multiplication/Division Register 4
		mov	MD5, #0		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		jb	RAM_28.4, code_5579
		mov	A, R2
		orl	A, R3
		jz	code_55B0

code_55AC:				; CODE XREF: RESET_0-946Bj
		mov	R0, #0FFh
		mov	R1, #0FFh

code_55B0:				; CODE XREF: RESET_0-9438j
		mov	DPTR, #0F874h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #5F63h	; Число	импульсов у ДСА	| имп.
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		clr	C
		rrc	A
		mov	R0, A
		mov	A, R1
		mov	B, #3		; B-Register
		div	AB
		mov	B, A		; B-Register
		mov	DPTR, #0F8ADh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_55D8	; B-Register
		mov	R0, #0C0h ; 'L'
		clr	A
		xch	A, @R0
		sjmp	code_55ED
; ---------------------------------------------------------------------------

code_55D8:				; CODE XREF: RESET_0-9413j
		cjne	A, RAM_0, code_55E1
		mov	R0, #0C1h ; '+'
		clr	A
		xch	A, @R0
		sjmp	code_55ED
; ---------------------------------------------------------------------------

code_55E1:				; CODE XREF: RESET_0:code_55D8j
		cjne	A, RAM_1, code_5617
		clr	A
		mov	DPTR, #0F8ADh
		movx	@DPTR, A
		mov	R0, #0C2h ; 'T'
		clr	A
		xch	A, @R0

code_55ED:				; CODE XREF: RESET_0-940Cj
					; RESET_0-9403j
		mov	DPTR, #0F8AEh
		movx	@DPTR, A
		mov	R2, A
		add	A, #2
		mov	B, #4		; B-Register
		div	AB
		cjne	A, #0Fh, code_55FB

code_55FB:
		jc	code_55FF
		mov	A, #0Fh

code_55FF:				; CODE XREF: RESET_0:code_55FBj
		mov	DPTR, #0F948h
		movx	@DPTR, A
		mov	B, R2		; B-Register
		mov	DPTR, #60F0h	; Нижний порог скорости	признака движения | км/час
		clr	A
		movc	A, @A+DPTR
		jb	RAM_2D.5, code_5612
		mov	DPTR, #60F1h	; Верхний порог	скорости признака движения | км/час
		clr	A
		movc	A, @A+DPTR

code_5612:				; CODE XREF: RESET_0-93D8j
		clr	C
		subb	A, B		; B-Register
		mov	RAM_2D.5, C

code_5617:				; CODE XREF: RESET_0:code_55E1j
		jnb	Options.4, code_565E
		lcall	code_B817
		jnb	RAM_2D.5, code_5624
		clr	RAM_25.6
		sjmp	code_563F
; ---------------------------------------------------------------------------

code_5624:				; CODE XREF: RESET_0-93C5j
		jb	RAM_25.6, code_565E
		mov	DPTR, #60F2h	; Номер	режимной точки по RPM для диагностики ДСA |
		clr	A
		movc	A, @A+DPTR
		swap	A
		cjne	A, RPM_RT, code_5630

code_5630:
		jc	code_5634
		sjmp	code_563F
; ---------------------------------------------------------------------------

code_5634:				; CODE XREF: RESET_0:code_5630j
		mov	DPTR, #60F3h	; Номер	режимной точки по GBC для диагностики ДСA |
		clr	A
		movc	A, @A+DPTR
		swap	A
		cjne	A, GBC_RT, code_563D

code_563D:
		jc	code_5646

code_563F:				; CODE XREF: RESET_0-93C0j
					; RESET_0-93B0j
		clr	A
		mov	DPTR, #0F8C0h
		movx	@DPTR, A
		sjmp	code_565E
; ---------------------------------------------------------------------------

code_5646:				; CODE XREF: RESET_0:code_563Dj
		jnb	RAM_29.1, code_565E
		mov	DPTR, #60F4h	; Время	для диагностики	ДСA | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F8C0h
		movx	A, @DPTR
		inc	A
		mov	DPTR, #0F8C0h
		movx	@DPTR, A
		cjne	A, B, code_565E	; B-Register
		setb	RAM_25.6

code_565E:				; CODE XREF: RESET_0:code_5617j
					; RESET_0:code_5624j ...
		jnb	RAM_28.5, code_5664
		ljmp	code_56E8
; ---------------------------------------------------------------------------

code_5664:				; CODE XREF: RESET_0:code_565Ej
		jb	RAM_2B.7, code_566A
		ljmp	code_56E8
; ---------------------------------------------------------------------------

code_566A:				; CODE XREF: RESET_0:code_5664j
		mov	DPTR, #0F889h
		movx	A, @DPTR
		mov	R0, A
		anl	A, #0Fh
		mov	B, A		; B-Register
		mov	DPTR, #0F88Eh
		movx	A, @DPTR
		mov	R1, A
		anl	A, #0Fh
		clr	C
		subb	A, B		; B-Register
		lcall	ABS_ACC
		mov	B, A		; B-Register
		mov	A, R0
		anl	A, #0F0h
		swap	A
		mov	R0, A
		mov	A, R1
		anl	A, #0F0h
		swap	A
		clr	C
		subb	A, R0
		lcall	ABS_ACC
		clr	C
		subb	A, B		; B-Register
		jnc	code_5696
		clr	A

code_5696:				; CODE XREF: RESET_0-934Fj
		add	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #60A7h	; Градиент таблицы обучения |
		clr	A
		movc	A, @A+DPTR
		mul	AB
		mov	B, A		; B-Register
		mov	DPTR, #0F88Ch
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_56AD
		mov	A, #0

code_56AD:				; CODE XREF: RESET_0-9339j
		mov	R0, A
		mov	DPTR, #0F88Ch
		movx	A, @DPTR
		add	A, B		; B-Register
		jnc	code_56B8
		mov	A, #0FFh

code_56B8:				; CODE XREF: RESET_0-932Ej
		mov	R1, A
		mov	DPTR, #0F889h
		movx	A, @DPTR
		mov	DPTR, #0FD00h
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R2, A
		lcall	code_AD03
		mov	R0, #40h ; '@'
		mov	R1, #0C0h ; 'L'
		lcall	code_AD03
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	A, DPL		; Data Pointer,	Low Byte
		cjne	A, RPM_THR_3D_RT, code_56DE
		mov	A, R2
		clr	C
		subb	A, B		; B-Register
		add	A, RAM_6E
		mov	RAM_6E,	A

code_56DE:				; CODE XREF: RESET_0-930Fj
		mov	DPTR, #0F889h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		jnz	code_56E8
		clr	RAM_2B.7

code_56E8:				; CODE XREF: RESET_0-9381j
					; RESET_0-937Bj ...
		mov	C, RAM_29.4
		orl	C, RAM_29.5
		jnc	code_56F1
		ljmp	code_58F5
; ---------------------------------------------------------------------------

code_56F1:				; CODE XREF: RESET_0-92F6j
		jnb	RAM_2D.1, code_56F7
		ljmp	code_587E
; ---------------------------------------------------------------------------

code_56F7:				; CODE XREF: RESET_0:code_56F1j
		jnb	RAM_29.1, code_5700
		lcall	code_B0DC
		lcall	code_B126

code_5700:				; CODE XREF: RESET_0:code_56F7j
		mov	DPTR, #60DAh
		clr	A
		movc	A, @A+DPTR
		anl	A, RAM_5B
		mov	B, A		; B-Register
		mov	DPTR, #0F4CAh
		movx	A, @DPTR
		orl	A, B		; B-Register
		movx	@DPTR, A
		mov	DPTR, #60DBh
		clr	A
		movc	A, @A+DPTR
		anl	A, RAM_23
		mov	B, A		; B-Register
		mov	DPTR, #0F4CBh
		movx	A, @DPTR
		orl	A, B		; B-Register
		movx	@DPTR, A
		mov	DPTR, #60DCh
		clr	A
		movc	A, @A+DPTR
		anl	A, RAM_24
		mov	B, A		; B-Register
		mov	DPTR, #0F4CCh
		movx	A, @DPTR
		orl	A, B		; B-Register
		movx	@DPTR, A
		mov	DPTR, #60DDh
		clr	A
		movc	A, @A+DPTR
		anl	A, RAM_25
		mov	B, A		; B-Register
		mov	DPTR, #0F4CDh
		movx	A, @DPTR
		orl	A, B		; B-Register
		movx	@DPTR, A
		mov	DPTR, #5FADh
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		anl	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #0F4CEh
		movx	A, @DPTR
		orl	A, B		; B-Register
		movx	@DPTR, A
		mov	DPTR, #5FB0h
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9C4h
		movx	A, @DPTR
		anl	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #0F4CFh
		movx	A, @DPTR
		orl	A, B		; B-Register
		movx	@DPTR, A
		mov	DPTR, #5FB1h
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9C5h
		movx	A, @DPTR
		anl	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #0F4D0h
		movx	A, @DPTR
		orl	A, B		; B-Register
		movx	@DPTR, A
		mov	DPTR, #5FB2h
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9C6h
		movx	A, @DPTR
		anl	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #0F4D1h
		movx	A, @DPTR
		orl	A, B		; B-Register
		movx	@DPTR, A
		jnb	RAM_29.1, code_581A
		mov	DPSEL, #2	; Data Pointer Select Register
		mov	DPTR, #0F4C9h
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPTR, #0F512h
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0CA87h
		mov	R2, #0
		mov	DPSEL, #0	; Data Pointer Select Register
		mov	DPTR, #0F4D2h

code_57B7:				; CODE XREF: RESET_0-91CAj
		mov	A, R2
		cjne	A, #40h, code_57BD ; '@'
		sjmp	code_581A
; ---------------------------------------------------------------------------

code_57BD:				; CODE XREF: RESET_0-922Aj
		anl	A, #7
		jnz	code_57CD
		mov	DPSEL, #2	; Data Pointer Select Register
		inc	DPTR
		movx	A, @DPTR
		mov	B, A		; B-Register
		clr	A
		movx	@DPTR, A
		mov	DPSEL, #0	; Data Pointer Select Register

code_57CD:				; CODE XREF: RESET_0-9223j
		mov	A, B		; B-Register
		rrc	A
		mov	B, A		; B-Register
		movx	A, @DPTR
		jc	code_57E3
		jb	ACC.7, code_57FD ; Accumulator
		jz	code_580B
		inc	A
		cjne	A, #14h, code_57DE

code_57DE:
		jc	code_57EC
		clr	A
		sjmp	code_57EC
; ---------------------------------------------------------------------------

code_57E3:				; CODE XREF: RESET_0-920Fj
		jz	code_57EA
		mov	A, #0FFh
		movx	@DPTR, A
		sjmp	code_57EF
; ---------------------------------------------------------------------------

code_57EA:				; CODE XREF: RESET_0:code_57E3j
		mov	A, #1

code_57EC:				; CODE XREF: RESET_0:code_57DEj
					; RESET_0-9201j
		movx	@DPTR, A
		sjmp	code_580B
; ---------------------------------------------------------------------------

code_57EF:				; CODE XREF: RESET_0-91FAj
		mov	DPSEL, #4	; Data Pointer Select Register
		clr	A
		movc	A, @A+DPTR
		mov	DPSEL, #3	; Data Pointer Select Register
		movx	@DPTR, A
		mov	DPSEL, #0	; Data Pointer Select Register
		sjmp	code_580B
; ---------------------------------------------------------------------------

code_57FD:				; CODE XREF: RESET_0-920Dj
		mov	DPSEL, #4	; Data Pointer Select Register
		clr	A
		movc	A, @A+DPTR
		anl	A, #0BFh
		mov	DPSEL, #3	; Data Pointer Select Register
		movx	@DPTR, A
		mov	DPSEL, #0	; Data Pointer Select Register

code_580B:				; CODE XREF: RESET_0-920Aj
					; RESET_0-91F5j ...
		inc	R2
		inc	DPTR
		mov	DPSEL, #3	; Data Pointer Select Register
		inc	DPTR
		mov	DPSEL, #4	; Data Pointer Select Register
		inc	DPTR
		mov	DPSEL, #0	; Data Pointer Select Register
		sjmp	code_57B7
; ---------------------------------------------------------------------------

code_581A:				; CODE XREF: RESET_0-9248j
					; RESET_0-9227j
		jb	Options.3, code_587E
		jnb	RAM_29.1, code_587E
		mov	DPTR, #5FB4h
		clr	A
		movc	A, @A+DPTR
		mov	R4, A
		mov	DPTR, #5FB3h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #2	; Data Pointer Select Register
		mov	DPTR, #0F512h
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPTR, #0F552h
		pop	DPSEL		; Data Pointer Select Register
		clr	A
		mov	R2, A
		mov	DPTR, #0F4D2h

code_5841:				; CODE XREF: RESET_0-9166j
		mov	A, R2
		cjne	A, #40h, code_5847 ; '@'
		sjmp	code_587E
; ---------------------------------------------------------------------------

code_5847:				; CODE XREF: RESET_0-91A0j
		movx	A, @DPTR
		jnb	ACC.7, code_586D ; Accumulator
		push	ACC		; Accumulator
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	A, R4
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		pop	ACC		; Accumulator
		jnb	RAM_29.2, code_586D
		dec	A
		mov	B, R3		; B-Register
		cjne	A, B, code_586D	; B-Register
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #2	; Data Pointer Select Register
		movx	A, @DPTR
		anl	A, #7Fh
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		clr	A

code_586D:				; CODE XREF: RESET_0-919Aj
					; RESET_0-918Aj ...
		movx	@DPTR, A
		inc	R2
		inc	DPTR
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #2	; Data Pointer Select Register
		inc	DPTR
		mov	DPSEL, #3	; Data Pointer Select Register
		inc	DPTR
		pop	DPSEL		; Data Pointer Select Register
		sjmp	code_5841
; ---------------------------------------------------------------------------

code_587E:				; CODE XREF: RESET_0-92EEj
					; RESET_0:code_581Aj ...
		lcall	code_C57D
		lcall	code_C527
		mov	A, RAM_79
		anl	A, #1
		jnz	code_58EC
		jb	RAM_29.5, code_58F5
		setb	C
		jnb	RAM_2A.6, code_58E5
		mov	DPTR, #5FE1h	; Время	до гашения лампы CE при	вкл зажигания |	cек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F807h
		movx	A, @DPTR
		cjne	A, B, code_589F	; B-Register

code_589F:
		jc	code_58EC
		clr	RAM_2E.0
		lcall	code_C516
		jnc	code_58E9
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		jnb	ACC.7, code_58DC ; Accumulator
		mov	DPTR, #0FAA1h
		movx	A, @DPTR
		anl	A, #0F0h
		jnz	code_58DC
		mov	DPTR, #0F4C9h
		movx	A, @DPTR
		inc	A
		mov	B, A		; B-Register
		jb	ACC.7, code_58CB ; Accumulator
		cjne	A, #19h, code_58C4

code_58C4:
		jc	code_58D7
		mov	B, #80h	; 'А'   ; B-Register
		sjmp	code_58D7
; ---------------------------------------------------------------------------

code_58CB:				; CODE XREF: RESET_0-9124j
		setb	RAM_2E.0
		anl	A, #7Fh
		cjne	A, #19h, code_58D2

code_58D2:
		jc	code_58D7
		mov	B, #0		; B-Register

code_58D7:				; CODE XREF: RESET_0:code_58C4j
					; RESET_0-9119j ...
		mov	A, B		; B-Register
		movx	@DPTR, A
		sjmp	code_58EC
; ---------------------------------------------------------------------------

code_58DC:				; CODE XREF: RESET_0-9136j
					; RESET_0-912Dj
		clr	A
		mov	DPTR, #0F4C9h
		movx	@DPTR, A
		setb	RAM_2E.0
		sjmp	code_58EC
; ---------------------------------------------------------------------------

code_58E5:				; CODE XREF: RESET_0-9154j
		clr	RAM_2E.0
		sjmp	code_58EE
; ---------------------------------------------------------------------------

code_58E9:				; CODE XREF: RESET_0-913Cj
		lcall	code_EA8D

code_58EC:				; CODE XREF: RESET_0-915Aj
					; RESET_0:code_589Fj ...
		mov	C, RAM_2E.0

code_58EE:				; CODE XREF: RESET_0-90FBj
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		mov	ACC.4, C	; Accumulator
		movx	@DPTR, A

code_58F5:				; CODE XREF: RESET_0-92F4j
					; RESET_0-9158j
		jnb	RAM_2D.0, code_58FB
		ljmp	code_5990
; ---------------------------------------------------------------------------

code_58FB:				; CODE XREF: RESET_0:code_58F5j
		jnb	RAM_2D.1, code_594B
		mov	DPTR, #0F4B8h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		xrl	A, #96h
		jnz	code_591A
		jnb	RAM_2D.2, code_5915
		mov	DPTR, #0F4B9h
		movx	A, @DPTR
		inc	A
		jz	code_5913
		movx	@DPTR, A

code_5913:				; CODE XREF: RESET_0-90D2j
		clr	RAM_2D.3

code_5915:				; CODE XREF: RESET_0-90DAj
		lcall	code_D04C
		sjmp	code_594B
; ---------------------------------------------------------------------------

code_591A:				; CODE XREF: RESET_0-90DCj
		mov	DPTR, #0F4BAh
		movx	A, @DPTR
		jz	code_5934
		mov	DPTR, #5FF7h
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FA97h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_5930	; B-Register

code_5930:
		jc	code_594B
		sjmp	code_593A
; ---------------------------------------------------------------------------

code_5934:				; CODE XREF: RESET_0-90C4j
		mov	DPTR, #0F4B6h
		movx	A, @DPTR
		jnz	code_594B

code_593A:				; CODE XREF: RESET_0-90B0j
		lcall	code_CEB3
		clr	A
		mov	DPTR, #0F4BAh
		movx	@DPTR, A
		mov	DPTR, #0FA97h
		movx	@DPTR, A
		mov	RAM_78,	#0Ch
		setb	RAM_2F.3

code_594B:				; CODE XREF: RESET_0:code_58FBj
					; RESET_0-90CAj ...
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		jnb	ACC.1, code_5955 ; Accumulator
		jb	RAM_2D.3, code_5984

code_5955:				; CODE XREF: RESET_0-9093j
		lcall	code_B2D4
		lcall	code_EA42
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		mov	R4, A
		anl	A, #3
		xrl	A, #3
		jz	code_5984
		mov	A, R4
		jnb	ACC.6, code_5981 ; Accumulator
		jnb	RAM_29.1, code_5984
		mov	DPTR, #0F4C6h
		movx	A, @DPTR
		dec	A
		movx	@DPTR, A
		jnz	code_5984
		mov	A, R4
		anl	A, #0BFh
		mov	DPTR, #0F4C5h
		movx	@DPTR, A
		orl	RAM_79,	#1
		clr	RAM_2E.0

code_5981:				; CODE XREF: RESET_0-907Bj
		lcall	code_D25F

code_5984:				; CODE XREF: RESET_0-9090j
					; RESET_0-907Ej ...
		jnb	RAM_2F.3, code_59A5
		jb	RAM_2F.4, code_5992
		lcall	code_D51A
		lcall	code_D55C

code_5990:				; CODE XREF: RESET_0-90EAj
		sjmp	code_59A5
; ---------------------------------------------------------------------------

code_5992:				; CODE XREF: RESET_0-905Bj
		jnb	RAM_2D.1, code_599A
		lcall	code_CE6A
		sjmp	code_59A5
; ---------------------------------------------------------------------------

code_599A:				; CODE XREF: RESET_0:code_5992j
		lcall	code_DBB8
		jnb	RAM_2D.3, code_59A5
		clr	A
		mov	DPTR, #0F4B9h
		movx	@DPTR, A

code_59A5:				; CODE XREF: RESET_0:code_5984j
					; RESET_0:code_5990j ...
		jnb	RAM_2D.1, code_59AB
		ljmp	code_5A2B
; ---------------------------------------------------------------------------

code_59AB:				; CODE XREF: RESET_0:code_59A5j
		jnb	RAM_2F.1, code_5A2B
		mov	R0, #91h ; 'С'
		mov	ACC, @R0	; Accumulator
		jnb	ACC.5, code_5A2B ; Accumulator
		jnb	RAM_2A.6, code_59D5
		mov	DPTR, #6082h	; Максимальное положение РХХ | шаг
		clr	A
		movc	A, @A+DPTR
		mov	UFRXX, A
		mov	WDTREL,	#80h ; 'А' ; Watchdog Timer Reload Register

code_59C2:				; CODE XREF: RESET_0-9018j
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	A, CRRXX
		xrl	A, UFRXX
		jnz	code_59C2
		mov	A, CRRXX
		mov	DPTR, #0F9C1h
		movx	@DPTR, A
		lcall	code_B2D4

code_59D5:				; CODE XREF: RESET_0-902Dj
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	A, #0FFh
		lcall	code_C8F4
		lcall	code_B354
		lcall	code_B3AD
		mov	DPTR, #0FA59h
		lcall	code_C967
		lcall	code_C90D
		lcall	code_C92A
		mov	A, #55h	; 'U'
		mov	DPTR, #0F9B0h
		movx	@DPTR, A
		mov	R0, #1
		mov	R1, #0
		mov	DPTR, #0FD00h

code_59FB:				; CODE XREF: RESET_0-8FDCj
		clr	C
		movx	A, @DPTR
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		inc	DPTR
		mov	A, DPH		; Data Pointer,	High Byte
		cjne	A, #0FFh, code_59FB
		mov	R2, #40h ; '@'
		mov	DPTR, #0F4D2h

code_5A0E:				; CODE XREF: RESET_0-8FCBj
		clr	C
		movx	A, @DPTR
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		inc	DPTR
		djnz	R2, code_5A0E
		mov	DPTR, #0F8FEh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	WDTREL,	#7Fh ; '' ; Watchdog Timer Reload Register
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1

code_5A29:				; CODE XREF: RESET_0:code_5A29j
		sjmp	code_5A29
; ---------------------------------------------------------------------------
code_5A2B:				; CODE XREF: RESET_0-903Aj
					; RESET_0:code_59ABj ...
		mov	A, P1		; Port 1 (PDIR=0)
		mov	DPTR, #0F8B3h
		movx	@DPTR, A
		mov	A, P4		; Port 4 (PDIR=0)
		mov	DPTR, #0F8B4h
		movx	@DPTR, A
		mov	A, P8		; Port 8, Analog/Digital Input
		mov	DPTR, #0F8B5h
		movx	@DPTR, A
		mov	A, P5		; Port 5 (PDIR=0)
		mov	DPTR, #0F8B6h
		movx	@DPTR, A
		mov	A, P6		; Port 6 (PDIR=0)
		mov	DPTR, #0F8B7h
		movx	@DPTR, A
		jb	RAM_2D.1, code_5BEB
		lcall	code_EA42

code_5BEB:				; CODE XREF: RESET_0-8DFDj
		jnb	RAM_2B.1, code_5C0F
		jb	RAM_25.6, code_5C0F
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		jnz	code_5C0F
		mov	DPTR, #9F5Ch	; Неравномерность (по GBC) в режиме ХХ 1 | Нестабильность, 1/сек^2 - Цикловое наполнение, мг/цикл
		mov	R2, GBC_RT
		lcall	GET_2D_VALUE
		mov	B, A		; B-Register
		mov	DPTR, #0A191h	; Неравномерность (по RPM) в режиме ХХ 1 | Нестабильность, 1/сек^2 - Обороты, об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		add	A, B		; B-Register
		jnc	code_5C23
		mov	A, #0FFh
		sjmp	code_5C23
; ---------------------------------------------------------------------------

code_5C0F:				; CODE XREF: RESET_0:code_5BEBj
					; RESET_0-8DF4j ...
		mov	DPTR, #0F942h
		movx	A, @DPTR
		mov	DPTR, #9394h	; Неравномерность скорости вращения 1 |	Нестабильность,	1/сек^2	- Обороты коленвала, об/мин - Цикловое наполнение,мг/цикл
		jnb	ACC.0, code_5C1C ; Accumulator
		mov	DPTR, #98A7h	; Неравномерность скорости вращения 1 |	Нестабильность,	1/сек^2	- Обороты коленвала, об/мин - Цикловое наполнение,мг/цикл

code_5C1C:				; CODE XREF: RESET_0-8DCCj
		mov	R2, RPM_RT
		mov	R3, GBC_RT
		lcall	GET_3D_VALUE

code_5C23:				; CODE XREF: RESET_0-8DD9j
					; RESET_0-8DD5j
		mov	B, A		; B-Register
		mov	DPTR, #9F9Ch	; Коррекция неравномерности по температуре 1 | Коррекция нестабильности, 1/сек^	- Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		add	A, B		; B-Register
		jnc	code_5C31
		mov	A, #0FFh

code_5C31:				; CODE XREF: RESET_0-8DB5j
		mov	B, A		; B-Register
		mov	R1, A
		mov	R0, #0
		mov	DPTR, #0FA05h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_5C55
		mov	RAM_1, R3
		mov	RAM_0, R2
		mov	DPTR, #5FC1h	; скорость изменения 1 | 1/сек^2
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	R3, #0
		lcall	SUB_R0R1_R2R3
		sjmp	code_5C59
; ---------------------------------------------------------------------------

code_5C55:				; CODE XREF: RESET_0-8DA0j
		mov	R1, B		; B-Register
		mov	R0, #0

code_5C59:				; CODE XREF: RESET_0-8D8Fj
		mov	DPTR, #0FA05h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	B, R1		; B-Register
		mov	DPTR, #0F9F8h
		movx	A, @DPTR
		cjne	A, B, code_5C6D	; B-Register
		sjmp	code_5C6F
; ---------------------------------------------------------------------------

code_5C6D:				; CODE XREF: RESET_0-8D7Aj
		jnc	code_5C73

code_5C6F:				; CODE XREF: RESET_0-8D77j
					; RESET_0:code_5C86j
		mov	A, #0FFh
		sjmp	code_5C92
; ---------------------------------------------------------------------------

code_5C73:				; CODE XREF: RESET_0:code_5C6Dj
		mov	DPTR, #0A338h	; Коэффицент A338 | Коэффициент	- Обороты коленвала, об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FF5Ah
		movx	@DPTR, A
		mov	DPTR, #0F9FAh
		movx	A, @DPTR
		cjne	A, B, code_5C86	; B-Register

code_5C86:
		jnc	code_5C6F
		mov	DPTR, #9594h	; Коэффициент уменьшения неравномерности | Коэффициент - Обороты коленвала, об/мин - Цикловое наполнение,мг/цикл
		mov	R2, RPM_RT
		mov	R3, GBC_RT
		lcall	GET_3D_VALUE

code_5C92:				; CODE XREF: RESET_0-8D71j
		mov	DPTR, #0F9F0h
		movx	@DPTR, A
		mov	DPTR, #0FAA0h
		movx	A, @DPTR
		mov	C, ACC.7	; Accumulator
		mov	DPTR, #0F93Dh
		movx	A, @DPTR
		anl	C, ACC.7	; Accumulator
		jnc	code_5CB2
		mov	DPTR, #9F7Ch	; Неравномерность (по RPM) | Нестабильность, 1/сек^2 - Обороты,	об/мин
		mov	R2, RPM_RT
		lcall	GET_2D_VALUE
		mov	R0, #0
		mov	R1, A
		ljmp	code_5D48
; ---------------------------------------------------------------------------

code_5CB2:				; CODE XREF: RESET_0-8D40j
		jnb	RAM_2B.1, code_5CC8
		jb	RAM_25.6, code_5CC8
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		jnz	code_5CC8
		mov	DPTR, #9FC3h	; Неравномерность (по GBC) в режиме ХХ 2 | Нестабильность, 1/сек^2 - Цикловое наполнение, мг/цикл
		mov	R2, GBC_RT
		lcall	GET_2D_VALUE
		sjmp	code_5CDC
; ---------------------------------------------------------------------------

code_5CC8:				; CODE XREF: RESET_0:code_5CB2j
					; RESET_0-8D2Dj ...
		mov	DPTR, #0F942h
		movx	A, @DPTR
		mov	DPTR, #9494h	; Неравномерность скорости вращения 2 |	Нестабильность,	1/сек^2	- Обороты коленвала, об/мин - Цикловое наполнение,мг/цикл
		jnb	ACC.0, code_5CD5 ; Accumulator
		mov	DPTR, #99A7h	; Неравномерность скорости вращения 2 |	Нестабильность,	1/сек^2	- Обороты коленвала, об/мин - Цикловое наполнение,мг/цикл

code_5CD5:				; CODE XREF: RESET_0-8D13j
		mov	R2, RPM_RT
		mov	R3, GBC_RT
		lcall	GET_3D_VALUE

code_5CDC:				; CODE XREF: RESET_0-8D1Cj
		mov	DPTR, #0F9EFh
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	DPTR, #96D4h	; Коррекция неравномерности по температуре 2 | Коррекция нестабильности, 1/сек^	- Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		clr	C
		add	A, B		; B-Register
		jnc	code_5CEF
		mov	A, #0FFh

code_5CEF:				; CODE XREF: RESET_0-8CF7j
		mov	B, A		; B-Register
		mov	R1, A
		mov	R0, #0
		mov	DPTR, #0F9F1h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_5D19
		mov	RAM_1, R3
		mov	RAM_0, R2
		mov	DPTR, #5FBEh	; скорость изменения 2 | 1/сек^2
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	R3, #0
		lcall	SUB_R0R1_R2R3
		jnc	code_5D1D
		mov	R1, #0
		mov	R0, #0
		sjmp	code_5D1D
; ---------------------------------------------------------------------------

code_5D19:				; CODE XREF: RESET_0-8CE2j
		mov	R1, B		; B-Register
		mov	R0, #0

code_5D1D:				; CODE XREF: RESET_0-8CD1j
					; RESET_0-8CCBj
		mov	DPTR, #0F9F1h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F9F0h
		movx	A, @DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	DPTR, #0FA0Ch
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F94Dh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, R1
		cjne	A, B, code_5D42	; B-Register

code_5D42:
		jnc	code_5D48
		mov	R0, #0
		mov	R1, B		; B-Register

code_5D48:				; CODE XREF: RESET_0-8D33j
					; RESET_0:code_5D42j
		mov	DPTR, #0FA0Eh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		jnb	RAM_2B.1, code_5D75
		jb	RAM_25.6, code_5D75
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		jnz	code_5D75
		mov	DPTR, #9FE3h	; Неравномерность (по GBC) в режиме ХХ 3 | Нестабильность, 1/сек^2 - Цикловое наполнение, мг/цикл
		mov	R2, GBC_RT
		lcall	GET_2D_VALUE
		mov	B, A		; B-Register
		mov	DPTR, #0A171h	; Неравномерность (по RPM) в режиме ХХ 3 | Нестабильность, 1/сек^2 - Обороты, об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		add	A, B		; B-Register
		jnc	code_5D89
		mov	A, #0FFh
		sjmp	code_5D89
; ---------------------------------------------------------------------------

code_5D75:				; CODE XREF: RESET_0-8C91j
					; RESET_0-8C8Ej ...
		mov	DPTR, #0F942h
		movx	A, @DPTR
		mov	DPTR, #96FBh	; Неравномерность скорости вращения 3 |	Нестабильность,	1/сек^2	- Обороты коленвала, об/мин - Цикловое наполнение,мг/цикл
		jnb	ACC.0, code_5D82 ; Accumulator
		mov	DPTR, #9AA7h	; Неравномерность скорости вращения 3 |	Нестабильность,	1/сек^2	- Обороты коленвала, об/мин - Цикловое наполнение,мг/цикл

code_5D82:				; CODE XREF: RESET_0-8C66j
		mov	R2, RPM_RT
		mov	R3, GBC_RT
		lcall	GET_3D_VALUE

code_5D89:				; CODE XREF: RESET_0-8C73j
					; RESET_0-8C6Fj
		mov	DPTR, #0FA1Ah
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	DPTR, #97FBh	; Коррекция неравномерности по температуре 3 | Коррекция нестабильности, 1/сек^	- Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		clr	C
		add	A, B		; B-Register
		jnc	code_5D9C
		mov	A, #0FFh

code_5D9C:				; CODE XREF: RESET_0-8C4Aj
		mov	B, A		; B-Register
		mov	R1, A
		mov	R0, #0
		mov	DPTR, #0FA18h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_5DC0
		mov	RAM_1, R3
		mov	RAM_0, R2
		mov	DPTR, #5FC0h	; скорость изменения 3 | 1/сек^2
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	R3, #0
		lcall	SUB_R0R1_R2R3
		sjmp	code_5DC4
; ---------------------------------------------------------------------------

code_5DC0:				; CODE XREF: RESET_0-8C35j
		mov	R1, B		; B-Register
		mov	R0, #0

code_5DC4:				; CODE XREF: RESET_0-8C24j
		mov	DPTR, #0FA9Eh
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0FA9Ch
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_5DDE
		clr	A
		mov	R0, A
		mov	R1, A

code_5DDE:				; CODE XREF: RESET_0-8C09j
		mov	DPTR, #0FA18h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		anl	A, #0FEh
		jnb	RAM_29.0, code_5DF2
		orl	A, #1

code_5DF2:				; CODE XREF: RESET_0-8BF5j
		movx	@DPTR, A
		lcall	OUT_PIN_PROCESS
		ljmp	code_2CDE
; END OF FUNCTION CHUNK	FOR RESET_0
; ---------------------------------------------------------------------------

$INCLUDE (j7es_data_area.asm)

; =============== S U B	R O U T	I N E =======================================


code_A5A0:				; CODE XREF: RESET_0-C48Dp
					; RESET_0-C47Bp ...
		clr	RAM_28.3

code_A5A2:				; CODE XREF: code_A5A0+Dj
		mov	ADCON1,	B	; A/D Converter	Control	Register 1
		mov	ADDATL,	#0	; A/D Converter	Data Register, Low Byte

code_A5A8:				; CODE XREF: code_A5A0:code_A5A8j
		jb	ADCON0.4, code_A5A8 ; A/D Converter Control Register 0
		mov	A, ADDATH	; A/D Converter	Data Register, High Byte
		jbc	RAM_28.3, code_A5A2
		ret
; End of function code_A5A0


; =============== S U B	R O U T	I N E =======================================


code_A5B1:				; CODE XREF: RESET_0:code_4E10p
		jb	RAM_2B.4, code_A5E2
		mov	A, RPM_RT_32
		mov	DPTR, #0F85Ch
		movx	@DPTR, A
		mov	A, GBC_RT_32
		mov	DPTR, #0F85Dh
		movx	@DPTR, A
		jnb	RAM_2C.7, code_A5C8
		mov	RAM_70,	#0FFh
		sjmp	code_A5CB
; ---------------------------------------------------------------------------

code_A5C8:				; CODE XREF: code_A5B1+Fj
		mov	RAM_70,	#0

code_A5CB:				; CODE XREF: code_A5B1+15j
		clr	A
		mov	DPTR, #0F85Bh
		movx	@DPTR, A
		mov	DPTR, #0F85Eh
		movx	@DPTR, A
		mov	DPTR, #0F860h
		movx	@DPTR, A
		mov	DPTR, #0F885h
		movx	@DPTR, A
		mov	RAM_6E,	#0
		setb	RAM_2B.4
		ret
; ---------------------------------------------------------------------------

code_A5E2:				; CODE XREF: code_A5B1j
		jb	RAM_26.6, code_A5E7
		sjmp	code_A627
; ---------------------------------------------------------------------------

code_A5E7:				; CODE XREF: code_A5B1:code_A5E2j
		mov	DPTR, #60A6h	; Допуск на стационарность для обучения	|
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F85Ch
		movx	A, @DPTR
		clr	C
		subb	A, RPM_RT_32
		lcall	ABS_ACC
		clr	C
		subb	A, B		; B-Register
		jnc	code_A60C
		mov	DPTR, #0F85Dh
		movx	A, @DPTR
		clr	C
		subb	A, GBC_RT_32
		lcall	ABS_ACC
		clr	C
		subb	A, B		; B-Register
		jc	code_A61F

code_A60C:				; CODE XREF: code_A5B1+4Aj
		clr	A
		mov	DPTR, #0F85Eh
		movx	@DPTR, A
		mov	A, RPM_RT_32
		mov	DPTR, #0F85Ch
		movx	@DPTR, A
		mov	A, GBC_RT_32
		mov	DPTR, #0F85Dh
		movx	@DPTR, A
		sjmp	code_A627
; ---------------------------------------------------------------------------

code_A61F:				; CODE XREF: code_A5B1+59j
		mov	DPTR, #0F85Eh
		movx	A, @DPTR
		inc	A
		jz	code_A627
		movx	@DPTR, A

code_A627:				; CODE XREF: code_A5B1+34j
					; code_A5B1+6Cj ...
		mov	DPTR, #0F860h
		movx	A, @DPTR
		clr	C
		subb	A, #1
		jc	code_A633
		movx	@DPTR, A
		sjmp	code_A640
; ---------------------------------------------------------------------------

code_A633:				; CODE XREF: code_A5B1+7Dj
		jb	RAM_26.6, code_A638
		sjmp	code_A640
; ---------------------------------------------------------------------------

code_A638:				; CODE XREF: code_A5B1:code_A633j
		mov	DPTR, #0F85Bh
		movx	A, @DPTR
		inc	A
		jz	code_A640
		movx	@DPTR, A

code_A640:				; CODE XREF: code_A5B1+80j
					; code_A5B1+85j ...
		jbc	RAM_26.6, code_A645
		sjmp	code_A6C2
; ---------------------------------------------------------------------------

code_A645:				; CODE XREF: code_A5B1:code_A640j
		jnb	RAM_2C.7, code_A64B
		ljmp	code_A6CE
; ---------------------------------------------------------------------------

code_A64B:				; CODE XREF: code_A5B1:code_A645j
		jnb	RAM_2C.6, code_A651
		ljmp	code_A6F0
; ---------------------------------------------------------------------------

code_A651:				; CODE XREF: code_A5B1:code_A64Bj
		clr	A
		mov	DPTR, #0F883h
		movx	@DPTR, A

code_A656:				; CODE XREF: code_A5B1+126j
		mov	DPTR, #0F860h
		movx	A, @DPTR
		jnz	code_A666
		mov	DPTR, #0F884h
		movx	A, @DPTR
		jb	ACC.0, code_A667 ; Accumulator
		ljmp	code_A746
; ---------------------------------------------------------------------------

code_A666:				; CODE XREF: code_A5B1+A9j
		ret
; ---------------------------------------------------------------------------

code_A667:				; CODE XREF: code_A5B1+AFj
		mov	DPTR, #60A8h	; Цикловая задержка при	регулировании |	циклов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F85Bh
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_A6C2
		mov	DPTR, #0F885h
		movx	A, @DPTR
		inc	A
		jz	code_A682
		mov	DPTR, #0F885h
		movx	@DPTR, A

code_A682:				; CODE XREF: code_A5B1+CBj
		mov	DPTR, #0F885h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F883h
		movx	A, @DPTR
		jz	code_A695
		mov	DPTR, #5FF0h	; Задержка при последующем центирировании | циклов
		clr	A
		movc	A, @A+DPTR
		sjmp	code_A69A
; ---------------------------------------------------------------------------

code_A695:				; CODE XREF: code_A5B1+DBj
		mov	DPTR, #5FEFh	; Задержка при первом центирировании | циклов
		clr	A
		movc	A, @A+DPTR

code_A69A:				; CODE XREF: code_A5B1+E2j
		cjne	A, B, code_A69D	; B-Register

code_A69D:
		jnc	code_A6C2
		clr	A
		mov	DPTR, #0F885h
		movx	@DPTR, A
		mov	DPTR, #87BDh	; Шаг изменения	КР при центрировании |	- Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		jb	RAM_2C.7, code_A6B5
		add	A, RAM_6E
		mov	RAM_6E,	A
		sjmp	code_A6BB
; ---------------------------------------------------------------------------

code_A6B5:				; CODE XREF: code_A5B1+FBj
		cpl	A
		inc	A
		add	A, RAM_6E
		mov	RAM_6E,	A

code_A6BB:				; CODE XREF: code_A5B1+102j
		jb	ACC.7, code_A6C3 ; Accumulator
		add	A, #0B0h ; '-'
		jc	code_A6CB

code_A6C2:				; CODE XREF: code_A5B1+92j
					; code_A5B1+C4j ...
		ret
; ---------------------------------------------------------------------------

code_A6C3:				; CODE XREF: code_A5B1:code_A6BBj
		add	A, #50h	; 'P'
		jnc	code_A6C8
		ret
; ---------------------------------------------------------------------------

code_A6C8:				; CODE XREF: code_A5B1+114j
		ljmp	code_A7D3
; ---------------------------------------------------------------------------

code_A6CB:				; CODE XREF: code_A5B1+10Fj
		ljmp	code_A7ED
; ---------------------------------------------------------------------------

code_A6CE:				; CODE XREF: code_A5B1+97j
		jnb	RAM_2C.6, code_A6DA
		mov	A, #3
		mov	DPTR, #0F883h
		movx	@DPTR, A
		ljmp	code_A656
; ---------------------------------------------------------------------------

code_A6DA:				; CODE XREF: code_A5B1:code_A6CEj
		setb	RAM_2C.6
		mov	A, #1
		mov	DPTR, #0F883h
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F89Fh
		movx	@DPTR, A
		mov	DPTR, #0F885h
		movx	@DPTR, A
		mov	DPTR, #890Bh	; Задержка регулирования Rich-Lean | Время, сек. - Обороты коленвала, об/мин - Цикловое	наполнение,мг/цикл
		sjmp	code_A704
; ---------------------------------------------------------------------------

code_A6F0:				; CODE XREF: code_A5B1+9Dj
		mov	A, #2
		mov	DPTR, #0F883h
		movx	@DPTR, A
		clr	RAM_2C.6
		clr	A
		mov	DPTR, #0F8A6h
		movx	@DPTR, A
		mov	DPTR, #0F885h
		movx	@DPTR, A
		mov	DPTR, #880Bh	; Задержка регулирования Lean-Rich | Время, сек. - Обороты коленвала, об/мин - Цикловое	наполнение,мг/цикл

code_A704:				; CODE XREF: code_A5B1+13Dj
		mov	A, RPM_GBC_3D_RT
		movc	A, @A+DPTR
		mov	DPTR, #0F860h
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F85Bh
		movx	@DPTR, A
		mov	DPTR, #0F884h
		movx	A, @DPTR
		anl	A, #0FEh
		mov	DPTR, #0F884h
		movx	@DPTR, A
		mov	DPTR, #8696h	; Шаг изменения	КР при переходе	|  - Обороты коленвала,	об/мин - Цикловое наполнение,мг/цикл
		mov	A, RPM_GBC_3D_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F85Fh
		movx	A, @DPTR
		clr	C
		subb	A, RAM_6E
		lcall	ABS_ACC
		div	AB
		mov	B, A		; B-Register
		mov	A, RAM_70

code_A731:				; CODE XREF: code_A5B1+184j
		mov	C, RAM_2C.7
		cpl	C
		rlc	A
		djnz	B, code_A731	; B-Register
		mov	RAM_70,	A
		mov	DPTR, #0F861h
		movx	@DPTR, A
		mov	A, RAM_6E
		mov	DPTR, #0F85Fh
		movx	@DPTR, A
		sjmp	code_A773
; ---------------------------------------------------------------------------

code_A746:				; CODE XREF: code_A5B1+B2j
		mov	DPTR, #0F884h
		movx	A, @DPTR
		orl	A, #1
		mov	DPTR, #0F884h
		movx	@DPTR, A
		mov	DPTR, #8696h	; Шаг изменения	КР при переходе	|  - Обороты коленвала,	об/мин - Цикловое наполнение,мг/цикл
		mov	A, RPM_GBC_3D_RT
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		jb	RAM_2C.7, code_A75F
		add	A, RAM_6E
		sjmp	code_A763
; ---------------------------------------------------------------------------

code_A75F:				; CODE XREF: code_A5B1+1A7j
		cpl	A
		inc	A
		add	A, RAM_6E

code_A763:				; CODE XREF: code_A5B1+1ACj
		mov	RAM_6E,	A
		jb	ACC.7, code_A76F ; Accumulator
		add	A, #0B0h ; '-'
		jnc	code_A773
		ljmp	code_A7ED
; ---------------------------------------------------------------------------

code_A76F:				; CODE XREF: code_A5B1+1B4j
		add	A, #50h	; 'P'
		jnc	code_A7D3

code_A773:				; CODE XREF: code_A5B1+193j
					; code_A5B1+1B9j
		jb	RAM_2B.7, code_A7D2
		mov	A, RAM_70
		anl	A, #0Fh
		cjne	A, #5, code_A7D2
		mov	DPTR, #5F96h	; Температура разрешения обучения | град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_A785

code_A785:
		jnc	code_A7D2
		mov	DPTR, #5F6Ah	; Число	стабильных циклов для обучения | циклов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F85Eh
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_A7D2
		mov	DPTR, #0F85Fh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FD00h
		mov	DPL, RPM_THR_3D_RT	; Data Pointer,	Low Byte
		movx	A, @DPTR
		xch	A, B		; B-Register
		jnz	code_A7AC
		mov	A, B		; B-Register
		sjmp	code_A7BC
; ---------------------------------------------------------------------------

code_A7AC:				; CODE XREF: code_A5B1+1F5j
		jb	ACC.7, code_A7B7 ; Accumulator
		mov	A, B		; B-Register
		inc	A
		jnz	code_A7BC
		dec	A
		sjmp	code_A7BC
; ---------------------------------------------------------------------------

code_A7B7:				; CODE XREF: code_A5B1:code_A7ACj
		mov	A, B		; B-Register
		jz	code_A7BC
		dec	A

code_A7BC:				; CODE XREF: code_A5B1+1F9j
					; code_A5B1+201j ...
		movx	@DPTR, A
		mov	DPTR, #0F88Ch
		movx	@DPTR, A
		mov	A, RPM_THR_3D_RT
		mov	DPTR, #0F88Eh
		movx	@DPTR, A
		mov	C, RAM_2B.6
		mov	RAM_2C.4, C
		clr	A
		mov	DPTR, #0F889h
		movx	@DPTR, A
		setb	RAM_2B.7

code_A7D2:				; CODE XREF: code_A5B1:code_A773j
					; code_A5B1+1C9j ...
		ret
; ---------------------------------------------------------------------------

code_A7D3:				; CODE XREF: code_A5B1:code_A6C8j
					; code_A5B1+1C0j
		mov	RAM_6E,	#0B0h ;	'-'
		mov	DPTR, #0F810h
		movx	A, @DPTR
		jnb	ACC.7, code_A80D ; Accumulator
		mov	DPTR, #0F8A6h
		movx	A, @DPTR
		add	A, #1
		movx	@DPTR, A
		cjne	A, #63h, code_A7E7 ; 'c'

code_A7E7:
		jc	code_A80D
		setb	RAM_25.4
		sjmp	code_A805
; ---------------------------------------------------------------------------

code_A7ED:				; CODE XREF: code_A5B1:code_A6CBj
					; code_A5B1+1BBj
		mov	RAM_6E,	#50h ; 'P'
		mov	DPTR, #0F810h
		movx	A, @DPTR
		jnb	ACC.7, code_A80D ; Accumulator
		mov	DPTR, #0F89Fh
		movx	A, @DPTR
		add	A, #1
		movx	@DPTR, A
		cjne	A, #64h, code_A801 ; 'd'

code_A801:
		jc	code_A80D
		setb	RAM_25.5

code_A805:				; CODE XREF: code_A5B1+23Aj
		mov	RAM_6E,	#0
		clr	RAM_2B.4
		lcall	code_A80E

code_A80D:				; CODE XREF: code_A5B1+229j
					; code_A5B1:code_A7E7j	...
		ret
; End of function code_A5B1


; =============== S U B	R O U T	I N E =======================================


code_A80E:				; CODE XREF: RESET_0-BF8Dp
					; code_A5B1+259p
		mov	DPTR, #0FD00h
		mov	R0, #0
		mov	A, #80h	; 'А'

code_A815:				; CODE XREF: code_A80E+9j
		movx	@DPTR, A
		inc	DPTR
		djnz	R0, code_A815
		ret
; End of function code_A80E


; =============== S U B	R O U T	I N E =======================================


CALC_ADAPTATION_RXX:				; CODE XREF: RESET_0-9E69p
		jb	RAM_2C.1, code_A82C
		clr	A
		mov	DPTR, #0F8A0h
		movx	@DPTR, A
		mov	DPTR, #0F8A1h
		movx	@DPTR, A
		mov	DPTR, #0F84Eh
		movx	@DPTR, A
		sjmp	code_A88F
; ---------------------------------------------------------------------------

code_A82C:				; CODE XREF: CALC_ADAPTATION_RXXj
		mov	DPTR, #0F849h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F84Ah
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_A841
		mov	A, B		; B-Register
		mov	DPTR, #0F84Ah
		movx	@DPTR, A

code_A841:				; CODE XREF: CALC_ADAPTATION_RXX+1Fj
		mov	DPTR, #0F847h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F84Ah
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_A860
		mov	DPTR, #0F948h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #6913h	; Шаг уменьшения уставки оборотов 1 | (об/мин)/сек - скорость автомобиля, км/час
		mov	A, B		; B-Register
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		sjmp	code_A86E
; ---------------------------------------------------------------------------

code_A860:				; CODE XREF: CALC_ADAPTATION_RXX+34j
		mov	DPTR, #0F948h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #6933h	; Шаг уменьшения уставки оборотов 2 | (об/мин)/сек - скорость автомобиля, км/час
		mov	A, B		; B-Register
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_A86E:				; CODE XREF: CALC_ADAPTATION_RXX+44j
		mov	DPTR, #0F84Eh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		clr	C
		subb	A, B		; B-Register
		jc	code_A88F
		clr	A
		movx	@DPTR, A
		mov	DPTR, #0F849h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F84Ah
		movx	A, @DPTR
		dec	A
		movx	@DPTR, A
		clr	C
		subb	A, B		; B-Register
		jnc	code_A88F
		mov	A, B		; B-Register
		movx	@DPTR, A

code_A88F:				; CODE XREF: CALC_ADAPTATION_RXX+10j
					; CALC_ADAPTATION_RXX+5Dj ...
		mov	DPTR, #0F84Ah
		movx	A, @DPTR
		clr	C
		subb	A, RPM_XX
		jc	code_A89F
		jnb	ACC.7, code_A8A6 ; Accumulator
		mov	A, #7Fh	; ''
		sjmp	code_A8A6
; ---------------------------------------------------------------------------

code_A89F:				; CODE XREF: CALC_ADAPTATION_RXX+7Cj
		jb	ACC.7, code_A8A6 ; Accumulator
		mov	A, #80h	; 'А'
		sjmp	code_A8A6

code_A8A6:				; CODE XREF: CALC_ADAPTATION_RXX+7Ej
					; CALC_ADAPTATION_RXX+83j ...
		mov	DELTA_RPM_XX, A
		mov	DPTR, #5F69h	; Ошибка запрещающая регулирование | об/мин
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, DELTA_RPM_XX
		mov	R0, A
		lcall	ABS_ACC
		clr	C
		subb	A, B		; B-Register
		jnc	code_A8C5
		clr	A
		mov	DPTR, #0F8BCh
		movx	@DPTR, A
		mov	DPTR, #0F8BDh
		movx	@DPTR, A
		sjmp	code_A8F2
; ---------------------------------------------------------------------------

code_A8C5:				; CODE XREF: CALC_ADAPTATION_RXX+9Ej
		mov	DPTR, #0F9D4h
		movx	A, @DPTR
		cjne	A, #0Fh, code_A8CC

code_A8CC:
		jc	code_A8D0
		mov	A, #0Fh

code_A8D0:				; CODE XREF: CALC_ADAPTATION_RXX:code_A8CCj
		mov	B, A		; B-Register
		mov	DPTR, #8A22h	; Пропорциональный коэффициент | % - Время после пуска,	сек
		mov	A, B		; B-Register
		movc	A, @A+DPTR
		mov	DPTR, #0F8BDh
		movx	@DPTR, A
		mov	DPTR, #0F847h
		movx	A, @DPTR
		cjne	A, RPM_XX, code_A8E3

code_A8E3:
		jnc	code_A8E8
		clr	A
		sjmp	code_A8EE
; ---------------------------------------------------------------------------

code_A8E8:				; CODE XREF: CALC_ADAPTATION_RXX:code_A8E3j
		mov	DPTR, #8A12h	; Диференциальный коэффициент |	% - Время после	пуска, сек
		mov	A, B		; B-Register
		movc	A, @A+DPTR

code_A8EE:				; CODE XREF: CALC_ADAPTATION_RXX+CCj
		mov	DPTR, #0F8BCh
		movx	@DPTR, A

code_A8F2:				; CODE XREF: CALC_ADAPTATION_RXX+A9j
		jb	RAM_2C.1, code_A90C
		mov	A, DELTA_RPM_XX
		mov	DPTR, #0F84Ch
		movx	@DPTR, A
		mov	A, UFRXX
		mov	R0, A
		mov	R1, #0
		lcall	code_ADA2
		mov	DPTR, #0F845h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A

code_A90C:				; CODE XREF: CALC_ADAPTATION_RXX:code_A8F2j
		mov	A, DEV_FLAGS
		anl	A, #4
		jnz	code_A97D
		
		call CALC_DUOZ_REGXX
		
		mov	B, A		; B-Register
		jnb	RAM_2D.5, code_A977
		mov	DPTR, #5F8Dh	; Температура активации	УОЗ при	движении | град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_A96D

code_A96D:
		jnc	code_A977
		mov	DPTR, #780Fh	; УОЗ на ХХ при	движении | УОЗ,	гр.п.к.в. - Цикловое наполнение, мг/цикл
		mov	A, GBC_RT_32
		movc	A, @A+DPTR
		sjmp	code_A979
; ---------------------------------------------------------------------------

code_A977:				; CODE XREF: CALC_ADAPTATION_RXX+148j
					; CALC_ADAPTATION_RXX:code_A96Dj
		mov	A, UOZXX_2

code_A979:				; CODE XREF: CALC_ADAPTATION_RXX+15Bj
		add		A, B		; B-Register
		mov		B, A            ; B-Register
		mov		DPTR, #0FF60h
		movx	A, @DPTR
		add		A, B
		mov	UOZXX_1, A

code_A97D:				; CODE XREF: CALC_ADAPTATION_RXX+F6j
		mov	A, DEV_FLAGS
		anl	A, #20h
		jz	code_A984
		ret
; ---------------------------------------------------------------------------

code_A984:				; CODE XREF: CALC_ADAPTATION_RXX+167j
		mov	DPTR, #0F84Ch
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, DELTA_RPM_XX
		clr	C
		subb	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #0F84Ch
		movx	A, @DPTR
		mov	C, ACC.7	; Accumulator
		mov	A, DELTA_RPM_XX
		anl	C, ACC.7	; Accumulator
		jc	code_A9C1
		mov	DPTR, #0F84Ch
		movx	A, @DPTR
		mov	C, ACC.7	; Accumulator
		cpl	C
		mov	A, DELTA_RPM_XX
		anl	C, /ACC.7	; Accumulator
		jc	code_A9C1
		mov	A, DELTA_RPM_XX
		jb	ACC.7, code_A9B9 ; Accumulator
		mov	A, B		; B-Register
		jnb	ACC.7, code_A9C1 ; Accumulator
		mov	B, #7Fh	; ''   ; B-Register
		sjmp	code_A9C1
; ---------------------------------------------------------------------------

code_A9B9:				; CODE XREF: CALC_ADAPTATION_RXX+192j
		mov	A, B		; B-Register
		jb	ACC.7, code_A9C1 ; Accumulator
		mov	B, #80h	; 'А'   ; B-Register

code_A9C1:				; CODE XREF: CALC_ADAPTATION_RXX+181j
					; CALC_ADAPTATION_RXX+18Ej ...
		mov	A, DELTA_RPM_XX
		mov	DPTR, #0F84Ch
		movx	@DPTR, A
		mov	DPTR, #60F7h	; Температура холодного	пуска для регулирования	| град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_A9CF

code_A9CF:
		jc	code_A9DC
		mov	A, DELTA_RPM_XX
		jb	ACC.7, code_A9DC ; Accumulator
		jnb	B.7, code_A9DC	; B-Register
		mov	B, #0		; B-Register

code_A9DC:				; CODE XREF: CALC_ADAPTATION_RXX:code_A9CFj
					; CALC_ADAPTATION_RXX+1B9j ...
		mov	DPTR, #0F8BCh
		movx	A, @DPTR
		mov	R0, A
		clr	A
		jnb	B.7, code_A9E7	; B-Register
		clr	C
		subb	A, R0

code_A9E7:				; CODE XREF: CALC_ADAPTATION_RXX+1C8j
		mov	R1, A
		mov	A, R0
		mul	AB
		mov	R2, A
		mov	A, B		; B-Register
		add	A, R1
		mov	R3, A
		mov	DPTR, #60EBh	; Ограничение ошибки П регулятора | об/мин
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		cpl	A
		inc	A
		mov	R0, A
		mov	A, DELTA_RPM_XX
		lcall	code_AD14
		mov	R0, A
		lcall	code_ADE2
		mov	DPTR, #0F8BDh
		movx	A, @DPTR
		mov	B, A		; B-Register
		lcall	MUL_ABSR0R1_B
		lcall	ADD_R0R1_R2R3
		mov	R2, B		; B-Register
		
		; Жесткость регулятора частоты вращения	| Коэффициент коррекции	- Обороты коленвала, об/мин - Цикловое наполнение,мг/цикл
		GET_RAM_BY_INDEX 700Bh, RPM_GBC_3D_RT, CAPTURE_GAINXX_MODE
		
		mov	B, A		; B-Register
		push	B		; B-Register
		lcall	MUL_ABSR0R1_B
		mov	DPTR, #0F8A1h
		movx	A, @DPTR
		add	A, B		; B-Register
		movx	@DPTR, A
		mov	A, R0
		addc	A, #0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		pop	B		; B-Register
		mov	A, R2
		mul	AB
		mov	R2, A
		mov	DPTR, #0F8A0h
		movx	A, @DPTR
		add	A, R2
		movx	@DPTR, A
		mov	DPTR, #0F8A1h
		movx	A, @DPTR
		addc	A, B		; B-Register
		movx	@DPTR, A
		mov	A, R0
		addc	A, #0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		mov	DPTR, #6084h	; Мин. расход воздуха (ограничение уставки) | кг/час
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0FF48h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_AA5A
		mov	A, R1
		jnb	ACC.7, code_AA5A ; Accumulator
		ret
; ---------------------------------------------------------------------------

code_AA5A:				; CODE XREF: CALC_ADAPTATION_RXX+239j
					; CALC_ADAPTATION_RXX+23Cj
		mov	DPTR, #0F845h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	ADD_R0R1_R2R3
		mov	A, R1
		jnb	ACC.7, code_AA6E ; Accumulator
		mov	R0, #0
		mov	R1, #0

code_AA6E:				; CODE XREF: CALC_ADAPTATION_RXX+24Dj
		mov	DPTR, #6082h	; Максимальное положение РХХ | шаг
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #60F7h	; Температура холодного	пуска для регулирования	| град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_AA7D

code_AA7D:
		jc	code_AA86
		mov	DPTR, #60F6h	; Максимальное положение РХХ холодного двигателя | шаг
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_AA86:				; CODE XREF: CALC_ADAPTATION_RXX:code_AA7Dj
		mov	A, B		; B-Register
		swap	A
		anl	A, #0Fh
		mov	R3, A
		mov	A, B		; B-Register
		swap	A
		anl	A, #0F0h
		mov	R2, A
		lcall	code_AD29
		jnb	RAM_2D.6, code_AAA1
		mov	DPTR, #5FE2h	; Минимальное положение	РХХ при	кондиционировании | шаг.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		sjmp	code_AAB4
; ---------------------------------------------------------------------------

code_AAA1:				; CODE XREF: CALC_ADAPTATION_RXX+27Bj
		jnb	RAM_2D.5, code_AAAD
		mov	DPTR, #60B3h	; Минимальное положение	РХХ при	движении | шаг.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		sjmp	code_AAB4
; ---------------------------------------------------------------------------

code_AAAD:				; CODE XREF: CALC_ADAPTATION_RXX:code_AAA1j
		mov	DPTR, #5FA3h	; Минимальное положение	РХХ | шаг.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_AAB4:				; CODE XREF: CALC_ADAPTATION_RXX+285j
					; CALC_ADAPTATION_RXX+291j
		mov	A, B		; B-Register
		swap	A
		anl	A, #0Fh
		mov	R3, A
		mov	A, B		; B-Register
		swap	A
		anl	A, #0F0h
		mov	R2, A
		lcall	code_AD35
		mov	DPTR, #0F845h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		lcall	code_ADA2
		mov	A, R1
		mov	UFRXX, A
		ret
; End of function CALC_ADAPTATION_RXX


; =============== S U B	R O U T	I N E =======================================


ADAPTATION_RXX:				; CODE XREF: RESET_0-9E66p
		mov	A, DEV_FLAGS
		anl	A, #20h
		jz	code_AADA
		ret
; ---------------------------------------------------------------------------

code_AADA:				; CODE XREF: ADAPTATION_RXX+4j
		jb	RAM_2D.5, code_AB08
		mov	DPTR, #0FF57h
		movx	A, @DPTR
		jnb	ACC.0, code_AAF6 ; Accumulator
		mov	A, DELTA_RPM_XX
		lcall	ABS_ACC
		mov	B, A		; B-Register
		mov	DPTR, #0A02Ah
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		cjne	A, B, code_AAF4	; B-Register

code_AAF4:
		jc	code_AB08

code_AAF6:				; CODE XREF: ADAPTATION_RXX+Ej
		mov	DPTR, #0F84Ah
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F84Bh
		movx	A, @DPTR
		jnb	RAM_2C.1, code_AB08
		clr	C
		subb	A, B		; B-Register
		jz	code_AB18

code_AB08:				; CODE XREF: ADAPTATION_RXX:code_AADAj
					; ADAPTATION_RXX:code_AAF4j	...
		mov	DPTR, #0F84Ah
		movx	A, @DPTR
		mov	DPTR, #0F84Bh
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F8BEh
		movx	@DPTR, A
		lcall	code_AC02

code_AB18:				; CODE XREF: ADAPTATION_RXX+33j
		jnb	RAM_29.1, code_AB23
		mov	DPTR, #0F8BEh
		movx	A, @DPTR
		inc	A
		jz	code_AB23
		movx	@DPTR, A

code_AB23:				; CODE XREF: ADAPTATION_RXX:code_AB18j
					; ADAPTATION_RXX+4Dj
		mov	DPTR, #0FF48h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F854h
		movx	A, @DPTR
		add	A, B		; B-Register
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		addc	A, #0
		movx	@DPTR, A
		mov	DPTR, #0F851h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		clr	C
		subb	A, #80h	; 'А'
		jz	code_AB42
		ret
; ---------------------------------------------------------------------------

code_AB42:				; CODE XREF: ADAPTATION_RXX+6Cj
		mov	A, DEV_FLAGS
		anl	A, #20h
		jz	code_AB49
		ret
; ---------------------------------------------------------------------------

code_AB49:				; CODE XREF: ADAPTATION_RXX+73j
		mov	DPTR, #60EFh	; Задержка адаптации РХХ горячего двигателя | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #60F7h	; Температура холодного	пуска для регулирования	| град.С
		clr	A
		movc	A, @A+DPTR
		cjne	A, TWAT, code_AB58

code_AB58:
		jc	code_AB61
		mov	DPTR, #60F5h	; Задержка адаптации РХХ холодного двигателя | сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register

code_AB61:				; CODE XREF: ADAPTATION_RXX:code_AB58j
		mov	DPTR, #0F8BEh
		movx	A, @DPTR
		cjne	A, B, code_AB68	; B-Register

code_AB68:
		jnc	code_AB6D
		ljmp	code_AC02
; ---------------------------------------------------------------------------

code_AB6D:				; CODE XREF: ADAPTATION_RXX:code_AB68j
		mov	DPTR, #0F854h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	MUL_R0R1_2
		mov	A, R1
		mov	R2, A
		lcall	CalcUFRXX
		mov	B, A		; B-Register
		mov	DPTR, #5F01h
		clr	A
		movc	A, @A+DPTR
		jb	ACC.6, code_AB6C
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	CRRXX, UFRXX
		setb	IEN0.7		; Interrupt Enable Register 0
code_AB6C:
		mov	DPTR, #0F845h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	A, B		; B-Register
		anl	A, #0F0h
		swap	A
		mov	R1, A
		mov	A, B		; B-Register
		anl	A, #0Fh
		swap	A
		mov	B, A		; B-Register
		mov	A, R0
		anl	A, #0Fh
		add	A, B		; B-Register
		mov	R0, A
		mov	DPTR, #0F845h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A

code_ABB4:				; CODE XREF: ADAPTATION_RXX+9Fj
		mov	DPTR, #608Ah	; Температура разрешения отключения топлива | град.С
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, TWAT
		cjne	A, B, code_ABC0	; B-Register

code_ABC0:
		jc	code_ABE3
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		jnz	code_ABE3
		mov	A, DELTA_RPM_XX
		lcall	ABS_ACC
		cjne	A, #14h, code_ABD0

code_ABD0:
		jc	code_ABE3
		mov	DPTR, #0F986h
		movx	A, @DPTR
		inc	A
		jz	code_ABDA
		movx	@DPTR, A

code_ABDA:				; CODE XREF: ADAPTATION_RXX+104j
		cjne	A, #0Ch, code_ABDD

code_ABDD:
		jc	code_ABEA
		setb	RAM_25.7
		sjmp	code_ABEA
; ---------------------------------------------------------------------------

code_ABE3:				; CODE XREF: ADAPTATION_RXX:code_ABC0j
					; ADAPTATION_RXX+F3j ...
		clr	RAM_25.7
		clr	A
		mov	DPTR, #0F986h
		movx	@DPTR, A

code_ABEA:				; CODE XREF: ADAPTATION_RXX:code_ABDDj
					; ADAPTATION_RXX+10Ej
		mov	DPTR, #0F847h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	A, RPM_XX
		clr	C
		subb	A, B		; B-Register
		jnc	code_AC02
		mov	DPTR, #0FF57h
		movx	A, @DPTR
		setb	ACC.0		; Accumulator
		movx	@DPTR, A
		clr	RAM_2C.2
		clr	RAM_22.6

code_AC02:				; CODE XREF: RESET_0-96BBp
					; RESET_0-957Fp ...
		clr	A
		mov	DPTR, #0F851h
		mov	R1, #5

code_AC08:				; CODE XREF: code_AC02+9j
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		djnz	R1, code_AC08
		ret
; End of function code_AC02


; =============== S U B	R O U T	I N E =======================================


code_AC0E:				; CODE XREF: RESET_0-A870p
		mov	A, CRRXX
		mov	DPTR, #0F9C1h
		movx	@DPTR, A
		clr	RAM_28.5
		mov	DPTR, #5F62h	; Максимальное положение РХХ для синхронизации | шаг.
		clr	A
		movc	A, @A+DPTR
		add	A, #14h
		mov	RAM_4, A
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	CRRXX, A
		mov	UFRXX, #0
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	DPTR, #0F9C1h

code_AC2B:				; CODE XREF: code_AC0E+53j
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	A, CRRXX
		cjne	A, RAM_4, code_AC36
		sjmp	code_AC4A
; ---------------------------------------------------------------------------

code_AC36:				; CODE XREF: code_AC0E+23j
		xch	A, RAM_4
		clr	C
		subb	A, RAM_4
		xch	A, RAM_4
		movx	A, @DPTR
		jz	code_AC4A
		clr	C
		subb	A, RAM_4
		jnc	code_AC46
		clr	A

code_AC46:				; CODE XREF: code_AC0E+35j
		movx	@DPTR, A
		mov	RAM_4, CRRXX

code_AC4A:				; CODE XREF: code_AC0E+26j
					; code_AC0E+30j
		mov	DPTR, #60CAh	; Напряжение отключения	питания	| В
		clr	A
		movc	A, @A+DPTR
		mov	RAM_0, A
		mov	B, #0		; B-Register
		lcall	code_A5A0
		mov	DPTR, #0F9C1h
		cjne	A, RAM_0, code_AC5D

code_AC5D:
		jnc	code_AC64
		mov	A, UFRXX
		cjne	A, CRRXX, code_AC2B

code_AC64:				; CODE XREF: code_AC0E:code_AC5Dj
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	DPTR, #6AA1h	; Положение РХХ	при пуске | Шаги РХХ - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	UFRXX, A
		mov	DPTR, #0F9C1h
		movx	A, @DPTR
		mov	CRRXX, A
		setb	IEN0.7		; Interrupt Enable Register 0

code_AC76:				; CODE XREF: code_AC0E+86j
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	A, CRRXX
		movx	@DPTR, A
		mov	DPTR, #60CAh	; Напряжение отключения	питания	| В
		clr	A
		movc	A, @A+DPTR
		mov	RAM_0, A
		mov	B, #0		; B-Register
		lcall	code_A5A0
		mov	DPTR, #0F9C1h
		cjne	A, RAM_0, code_AC90

code_AC90:
		jnc	code_AC9A
		mov	A, UFRXX
		cjne	A, CRRXX, code_AC76
		mov	A, CRRXX
		movx	@DPTR, A

code_AC9A:				; CODE XREF: code_AC0E:code_AC90j
		mov	DPTR, #60CAh	; Напряжение отключения	питания	| В
		clr	A
		movc	A, @A+DPTR
		mov	RAM_0, A
		mov	B, #0		; B-Register
		lcall	code_A5A0
		cjne	A, RAM_0, code_ACAA

code_ACAA:
		jc	code_ACAF
		lcall	code_B304

code_ACAF:				; CODE XREF: code_AC0E:code_ACAAj
		ret
; End of function code_AC0E


; =============== S U B	R O U T	I N E =======================================


code_ACB0:				; CODE XREF: RESET_0-BD51p
		mov	A, TWAT
		mov	DPTR, #0F80Ah
		movx	@DPTR, A
		mov	CRRXX, #7Fh ; ''
		mov	UFRXX, #0
		setb	IEN0.7		; Interrupt Enable Register 0

code_ACBE:				; CODE XREF: code_ACB0+14j
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	A, UFRXX
		cjne	A, CRRXX, code_ACBE
		mov	DPTR, #6AA1h	; Положение РХХ	при пуске | Шаги РХХ - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	UFRXX, A

code_ACCF:				; CODE XREF: code_ACB0+25j
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	A, UFRXX
		cjne	A, CRRXX, code_ACCF
		ret
; End of function code_ACB0


; =============== S U B	R O U T	I N E =======================================


code_ACD9:				; CODE XREF: RESET_0-A5EAp
					; RESET_0:code_4593p ...
		clr	A
		mov	DPTR, #0F83Eh
		movx	@DPTR, A
		mov	DPTR, #0F83Dh
		movx	@DPTR, A
		mov	DPTR, #0F840h
		movx	@DPTR, A
		mov	DPTR, #0F83Fh
		movx	@DPTR, A
		clr	RAM_27.0
		ret
; End of function code_ACD9


; =============== S U B	R O U T	I N E =======================================


code_ACED:				; CODE XREF: RESET_0-BF9Cp
					; RESET_0-A5E7p ...
		clr	RAM_2B.4
		clr	RAM_2B.5
		clr	RAM_2B.1
		mov	RAM_6B,	#0
		mov	DPTR, #87E4h	; Состав смеси на ХХ | Отношение воздух/топливо	- Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mov	ALF_1, A
		mov	DPTR, #0F833h
		movx	@DPTR, A
		ret
; End of function code_ACED


; =============== S U B	R O U T	I N E =======================================

TestMinMax:
code_AD03:				; CODE XREF: RESET_0-BF70p
					; RESET_0-B959p ...
		clr	C
		subb	A, R0
		jnc	code_AD09
		mov	A, R0
		ret
; ---------------------------------------------------------------------------

code_AD09:				; CODE XREF: code_AD03+2j
		add	A, R0
		clr	C
		subb	A, R1
		jc	code_AD11
		mov	A, R1
		setb	C
		ret
; ---------------------------------------------------------------------------

code_AD11:				; CODE XREF: code_AD03+9j
		add	A, R1
		clr	C
		ret
; End of function code_AD03


; =============== S U B	R O U T	I N E =======================================

TestMinMaxNeg:
code_AD14:				; CODE XREF: RESET_0-A1EAp
					; RESET_0-995Ap ...
		clr	C
		jnb	ACC.7, code_AD20 ; Accumulator
		subb	A, R0
		jnc	code_AD1D
		mov	A, R0
		ret
; ---------------------------------------------------------------------------

code_AD1D:				; CODE XREF: code_AD14+5j
		add	A, R0
		setb	C
		ret
; ---------------------------------------------------------------------------

code_AD20:				; CODE XREF: code_AD14+1j
		subb	A, R1
		jc	code_AD26
		mov	A, R1
		setb	C
		ret
; ---------------------------------------------------------------------------

code_AD26:				; CODE XREF: code_AD14+Dj
		add	A, R1
		clr	C
		ret
; End of function code_AD14


; =============== S U B	R O U T	I N E =======================================


code_AD29:				; CODE XREF: IE0_0+1055p RESET_0-B639p ...
		clr	C
		mov	A, R2
		subb	A, R0
		mov	A, R3
		subb	A, R1
		jnc	code_AD34
		mov	A, R2
		mov	R0, A
		mov	A, R3
		mov	R1, A

code_AD34:				; CODE XREF: code_AD29+5j
		ret
; End of function code_AD29


; =============== S U B	R O U T	I N E =======================================


code_AD35:				; CODE XREF: RESET_0-B62Ap
					; CALC_ADAPTATION_RXX+2A6p
		clr	C
		mov	A, R2
		subb	A, R0
		mov	A, R3
		subb	A, R1
		jc	code_AD40
		mov	A, R2
		mov	R0, A
		mov	A, R3
		mov	R1, A

code_AD40:				; CODE XREF: code_AD35+5j
		ret
; End of function code_AD35


; =============== S U B	R O U T	I N E =======================================


MUL_R0R1_B:				; CODE XREF: IE0_0+13Dp IE0_0+430p ...
		mov	A, B		; B-Register
		xch	A, R1
		mul	AB
		xch	A, R0
		xch	A, B		; B-Register
		xch	A, R1
		mul	AB
		xch	A, B		; B-Register
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		ret
; End of function MUL_R0R1_B


; =============== S U B	R O U T	I N E =======================================


MUL_ABSR0R1_B:				; CODE XREF: IE0_0+A9p	IE0_0+10Dp ...
		mov	A, B		; B-Register
		xch	A, R1
		jb	ACC.7, code_AD5F ; Accumulator
		mul	AB
		xch	A, R0
		xch	A, B		; B-Register
		sjmp	code_AD65
; ---------------------------------------------------------------------------

code_AD5F:				; CODE XREF: MUL_ABSR0R1_B+3j
		mul	AB
		xch	A, R0
		xch	A, B		; B-Register
		clr	C
		subb	A, R1

code_AD65:				; CODE XREF: MUL_ABSR0R1_B+Aj
		xch	A, R1
		mul	AB
		xch	A, B		; B-Register
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, #0
		mov	R1, A
		ret
; End of function MUL_ABSR0R1_B


; =============== S U B	R O U T	I N E =======================================


code_AD70:				; CODE XREF: IE0_0:code_10E6p
					; IE0_0+903p ...
		clr	C
		clr	A
		subb	A, R0
		mov	R0, A
		clr	A
		subb	A, R1
		mov	R1, A
		ret
; End of function code_AD70


; =============== S U B	R O U T	I N E =======================================

MUL_R0R1_2:				; CODE XREF: IE0_0+7ACp IE0_0+1046p ...
		mov	A, R0
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, R1
		jc	code_AD81
		mov	R1, A
		ret
; ---------------------------------------------------------------------------

code_AD81:				; CODE XREF: MUL_R0R1_2+5j code_AD86+7j ...
		mov	R0, #0FFh
		mov	R1, #0FFh
		ret
; End of function MUL_R0R1_2


; =============== S U B	R O U T	I N E =======================================

MUL_R0R1_4:
code_AD86:				; CODE XREF: IE0_0+21p	IE0_0+58Ap ...
		mov	A, R0
		mov	R0, #2
		clr	C

code_AD8A:				; CODE XREF: code_AD86+Aj
		rlc	A
		xch	A, R1
		rlc	A
		jc	code_AD81
		xch	A, R1
		djnz	R0, code_AD8A
		mov	R0, A
		ret
; End of function code_AD86


; =============== S U B	R O U T	I N E =======================================

MUL_R0R1_8:
code_AD94:				; CODE XREF: RESET_0-B0FBp
					; RESET_0-AFEAp ...
		mov	A, R0
		mov	R0, #3
		clr	C

code_AD98:				; CODE XREF: code_AD94+Aj
		rlc	A
		xch	A, R1
		rlc	A
		jc	code_AD81
		xch	A, R1
		djnz	R0, code_AD98
		mov	R0, A
		ret
; End of function code_AD94


; =============== S U B	R O U T	I N E =======================================

MUL_R0R1_16:
code_ADA2:				; CODE XREF: IE0_0+1739p IE0_0+176Dp ...
		mov	A, R1
		anl	A, #0F0h
		jnz	code_AD81
		mov	A, R0
		anl	A, #0F0h
		orl	A, R1
		swap	A
		mov	R1, A
		mov	A, R0
		anl	A, #0Fh
		swap	A
		mov	R0, A
		ret
; End of function code_ADA2


; =============== S U B	R O U T	I N E =======================================


DIV_R0R1_2:				; CODE XREF: IE0_0+151p IE0_0+54Ep ...
		clr	C
		mov	A, R1
		rrc	A
		mov	R1, A
		mov	A, R0
		rrc	A
		mov	R0, A
		ret
; End of function DIV_R0R1_2


; =============== S U B	R O U T	I N E =======================================


DIV_R0R1_4:				; CODE XREF: IE0_0+FB9p IE0_0+1357p ...
		mov	A, R1
		mov	R1, #2
		sjmp	code_ADBE

DIV_R0R1_64:				; CODE XREF: IE0_0+14Ep
					; IE0_0:code_189Fp ...
		mov	A, R1
		mov	R1, #6
		sjmp	code_ADBE

DIV_R0R1_32:				; CODE XREF: IE0_0+14Ep
					; IE0_0:code_189Fp ...
		mov	A, R1
		mov	R1, #5
		sjmp	code_ADBE

DIV_R0R1_8:				; CODE XREF: IE0_0+14Ep
					; IE0_0:code_189Fp ...
		mov	A, R1
		mov	R1, #3

code_ADBE:				; CODE XREF: DIV_R0R1_4+8j
		clr	C
		rrc	A
		xch	A, R0
		rrc	A
		xch	A, R0
		djnz	R1, code_ADBE
		mov	R1, A
		ret
; End of function DIV_R0R1


; =============== S U B	R O U T	I N E =======================================


ADD_R0R1_R2R3:				; CODE XREF: IE0_0+CCp	IE0_0+120p ...
		mov	A, R0
		add	A, R2
		mov	R0, A
		mov	A, R1
		addc	A, R3
		mov	R1, A
		ret
; End of function ADD_R0R1_R2R3


; =============== S U B	R O U T	I N E =======================================


SUB_R0R1_R2R3:				; CODE XREF: IE0_0+76p	IE0_0+9Fp ...
		clr	C
		mov	A, R0
		subb	A, R2
		mov	R0, A
		mov	A, R1
		subb	A, R3
		mov	R1, A
		ret
; End of function SUB_R0R1_R2R3


; =============== S U B	R O U T	I N E =======================================


code_ADE2:				; CODE XREF: RESET_0:code_47C1p
					; CALC_ADAPTATION_RXX:code_A926p	...
		mov	A, R0
		jb	ACC.7, code_ADE9 ; Accumulator
		mov	R1, #0
		ret
; ---------------------------------------------------------------------------

code_ADE9:				; CODE XREF: code_ADE2+1j
		mov	R1, #0FFh
		ret
; End of function code_ADE2


; =============== S U B	R O U T	I N E =======================================


code_ADEC:				; CODE XREF: RESET_0-A1FDp
					; CALC_ADAPTATION_RXX+130p
		mov	A, R1
		jb	ACC.7, code_ADF9 ; Accumulator
		jnz	code_ADF6
		mov	A, R0
		jnb	ACC.7, code_AE02 ; Accumulator

code_ADF6:				; CODE XREF: code_ADEC+4j
		mov	A, #7Fh	; ''
		ret
; ---------------------------------------------------------------------------

code_ADF9:				; CODE XREF: code_ADEC+1j
		cpl	A
		jnz	code_AE00
		mov	A, R0
		jb	ACC.7, code_AE02 ; Accumulator

code_AE00:				; CODE XREF: code_ADEC+Ej
		mov	A, #80h	; 'А'

code_AE02:				; CODE XREF: code_ADEC+7j
					; code_ADEC+11j
		ret
; End of function code_ADEC


; =============== S U B	R O U T	I N E =======================================


ABS_ACC:				; CODE XREF: IE0_0+F34p IE0_0+1119p ...
		jnb	ACC.7, code_AE08 ; Accumulator
		cpl	A
		inc	A

code_AE08:				; CODE XREF: ABS_ACCj
		ret
; End of function ABS_ACC


; =============== S U B	R O U T	I N E =======================================


code_AE09:				; CODE XREF: RESET_0-B7E5p
					; RESET_0-B781p ...
		mov	A, R1
		jnb	ACC.7, code_AE17 ; Accumulator
		mov	A, R0
		cpl	A
		add	A, #1
		mov	R0, A
		mov	A, R1
		cpl	A
		addc	A, #0
		mov	R1, A

code_AE17:				; CODE XREF: code_AE09+1j
		ret
; End of function code_AE09


; =============== S U B	R O U T	I N E =======================================


CalcUFRXX:				; CODE XREF: RESET_0-9DA4p
					; RESET_0-9CE0p ...
		mov	DPTR, #6084h	; Мин. расход воздуха (ограничение уставки) | кг/час
		clr	A
		movc	A, @A+DPTR
		mov	R0, A
		mov	DPTR, #6085h	; Макс расход воздуха (ограничение уставки) | кг/час
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		mov	A, R2
		lcall	code_AD03
		mov	R2, A
		swap	A
		rl	A
		anl	A, #1Fh
		mov	DPTR, #0FF4Bh
		movx	@DPTR, A
		
		GET_2D_RAM_VALUE_BY_R2 0A2D8h, CAPTURE_DUTY_RXX_MODE ; Прямая характеристика	РХХ | Положение	РХХ, шагов - Желаемый расход воздуха
		
		mov	B, A		; B-Register
		mov	R0, #0
		mov	DPTR, #6082h	; Максимальное положение РХХ | шаг
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		mov	A, B		; B-Register
		lcall	code_AD03
		mov	UFRXX, A
		ret
; End of function CalcUFRXX


; =============== S U B	R O U T	I N E =======================================


GET_2D_VALUE:				; CODE XREF: IE0_0+1858p RESET_0-8DE6p ...
		mov	A, R2
		swap	A
		rl	A
		anl	A, #1Fh
		mov	R3, A
		mov	A, R2
		swap	A
		rl	A
		anl	A, #0E0h
		mov	R2, A
		jnz	code_AE5A
		mov	A, R3
		movc	A, @A+DPTR
		ret
; ---------------------------------------------------------------------------

code_AE5A:				; CODE XREF: GET_2D_VALUE+Cj
		mov	B, R2		; B-Register
		mov	A, R3
		inc	A
		movc	A, @A+DPTR
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		mov	A, R2
		cpl	A
		inc	A
		mov	B, A		; B-Register
		mov	A, R3
		movc	A, @A+DPTR
		mul	AB
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, B		; B-Register
		ret
; End of function GET_2D_VALUE


; =============== S U B	R O U T	I N E =======================================


GET_3D_VALUE:				; CODE XREF: IE0_0+D97p IE0_0+F9Cp ...
		mov	A, R3
		anl	A, #0F0h
		mov	B, A		; B-Register
		mov	A, R2
		anl	A, #0F0h
		swap	A
		add	A, B		; B-Register
		mov	R4, A
		mov	A, R2
		anl	A, #0Fh
		mov	R2, A
		mov	A, R3
		anl	A, #0Fh
		mov	R3, A
		orl	A, R2
		jnz	code_AE8B
		mov	A, R4
		movc	A, @A+DPTR
		ret
; ---------------------------------------------------------------------------

code_AE8B:				; CODE XREF: GET_3D_VALUE+15j
		mov	A, R2
		mov	B, R3		; B-Register
		mul	AB
		mov	B, A		; B-Register
		mov	A, R4
		add	A, #11h
		movc	A, @A+DPTR
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		mov	A, #10h
		clr	C
		subb	A, R2
		mov	B, R3		; B-Register
		mul	AB
		mov	B, A		; B-Register
		mov	A, R4
		add	A, #10h
		movc	A, @A+DPTR
		mul	AB
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, B		; B-Register
		mov	R1, A
		mov	A, #10h
		clr	C
		subb	A, R3
		mov	R3, A
		mov	B, R2		; B-Register
		mul	AB
		mov	B, A		; B-Register
		mov	A, R4
		inc	A
		movc	A, @A+DPTR
		mul	AB
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, B		; B-Register
		mov	R1, A
		mov	A, #10h
		clr	C
		subb	A, R2
		mov	B, R3		; B-Register
		mul	AB
		mov	B, A		; B-Register
		mov	A, R4
		movc	A, @A+DPTR
		mul	AB
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, B		; B-Register
		ret
; End of function GET_3D_VALUE


; =============== S U B	R O U T	I N E =======================================


code_AED3:				; CODE XREF: code_EBA4+E6p
		mov	B, #5		; B-Register
		div	AB
		cjne	A, #24h, code_AEDA ; '$'

code_AEDA:
		jc	code_AEDE
		mov	A, #24h	; '$'

code_AEDE:				; CODE XREF: code_AED3:code_AEDAj
		mov	R2, A
		mov	A, B		; B-Register
		mov	B, #33h	; '3'   ; B-Register
		mul	AB
		mov	R3, A
; End of function code_AED3


; =============== S U B	R O U T	I N E =======================================

GET_2D_INTERPOLATION:				; CODE XREF: IE0_0+153Ap IE0_0+159Bp ...
		mov	A, R2
		movc	A, @A+DPTR
		xch	A, R2
		inc	A
		movc	A, @A+DPTR
		clr	C
		subb	A, R2
		jc	code_AEF8
		mov	B, R3		; B-Register
		mul	AB
		add	A, #80h	; 'А'
		mov	A, B		; B-Register
		addc	A, R2
		ret
; ---------------------------------------------------------------------------

code_AEF8:				; CODE XREF: GET_2D_INTERPOLATION+7j
		cpl	A
		inc	A
		mov	B, R3		; B-Register
		mul	AB
		clr	C
		mov	A, R2
		subb	A, B		; B-Register
		ret
; End of function GET_2D_INTERPOLATION


; =============== S U B	R O U T	I N E =======================================


GET_3D_RAM_VALUE:				; CODE XREF: RESET_0-9A79p
		mov	A, R3
		anl	A, #0F0h
		mov	B, A		; B-Register
		mov	A, R2
		anl	A, #0F0h
		swap	A
		add	A, B		; B-Register
		mov	R4, A
		mov	A, R2
		anl	A, #0Fh
		mov	R2, A
		mov	A, R3
		anl	A, #0Fh
		mov	R3, A
		orl	A, R2
		jnz	code_AF1E
		mov	A, R4
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		ret
; ---------------------------------------------------------------------------

code_AF1E:				; CODE XREF: code_AF02+15j
		mov	A, R2
		mov	B, R3		; B-Register
		mul	AB
		mov	B, A		; B-Register
		mov	A, R4
		add	A, #11h
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		mov	A, #10h
		clr	C
		subb	A, R2
		mov	B, R3		; B-Register
		mul	AB
		mov	B, A		; B-Register
		mov	A, R4
		add	A, #10h
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mul	AB
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, B		; B-Register
		mov	R1, A
		mov	A, #10h
		clr	C
		subb	A, R3
		mov	R3, A
		mov	B, R2		; B-Register
		mul	AB
		mov	B, A		; B-Register
		mov	A, R4
		inc	A
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mul	AB
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, B		; B-Register
		mov	R1, A
		mov	A, #10h
		clr	C
		subb	A, R2
		mov	B, R3		; B-Register
		mul	AB
		mov	B, A		; B-Register
		mov	A, R4
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mul	AB
		add	A, R0
		mov	R0, A
		mov	A, R1
		addc	A, B		; B-Register
		ret
; End of function code_AF02


; =============== S U B	R O U T	I N E =======================================


code_AF6E:				; CODE XREF: RESET_0-B2A7p
					; RESET_0-B297p ...
		mov	B, A		; B-Register
		movx	A, @DPTR
		add	A, B		; B-Register
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		addc	A, #0
		movx	@DPTR, A
		ret
; End of function code_AF6E


; =============== S U B	R O U T	I N E =======================================


code_AF7B:				; CODE XREF: RESET_0-AFB9p
		mov	R1, A
		swap	A
		anl	A, #0Fh
		mov	B, A		; B-Register
		movc	A, @A+DPTR
		mov	R0, A
		mov	A, B		; B-Register
		inc	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R0
		clr	C
		subb	A, B		; B-Register
		mov	B, A		; B-Register
		mov	A, R1
		anl	A, #0Fh
		swap	A
		mul	AB
		mov	A, R0
		clr	C
		subb	A, B		; B-Register
		clr	C
		subb	A, #14h
		jnc	code_AF9F
		mov	A, #0

code_AF9F:				; CODE XREF: code_AF7B+20j
		ret
; End of function code_AF7B


; =============== S U B	R O U T	I N E =======================================


code_AFA0:				; CODE XREF: RESET_0-BDF2p
					; RESET_0-B168p
		mov	R1, A
		swap	A
		anl	A, #0Fh
		mov	B, A		; B-Register
		movc	A, @A+DPTR
		mov	R0, A
		mov	A, B		; B-Register
		inc	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R0
		clr	C
		subb	A, B		; B-Register
		mov	B, A		; B-Register
		mov	A, R1
		anl	A, #0Fh
		swap	A
		mul	AB
		mov	A, R0
		clr	C
		subb	A, B		; B-Register
		jnc	code_AFC1
		mov	A, #0

code_AFC1:				; CODE XREF: code_AFA0+1Dj
		ret
; End of function code_AFA0


; =============== S U B	R O U T	I N E =======================================


code_AFC2:				; CODE XREF: RESET_0-9AB0p
		mov	DPTR, #0F833h
		movx	A, @DPTR
		mov	B, A		; B-Register
		clr	C
		subb	A, ALF_1
		jz	code_AFF4
		jnc	code_AFDD
		mov	DPTR, #6077h	; Макс.	скорость обеднения смеси | 1/сек.
		clr	A
		movc	A, @A+DPTR
		add	A, B		; B-Register
		cjne	A, ALF_1, code_AFD9

code_AFD9:
		jnc	code_AFF5
		sjmp	code_AFEE
; ---------------------------------------------------------------------------

code_AFDD:				; CODE XREF: code_AFC2+Bj
		mov	DPTR, #6078h	; Макс.	скорость обогащения смеси | 1/сек.
		clr	A
		movc	A, @A+DPTR
		xch	A, B		; B-Register
		subb	A, B		; B-Register
		jnc	code_AFE9
		clr	A

code_AFE9:				; CODE XREF: code_AFC2+24j
		cjne	A, ALF_1, code_AFEC

code_AFEC:
		jc	code_AFF5

code_AFEE:				; CODE XREF: code_AFC2+19j
		mov	DPTR, #0F833h
		movx	@DPTR, A
		mov	ALF_1, A

code_AFF4:				; CODE XREF: code_AFC2+9j
		ret
; ---------------------------------------------------------------------------

code_AFF5:				; CODE XREF: code_AFC2:code_AFD9j
					; code_AFC2:code_AFECj
		mov	DPTR, #0F833h
		mov	A, ALF_1
		movx	@DPTR, A
		ret
; End of function code_AFC2


; =============== S U B	R O U T	I N E =======================================


code_AFFC:				; CODE XREF: RESET_0:code_4EEBp
		jnb	RAM_29.3, code_B00C
		mov	DPTR, #0F835h
		movx	A, @DPTR
		clr	C
		subb	A, ALF_1
		jnc	code_B00C
		add	A, ALF_1
		mov	ALF_1, A

code_B00C:				; CODE XREF: code_AFFCj code_AFFC+Aj
		mov	DPTR, #607Ah	; Скорость изменения коррекции состава смеси | 1/сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F834h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_B026	; B-Register
		clr	A
		movx	@DPTR, A
		mov	DPTR, #0F835h
		movx	A, @DPTR
		inc	A
		jz	code_B026
		movx	@DPTR, A

code_B026:				; CODE XREF: code_AFFC+1Dj
					; code_AFFC+27j
		ret
; End of function code_AFFC


; =============== S U B	R O U T	I N E =======================================


code_B027:				; CODE XREF: RESET_0-9D06p
		mov	DPTR, #87E4h	; Состав смеси на ХХ | Отношение воздух/топливо	- Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		nop
		nop
		nop
		mov	B, A		; B-Register
		mov	DPTR, #0F835h
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jc	code_B03E
		mov	A, B		; B-Register
		movx	@DPTR, A

code_B03E:				; CODE XREF: code_B027+12j
		mov	DPTR, #607Ah	; Скорость изменения коррекции состава смеси | 1/сек.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F834h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_B08F	; B-Register
		clr	A
		movx	@DPTR, A
		mov	DPTR, #607Dh	; Начальная температура	прогретого двигателя | град.С
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #6A53h	; Базовый состав смеси | Отношение воздух/топливо - Температура, град.С
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, #80h	; 'А'
		clr	C
		subb	A, B		; B-Register
		jnc	code_B063
		clr	A

code_B063:				; CODE XREF: code_B027+39j
		mov	B, A		; B-Register
		mov	DPTR, #6A7Ah	; Коррекция базового состава смеси | Коэффициент коррекции - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		mul	AB
		mov	DPTR, #6A53h	; Базовый состав смеси | Отношение воздух/топливо - Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		add	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #6079h	; Коррекция состава смеси при возобновлении топливоподачи |
		clr	A
		movc	A, @A+DPTR
		xch	A, B		; B-Register
		clr	C
		subb	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #0F835h
		movx	A, @DPTR
		dec	A
		clr	C
		subb	A, B		; B-Register
		jc	code_B08F
		add	A, B		; B-Register
		movx	@DPTR, A

code_B08F:				; CODE XREF: code_B027+24j
					; code_B027+63j
		ret
; End of function code_B027


; =============== S U B	R O U T	I N E =======================================


code_B090:				; CODE XREF: RESET_0-BD21p
		clr	P5.4		; Port 5 (PDIR=0)
		anl	P9, #7Fh	; Port 9 (PDIR=0)
		orl	P9, #80h	; Port 9 (PDIR=0)
		anl	P9, #7Fh	; Port 9 (PDIR=0)
		orl	P9, #80h	; Port 9 (PDIR=0)
		ret
; End of function code_B090


; =============== S U B	R O U T	I N E =======================================


code_B09F:				; CODE XREF: code_B0AD+5p code_B0AD+Dp ...
		mov	R3, #8

code_B0A1:				; CODE XREF: code_B09F+Bj
		setb	P5.4		; Port 5 (PDIR=0)
		mov	C, P5.5		; Port 5 (PDIR=0)
		rlc	A
		mov	P5.3, C		; Port 5 (PDIR=0)
		clr	P5.4		; Port 5 (PDIR=0)
		djnz	R3, code_B0A1
		ret
; End of function code_B09F


; =============== S U B	R O U T	I N E =======================================


code_B0AD:				; CODE XREF: code_B0DCp
		anl	P9, #7Fh	; Port 9 (PDIR=0)
		mov	A, #0
		lcall	code_B09F
		mov	DPTR, #0F9CBh
		movx	@DPTR, A
		clr	A
		lcall	code_B09F
		mov	DPTR, #0F9CAh
		movx	@DPTR, A
		orl	P9, #80h	; Port 9 (PDIR=0)
		anl	P9, #7Fh	; Port 9 (PDIR=0)
		mov	A, #0Fh
		lcall	code_B09F
		mov	DPTR, #0F9CCh
		movx	@DPTR, A
		clr	A
		lcall	code_B09F
		mov	DPTR, #0F9CDh
		movx	@DPTR, A
		orl	P9, #80h	; Port 9 (PDIR=0)
		ret
; End of function code_B0AD


; =============== S U B	R O U T	I N E =======================================


code_B0DC:				; CODE XREF: RESET_0-92E8p
		lcall	code_B0AD
		mov	DPTR, #5FEEh	; Порог	напр. для запрета диагн. РХХ | В
		clr	A
		movc	A, @A+DPTR
		cjne	A, RAM_4B, code_B0E7

code_B0E7:
		jnc	code_B119
		jnb	RAM_2A.6, code_B119
		mov	A, P6		; Port 6 (PDIR=0)
		mov	C, ACC.7	; Accumulator
		anl	C, ACC.6	; Accumulator
		jc	code_B119
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	C, RAM_27.7
		setb	IEN0.7		; Interrupt Enable Register 0
		jnc	code_B125
		clr	RAM_27.7
		mov	DPTR, #5FB7h	; Период диагностики РХХ | циклов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9CEh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_B10E	; B-Register

code_B10E:
		jc	code_B125
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		orl	A, #10h
		movx	@DPTR, A
		sjmp	code_B125
; ---------------------------------------------------------------------------

code_B119:				; CODE XREF: code_B0DC:code_B0E7j
					; code_B0DC+Dj	...
		clr	A
		mov	DPTR, #0F9CEh
		movx	@DPTR, A
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		anl	A, #0EFh
		movx	@DPTR, A

code_B125:				; CODE XREF: code_B0DC+1Ej
					; code_B0DC:code_B10Ej	...
		ret
; End of function code_B0DC


; =============== S U B	R O U T	I N E =======================================


code_B126:				; CODE XREF: RESET_0-92E5p
		clr	A
		mov	DPTR, #0F9C4h
		movx	@DPTR, A
		mov	DPTR, #0F9C5h
		movx	@DPTR, A
		mov	DPTR, #0F9C6h
		movx	A, @DPTR
		anl	A, #0F0h
		movx	@DPTR, A
		mov	DPTR, #0F9CAh
		movx	A, @DPTR
		mov	R4, A
		xrl	A, #0FFh
		jnz	code_B142
		ljmp	code_B1E6
; ---------------------------------------------------------------------------

code_B142:				; CODE XREF: code_B126+17j
		mov	A, R4
		anl	A, #30h
		mov	R3, A
		xrl	A, #30h
		jz	code_B16B
		mov	A, R3
		jnz	code_B156
		mov	DPTR, #0F9C4h
		movx	A, @DPTR
		orl	A, #10h
		movx	@DPTR, A
		sjmp	code_B16B
; ---------------------------------------------------------------------------

code_B156:				; CODE XREF: code_B126+25j
		mov	A, R3
		xrl	A, #10h
		jnz	code_B164
		mov	DPTR, #0F9C4h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		sjmp	code_B16B
; ---------------------------------------------------------------------------

code_B164:				; CODE XREF: code_B126+33j
		mov	DPTR, #0F9C5h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A

code_B16B:				; CODE XREF: code_B126+22j
					; code_B126+2Ej ...
		mov	A, R4
		anl	A, #0Ch
		mov	R3, A
		xrl	A, #0Ch
		jz	code_B194
		mov	A, R3
		jnz	code_B17F
		mov	DPTR, #0F9C4h
		movx	A, @DPTR
		orl	A, #20h
		movx	@DPTR, A
		sjmp	code_B194
; ---------------------------------------------------------------------------

code_B17F:				; CODE XREF: code_B126+4Ej
		mov	A, R3
		xrl	A, #4
		jnz	code_B18D
		mov	DPTR, #0F9C4h
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A
		sjmp	code_B194
; ---------------------------------------------------------------------------

code_B18D:				; CODE XREF: code_B126+5Cj
		mov	DPTR, #0F9C5h
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A

code_B194:				; CODE XREF: code_B126+4Bj
					; code_B126+57j ...
		mov	A, R4
		anl	A, #3
		mov	R3, A
		xrl	A, #3
		jz	code_B1BD
		mov	A, R3
		jnz	code_B1A8
		mov	DPTR, #0F9C4h
		movx	A, @DPTR
		orl	A, #40h
		movx	@DPTR, A
		sjmp	code_B1BD
; ---------------------------------------------------------------------------

code_B1A8:				; CODE XREF: code_B126+77j
		mov	A, R3
		xrl	A, #1
		jnz	code_B1B6
		mov	DPTR, #0F9C4h
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A
		sjmp	code_B1BD
; ---------------------------------------------------------------------------

code_B1B6:				; CODE XREF: code_B126+85j
		mov	DPTR, #0F9C5h
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A

code_B1BD:				; CODE XREF: code_B126+74j
					; code_B126+80j ...
		mov	A, R4
		anl	A, #0C0h
		mov	R3, A
		xrl	A, #0C0h
		jz	code_B1E6
		mov	A, R3
		jnz	code_B1D1
		mov	DPTR, #0F9C4h
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A
		sjmp	code_B1E6
; ---------------------------------------------------------------------------

code_B1D1:				; CODE XREF: code_B126+A0j
		mov	A, R3
		xrl	A, #40h
		jnz	code_B1DF
		mov	DPTR, #0F9C4h
		movx	A, @DPTR
		orl	A, #8
		movx	@DPTR, A
		sjmp	code_B1E6
; ---------------------------------------------------------------------------

code_B1DF:				; CODE XREF: code_B126+AEj
		mov	DPTR, #0F9C5h
		movx	A, @DPTR
		orl	A, #8
		movx	@DPTR, A

code_B1E6:				; CODE XREF: code_B126+19j
					; code_B126+9Dj ...
		mov	DPTR, #0F9CDh
		movx	A, @DPTR
		mov	R4, A
		anl	A, #30h
		mov	R3, A
		xrl	A, #30h
		jz	code_B21A
		mov	DPTR, #0F9C5h
		movx	A, @DPTR
		orl	A, #10h
		movx	@DPTR, A
		mov	A, R3
		jnz	code_B205
		mov	DPTR, #0F9C5h
		movx	A, @DPTR
		orl	A, #40h
		movx	@DPTR, A
		sjmp	code_B21A
; ---------------------------------------------------------------------------

code_B205:				; CODE XREF: code_B126+D4j
		mov	A, R3
		xrl	A, #10h
		jnz	code_B213
		mov	DPTR, #0F9C5h
		movx	A, @DPTR
		orl	A, #20h
		movx	@DPTR, A
		sjmp	code_B21A
; ---------------------------------------------------------------------------

code_B213:				; CODE XREF: code_B126+E2j
		mov	DPTR, #0F9C5h
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A

code_B21A:				; CODE XREF: code_B126+CAj
					; code_B126+DDj ...
		mov	DPTR, #5F00h
		clr	A
		movc	A, @A+DPTR
		jnb	ACC.2, code_B21B
		mov		DPTR, #0F9CBh
		movx	A, @DPTR
		anl		A, #0Ch
		mov		R3, A
		xrl		A, #0Ch
		sjmp	code_B21C

code_B21B:
		mov	A, R4
		anl	A, #0C0h
		mov	R3, A
		xrl	A, #0C0h

code_B21C:
		jz	code_B27B
		mov	A, R3
		jnz	code_B240
		mov	DPTR, #5FB8h	; Период диагностики реле бензонасоса |	циклов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9CFh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_B235	; B-Register

code_B235:
		jc	code_B280
		mov	DPTR, #0F9C6h
		movx	A, @DPTR
		orl	A, #4
		movx	@DPTR, A
		sjmp	code_B280
; ---------------------------------------------------------------------------

code_B240:				; CODE XREF: code_B126+FDj
		mov	DPTR, #5F00h
		clr	A
		movc	A, @A+DPTR
		jnb	ACC.2, code_B242
		mov		A, R3
		xrl		A, #8

		
code_B241:
		mov	A, R3
		xrl	A, #20h

code_B242:
		jnz	code_B260
		mov	DPTR, #5FB8h	; Период диагностики реле бензонасоса |	циклов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9CFh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_B255	; B-Register

code_B255:
		jc	code_B280
		mov	DPTR, #0F9C6h
		movx	A, @DPTR
		orl	A, #8
		movx	@DPTR, A
		sjmp	code_B280
; ---------------------------------------------------------------------------

code_B260:				; CODE XREF: code_B126+11Dj
		mov	DPTR, #5FB8h	; Период диагностики реле бензонасоса |	циклов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9CFh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_B270	; B-Register

code_B270:
		jc	code_B280
		mov	DPTR, #0F9C6h
		movx	A, @DPTR
		orl	A, #2
		movx	@DPTR, A
		sjmp	code_B280
; ---------------------------------------------------------------------------

code_B27B:				; CODE XREF: code_B126+FAj
		clr	A
		mov	DPTR, #0F9CFh
		movx	@DPTR, A

code_B280:				; CODE XREF: code_B126:code_B235j
					; code_B126+118j ...
		mov	DPTR, #0F9CCh
		movx	A, @DPTR
		mov	R4, A
		anl	A, #0C0h
		mov	R3, A
		xrl	A, #0C0h
		jz	code_B2A7
		mov	DPTR, #5FB9h	; Период диагн.	реле вентилятора охлаждения | циклов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9D0h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_B29C	; B-Register

code_B29C:
		jc	code_B2AC
		mov	DPTR, #0F9C6h
		movx	A, @DPTR
		orl	A, #1
		movx	@DPTR, A
		sjmp	code_B2AC
; ---------------------------------------------------------------------------

code_B2A7:				; CODE XREF: code_B126+164j
		clr	A
		mov	DPTR, #0F9D0h
		movx	@DPTR, A

code_B2AC:				; CODE XREF: code_B126:code_B29Cj
					; code_B126+17Fj
		mov	DPTR, #0F9CBh
		movx	A, @DPTR
		anl	A, #3
		xrl	A, #3
		jz	code_B2CC
		mov	DPTR, #5F99h	; Период диагностики нагревателя ДК | циклов
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F9C0h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_B2C6	; B-Register

code_B2C6:
		jc	code_B2D3
		setb	RAM_22.3
		sjmp	code_B2D3
; ---------------------------------------------------------------------------

code_B2CC:				; CODE XREF: code_B126+18Ej
		clr	RAM_22.3
		clr	A
		mov	DPTR, #0F9C0h
		movx	@DPTR, A

code_B2D3:				; CODE XREF: code_B126:code_B2C6j
					; code_B126+1A4j
		ret
; End of function code_B126


; =============== S U B	R O U T	I N E =======================================


code_B2D4:				; CODE XREF: RESET_0-A88Dp
					; RESET_0:code_5955p ...
		lcall	code_B334
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		clr	ACC.3		; Accumulator
		movx	@DPTR, A
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		clr	ACC.6		; Accumulator
		movx	@DPTR, A
		clr		A
		mov	DPTR, #0F806h
		movx	@DPTR, A
		mov	DPTR, #0F9A8h
		movx	A, @DPTR
		clr	ACC.4		; Accumulator
		movx	@DPTR, A
		mov	RPM_XX,	#0
		mov	RPM_1, #0
		mov	RPM, #0
		mov	RPM_RT,	#0
		mov	RPM_RT_32, #0
		ret
; End of function code_B2D4


; =============== S U B	R O U T	I N E =======================================


code_B304:				; CODE XREF: code_AC0E+9Ep
					; code_D098+2Ap ...
		clr	RAM_29.6
		clr	RAM_29.5
		setb	RAM_2C.2
		mov	DPTR, #0F810h
		movx	A, @DPTR
		anl	A, #0FCh
		movx	@DPTR, A
		mov	DPTR, #0F9A8h
		movx	A, @DPTR
		clr	ACC.4		; Accumulator
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F95Bh
		movx	@DPTR, A
		mov	DPTR, #0F95Ch
		movx	@DPTR, A
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		setb	ACC.3		; Accumulator
		movx	@DPTR, A
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		setb	ACC.6		; Accumulator
		movx	@DPTR, A
		setb	RAM_26.1
		setb	IEN1.5		; Interrupt Enable Register 1
		ret
; End of function code_B304


; =============== S U B	R O U T	I N E =======================================


code_B334:				; CODE XREF: code_B2D4p
		clr	IEN1.5		; Interrupt Enable Register 1
		clr	RAM_26.1
		anl	CMEN, #0F0h	; Compare Enable Register (RMAP=0)
		anl	CMEN, #0Fh	; Compare Enable Register (RMAP=0)
		orl	P4, #0FFh	; Port 4 (PDIR=0)
		mov	RAM_7C,	#0
		ret
; End of function code_B334


; =============== S U B	R O U T	I N E =======================================


code_B345:				; CODE XREF: RESET_0:code_2A9Cp
					; RESET_0-A7F2p
		mov	R2, #40h ; '@'
		mov	DPTR, #0F4D2h

code_B34A:				; CODE XREF: code_B345+Cj
		movx	A, @DPTR
		jb	ACC.7, code_B350 ; Accumulator
		clr	A
		movx	@DPTR, A

code_B350:				; CODE XREF: code_B345+6j
		inc	DPTR
		djnz	R2, code_B34A
		ret
; End of function code_B345


; =============== S U B	R O U T	I N E =======================================


code_B354:				; CODE XREF: RESET_0-C49Dp
					; RESET_0-BD61p ...
		clr	A
		mov	DPTR, #0FA2Bh
		movx	@DPTR, A
		mov	DPTR, #0FA2Ch
		movx	@DPTR, A
		mov	DPTR, #0FA2Dh
		movx	@DPTR, A
		mov	DPTR, #0FA25h
		movx	@DPTR, A
		mov	B, #0Ch		; B-Register
		mov	DPTR, #0FA4Bh

code_B36B:				; CODE XREF: code_B354+19j
		movx	@DPTR, A
		inc	DPTR
		djnz	B, code_B36B	; B-Register
		mov	DPTR, #0FA57h
		movx	@DPTR, A
		mov	DPTR, #0FA61h
		movx	@DPTR, A
		mov	A, #80h	; 'А'
		mov	DPTR, #0FA2Eh
		movx	@DPTR, A
		mov	DPTR, #0FA26h
		movx	@DPTR, A
		mov	DPTR, #0FA58h
		movx	@DPTR, A
		mov	DPTR, #0FA62h
		movx	@DPTR, A
		mov	DPTR, #5FD0h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA63h
		movx	@DPTR, A
		mov	DPTR, #0FA65h
		movx	@DPTR, A
		mov	DPTR, #0FA67h
		movx	@DPTR, A
		mov	DPTR, #5FD1h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA64h
		movx	@DPTR, A
		mov	DPTR, #0FA66h
		movx	@DPTR, A
		mov	DPTR, #0FA68h
		movx	@DPTR, A
		ret
; End of function code_B354


; =============== S U B	R O U T	I N E =======================================


code_B3AD:				; CODE XREF: RESET_0-BD5Ep
					; RESET_0-9003p
		clr	A
		mov	DPTR, #0FA59h
		movx	@DPTR, A
		mov	DPTR, #0FA5Bh
		movx	@DPTR, A
		mov	DPTR, #0FA5Dh
		movx	@DPTR, A
		mov	DPTR, #0FA5Fh
		movx	@DPTR, A
		mov	A, #80h	; 'А'
		mov	DPTR, #0FA5Ah
		movx	@DPTR, A
		mov	DPTR, #0FA5Ch
		movx	@DPTR, A
		mov	DPTR, #0FA5Eh
		movx	@DPTR, A
		mov	DPTR, #0FA60h
		movx	@DPTR, A
		mov	DPTR, #5FC8h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA41h
		movx	@DPTR, A
		mov	DPTR, #0FA43h
		movx	@DPTR, A
		mov	DPTR, #5FC9h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA42h
		movx	@DPTR, A
		mov	DPTR, #0FA44h
		movx	@DPTR, A
		mov	DPTR, #5FCAh
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA45h
		movx	@DPTR, A
		mov	DPTR, #5FCBh
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA46h
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F942h
		movx	@DPTR, A
		ret
; End of function code_B3AD


; =============== S U B	R O U T	I N E =======================================


code_B402:				; CODE XREF: RESET_0:code_4EE5p
		jb	RAM_2C.3, code_B41F
		mov	RAM_3A,	#0
		mov	B, #4		; B-Register
		mov	DPTR, #0F86Bh
		clr	A

code_B40F:				; CODE XREF: code_B402+Fj
		movx	@DPTR, A
		inc	DPTR
		djnz	B, code_B40F	; B-Register
		mov	B, #4		; B-Register
		mov	R0, #0ACh ; 'м'

code_B419:				; CODE XREF: code_B402+1Aj
		mov	@R0, #0
		inc	R0
		djnz	B, code_B419	; B-Register

code_B41F:				; CODE XREF: code_B402j
		mov	C, RAM_23.7
		orl	C, RAM_24.7
		orl	C, RAM_25.0
		jnc	code_B444

code_B427:				; CODE XREF: code_B526+25j
		mov	DPTR, #60B4h	; Ограничение смещения УОЗ при ошибках уровня шума | град.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #71E8h	; Максимальное смещение	УОЗ при	детонации | УОЗ, гр.п.к.в. - Обороты коленвала,	об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		cjne	A, B, code_B437	; B-Register

code_B437:
		jc	code_B43B
		mov	A, B		; B-Register

code_B43B:				; CODE XREF: code_B402:code_B437j
		mov	R1, #4
		mov	R0, #0ACh ; 'м'

code_B43F:				; CODE XREF: code_B402+3Fj
		mov	@R0, A
		inc	R0
		djnz	R1, code_B43F
		ret
; ---------------------------------------------------------------------------

code_B444:				; CODE XREF: code_B402+23j
		mov	R1, #0
		clr	RAM_2C.5
		mov	DPTR, #0F932h
		movx	A, @DPTR
		mov	RAM_3B,	A

code_B44E:				; CODE XREF: code_B402:code_B523j
		mov	DPTR, #0F900h
		mov	A, #0Ch
		mov	B, R1		; B-Register
		mul	AB
		add	A, RAM_3B
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R4, A
		mov	A, #0ACh ; 'м'
		add	A, R1
		mov	R0, A
		mov	A, @R0
		mov	R3, A
		mov	DPTR, #5EE0h
		mov	A, R1
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	R2, A
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	A, RAM_71
		anl	B, A		; B-Register
		xrl	A, B		; B-Register
		mov	RAM_71,	A
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, B		; B-Register
		jnz	code_B4A6
		mov	DPTR, #0F954h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F86Bh
		mov	A, DPL		; Data Pointer,	Low Byte
		add	A, R1
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_B496
		add	A, B		; B-Register
		inc	A
		movx	@DPTR, A
		sjmp	code_B4D6
; ---------------------------------------------------------------------------

code_B496:				; CODE XREF: code_B402+8Cj
		clr	A
		movx	@DPTR, A
		mov	A, R3
		jz	code_B49C
		dec	R3

code_B49C:				; CODE XREF: code_B402+97j
		mov	A, R4
		jz	code_B4A0
		dec	R4

code_B4A0:				; CODE XREF: code_B402+9Bj
		mov	A, R2
		cpl	A
		anl	RAM_3A,	A
		sjmp	code_B4D6
; ---------------------------------------------------------------------------

code_B4A6:				; CODE XREF: code_B402+78j
		setb	RAM_2C.5
		mov	A, RAM_3A
		anl	A, R2
		jz	code_B4C9
		mov	DPTR, #0F953h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F86Bh
		mov	A, DPL		; Data Pointer,	Low Byte
		add	A, R1
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_B4C9
		inc	R3
		inc	R3
		inc	R3
		inc	R3
		inc	R4
		inc	R4
		inc	R4
		inc	R4

code_B4C9:				; CODE XREF: code_B402+A9j
					; code_B402+BDj
		mov	DPTR, #0F86Bh
		mov	A, DPL		; Data Pointer,	Low Byte
		add	A, R1
		mov	DPL, A		; Data Pointer,	Low Byte
		clr	A
		movx	@DPTR, A
		mov	A, R2
		orl	RAM_3A,	A

code_B4D6:				; CODE XREF: code_B402+92j
					; code_B402+A2j
		mov	A, R4
		cjne	A, RAM_3, code_B4DA

code_B4DA:
		jc	code_B4DF
		mov	R3, A
		sjmp	code_B4F0
; ---------------------------------------------------------------------------

code_B4DF:				; CODE XREF: code_B402:code_B4DAj
		mov	DPTR, #0F955h
		mov	A, DPL		; Data Pointer,	Low Byte
		add	A, R1
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		dec	A
		movx	@DPTR, A
		jnz	code_B4F0
		dec	R3
		mov	A, #5
		movx	@DPTR, A

code_B4F0:				; CODE XREF: code_B402+DBj
					; code_B402+E8j
		mov	DPTR, #71E8h	; Максимальное смещение	УОЗ при	детонации | УОЗ, гр.п.к.в. - Обороты коленвала,	об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R4
		cjne	A, B, code_B4FC	; B-Register

code_B4FC:
		jc	code_B500
		mov	R4, B		; B-Register

code_B500:				; CODE XREF: code_B402:code_B4FCj
		mov	A, R3
		cjne	A, B, code_B504	; B-Register

code_B504:
		jc	code_B508
		mov	R3, B		; B-Register

code_B508:				; CODE XREF: code_B402:code_B504j
		mov	DPTR, #0F900h
		mov	A, #0Ch
		mov	B, R1		; B-Register
		mul	AB
		add	A, RAM_3B
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		mov	A, R4
		movx	@DPTR, A
		mov	A, #0ACh ; 'м'
		add	A, R1
		mov	R0, A
		mov	A, R3
		mov	@R0, A
		inc	R1
		cjne	R1, #4,	code_B523
		ret
; ---------------------------------------------------------------------------

code_B523:				; CODE XREF: code_B402+11Dj
		ljmp	code_B44E
; End of function code_B402


; =============== S U B	R O U T	I N E =======================================


code_B526:				; CODE XREF: RESET_0-9B02p
		jb	RAM_2C.3, code_B543
		mov	RAM_3A,	#0
		mov	B, #4		; B-Register
		mov	DPTR, #0F86Bh
		clr	A

code_B533:				; CODE XREF: code_B526+Fj
		movx	@DPTR, A
		inc	DPTR
		djnz	B, code_B533	; B-Register
		mov	B, #4		; B-Register
		mov	R0, #0ACh ; 'м'

code_B53D:				; CODE XREF: code_B526+1Aj
		mov	@R0, #0
		inc	R0
		djnz	B, code_B53D	; B-Register

code_B543:				; CODE XREF: code_B526j
		mov	C, RAM_23.7
		orl	C, RAM_24.7
		orl	C, RAM_25.0
		jnc	code_B54E
		ljmp	code_B427
; ---------------------------------------------------------------------------

code_B54E:				; CODE XREF: code_B526+23j
		mov	R1, #0
		clr	RAM_2C.5

code_B552:				; CODE XREF: code_B526:code_B5DDj
		mov	A, #0ACh ; 'м'
		add	A, R1
		mov	R0, A
		mov	A, @R0
		mov	R3, A
		mov	DPTR, #5EE0h
		mov	A, R1
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	R2, A
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	A, RAM_71
		anl	B, A		; B-Register
		xrl	A, B		; B-Register
		mov	RAM_71,	A
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	A, B		; B-Register
		jnz	code_B596
		mov	DPTR, #0F954h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F86Bh
		mov	A, DPL		; Data Pointer,	Low Byte
		add	A, R1
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_B58A
		add	A, B		; B-Register
		inc	A
		movx	@DPTR, A
		sjmp	code_B5C2
; ---------------------------------------------------------------------------

code_B58A:				; CODE XREF: code_B526+5Cj
		clr	A
		movx	@DPTR, A
		mov	A, R3
		jz	code_B590
		dec	R3

code_B590:				; CODE XREF: code_B526+67j
		mov	A, R2
		cpl	A
		anl	RAM_3A,	A
		sjmp	code_B5C2
; ---------------------------------------------------------------------------

code_B596:				; CODE XREF: code_B526+48j
		setb	RAM_2C.5
		mov	A, RAM_3A
		anl	A, R2
		jz	code_B5B5
		mov	DPTR, #0F953h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F86Bh
		mov	A, DPL		; Data Pointer,	Low Byte
		add	A, R1
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_B5B5
		inc	R3
		inc	R3
		inc	R3
		inc	R3

code_B5B5:				; CODE XREF: code_B526+75j
					; code_B526+89j
		mov	DPTR, #0F86Bh
		mov	A, DPL		; Data Pointer,	Low Byte
		add	A, R1
		mov	DPL, A		; Data Pointer,	Low Byte
		clr	A
		movx	@DPTR, A
		mov	A, R2
		orl	RAM_3A,	A

code_B5C2:				; CODE XREF: code_B526+62j
					; code_B526+6Ej
		mov	DPTR, #71E8h	; Максимальное смещение	УОЗ при	детонации | УОЗ, гр.п.к.в. - Обороты коленвала,	об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R3
		cjne	A, B, code_B5CE	; B-Register

code_B5CE:
		jc	code_B5D2
		mov	R3, B		; B-Register

code_B5D2:				; CODE XREF: code_B526:code_B5CEj
		mov	A, #0ACh ; 'м'
		add	A, R1
		mov	R0, A
		mov	A, R3
		mov	@R0, A
		inc	R1
		cjne	R1, #4,	code_B5DD
		ret
; ---------------------------------------------------------------------------

code_B5DD:				; CODE XREF: code_B526+B3j
		ljmp	code_B552
; End of function code_B526


; =============== S U B	R O U T	I N E =======================================


code_B5E0:				; CODE XREF: IE0_0+12Cp
		mov	DPTR, #0F934h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		jb	RAM_24.7, code_B5FA
		mov	DPTR, #5F78h	; Порог	детектора ошибки высокого уровня шума двигателя	|
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5F79h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		sjmp	code_B606
; ---------------------------------------------------------------------------

code_B5FA:				; CODE XREF: code_B5E0+9j
		mov	DPTR, #5F78h	; Порог	детектора ошибки высокого уровня шума двигателя	|
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5F79h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A

code_B606:				; CODE XREF: code_B5E0+18j
		clr	C
		lcall	SUB_R0R1_R2R3
		cpl	C
		mov	RAM_24.7, C
		jnc	code_B610
		ret
; ---------------------------------------------------------------------------

code_B610:				; CODE XREF: code_B5E0+2Dj
		mov	DPTR, #0F934h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		jb	RAM_23.7, code_B62A
		mov	DPTR, #5F64h	; Порог	детектора ошибки низкого уровня	шума двигателя |
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5F65h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		sjmp	code_B638
; ---------------------------------------------------------------------------

code_B62A:				; CODE XREF: code_B5E0+39j
		mov	DPTR, #5F66h	; Порог	сброса ошибки низкого уровня шума |
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5F67h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		sjmp	code_B638

code_B638:				; CODE XREF: code_B5E0+48j
		clr	C
		lcall	SUB_R0R1_R2R3
		mov	RAM_23.7, C
		ret
; End of function code_B5E0


; =============== S U B	R O U T	I N E =======================================


code_B63F:				; CODE XREF: RESET_0:code_4EE8p
		mov	DPTR, #0F967h
		movx	A, @DPTR
		jnz	code_B69B
		mov	DPTR, #0F969h
		movx	A, @DPTR
		jnz	code_B69B
		mov	DPTR, #0F96Bh
		movx	A, @DPTR
		jnz	code_B69B
		mov	DPTR, #0F96Dh
		movx	A, @DPTR
		jnz	code_B69B
		mov	DPTR, #0F966h
		movx	A, @DPTR
		mov	B, A		; B-Register
		inc	DPTR
		inc	DPTR
		movx	A, @DPTR
		add	A, B		; B-Register
		rrc	A
		mov	B, A		; B-Register
		inc	DPTR
		inc	DPTR
		movx	A, @DPTR
		rrc	A
		anl	A, #7Fh
		addc	A, B		; B-Register
		rrc	A
		mov	B, A		; B-Register
		inc	DPTR
		inc	DPTR
		movx	A, @DPTR
		rrc	A
		rrc	A
		anl	A, #3Fh
		addc	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #0F980h
		movx	@DPTR, A
		mov	DPTR, #77EFh	; Минимальный общий уровень шума для диагн. | Уровень -	Обороты	коленвала, об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		cjne	A, B, code_B688	; B-Register

code_B688:
		jc	code_B69B
		mov	DPTR, #0F985h
		movx	A, @DPTR
		inc	A
		jz	code_B697
		mov	DPTR, #0F985h
		movx	@DPTR, A
		sjmp	code_B6AA
; ---------------------------------------------------------------------------

code_B697:				; CODE XREF: code_B63F+50j
		setb	RAM_25.0
		sjmp	code_B6AA
; ---------------------------------------------------------------------------

code_B69B:				; CODE XREF: code_B63F+4j code_B63F+Aj ...
		mov	DPTR, #0F985h
		movx	A, @DPTR
		jz	code_B6A8
		dec	A
		mov	DPTR, #0F985h
		movx	@DPTR, A
		sjmp	code_B6AA
; ---------------------------------------------------------------------------

code_B6A8:				; CODE XREF: code_B63F+60j
		clr	RAM_25.0

code_B6AA:				; CODE XREF: code_B63F+56j
					; code_B63F+5Aj ...
		ret
; End of function code_B63F


; =============== S U B	R O U T	I N E =======================================


code_B6AB:				; CODE XREF: RESET_0-AE7Fp
		add	A, R1
		xch	A, R2
		addc	A, #0
		clr	C
		xch	A, R2
		subb	A, R3
		mov	R1, A
		mov	A, R2
		subb	A, #0
		mov	R2, A
		mov	A, R1
		add	A, #8
		mov	R3, A
		mov	A, R2
		addc	A, #0
		anl	A, #0Fh
		swap	A
		xch	A, R3
		anl	A, #0F0h
		swap	A
		add	A, R3
		ret
; End of function code_B6AB


; =============== S U B	R O U T	I N E =======================================


code_B6C7:				; CODE XREF: RESET_0-A915p
		mov	DPTR, #0F808h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #5F84h	; Коэффициент квантования МРВ на 32 |
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	A, R1
		jnz	code_B6E3
		mov	A, R0
		cjne	A, #0F0h, code_B6E1 ; 'Ё'

code_B6E1:
		jc	code_B6E5

code_B6E3:				; CODE XREF: code_B6C7+14j
		mov	A, #0F0h ; 'Ё'

code_B6E5:				; CODE XREF: code_B6C7:code_B6E1j
		mov	DPTR, #0F879h
		movx	@DPTR, A
		add	A, #4
		swap	A
		rl	A
		anl	A, #1Fh
		mov	DPTR, #0F87Ah
		movx	@DPTR, A
		mov	B, A		; B-Register
		jnb	RAM_2B.3, code_B6FF
		mov	DPTR, #5F85h	; Ожидаемая температура	ОГ в режиме отсечки топлива | град.С
		clr	A
		movc	A, @A+DPTR
		sjmp	code_B703
; ---------------------------------------------------------------------------

code_B6FF:				; CODE XREF: code_B6C7+2Ej
		mov	DPTR, #862Fh	; Ожидаемая температура	ОГ в рабочих режимах | Температура ОГ, град.С -	Массовый расход	воздуха, кг/час
		movc	A, @A+DPTR

code_B703:				; CODE XREF: code_B6C7+36j
		mov	R1, A
		mov	A, B		; B-Register
		mov	DPTR, #864Fh	; Постоянная времени выпускной трубы | Постоянная времени - Массовый расход воздуха, кг/час
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	R0, #0
		mov	DPTR, #0F892h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F894h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		lcall	MUL_ABSR0R1_B
		mov	DPTR, #0F894h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0F894h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		ret
; End of function code_B6C7


; =============== S U B	R O U T	I N E =======================================


code_B73C:				; CODE XREF: RESET_0-99F4p
		mov	DPTR, #0F952h
		movx	A, @DPTR
		jz	code_B749
		mov	DPTR, #0FA94h
		movx	A, @DPTR
		jb	ACC.0, code_B74F ; Accumulator

code_B749:				; CODE XREF: code_B73C+4j
		clr	A
		mov	DPTR, #0F9A0h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_B74F:				; CODE XREF: code_B73C+Aj
		jb	ACC.1, code_B7C3 ; Accumulator
		mov	A, DEV_FLAGS
		anl	A, #4
		jz	code_B759
		ret
; ---------------------------------------------------------------------------

code_B759:				; CODE XREF: code_B73C+1Aj
		mov	DPTR, #0F94Ch
		movx	A, @DPTR
		mov	R0, A
		jnb	ACC.7, code_B7B1 ; Accumulator
		mov	DPTR, #0FF46h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #5FFEh	; Число	циклов Д.К. УОЗ	на торможении. |
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_B76F	; B-Register

code_B76F:
		jnc	code_B774
		ljmp	code_B7C3
; ---------------------------------------------------------------------------

code_B774:				; CODE XREF: code_B73C:code_B76Fj
		mov	DPTR, #5FF3h	; Стационарность по оборотам | об/мин.c.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R0
		cpl	A
		inc	A
		mov	R0, A
		clr	C
		subb	A, B		; B-Register
		jnc	code_B786
		mov	R0, #0

code_B786:				; CODE XREF: code_B73C+46j
		mov	A, R0
		mov	B, #8		; B-Register
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		mov	DPTR, #60C4h	; Коэффициент динамической коррекции торможения. | гр.1000rpm.с.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	A, R1
		jnz	code_B79E
		mov	A, R0
		sjmp	code_B7A0
; ---------------------------------------------------------------------------

code_B79E:				; CODE XREF: code_B73C+5Dj
		mov	A, #0FFh

code_B7A0:				; CODE XREF: code_B73C+60j
		mov	B, A		; B-Register
		mov	DPTR, #60ACh	; Максимальное опережение по Д.К.УОЗ на	торможении. | гр.п.к.в
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_B7AA	; B-Register

code_B7AA:
		jc	code_B7AE
		mov	A, B		; B-Register

code_B7AE:				; CODE XREF: code_B73C:code_B7AAj
		ljmp	code_B812
; ---------------------------------------------------------------------------

code_B7B1:				; CODE XREF: code_B73C+22j
		mov	DPTR, #0FF46h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		mov	B, A		; B-Register
		mov	DPTR, #5FFDh	; Число	циклов Д.К. УОЗ	на разгоне. |
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_B7C1	; B-Register

code_B7C1:
		jnc	code_B7D5

code_B7C3:				; CODE XREF: code_B73C:code_B74Fj
					; code_B73C+35j
		clr	A
		mov	DPTR, #0F9A0h
		movx	@DPTR, A
		mov	DPTR, #0FA94h
		movx	A, @DPTR
		clr	ACC.0		; Accumulator
		clr	ACC.1		; Accumulator
		mov	DPTR, #0FA94h
		movx	@DPTR, A
		ret
; ---------------------------------------------------------------------------

code_B7D5:				; CODE XREF: code_B73C:code_B7C1j
		mov	DPTR, #5FF3h	; Стационарность по оборотам | об/мин.c.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R0
		clr	C
		subb	A, B		; B-Register
		jnc	code_B7E4
		mov	R0, #0

code_B7E4:				; CODE XREF: code_B73C+A4j
		mov	A, R0
		mov	B, #8		; B-Register
		mul	AB
		mov	R0, A
		mov	R1, B		; B-Register
		mov	DPTR, #5FF5h	; Коэффициент динамической коррекции разгона. |	гр.1000rpm.с.
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		lcall	MUL_R0R1_B
		mov	A, R1
		jnz	code_B7FC
		mov	A, R0
		sjmp	code_B7FE
; ---------------------------------------------------------------------------

code_B7FC:				; CODE XREF: code_B73C+BBj
		mov	A, #0FFh

code_B7FE:				; CODE XREF: code_B73C+BEj
		mov	B, A		; B-Register
		mov	DPTR, #5FF4h	; Максимальное запаздывание по Д.К.УОЗ на разгоне. | гр.п.к.в
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_B808	; B-Register

code_B808:
		jc	code_B80C
		sjmp	code_B80E
; ---------------------------------------------------------------------------

code_B80C:				; CODE XREF: code_B73C:code_B808j
		mov	B, A		; B-Register

code_B80E:				; CODE XREF: code_B73C+CEj
		mov	A, B		; B-Register
		cpl	A
		inc	A

code_B812:				; CODE XREF: code_B73C:code_B7AEj
		mov	DPTR, #0F9A0h
		movx	@DPTR, A
		ret
; End of function code_B73C


; =============== S U B	R O U T	I N E =======================================


code_B817:				; CODE XREF: RESET_0-93C8p
					; code_B817+24j
		mov	DPTR, #0F94Ah
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	DPTR, #0F8AEh
		movx	A, @DPTR
		clr	RAM_28.4
		mov	MD0, #0		; Multiplication/Division Register 0
		mov	MD1, A		; Multiplication/Division Register 1
		mov	MD4, R2		; Multiplication/Division Register 4
		mov	MD5, R3		; Multiplication/Division Register 5
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	A, MD4		; Multiplication/Division Register 4
		mov	A, MD5		; Multiplication/Division Register 5
		jb	RAM_28.4, code_B817
		lcall	DIV_R0R1_2
		mov	A, R1
		jz	code_B847
		clr	A
		sjmp	code_B859
; ---------------------------------------------------------------------------

code_B847:				; CODE XREF: code_B817+2Bj
		mov	A, R0
		cjne	A, #1Fh, code_B84B

code_B84B:
		jc	code_B84F
		mov	A, #1Fh

code_B84F:				; CODE XREF: code_B817:code_B84Bj
		mov	DPTR, #0FA98h
		movx	@DPTR, A
		anl	A, #1Fh
		mov	DPTR, #9E3Ch	; Индекс по скорости/оборотам |	Индекс - Отношение SPEED/RPM (/1000)
		movc	A, @A+DPTR

code_B859:				; CODE XREF: code_B817+2Ej
		mov	DPTR, #0F952h
		movx	@DPTR, A
		ret
; End of function code_B817


; =============== S U B	R O U T	I N E =======================================


CALC_UGB_RXX:				; CODE XREF: RESET_0:code_4B1Ep
					; RESET_0:code_4C15p ...
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		mov	R3, A
		mov	R2, RPM_RT
		
		; Желаемый расход воздуха | Воздух, кг/час - Обороты коленвала,	об/мин - Положение дросселя,%
		GET_3D_RAM_WITH_INTERPOLATION 9E5Ch, CAPTURE_UGBXX_MODE
		
		mov	B, A		; B-Register
		mov	DPTR, #75A2h	; Поправка к расходу по	ТОЖ. | Воздух, кг/час -	Температура, град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		add	A, B		; B-Register
		mov	B, A		; B-Register
		mov	DPTR, #6085h	; Макс расход воздуха (ограничение уставки) | кг/час
		clr	A
		movc	A, @A+DPTR
		cjne	A, B, code_B881	; B-Register

code_B881:
		jnc	code_B885
		mov	B, A		; B-Register

code_B885:				; CODE XREF: CALC_UGB_RXX:code_B881j
		mov	R2, B		; B-Register
		mov	DPTR, #0F952h
		movx	A, @DPTR
		mov	DPTR, #8A0Ch	; Задержка коррекции MAX_UGB по	скорости/оборотам | Время, сек - Индекс	SPEED/RPM
		movc	A, @A+DPTR
		mov	R4, A
		cpl	A
		inc	A
		mov	B, A		; B-Register
		mov	DPTR, #0FF43h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	MUL_R0R1_B
		mov	B, R4		; B-Register
		mov	A, R2
		mul	AB
		mov	R2, A
		mov	R3, B		; B-Register
		lcall	ADD_R0R1_R2R3
		mov	DPTR, #0FF43h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		mov	UGB, R1
		ret
; End of function CALC_UGB_RXX


; =============== S U B	R O U T	I N E =======================================


code_B8B6:				; CODE XREF: RESET_0:code_4C33p
		mov	DPTR, #8E0Ah	; Коррекция MIN_UGB по оборотам	| Воздух, кг/час - Обороты, об/мин
		mov	R2, RPM_RT
		lcall	GET_2D_VALUE
		mov	B, A		; B-Register
		mov	DPTR, #6FE4h	; Минимальный расход воздуха через РХХ | MIN_UGB, кг/час - Температура,	град.С
		mov	A, TWAT_RT
		movc	A, @A+DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_B8CC
		clr	A

code_B8CC:				; CODE XREF: code_B8B6+13j
		mov	R0, A
		mov	DPTR, #6085h	; Макс расход воздуха (ограничение уставки) | кг/час
		clr	A
		movc	A, @A+DPTR
		mov	R1, A
		mov	DPTR, #0F952h
		movx	A, @DPTR
		mov	DPTR, #75D9h	; Задержка коррекции MIN_UGB по	скорости/оборотам | Время, сек - Индекс	SPEED/RPM
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F976h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, B, code_B8E6	; B-Register

code_B8E6:
		jc	code_B8F9
		clr	A
		mov	DPTR, #0F976h
		movx	@DPTR, A
		mov	DPTR, #0FF44h
		movx	A, @DPTR
		dec	A
		lcall	code_AD03
		mov	DPTR, #0FF44h
		movx	@DPTR, A

code_B8F9:				; CODE XREF: code_B8B6:code_B8E6j
		mov	DPTR, #0FF44h
		movx	A, @DPTR
		mov	UGB, A
		ret
; End of function code_B8B6


; =============== S U B	R O U T	I N E =======================================


CALC_UGB_BY_CRRXX:				; CODE XREF: RESET_0-9E63p
		mov	A, CRRXX
		mov	R2, A
		swap	A
		rl	A
		anl	A, #1Fh
		mov	DPTR, #0FF4Ch
		movx	@DPTR, A

		GET_2D_RAM_VALUE_BY_R2 0A2F8h, CAPTURE_INVERS_DUTY_RXX_MODE ; Обратная характеристика РХХ |	Расход воздуха через РХХ - Положение РХХ, шагов
		
		mov	DPTR, #0FF44h
		movx	@DPTR, A
		ret
; End of function CALC_UGB_BY_CRRXX


; =============== S U B	R O U T	I N E =======================================


code_B916:				; CODE XREF: IE0_0+48Ep
		mov	DPTR, #0FA10h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0FA12h
		movx	A, @DPTR
		add	A, R0
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		addc	A, R1
		mov	R1, A
		clr	A
		addc	A, #0
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		add	A, R0
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		addc	A, R1
		mov	R1, A
		mov	A, R2
		addc	A, R2
		mov	R2, A
		inc	DPTR
		movx	A, @DPTR
		add	A, R0
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		addc	A, R1
		mov	R1, A
		mov	A, R2
		addc	A, R2
		mov	R2, A
		mov	MD0, R0		; Multiplication/Division Register 0
		mov	MD1, R1		; Multiplication/Division Register 1
		mov	MD2, R2		; Multiplication/Division Register 2
		mov	MD3, #0		; Multiplication/Division Register 3
		mov	ARCON, #22h ; '"' ; Arithmetic Control Register
		nop
		nop
		nop
		nop
		nop
		nop
		mov	R0, MD0		; Multiplication/Division Register 0
		mov	R1, MD1		; Multiplication/Division Register 1
		mov	R2, MD2		; Multiplication/Division Register 2
		mov	R3, MD3		; Multiplication/Division Register 3
		mov	DPTR, #0FA9Ch
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		ret
; End of function code_B916


; =============== S U B	R O U T	I N E =======================================


code_B967:				; CODE XREF: RESET_0:code_3B25p
		clr	A
		mov	DPTR, #0F813h
		mov	R1, #10h

code_B96D:				; CODE XREF: code_B967+9j
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		djnz	R1, code_B96D
		ret
; End of function code_B967


; =============== S U B	R O U T	I N E =======================================


CLEAR_ADD_FUEL:				; CODE XREF: RESET_0:code_4B76p
					; RESET_0:code_4B8Dp ...
		clr	RAM_2B.5
		clr	A
		mov	DPTR, #0F97Bh
		movx	@DPTR, A
		mov	DPTR, #0F97Ah
		movx	@DPTR, A
		mov	DPTR, #0FA94h
		movx	@DPTR, A
		mov	DPTR, #0FA96h
		movx	@DPTR, A
		ret
; End of function CLEAR_ADD_FUEL


; =============== S U B	R O U T	I N E =======================================


ICMP0_ICMP7_0:				; CODE XREF: ICMP0_ICMP7j
		push	ACC		; Accumulator
		push	PSW		; Program Status Word
		push	B		; B-Register
		mov	A, IRCON1	; Interrupt Request Control Register 1
		nop
		nop
		nop
		jnb	ACC.4, code_B9B4 ; Accumulator
		anl	IRCON1,	#0EFh	; Interrupt Request Control Register 1
		jb	P4.4, code_B9B4	; Port 4 (PDIR=0)
		mov	A, CML4		; Compare Register 4, Low Byte (RMAP=0)
		add	A, RAM_44
		mov	B, A		; B-Register
		mov	A, CMH4		; Compare Register 4, High Byte	(RMAP=0)
		addc	A, RAM_45
		anl	CMEN, #0EFh	; Compare Enable Register (RMAP=0)
		mov	CMH4, A		; Compare Register 4, High Byte	(RMAP=0)
		mov	CML4, B		; Compare Register 4, Low Byte (RMAP=0)
		orl	CMEN, #10h	; Compare Enable Register (RMAP=0)
		setb	P4.4		; Port 4 (PDIR=0)
		sjmp	code_BA18
; ---------------------------------------------------------------------------

code_B9B4:				; CODE XREF: ICMP0_ICMP7_0+Bj
					; ICMP0_ICMP7_0+11j
		jnb	ACC.5, code_B9D6 ; Accumulator
		anl	IRCON1,	#0DFh	; Interrupt Request Control Register 1
		jb	P4.5, code_B9D6	; Port 4 (PDIR=0)
		mov	A, CML5		; Compare Register 5, Low Byte (RMAP=0)
		add	A, RAM_44
		mov	B, A		; B-Register
		mov	A, CMH5		; Compare Register 5, High Byte	(RMAP=0)
		addc	A, RAM_45
		anl	CMEN, #0DFh	; Compare Enable Register (RMAP=0)
		mov	CMH5, A		; Compare Register 5, High Byte	(RMAP=0)
		mov	CML5, B		; Compare Register 5, Low Byte (RMAP=0)
		orl	CMEN, #20h	; Compare Enable Register (RMAP=0)
		setb	P4.5		; Port 4 (PDIR=0)
		sjmp	code_BA18
; ---------------------------------------------------------------------------

code_B9D6:				; CODE XREF: ICMP0_ICMP7_0:code_B9B4j
					; ICMP0_ICMP7_0+33j
		jnb	ACC.6, code_B9F8 ; Accumulator
		anl	IRCON1,	#0BFh	; Interrupt Request Control Register 1
		jb	P4.6, code_B9F8	; Port 4 (PDIR=0)
		mov	A, CML6		; Compare Register 6, Low Byte (RMAP=0)
		add	A, RAM_44
		mov	B, A		; B-Register
		mov	A, CMH6		; Compare Register 6, High Byte	(RMAP=0)
		addc	A, RAM_45
		anl	CMEN, #0BFh	; Compare Enable Register (RMAP=0)
		mov	CMH6, A		; Compare Register 6, High Byte	(RMAP=0)
		mov	CML6, B		; B-Register
		orl	CMEN, #40h	; Compare Enable Register (RMAP=0)
		setb	P4.6		; Port 4 (PDIR=0)
		sjmp	code_BA18
; ---------------------------------------------------------------------------

code_B9F8:				; CODE XREF: ICMP0_ICMP7_0:code_B9D6j
					; ICMP0_ICMP7_0+55j
		jnb	ACC.7, code_BA18 ; Accumulator
		anl	IRCON1,	#7Fh	; Interrupt Request Control Register 1
		jb	P4.7, code_BA18	; Port 4 (PDIR=0)
		mov	A, CML7		; Compare Register 7, Low Byte (RMAP=0)
		add	A, RAM_44
		mov	B, A		; B-Register
		mov	A, CMH7		; Compare Register 7, High Byte	(RMAP=0)
		addc	A, RAM_45
		anl	CMEN, #7Fh	; Compare Enable Register (RMAP=0)
		mov	CMH7, A		; Compare Register 7, High Byte	(RMAP=0)
		mov	CML7, B		; B-Register
		orl	CMEN, #80h	; Compare Enable Register (RMAP=0)
		setb	P4.7		; Port 4 (PDIR=0)

code_BA18:				; CODE XREF: ICMP0_ICMP7_0+2Bj
					; ICMP0_ICMP7_0+4Dj ...
		anl	IRCON1,	#0F0h	; Interrupt Request Control Register 1
		pop	B		; B-Register
		pop	PSW		; Program Status Word
		pop	ACC		; Accumulator
		reti
; End of function ICMP0_ICMP7_0


; =============== S U B	R O U T	I N E =======================================


IE1_0:					; CODE XREF: IE1j
		jb	P4.4, code_BA2D	; Port 4 (PDIR=0)
		anl	CMEN, #0EFh	; Compare Enable Register (RMAP=0)
		setb	P4.4		; Port 4 (PDIR=0)
		orl	CMEN, #10h	; Compare Enable Register (RMAP=0)

code_BA2D:				; CODE XREF: IE1_0j
		jb	P4.5, code_BA38	; Port 4 (PDIR=0)
		anl	CMEN, #0DFh	; Compare Enable Register (RMAP=0)
		setb	P4.5		; Port 4 (PDIR=0)
		orl	CMEN, #20h	; Compare Enable Register (RMAP=0)

code_BA38:				; CODE XREF: IE1_0:code_BA2Dj
		jb	P4.6, code_BA43	; Port 4 (PDIR=0)
		anl	CMEN, #0BFh	; Compare Enable Register (RMAP=0)
		setb	P4.6		; Port 4 (PDIR=0)
		orl	CMEN, #40h	; Compare Enable Register (RMAP=0)

code_BA43:				; CODE XREF: IE1_0:code_BA38j
		jb	P4.7, code_BA4E	; Port 4 (PDIR=0)
		anl	CMEN, #7Fh	; Compare Enable Register (RMAP=0)
		setb	P4.7		; Port 4 (PDIR=0)
		orl	CMEN, #80h	; Compare Enable Register (RMAP=0)

code_BA4E:				; CODE XREF: IE1_0:code_BA43j
		reti
; End of function IE1_0

; ---------------------------------------------------------------------------
; OLT_DIAG_REQUEST
		INIT_DB_ZERO	%0BAD0h - $
		; 2-х байтные переменные XRAM
		dw 0F99Ch, 0F869h, 0F876h, 0F981h, 0F9D5h, 0
		INIT_DB_ZERO	%0BAE0h - $
		; 1 байтные из RAM
		db TWAT_RT, RPM_RT, RPM_THR_3D_RT, RAM_2A, DELTA_RPM_XX, RAM_6B
		db UGB, LAUNCH_UOZ_OFFSET, GBC_RT, KNOCK_LO, KNOCK_HI, 0
		INIT_DB_ZERO	%0BAEDh - $
		; 1 байтные их XRAM
		dw 0F89Ah, 0F99Ah, 0F979h, 0FAA7h, 0F9B7h, 0F97Fh, 0F93Dh, 0FAA1h, 0F8B9h, 0F802h, 0FF40h, 0F84Ah 
		dw 0F847h, 0F848h, 0FAB3h, 0FAB0h, 0FF5Fh, 0FF60h, 0FF3Eh, 0F9A7h, 0F9A8h, 0F9D7h, 0F806h, 0	
		INIT_DB_ZERO	%0BB1Eh - $
		db 2Bh,	2Ch, 93h, 5Bh, 23h, 24h, 25h, 5Fh, 49h,	61h, 4Ch, 52h, 55h, 53h, 38h, 39h
		db 64h,	65h, 6Fh, 4Dh, 62h, 0ACh, 0ADh,	0AEh, 0AFh, 74h, 0
		dw 0F80Ch, 0F80Dh, 0F84Dh, 0F8A9h, 0F80Bh, 0F80Eh, 0F811h, 0F810h, 0F88Fh, 0F8AEh, 0F849h, 0F93Bh, 0F5FFh, 0
		dw 0F97Bh, 0F98Dh, 0F841h, 0F808h, 0F82Eh, 0F862h, 0
		db 2Ch,	49h, 61h, 52h, 38h, 39h, 62h, 0
		dw 0F8AEh, 0F885h, 0F5FFh, 0
		dw 0F841h, 0F808h, 0F82Eh, 0
		db 20h,	21h, 2Bh, 2Ch, 5Bh, 23h, 24h, 25h, 49h,	61h, 52h
		db 55h,	53h, 64h, 65h, 6Fh, 0
		dw 0F844h, 0F8AEh, 0F978h, 0F849h, 0F964h, 0F810h, 0
		dw 0F841h, 0F808h, 0F82Eh, 0F862h, 0F874h, 0F8F8h, 0F93Bh, 0
		db 20h,	21h, 2Bh, 2Ch, 49h, 61h, 52h, 55h, 53h,	65h, 6Fh, 0
		dw 0F844h, 0F8AEh, 0F978h, 0F810h, 0
		dw 0F841h, 0F808h, 0F82Eh, 0F862h, 0F874h, 0F93Bh, 0
		db 74h,	0
		dw 0F80Bh, 0F80Ch, 0F80Dh, 0F964h, 0F8A9h, 0F8B3h, 0F8B6h, 0F8B7h, 0F8B5h, 0F80Eh, 0
		dw 0FA41h, 0FA42h, 0FA63h, 0FA64h, 0FA65h, 0FA66h, 0FA67h, 0FA68h, 0FA69h, 0FA6Ah, 0FA6Bh, 0FA6Ch, 0FA6Dh, 0FA6Eh, 0FA6Fh, 0FA70h
		dw 0F8C6h, 0F8C7h, 0F8C8h, 0F8C9h, 0F8CAh, 0F8CBh, 0F8CCh, 0F8CDh, 0F93Dh, 0

; =============== S U B	R O U T	I N E =======================================


code_BC1A:				; CODE XREF: RESET_0:code_2501p
					; RESET_0-A78Dp
		mov	WDTREL,	#80h ; 'А' ; Watchdog Timer Reload Register
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		lcall	code_BC94
		mov	RAM_6, #4

code_BC27:				; CODE XREF: code_BC1A+1Cj
		mov	RAM_5, #8

code_BC2A:				; CODE XREF: code_BC1A+18j
		mov	A, @R1
		rlc	A
		mov	@R1, A
		mov	RAM_2D.0, C
		lcall	code_BCF7
		djnz	RAM_5, code_BC2A
		inc	R1
		djnz	RAM_6, code_BC27
		mov	R1, #25h ; '%'
		mov	RAM_6, #4

code_BC3E:				; CODE XREF: code_BC1A+36j
		mov	RAM_5, #4

code_BC41:				; CODE XREF: code_BC1A+32j
		lcall	code_BD87
		mov	A, @R1
		mov	C, Options.7
		rlc	A
		mov	C, Options.6
		rlc	A
		mov	@R1, A
		djnz	RAM_5, code_BC41
		inc	R1
		djnz	RAM_6, code_BC3E
		mov	R1, #29h ; ')'
		mov	RAM_6, #2

code_BC58:				; CODE XREF: code_BC1A+4Dj
		mov	RAM_5, #8

code_BC5B:				; CODE XREF: code_BC1A+49j
		mov	A, @R1
		rlc	A
		mov	@R1, A
		mov	RAM_2D.0, C
		lcall	code_BCF7
		djnz	RAM_5, code_BC5B
		inc	R1
		djnz	RAM_6, code_BC58
		mov	R1, #29h ; ')'
		mov	RAM_6, #2

code_BC6F:				; CODE XREF: code_BC1A+67j
		mov	RAM_5, #4

code_BC72:				; CODE XREF: code_BC1A+63j
		lcall	code_BD87
		mov	A, @R1
		mov	C, Options.7
		rlc	A
		mov	C, Options.6
		rlc	A
		mov	@R1, A
		djnz	RAM_5, code_BC72
		inc	R1
		djnz	RAM_6, code_BC6F
		clr	RAM_2D.0
		mov	R2, #6
		mov	R0, #25h ; '%'
		mov	DPTR, #0F4A0h

code_BC8D:				; CODE XREF: code_BC1A+77j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R2, code_BC8D
		ret
; End of function code_BC1A


; =============== S U B	R O U T	I N E =======================================


code_BC94:				; CODE XREF: code_BC1A+7p
		mov	R0, #50h ; 'P'
		mov	DPTR, #0F4AEh
		mov	R2, #8

code_BC9B:				; CODE XREF: code_BC94+Bj
		movx	A, @DPTR
		mov	@R0, A
		inc	R0
		inc	DPTR
		djnz	R2, code_BC9B
		mov	DPTR, #0BFC8h
		mov	R2, #8

code_BCA6:				; CODE XREF: code_BC94+17j
		clr	A
		movc	A, @A+DPTR
		mov	@R0, A
		inc	R0
		inc	DPTR
		djnz	R2, code_BCA6
		mov	DPTR, #0BFD0h
		mov	R2, #4

code_BCB2:				; CODE XREF: code_BC94+23j
		clr	A
		movc	A, @A+DPTR
		mov	@R0, A
		inc	R0
		inc	DPTR
		djnz	R2, code_BCB2
		mov	DPTR, #0F4B2h
		mov	R2, #4

code_BCBE:				; CODE XREF: code_BC94+2Ej
		movx	A, @DPTR
		mov	@R0, A
		inc	R0
		inc	DPTR
		djnz	R2, code_BCBE
		mov	DPTR, #0BFC8h
		mov	R2, #8

code_BCC9:				; CODE XREF: code_BC94+3Aj
		clr	A
		movc	A, @A+DPTR
		mov	@R0, A
		inc	R0
		inc	DPTR
		djnz	R2, code_BCC9
		mov	DPTR, #0BFD0h
		clr	A
		movc	A, @A+DPTR
		mov	@R0, A
		mov	R0, #25h ; '%'
		mov	DPTR, #0F4A6h
		mov	R2, #6

code_BCDD:				; CODE XREF: code_BC94+4Dj
		movx	A, @DPTR
		mov	@R0, A
		inc	R0
		inc	DPTR
		djnz	R2, code_BCDD
		mov	R0, #50h ; 'P'
		mov	RAM_24,	@R0
		inc	R0
		mov	RAM_23,	@R0
		inc	R0
		mov	RAM_22,	@R0
		inc	R0
		mov	Options, @R0
		inc	R0
		mov	A, R0
		mov	RAM_2, A
		mov	R1, #25h ; '%'
		ret
; End of function code_BC94


; =============== S U B	R O U T	I N E =======================================


code_BCF7:				; CODE XREF: code_BC1A+15p
					; code_BC1A+46p
		mov	RAM_4, #11h

code_BCFA:				; CODE XREF: code_BCF7:code_BD83j
		clr	A
		mov	C, RAM_22.6
		rlc	A
		mov	C, Options.2
		rlc	A
		mov	C, RAM_23.3
		rlc	A
		mov	C, RAM_2D.0
		rlc	A
		mov	C, RAM_23.0
		rlc	A
		mov	C, RAM_23.4
		rlc	A
		mov	C, Options.6
		rlc	A
		mov	DPTR, #0BEC8h
		movc	A, @A+DPTR
		anl	A, #0A0h
		mov	Hardware, A
		rl	A
		mov	C, RAM_23.5
		rlc	A
		mov	C, Options.4
		rlc	A
		mov	C, RAM_22.2
		rlc	A
		mov	C, RAM_23.1
		rlc	A
		mov	C, RAM_22.3
		rlc	A
		mov	C, RAM_23.6
		rlc	A
		mov	C, Options.7
		rlc	A
		mov	DPTR, #0BEC8h
		movc	A, @A+DPTR
		anl	A, #9
		orl	Hardware, A
		rrc	A
		jnb	RAM_2D.0, code_BD3B
		cpl	C

code_BD3B:				; CODE XREF: code_BCF7+40j
		mov	Hardware.0, C
		rlc	A
		mov	C, RAM_23.7
		rlc	A
		mov	C, RAM_22.0
		rlc	A
		mov	C, RAM_22.7
		rlc	A
		mov	C, RAM_24.4
		rlc	A
		mov	C, Options.1
		rlc	A
		mov	C, RAM_24.6
		rlc	A
		mov	C, Options.5
		rlc	A
		mov	DPTR, #0BEC8h
		movc	A, @A+DPTR
		anl	A, #12h
		orl	Hardware, A
		mov	C, Hardware.1
		rlc	A
		mov	C, RAM_23.2
		rlc	A
		mov	C, Options.3
		rlc	A
		mov	C, Options.0
		rlc	A
		mov	C, RAM_22.4
		rlc	A
		mov	C, RAM_24.2
		rlc	A
		mov	C, RAM_24.1
		rlc	A
		mov	C, RAM_22.5
		rlc	A
		mov	DPTR, #0BEC8h
		movc	A, @A+DPTR
		anl	A, #44h
		orl	Hardware, A
		lcall	code_BE1E
		djnz	RAM_4, code_BD83
		sjmp	code_BD86
; ---------------------------------------------------------------------------

code_BD83:				; CODE XREF: code_BCF7+87j
		ljmp	code_BCFA
; ---------------------------------------------------------------------------

code_BD86:				; CODE XREF: code_BCF7+8Aj
		ret
; End of function code_BCF7


; =============== S U B	R O U T	I N E =======================================


code_BD87:				; CODE XREF: code_BC1A:code_BC41p
					; code_BC1A:code_BC72p
		mov	RAM_4, #22h ; '"'

code_BD8A:				; CODE XREF: code_BD87:code_BE1Aj
		clr	A
		mov	C, RAM_22.6
		rlc	A
		mov	C, Options.2
		rlc	A
		mov	C, RAM_23.3
		rlc	A
		mov	C, RAM_22.1
		rlc	A
		mov	C, RAM_23.0
		rlc	A
		mov	C, RAM_23.4
		rlc	A
		mov	C, Options.6
		rlc	A
		mov	DPTR, #0BEC8h
		movc	A, @A+DPTR
		anl	A, #0A0h
		mov	Hardware, A
		rl	A
		mov	C, RAM_23.5
		rlc	A
		mov	C, Options.4
		rlc	A
		mov	C, RAM_22.2
		rlc	A
		mov	C, RAM_23.1
		rlc	A
		mov	C, RAM_22.3
		rlc	A
		mov	C, RAM_23.6
		rlc	A
		mov	C, Options.7
		rlc	A
		mov	DPTR, #0BEC8h
		movc	A, @A+DPTR
		anl	A, #9
		orl	Hardware, A
		rrc	A
		cpl	C
		mov	Hardware.0, C
		rlc	A
		mov	C, RAM_23.7
		rlc	A
		mov	C, RAM_22.0
		rlc	A
		mov	C, RAM_22.7
		rlc	A
		mov	C, RAM_24.4
		rlc	A
		mov	C, Options.1
		rlc	A
		mov	C, RAM_24.6
		rlc	A
		mov	C, Options.5
		rlc	A
		mov	DPTR, #0BEC8h
		movc	A, @A+DPTR
		anl	A, #12h
		orl	Hardware, A
		mov	C, Hardware.1
		rlc	A
		mov	C, RAM_23.2
		rlc	A
		mov	C, Options.3
		rlc	A
		mov	C, Options.0
		rlc	A
		mov	C, RAM_22.4
		rlc	A
		mov	C, RAM_24.2
		rlc	A
		mov	C, RAM_24.1
		rlc	A
		mov	C, RAM_22.5
		rlc	A
		mov	DPTR, #0BEC8h
		movc	A, @A+DPTR
		anl	A, #44h
		orl	Hardware, A
		mov	A, RAM_4
		rrc	A
		jc	code_BE12
		lcall	code_BE3D
		sjmp	code_BE15
; ---------------------------------------------------------------------------

code_BE12:				; CODE XREF: code_BD87+84j
		lcall	code_BE1E

code_BE15:				; CODE XREF: code_BD87+89j
		djnz	RAM_4, code_BE1A
		sjmp	code_BE1D
; ---------------------------------------------------------------------------

code_BE1A:				; CODE XREF: code_BD87:code_BE15j
		ljmp	code_BD8A
; ---------------------------------------------------------------------------

code_BE1D:				; CODE XREF: code_BD87+91j
		ret
; End of function code_BD87


; =============== S U B	R O U T	I N E =======================================


code_BE1E:				; CODE XREF: code_BCF7+84p
					; code_BD87:code_BE12p
		mov	A, RAM_2
		mov	R0, A
		mov	A, RAM_24
		mov	RAM_24,	RAM_23
		mov	RAM_23,	RAM_22
		mov	RAM_22,	Options
		rr	A
		xrl	A, Hardware
		xrl	A, @R0
		mov	Options, A
		cjne	R0, #70h, code_BE3A ; 'p'
		mov	RAM_2, #54h ; 'T'
		sjmp	code_BE3C
; ---------------------------------------------------------------------------

code_BE3A:				; CODE XREF: code_BE1E+14j
		inc	RAM_2

code_BE3C:				; CODE XREF: code_BE1E+1Aj
		ret
; End of function code_BE1E


; =============== S U B	R O U T	I N E =======================================


code_BE3D:				; CODE XREF: code_BD87+86p
		mov	A, RAM_2
		mov	R0, A
		mov	A, RAM_24
		mov	RAM_24,	RAM_23
		mov	RAM_23,	RAM_22
		mov	RAM_22,	Options
		rr	A
		xrl	A, Hardware
		xrl	A, @R0
		mov	Options, A
		ret
; End of function code_BE3D

; ---------------------------------------------------------------------------
		INIT_DB_ZERO	%0BE52h - $
		db 80h,	0F1h, 10h, 61h,	5Ah, 80h, 0, 92h, 0F1h,	10h, 5Ah
		db 91h,	32h, 31h, 31h, 32h, 34h, 2Dh, 31h, 34h,	31h, 31h
		db 30h,	32h, 30h, 2Dh, 33h, 32h, 90h, 0, 8Ch, 0F1h, 10h
		db 5Ah,	92h, 4Eh, 4Fh, 54h, 53h, 55h, 50h, 50h,	4Fh, 52h
		db 54h,	0A7h, 0, 8Ch, 0F1h, 10h, 5Ah, 94h, 31h,	34h, 31h
		db 31h,	30h, 31h, 30h, 2Dh, 33h, 32h, 65h, 0, 91h, 0F1h
		db 10h,	5Ah, 97h, 53h, 41h, 4Dh, 41h, 52h, 41h,	2Dh, 31h
		db 2Eh,	36h, 4Ch, 2Ch, 31h, 36h, 56h, 2Fh, 0, 8Ch, 0F1h
		db 10h,	5Ah, 99h, 31h, 35h, 2Dh, 30h, 32h, 2Dh,	32h, 30h
		db 30h,	35h, 69h, 0, 8Ah, 0F1h,	10h, 5Ah, 9Ah, 49h, 32h
		db 30h,	35h, 44h, 4Dh, 35h, 33h, 58h, 0, 0A9h, 56h, 44h
		db 0EDh, 0EDh, 56h, 1Bh, 0, 12h, 0A9h, 0A9h, 56h, 0F6h
		db 0A9h, 0F6h, 1Bh, 1Bh, 0BBh, 0A0h, 12h, 44h, 0A0h, 0BBh
		db 0EDh, 4Dh, 0A0h, 0F6h, 5Fh, 0, 5Fh, 5Fh, 0E4h, 44h
		db 0A9h, 9, 0FFh, 0F6h,	0BBh, 0A9h, 12h, 0FFh, 56h, 56h
		db 0A9h, 9, 44h, 0E4h, 56h, 0F6h, 5Fh, 0BBh, 0A0h, 0A9h
		db 12h,	44h, 0FFh, 9, 0F6h, 0A0h, 12h, 56h, 9, 9, 0EDh
		db 6Ah,	95h, 87h, 2Eh, 2Eh, 95h, 0D8h, 0C3h, 0D1h, 6Ah
		db 6Ah,	95h, 35h, 6Ah, 35h, 0D8h, 0D8h,	78h, 63h, 0D1h
		db 87h,	63h, 78h, 2Eh, 8Eh, 63h, 35h, 9Ch, 0C3h, 9Ch, 9Ch
		db 27h,	87h, 6Ah, 0CAh,	3Ch, 35h, 78h, 6Ah, 0D1h, 3Ch
		db 95h,	95h, 6Ah, 0CAh,	87h, 27h, 95h, 35h, 9Ch, 78h, 63h
		db 6Ah,	0D1h, 87h, 3Ch,	0CAh, 35h, 63h,	0D1h, 95h, 0CAh
		db 0CAh, 2Eh, 56h, 0A9h, 0BBh, 12h, 12h, 0A9h, 0E4h, 0FFh
		db 0EDh, 56h, 56h, 0A9h, 9, 56h, 9, 0E4h, 0E4h,	44h, 5Fh
		db 0EDh, 0BBh, 5Fh, 44h, 12h, 0B2h, 5Fh, 9, 0A0h, 0FFh
		db 0A0h, 0A0h, 1Bh, 0BBh, 56h, 0F6h, 0,	9, 44h,	56h, 0EDh
		db 0, 0A9h, 0A9h, 56h, 0F6h, 0BBh, 1Bh,	0A9h, 9, 0A0h
		db 44h,	5Fh, 56h, 0EDh,	0BBh, 0, 0F6h, 9, 5Fh, 0EDh, 0A9h
		db 0F6h, 0F6h, 12h, 95h, 6Ah, 78h, 0D1h, 0D1h, 6Ah, 27h
		db 3Ch,	2Eh, 95h, 95h, 6Ah, 0CAh, 95h, 0CAh, 27h, 27h
		db 87h,	9Ch, 2Eh, 78h, 9Ch, 87h, 0D1h, 71h, 9Ch, 0CAh
		db 63h,	3Ch, 63h, 63h, 0D8h, 78h, 95h, 35h, 0C3h, 0CAh
		db 87h,	95h, 2Eh, 0C3h,	6Ah, 6Ah, 95h, 35h, 78h, 0D8h
		db 6Ah,	0CAh, 63h, 87h,	9Ch, 95h, 2Eh, 78h, 0C3h, 35h
		db 0CAh, 9Ch, 2Eh, 6Ah,	35h, 35h, 0D1h,	41h, 76h, 74h
		db 6Fh,	56h, 41h, 5Ah, 0, 56h, 11h, 19h, 10h, 5Ah, 0A5h

; =============== S U B	R O U T	I N E =======================================


code_BFD6:				; CODE XREF: code_C0E9+9p
					; code_C0E9+1Ap ...
		orl	P5, #40h	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		anl	P5, #7Fh	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		anl	P5, #0BFh	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		ret
; End of function code_BFD6


; =============== S U B	R O U T	I N E =======================================


code_C008:				; CODE XREF: code_C0E9+34p
					; code_C125+24p ...
		anl	P5, #7Fh	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		orl	P5, #40h	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		orl	P5, #80h	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		ret
; End of function code_C008


; =============== S U B	R O U T	I N E =======================================


code_C038:				; CODE XREF: code_C0E9+Ep
					; code_C0E9+15p ...
		mov	A, R4
		mov	R2, #8

code_C03B:				; CODE XREF: code_C038+24j
		rlc	A
		jc	code_C043
		anl	P5, #7Fh	; Port 5 (PDIR=0)
		sjmp	code_C048
; ---------------------------------------------------------------------------

code_C043:				; CODE XREF: code_C038+4j
		orl	P5, #80h	; Port 5 (PDIR=0)
		nop
		nop

code_C048:				; CODE XREF: code_C038+9j
		nop
		nop
		orl	P5, #40h	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		anl	P5, #0BFh	; Port 5 (PDIR=0)
		djnz	R2, code_C03B
		nop
		nop
		orl	P5, #80h	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		orl	P5, #40h	; Port 5 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		orl	P5, #80h	; Port 5 (PDIR=0)
		nop
		nop
		nop
		mov	B, P5		; B-Register
		mov	C, B.7		; B-Register
		nop
		nop
		nop
		nop
		anl	P5, #0BFh	; Port 5 (PDIR=0)
		nop
		orl	IP1, #80h	; Interrupt Priority Register 1
		anl	P5, #7Fh	; Port 5 (PDIR=0)
		nop
		nop
		ret
; End of function code_C038


; =============== S U B	R O U T	I N E =======================================


code_C089:				; CODE XREF: code_C0E9:code_C115p
					; code_C151:code_C17Dp
		mov	R2, #8
		rlc	A
		orl	P5, #80h	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		orl	IP1, #80h	; Interrupt Priority Register 1
		orl	P5, #80h	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop

code_C09D:				; CODE XREF: code_C089+2Fj
		orl	P5, #40h	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		nop
		nop
		mov	B, P5		; B-Register
		mov	C, B.7		; B-Register
		nop
		nop
		nop
		anl	P5, #0BFh	; Port 5 (PDIR=0)
		rlc	A
		nop
		nop
		nop
		nop
		nop
		nop
		djnz	R2, code_C09D
		orl	IP1, #80h	; Interrupt Priority Register 1
		anl	P5, #7Fh	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		jc	code_C0CB
		anl	P5, #7Fh	; Port 5 (PDIR=0)
		sjmp	code_C0CE
; ---------------------------------------------------------------------------

code_C0CB:				; CODE XREF: code_C089+3Bj
		orl	P5, #80h	; Port 5 (PDIR=0)

code_C0CE:				; CODE XREF: code_C089+40j
		nop
		nop
		nop
		nop
		orl	P5, #40h	; Port 5 (PDIR=0)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		anl	P5, #0BFh	; Port 5 (PDIR=0)
		mov	R4, A
		nop
		nop
		nop
		ret
; End of function code_C089


; =============== S U B	R O U T	I N E =======================================


code_C0E9:				; CODE XREF: code_C311+6p code_C32E+6p ...
		mov	WDTREL,	#80h ; 'А' ; Watchdog Timer Reload Register
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	RAM_3, R4
		lcall	code_BFD6
		mov	R4, #0A0h ; 'а'
		lcall	code_C038
		jc	code_C123
		mov	R4, RAM_3
		lcall	code_C038
		jc	code_C123
		lcall	code_BFD6
		mov	R4, #0A1h ; 'б'
		lcall	code_C038
		jc	code_C123

code_C10D:				; CODE XREF: code_C0E9+32j
		mov	A, R1
		dec	A
		jnz	code_C114
		setb	C
		sjmp	code_C115
; ---------------------------------------------------------------------------

code_C114:				; CODE XREF: code_C0E9+26j
		clr	C

code_C115:				; CODE XREF: code_C0E9+29j
		lcall	code_C089
		mov	A, R4
		mov	@R0, A
		inc	R0
		djnz	R1, code_C10D
		lcall	code_C008
		clr	C
		sjmp	code_C124
; ---------------------------------------------------------------------------

code_C123:				; CODE XREF: code_C0E9+11j
					; code_C0E9+18j ...
		setb	C

code_C124:				; CODE XREF: code_C0E9+38j
		ret
; End of function code_C0E9


; =============== S U B	R O U T	I N E =======================================


code_C125:				; CODE XREF: code_C415+15p
					; code_C434+15p ...
		mov	WDTREL,	#80h ; 'А' ; Watchdog Timer Reload Register
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	RAM_3, R4
		lcall	code_BFD6
		mov	R4, #0A0h ; 'а'
		lcall	code_C038
		jc	code_C14F
		mov	R4, RAM_3
		lcall	code_C038
		jc	code_C14F

code_C13F:				; CODE XREF: code_C125+22j
		mov	A, @R0
		mov	R4, A
		lcall	code_C038
		jc	code_C14F
		inc	R0
		djnz	R1, code_C13F
		lcall	code_C008
		clr	C
		sjmp	code_C150
; ---------------------------------------------------------------------------

code_C14F:				; CODE XREF: code_C125+11j
					; code_C125+18j ...
		setb	C

code_C150:				; CODE XREF: code_C125+28j
		ret
; End of function code_C125


; =============== S U B	R O U T	I N E =======================================


code_C151:				; CODE XREF: code_C5B5+6p code_C61A+6p ...
		mov	WDTREL,	#80h ; 'А' ; Watchdog Timer Reload Register
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	RAM_3, R4
		lcall	code_BFD6
		mov	R4, #0A2h ; 'в'
		lcall	code_C038
		jc	code_C18B
		mov	R4, RAM_3
		lcall	code_C038
		jc	code_C18B
		lcall	code_BFD6
		mov	R4, #0A3h ; 'г'
		lcall	code_C038
		jc	code_C18B

code_C175:				; CODE XREF: code_C151+32j
		mov	A, R1
		dec	A
		jnz	code_C17C
		setb	C
		sjmp	code_C17D
; ---------------------------------------------------------------------------

code_C17C:				; CODE XREF: code_C151+26j
		clr	C

code_C17D:				; CODE XREF: code_C151+29j
		lcall	code_C089
		mov	A, R4
		mov	@R0, A
		inc	R0
		djnz	R1, code_C175
		lcall	code_C008
		clr	C
		sjmp	code_C18C
; ---------------------------------------------------------------------------

code_C18B:				; CODE XREF: code_C151+11j
					; code_C151+18j ...
		setb	C

code_C18C:				; CODE XREF: code_C151+38j
		ret
; End of function code_C151


; =============== S U B	R O U T	I N E =======================================


code_C18D:				; CODE XREF: code_C5B5+26p
					; code_C5B5+3Ep ...
		mov	WDTREL,	#80h ; 'А' ; Watchdog Timer Reload Register
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov	RAM_3, R4
		lcall	code_BFD6
		mov	R4, #0A2h ; 'в'
		lcall	code_C038
		jc	code_C1B7
		mov	R4, RAM_3
		lcall	code_C038
		jc	code_C1B7

code_C1A7:				; CODE XREF: code_C18D+22j
		mov	A, @R0
		mov	R4, A
		lcall	code_C038
		jc	code_C1B7
		inc	R0
		djnz	R1, code_C1A7
		lcall	code_C008
		clr	C
		sjmp	code_C1B8
; ---------------------------------------------------------------------------

code_C1B7:				; CODE XREF: code_C18D+11j
					; code_C18D+18j ...
		setb	C

code_C1B8:				; CODE XREF: code_C18D+28j
		ret
; End of function code_C18D


; =============== S U B	R O U T	I N E =======================================


code_C1B9:				; CODE XREF: RESET_0-C30Fp
					; RESET_0-A816p ...
		mov	S0CON, #40h ; '@' ; Serial Channel 0 Control Register
		mov	PCON, #80h ; 'А' ; Power Control Register
		mov	ADCON0,	#0C0h ;	'L' ; A/D Converter Control Register 0
		mov	R0, #0A8h ; 'и'
		mov	@R0, #0D0h ; '¦'
		jnb	RAM_2D.0, code_C1D1
		mov	S0RELL,	#0D5h ;	'-' ; Serial Channel 0 Reload Reg., Low Byte
		mov	S0RELH,	#1	; Serial Channel 0 Reload Reg.,	High Byte
		sjmp	code_C1D7
; ---------------------------------------------------------------------------

code_C1D1:				; CODE XREF: code_C1B9+Dj
		mov	S0RELL,	#0D0h ;	'¦' ; Serial Channel 0 Reload Reg., Low Byte
		mov	S0RELH,	#3	; Serial Channel 0 Reload Reg.,	High Byte

code_C1D7:				; CODE XREF: code_C1B9+16j
		lcall	code_C225
		lcall	code_C233
		mov	R0, #93h ; 'У'
		mov	@R0, #0
		setb	RAM_2F.0
		clr	RAM_2D.1
		mov	DPTR, #0F9B0h
		movx	A, @DPTR
		xrl	A, #55h
		jz	code_C1F8
		mov	DPTR, #0F4B9h
		movx	A, @DPTR
		cjne	A, #3, code_C1F4

code_C1F4:
		jnc	code_C1F8
		setb	RAM_2D.3

code_C1F8:				; CODE XREF: code_C1B9+32j
					; code_C1B9:code_C1F4j
		jnb	RAM_2D.2, code_C210
		setb	RAM_25.1
		mov	DPTR, #0BFD4h
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, #1
		movc	A, @A+DPTR
		xrl	A, B		; B-Register
		inc	A
		jz	code_C210
		clr	RAM_2D.3
		clr	RAM_2D.0

code_C210:				; CODE XREF: code_C1B9:code_C1F8j
					; code_C1B9+51j
		clr	A
		mov	DPTR, #0F4B6h
		movx	@DPTR, A
		mov	DPTR, #0F4BAh
		movx	@DPTR, A
		mov	RAM_78,	A
		jb	RAM_2D.0, code_C224
		clr	RAM_25.1
		setb	S0CON.4		; Serial Channel 0 Control Register
		setb	IEN0.4		; Interrupt Enable Register 0

code_C224:				; CODE XREF: code_C1B9+62j
		ret
; End of function code_C1B9


; =============== S U B	R O U T	I N E =======================================


code_C225:				; CODE XREF: code_C1B9:code_C1D7p
					; code_CE6A+45p ...
		clr	A
		mov	RAM_7E,	A
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #6	; Data Pointer Select Register
		mov	DPTR, #0F700h
		pop	DPSEL		; Data Pointer Select Register
		ret
; End of function code_C225


; =============== S U B	R O U T	I N E =======================================


code_C233:				; CODE XREF: code_C1B9+21p
					; code_D584+22p ...
		clr	A
		mov	RAM_51,	A
		mov	R0, #92h ; 'Т'
		mov	@R0, A
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		pop	DPSEL		; Data Pointer Select Register
		ret
; End of function code_C233


; =============== S U B	R O U T	I N E =======================================


code_C244:				; CODE XREF: code_CE6A+42p
					; code_DBB8+Ep	...
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		pop	DPSEL		; Data Pointer Select Register
		clr	RAM_2F.3
		clr	RAM_2F.0
		clr	RAM_2F.4
		mov	RAM_78,	#0
		setb	S0CON.1		; Serial Channel 0 Control Register
		ret
; End of function code_C244


; =============== S U B	R O U T	I N E =======================================


code_C25A:				; CODE XREF: code_DAEF+1Dp
					; code_DAEF+40p ...
		mov	DPH, R3		; Data Pointer,	High Byte
		mov	DPL, R4		; Data Pointer,	Low Byte

code_C25E:				; CODE XREF: code_C25A+13j
		movx	A, @DPTR
		jz	code_C26F
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		movx	@DPTR, A
		inc	DPTR
		inc	RAM_51
		pop	DPSEL		; Data Pointer Select Register
		inc	DPTR
		sjmp	code_C25E
; ---------------------------------------------------------------------------

code_C26F:				; CODE XREF: code_C25A+5j
		ret
; End of function code_C25A


; =============== S U B	R O U T	I N E =======================================


code_C270:				; CODE XREF: code_D697+Cp
					; code_D6AE+13p ...
		mov	DPH, R3		; Data Pointer,	High Byte
		mov	DPL, R4		; Data Pointer,	Low Byte

code_C274:				; CODE XREF: code_C270+14j
		clr	A
		movc	A, @A+DPTR
		jz	code_C286
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		movx	@DPTR, A
		inc	DPTR
		inc	RAM_51
		pop	DPSEL		; Data Pointer Select Register
		inc	DPTR
		sjmp	code_C274
; ---------------------------------------------------------------------------

code_C286:				; CODE XREF: code_C270+6j
		ret
; End of function code_C270


; =============== S U B	R O U T	I N E =======================================


COPY_RAM:				; CODE XREF: COPY_RAM+Aj
					; code_CEFE+3Cp ...
		mov	DPSEL, #3	; Data Pointer Select Register
		movx	A, @DPTR
		inc	DPTR
		mov	DPSEL, #4	; Data Pointer Select Register
		movx	@DPTR, A
		inc	DPTR
		djnz	R2, COPY_RAM
		ret
; End of function COPY_RAM


; =============== S U B	R O U T	I N E =======================================


code_C294:				; CODE XREF: code_D76F+25p
					; code_D76F+33p ...
		mov	DPH, R3		; Data Pointer,	High Byte
		mov	DPL, R4		; Data Pointer,	Low Byte

code_C298:				; CODE XREF: code_C294+12j
		clr	A
		movc	A, @A+DPTR
		inc	DPTR
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		movx	@DPTR, A
		inc	DPTR
		inc	RAM_51
		pop	DPSEL		; Data Pointer Select Register
		djnz	R2, code_C298
		ret
; End of function code_C294


; =============== S U B	R O U T	I N E =======================================


code_C2A9:				; CODE XREF: code_DC62+26p
					; code_DCAD+26p ...
		mov	DPH, R3		; Data Pointer,	High Byte
		mov	DPL, R4		; Data Pointer,	Low Byte

code_C2AD:				; CODE XREF: code_C2A9+16j
		clr	A
		movc	A, @A+DPTR
		jz	code_C2C1
		mov	R0, A
		mov	A, @R0
		inc	DPTR
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		movx	@DPTR, A
		inc	DPTR
		inc	RAM_51
		pop	DPSEL		; Data Pointer Select Register
		sjmp	code_C2AD
; ---------------------------------------------------------------------------

code_C2C1:				; CODE XREF: code_C2A9+6j
		ret
; End of function code_C2A9


; =============== S U B	R O U T	I N E =======================================


code_C2C2:				; CODE XREF: code_DC62+34p
					; code_DCAD+34p ...
		mov	DPH, R3		; Data Pointer,	High Byte
		mov	DPL, R4		; Data Pointer,	Low Byte

code_C2C6:				; CODE XREF: code_C2C2+28j
		mov	R3, #2
		clr	A
		movc	A, @A+DPTR
		jz	code_C2EC
		mov	R4, A
		inc	DPTR
		clr	A
		movc	A, @A+DPTR
		inc	DPTR
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPH, R4		; Data Pointer,	High Byte
		mov	DPL, A		; Data Pointer,	Low Byte

code_C2DA:				; CODE XREF: code_C2C2+24j
		movx	A, @DPTR
		inc	DPTR
		mov	DPSEL, #7	; Data Pointer Select Register
		movx	@DPTR, A
		inc	DPTR
		inc	RAM_51
		mov	DPSEL, #3	; Data Pointer Select Register
		djnz	R3, code_C2DA
		pop	DPSEL		; Data Pointer Select Register
		sjmp	code_C2C6
; ---------------------------------------------------------------------------

code_C2EC:				; CODE XREF: code_C2C2+8j
		ret
; End of function code_C2C2


; =============== S U B	R O U T	I N E =======================================


code_C2ED:				; CODE XREF: code_DC62+2Dp
					; code_DCAD+2Dp ...
		mov	DPH, R3		; Data Pointer,	High Byte
		mov	DPL, R4		; Data Pointer,	Low Byte

code_C2F1:				; CODE XREF: code_C2ED+21j
		clr	A
		movc	A, @A+DPTR
		jz	code_C310
		mov	R4, A
		inc	DPTR
		clr	A
		movc	A, @A+DPTR
		inc	DPTR
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPH, R4		; Data Pointer,	High Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		movx	A, @DPTR
		inc	DPTR
		mov	DPSEL, #7	; Data Pointer Select Register
		movx	@DPTR, A
		inc	DPTR
		inc	RAM_51
		pop	DPSEL		; Data Pointer Select Register
		sjmp	code_C2F1
; ---------------------------------------------------------------------------

code_C310:				; CODE XREF: code_C2ED+6j
		ret
; End of function code_C2ED


; =============== S U B	R O U T	I N E =======================================


code_C311:				; CODE XREF: RESET_0:code_25ABp
		mov	R4, #10h
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_C31E
		setb	RAM_22.2

code_C31E:				; CODE XREF: code_C311+9j
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F485h

code_C325:				; CODE XREF: code_C311+18j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_C325
		clr	A
		movx	@DPTR, A
		ret
; End of function code_C311


; =============== S U B	R O U T	I N E =======================================


code_C32E:				; CODE XREF: RESET_0-C434p
		mov	R4, #18h
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_C33B
		setb	RAM_22.2

code_C33B:				; CODE XREF: code_C32E+9j
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F48Dh

code_C342:				; CODE XREF: code_C32E+18j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_C342
		clr	A
		movx	@DPTR, A
		ret
; End of function code_C32E


; =============== S U B	R O U T	I N E =======================================


code_C34B:				; CODE XREF: RESET_0-C42Bp
		mov	R4, #48h ; 'H'
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_C358
		setb	RAM_22.2

code_C358:				; CODE XREF: code_C34B+9j
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F474h

code_C35F:				; CODE XREF: code_C34B+18j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_C35F
		clr	A
		movx	@DPTR, A
		ret
; End of function code_C34B


; =============== S U B	R O U T	I N E =======================================


code_C368:				; CODE XREF: RESET_0-C431p
		mov	R4, #20h ; ' '
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_C377
		setb	RAM_22.2
		sjmp	code_C3A2
; ---------------------------------------------------------------------------

code_C377:				; CODE XREF: code_C368+9j
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F495h

code_C37E:				; CODE XREF: code_C368+1Aj
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_C37E
		mov	R4, #28h ; '('
		mov	R1, #2
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_C393
		setb	RAM_22.2
		sjmp	code_C3A2
; ---------------------------------------------------------------------------

code_C393:				; CODE XREF: code_C368+25j
		mov	R1, #2
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F49Dh

code_C39A:				; CODE XREF: code_C368+36j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_C39A
		clr	A
		movx	@DPTR, A

code_C3A2:				; CODE XREF: code_C368+Dj
					; code_C368+29j
		ret
; End of function code_C368


; =============== S U B	R O U T	I N E =======================================


code_C3A3:				; CODE XREF: RESET_0-C42Ep
		mov	R4, #30h ; '0'
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_C3B2
		setb	RAM_22.2
		sjmp	code_C3F9
; ---------------------------------------------------------------------------

code_C3B2:				; CODE XREF: code_C3A3+9j
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F460h

code_C3B9:				; CODE XREF: code_C3A3+1Aj
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_C3B9
		mov	R4, #38h ; '8'
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_C3CE
		setb	RAM_22.2
		sjmp	code_C3F9
; ---------------------------------------------------------------------------

code_C3CE:				; CODE XREF: code_C3A3+25j
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F468h

code_C3D5:				; CODE XREF: code_C3A3+36j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_C3D5
		mov	R4, #40h ; '@'
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_C3EA
		setb	RAM_22.2
		sjmp	code_C3F9
; ---------------------------------------------------------------------------

code_C3EA:				; CODE XREF: code_C3A3+41j
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F470h

code_C3F1:				; CODE XREF: code_C3A3+52j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_C3F1
		clr	A
		movx	@DPTR, A

code_C3F9:				; CODE XREF: code_C3A3+Dj
					; code_C3A3+29j ...
		ret
; End of function code_C3A3


; =============== S U B	R O U T	I N E =======================================


code_C3FA:				; CODE XREF: RESET_0-C428p
		mov	R4, #0FBh ; 'v'
		mov	R1, #5
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_C407
		setb	RAM_22.2

code_C407:				; CODE XREF: code_C3FA+9j
		mov	R1, #5
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F480h

code_C40E:				; CODE XREF: code_C3FA+18j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_C40E
		ret
; End of function code_C3FA


; =============== S U B	R O U T	I N E =======================================


code_C415:				; CODE XREF: code_DF34+1Fp
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F485h

code_C41C:				; CODE XREF: code_C415+Bj
		movx	A, @DPTR
		mov	@R0, A
		inc	DPTR
		inc	R0
		djnz	R1, code_C41C
		mov	R4, #10h
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		clr	IEN0.7		; Interrupt Enable Register 0
		lcall	code_C125
		setb	IEN0.7		; Interrupt Enable Register 0
		jnc	code_C433
		setb	RAM_22.2

code_C433:				; CODE XREF: code_C415+1Aj
		ret
; End of function code_C415


; =============== S U B	R O U T	I N E =======================================


code_C434:				; CODE XREF: code_DF5C+1Fp
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F48Dh

code_C43B:				; CODE XREF: code_C434+Bj
		movx	A, @DPTR
		mov	@R0, A
		inc	DPTR
		inc	R0
		djnz	R1, code_C43B
		mov	R4, #18h
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		clr	IEN0.7		; Interrupt Enable Register 0
		lcall	code_C125
		setb	IEN0.7		; Interrupt Enable Register 0
		jnc	code_C452
		setb	RAM_22.2

code_C452:				; CODE XREF: code_C434+1Aj
		ret
; End of function code_C434


; =============== S U B	R O U T	I N E =======================================


code_C453:				; CODE XREF: code_DF0C+1Fp
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F474h

code_C45A:				; CODE XREF: code_C453+Bj
		movx	A, @DPTR
		mov	@R0, A
		inc	DPTR
		inc	R0
		djnz	R1, code_C45A
		mov	R4, #48h ; 'H'
		mov	R1, #7
		mov	R0, #94h ; 'Ф'
		clr	IEN0.7		; Interrupt Enable Register 0
		lcall	code_C125
		setb	IEN0.7		; Interrupt Enable Register 0
		jnc	code_C471
		setb	RAM_22.2

code_C471:				; CODE XREF: code_C453+1Aj
		ret
; End of function code_C453


; =============== S U B	R O U T	I N E =======================================


code_C472:				; CODE XREF: code_DF84+1Fp
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F495h

code_C479:				; CODE XREF: code_C472+Bj
		movx	A, @DPTR
		mov	@R0, A
		inc	DPTR
		inc	R0
		djnz	R1, code_C479
		mov	R4, #20h ; ' '
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		clr	IEN0.7		; Interrupt Enable Register 0
		lcall	code_C125
		setb	IEN0.7		; Interrupt Enable Register 0
		jc	code_C4AD
		lcall	code_C50D
		mov	R1, #2
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F49Dh

code_C498:				; CODE XREF: code_C472+2Aj
		movx	A, @DPTR
		mov	@R0, A
		inc	DPTR
		inc	R0
		djnz	R1, code_C498
		mov	R4, #28h ; '('
		mov	R1, #2
		mov	R0, #94h ; 'Ф'
		clr	IEN0.7		; Interrupt Enable Register 0
		lcall	code_C125
		setb	IEN0.7		; Interrupt Enable Register 0
		jnc	code_C4AF

code_C4AD:				; CODE XREF: code_C472+1Aj
		setb	RAM_22.2

code_C4AF:				; CODE XREF: code_C472+39j
		ret
; End of function code_C472


; =============== S U B	R O U T	I N E =======================================


code_C4B0:				; CODE XREF: code_DEE4+1Fp
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F460h

code_C4B7:				; CODE XREF: code_C4B0+Bj
		movx	A, @DPTR
		mov	@R0, A
		inc	DPTR
		inc	R0
		djnz	R1, code_C4B7
		mov	R4, #30h ; '0'
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		clr	IEN0.7		; Interrupt Enable Register 0
		lcall	code_C125
		setb	IEN0.7		; Interrupt Enable Register 0
		jc	code_C50A
		lcall	code_C50D
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F468h

code_C4D6:				; CODE XREF: code_C4B0+2Aj
		movx	A, @DPTR
		mov	@R0, A
		inc	DPTR
		inc	R0
		djnz	R1, code_C4D6
		mov	R4, #38h ; '8'
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		clr	IEN0.7		; Interrupt Enable Register 0
		lcall	code_C125
		setb	IEN0.7		; Interrupt Enable Register 0
		jc	code_C50A
		lcall	code_C50D
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F470h

code_C4F5:				; CODE XREF: code_C4B0+49j
		movx	A, @DPTR
		mov	@R0, A
		inc	DPTR
		inc	R0
		djnz	R1, code_C4F5
		mov	R4, #40h ; '@'
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		clr	IEN0.7		; Interrupt Enable Register 0
		lcall	code_C125
		setb	IEN0.7		; Interrupt Enable Register 0
		jnc	code_C50C

code_C50A:				; CODE XREF: code_C4B0+1Aj
					; code_C4B0+39j
		setb	RAM_22.2

code_C50C:				; CODE XREF: code_C4B0+58j
		ret
; End of function code_C4B0


; =============== S U B	R O U T	I N E =======================================


code_C50D:				; CODE XREF: RESET_0:code_2548p
					; RESET_0-C497p ...
		mov	R3, #34h ; '4'
		mov	R4, #0FFh

code_C511:				; CODE XREF: code_C50D:code_C511j
					; code_C50D+6j
		djnz	R4, code_C511
		djnz	R3, code_C511
		ret
; End of function code_C50D


; =============== S U B	R O U T	I N E =======================================


code_C516:				; CODE XREF: RESET_0-913Fp
		mov	DPTR, #0F512h
		mov	R2, #40h ; '@'

code_C51B:				; CODE XREF: code_C516+Aj
		movx	A, @DPTR
		jb	ACC.7, code_C525 ; Accumulator
		inc	DPTR
		djnz	R2, code_C51B
		clr	C
		sjmp	code_C526
; ---------------------------------------------------------------------------

code_C525:				; CODE XREF: code_C516+6j
		setb	C

code_C526:				; CODE XREF: code_C516+Dj
		ret
; End of function code_C516


; =============== S U B	R O U T	I N E =======================================


code_C527:				; CODE XREF: RESET_0-9161p
		clr	A
		mov	R0, #93h ; 'У'
		mov	@R0, A
		mov	R1, A
		mov	DPTR, #0F512h
		mov	R2, #40h ; '@'
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPTR, #0CA07h
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F400h
		movx	@DPTR, A
		mov	DPSEL, #0	; Data Pointer Select Register

code_C541:				; CODE XREF: code_C527+53j
		movx	A, @DPTR
		anl	A, #0F0h
		mov	R4, A
		jz	code_C578
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPTR, #0CA07h
		mov	A, R1
		mov	B, #2		; B-Register
		mul	AB
		add	A, DPL		; Data Pointer,	Low Byte
		mov	DPL, A		; Data Pointer,	Low Byte
		clr	A
		addc	A, DPH		; Data Pointer,	High Byte
		mov	DPH, A		; Data Pointer,	High Byte
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		mov	A, #1
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	A, R3
		movx	@DPTR, A
		inc	DPTR
		mov	A, B		; B-Register
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		clr	A
		movx	@DPTR, A
		mov	DPSEL, #0	; Data Pointer Select Register
		mov	R0, #93h ; 'У'
		inc	@R0

code_C578:				; CODE XREF: code_C527+1Ej
		inc	DPTR
		inc	R1
		djnz	R2, code_C541
		ret
; End of function code_C527


; =============== S U B	R O U T	I N E =======================================


code_C57D:				; CODE XREF: RESET_0:code_587Ep
		mov	DPTR, #0F9C9h
		movx	A, @DPTR
		jz	code_C5B4
		jb	ACC.7, code_C5B4 ; Accumulator
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPTR, #0F512h
		mov	R2, #40h ; '@'
		mov	DPSEL, #0	; Data Pointer Select Register
		mov	DPTR, #0F552h

code_C594:				; CODE XREF: code_C57D+2Ej
		movx	A, @DPTR
		jz	code_C5A3
		dec	A
		movx	@DPTR, A
		jnz	code_C5A3
		clr	A
		mov	DPSEL, #3	; Data Pointer Select Register
		movx	@DPTR, A
		mov	DPSEL, #0	; Data Pointer Select Register

code_C5A3:				; CODE XREF: code_C57D+18j
					; code_C57D+1Cj
		inc	DPTR
		mov	DPSEL, #3	; Data Pointer Select Register
		inc	DPTR
		mov	DPSEL, #0	; Data Pointer Select Register
		djnz	R2, code_C594
		mov	DPTR, #0F9C9h
		movx	A, @DPTR
		orl	A, #80h
		movx	@DPTR, A

code_C5B4:				; CODE XREF: code_C57D+4j code_C57D+6j
		ret
; End of function code_C57D


; =============== S U B	R O U T	I N E =======================================


code_C5B5:				; CODE XREF: code_C688+6p
		mov	R4, #18h
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		lcall	code_C151
		jnc	code_C5C2
		setb	RAM_22.2

code_C5C2:				; CODE XREF: code_C5B5+9j
		mov	R0, #94h ; 'Ф'
		mov	A, @R0
		mov	R1, A
		inc	R0
		mov	A, @R0
		mov	R2, A
		inc	R0
		mov	A, @R0
		mov	R3, A
		xrl	A, R1
		jnz	code_C5E7
		mov	A, R1
		xrl	A, R2
		jz	code_C615
		mov	A, R1
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #19h
		mov	R1, #1
		lcall	code_C18D
		jnc	code_C5E2
		setb	RAM_22.2

code_C5E2:				; CODE XREF: code_C5B5+29j
		lcall	code_C50D
		sjmp	code_C615
; ---------------------------------------------------------------------------

code_C5E7:				; CODE XREF: code_C5B5+18j
		mov	A, R2
		xrl	A, R3
		jnz	code_C5FF
		mov	A, R3
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #18h
		mov	R1, #1
		lcall	code_C18D
		jnc	code_C5FA
		setb	RAM_22.2

code_C5FA:				; CODE XREF: code_C5B5+41j
		lcall	code_C50D
		sjmp	code_C615
; ---------------------------------------------------------------------------

code_C5FF:				; CODE XREF: code_C5B5+34j
		mov	A, R1
		xrl	A, R2
		jnz	code_C615
		mov	A, R1
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #1Ah
		mov	R1, #1
		lcall	code_C18D
		jnc	code_C612
		setb	RAM_22.2

code_C612:				; CODE XREF: code_C5B5+59j
		lcall	code_C50D

code_C615:				; CODE XREF: code_C5B5+1Cj
					; code_C5B5+30j ...
		mov	R0, #94h ; 'Ф'
		mov	A, @R0
		mov	R5, A
		ret
; End of function code_C5B5


; =============== S U B	R O U T	I N E =======================================


code_C61A:				; CODE XREF: code_C688+3p
		mov	R4, #1Ch
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		lcall	code_C151
		jnc	code_C627
		setb	RAM_22.2

code_C627:				; CODE XREF: code_C61A+9j
		mov	R0, #94h ; 'Ф'
		mov	A, @R0
		mov	R1, A
		inc	R0
		mov	A, @R0
		mov	R2, A
		inc	R0
		mov	A, @R0
		mov	R3, A
		xrl	A, R1
		jnz	code_C64C
		mov	A, R1
		xrl	A, R2
		jz	code_C67A
		mov	A, R1
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #1Dh
		mov	R1, #1
		lcall	code_C18D
		jnc	code_C647
		setb	RAM_22.2

code_C647:				; CODE XREF: code_C61A+29j
		lcall	code_C50D
		sjmp	code_C67A
; ---------------------------------------------------------------------------

code_C64C:				; CODE XREF: code_C61A+18j
		mov	A, R2
		xrl	A, R3
		jnz	code_C664
		mov	A, R3
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #1Ch
		mov	R1, #1
		lcall	code_C18D
		jnc	code_C65F
		setb	RAM_22.2

code_C65F:				; CODE XREF: code_C61A+41j
		lcall	code_C50D
		sjmp	code_C67A
; ---------------------------------------------------------------------------

code_C664:				; CODE XREF: code_C61A+34j
		mov	A, R1
		xrl	A, R2
		jnz	code_C67A
		mov	A, R1
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #1Eh
		mov	R1, #1
		lcall	code_C18D
		jnc	code_C677
		setb	RAM_22.2

code_C677:				; CODE XREF: code_C61A+59j
		lcall	code_C50D

code_C67A:				; CODE XREF: code_C61A+1Cj
					; code_C61A+30j ...
		mov	R0, #94h ; 'Ф'
		mov	A, @R0
		cjne	A, #10h, code_C680

code_C680:
		jc	code_C683
		clr	A

code_C683:				; CODE XREF: code_C61A:code_C680j
		mov	DPTR, #0F942h
		movx	@DPTR, A
		ret
; End of function code_C61A


; =============== S U B	R O U T	I N E =======================================


code_C688:				; CODE XREF: RESET_0:code_25CCp
		lcall	code_C70D
		lcall	code_C61A
		lcall	code_C5B5
		mov	RAM_7E,	#0
		mov	R7, #0
		mov	R6, #3

code_C698:				; CODE XREF: code_C688+45j
		mov	A, R7
		mov	B, #8		; B-Register
		mul	AB
		add	A, #0
		mov	R4, A
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C151
		jnc	code_C6AB
		setb	RAM_22.2

code_C6AB:				; CODE XREF: code_C688+1Fj
		mov	R0, #94h ; 'Ф'
		mov	R1, #8
		mov	R4, #0

code_C6B1:				; CODE XREF: code_C688+2Dj
		mov	A, @R0
		add	A, R4
		mov	R4, A
		inc	R0
		djnz	R1, code_C6B1
		mov	A, R4
		xrl	A, R5
		jz	code_C6BF
		inc	RAM_7E
		sjmp	code_C6CC
; ---------------------------------------------------------------------------

code_C6BF:				; CODE XREF: code_C688+31j
		mov	R0, #94h ; 'Ф'
		mov	R1, #8
		mov	DPTR, #0FA59h

code_C6C6:				; CODE XREF: code_C688+42j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_C6C6

code_C6CC:				; CODE XREF: code_C688+35j
		inc	R7
		djnz	R6, code_C698
		mov	A, RAM_7E
		jz	code_C6E2
		xrl	A, #3
		jz	code_C6DF
		mov	DPTR, #0FA59h
		lcall	code_C967
		sjmp	code_C6E2
; ---------------------------------------------------------------------------

code_C6DF:				; CODE XREF: code_C688+4Dj
		lcall	code_C7F5

code_C6E2:				; CODE XREF: code_C688+49j
					; code_C688+55j
		mov	DPTR, #0FA5Ah
		movx	A, @DPTR
		inc	A
		jnz	code_C70C
		clr	A
		mov	DPTR, #0FA59h
		movx	@DPTR, A
		mov	DPTR, #0FA5Bh
		movx	@DPTR, A
		mov	DPTR, #0FA5Dh
		movx	@DPTR, A
		mov	DPTR, #0FA5Fh
		movx	@DPTR, A
		mov	A, #80h	; 'А'
		mov	DPTR, #0FA5Ah
		movx	@DPTR, A
		mov	DPTR, #0FA5Ch
		movx	@DPTR, A
		mov	DPTR, #0FA5Eh
		movx	@DPTR, A
		mov	DPTR, #0FA60h
		movx	@DPTR, A

code_C70C:				; CODE XREF: code_C688+5Fj
		ret
; End of function code_C688


; =============== S U B	R O U T	I N E =======================================


code_C70D:				; CODE XREF: code_C688p
		mov	A, R5
		xrl	A, #55h
		jnz	code_C74B
		mov	R4, #20h ; ' '
		mov	R1, #0Ch
		mov	R0, #94h ; 'Ф'
		lcall	code_C151
		jnc	code_C721
		setb	RAM_22.2
		sjmp	code_C74B
; ---------------------------------------------------------------------------

code_C721:				; CODE XREF: code_C70D+Ej
		mov	R7, #2
		mov	R6, #2
		mov	R0, #94h ; 'Ф'

code_C727:				; CODE XREF: code_C70D+20j
					; code_C70D+26j
		mov	A, @R0
		inc	R0
		inc	R0
		xrl	A, @R0
		jnz	code_C74B
		djnz	R7, code_C727
		mov	R7, #2
		mov	R0, #95h ; 'Х'
		djnz	R6, code_C727
		mov	R7, #2
		mov	R6, #2
		mov	R0, #9Ah ; 'Ъ'

code_C73B:				; CODE XREF: code_C70D+34j
					; code_C70D+3Aj
		mov	A, @R0
		inc	R0
		inc	R0
		xrl	A, @R0
		jnz	code_C74B
		djnz	R7, code_C73B
		mov	R7, #2
		mov	R0, #9Bh ; 'Ы'
		djnz	R6, code_C73B
		sjmp	code_C779
; ---------------------------------------------------------------------------

code_C74B:				; CODE XREF: code_C70D+3j
					; code_C70D+12j ...
		mov	DPTR, #5FC8h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA41h
		movx	@DPTR, A
		mov	DPTR, #0FA43h
		movx	@DPTR, A
		mov	DPTR, #5FC9h
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA42h
		movx	@DPTR, A
		mov	DPTR, #0FA44h
		movx	@DPTR, A
		mov	DPTR, #5FCAh
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA45h
		movx	@DPTR, A
		mov	DPTR, #5FCBh
		clr	A
		movc	A, @A+DPTR
		mov	DPTR, #0FA46h
		movx	@DPTR, A
		sjmp	code_C7F4
; ---------------------------------------------------------------------------

code_C779:				; CODE XREF: code_C70D+3Cj
		mov	R0, #95h ; 'Х'
		mov	A, @R0
		mov	R1, A
		mov	DPTR, #0FA44h
		movx	@DPTR, A
		mov	R0, #94h ; 'Ф'
		mov	A, @R0
		mov	R0, A
		mov	DPTR, #0FA43h
		movx	@DPTR, A
		lcall	code_AE09
		mov	DPTR, #5FC8h
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5FC9h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_C74B
		mov	R0, #9Bh ; 'Ы'
		mov	A, @R0
		mov	R1, A
		mov	DPTR, #0FA46h
		movx	@DPTR, A
		mov	R0, #9Ah ; 'Ъ'
		mov	A, @R0
		mov	R0, A
		mov	DPTR, #0FA45h
		movx	@DPTR, A
		lcall	code_AE09
		mov	DPTR, #5FC8h
		clr	A
		movc	A, @A+DPTR
		mov	R2, A
		mov	DPTR, #5FC9h
		clr	A
		movc	A, @A+DPTR
		mov	R3, A
		lcall	SUB_R0R1_R2R3
		jnc	code_C74B
		mov	DPTR, #0FA43h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	code_AE09
		mov	A, R1
		mov	R3, A
		mov	A, R0
		mov	R2, A
		mov	DPTR, #0FA45h
		movx	A, @DPTR
		mov	R0, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R1, A
		lcall	code_AE09
		mov	DPTR, #0FA41h
		mov	A, R0
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R1
		movx	@DPTR, A
		lcall	SUB_R0R1_R2R3
		jnc	code_C7F4
		mov	DPTR, #0FA41h
		mov	A, R2
		movx	@DPTR, A
		inc	DPL		; Data Pointer,	Low Byte
		mov	A, R3
		movx	@DPTR, A

code_C7F4:				; CODE XREF: code_C70D+6Aj
					; code_C70D+DCj
		ret
; End of function code_C70D


; =============== S U B	R O U T	I N E =======================================


code_C7F5:				; CODE XREF: code_C688:code_C6DFp
		mov	RAM_7E,	#0
		mov	RAM_51,	#0
		mov	R5, #0
		mov	R7, #0
		mov	R6, #3

code_C801:				; CODE XREF: code_C7F5+43j
		mov	A, R7
		mov	B, #8		; B-Register
		mul	AB
		add	A, #0
		mov	R4, A
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C151
		jnc	code_C816
		setb	RAM_22.2
		sjmp	code_C837
; ---------------------------------------------------------------------------

code_C816:				; CODE XREF: code_C7F5+1Bj
		mov	A, R5
		jnz	code_C82A
		mov	R1, #8
		mov	DPTR, #0FA59h
		mov	R0, #94h ; 'Ф'

code_C820:				; CODE XREF: code_C7F5+2Fj
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_C820
		mov	R5, #1
		sjmp	code_C837
; ---------------------------------------------------------------------------

code_C82A:				; CODE XREF: code_C7F5+22j
		mov	R1, #8
		mov	DPTR, #0FA59h
		lcall	code_C9C1
		mov	A, RAM_7E
		rlc	A
		mov	RAM_7E,	A

code_C837:				; CODE XREF: code_C7F5+1Fj
					; code_C7F5+33j
		inc	R7
		djnz	R6, code_C801
		mov	A, R5
		jz	code_C88A
		mov	A, RAM_7E
		jz	code_C884
		xrl	A, #3
		jz	code_C878
		mov	A, RAM_7E
		jb	ACC.1, code_C884 ; Accumulator
		jnb	ACC.0, code_C884 ; Accumulator
		mov	A, RAM_51
		jz	code_C884
		setb	RAM_22.2
		clr	A
		mov	DPTR, #0FA59h
		movx	@DPTR, A
		mov	DPTR, #0FA5Bh
		movx	@DPTR, A
		mov	DPTR, #0FA5Dh
		movx	@DPTR, A
		mov	DPTR, #0FA5Fh
		movx	@DPTR, A
		mov	A, #80h	; 'А'
		mov	DPTR, #0FA5Ah
		movx	@DPTR, A
		mov	DPTR, #0FA5Ch
		movx	@DPTR, A
		mov	DPTR, #0FA5Eh
		movx	@DPTR, A
		mov	DPTR, #0FA60h
		movx	@DPTR, A
		sjmp	code_C884
; ---------------------------------------------------------------------------

code_C878:				; CODE XREF: code_C7F5+4Ej
		mov	RAM_7E,	#0
		mov	RAM_51,	#1
		mov	R5, #0
		mov	R7, #1
		mov	R6, #2

code_C884:				; CODE XREF: code_C7F5+4Aj
					; code_C7F5+52j ...
		mov	DPTR, #0FA59h
		lcall	code_C967

code_C88A:				; CODE XREF: code_C7F5+46j
		ret
; End of function code_C7F5


; =============== S U B	R O U T	I N E =======================================


code_C88B:				; CODE XREF: RESET_0-C425p
		mov	R4, #9Dh ; 'Э'
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_C898
		setb	RAM_22.2

code_C898:				; CODE XREF: code_C88B+9j
		mov	R0, #94h ; 'Ф'
		mov	A, @R0
		mov	R1, A
		inc	R0
		mov	A, @R0
		mov	R2, A
		inc	R0
		mov	A, @R0
		mov	R3, A
		xrl	A, R1
		jnz	code_C8BD
		mov	A, R1
		xrl	A, R2
		jz	code_C8EB
		mov	A, R1
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #9Eh ; 'Ю'
		mov	R1, #1
		lcall	code_C125
		jnc	code_C8B8
		setb	RAM_22.2

code_C8B8:				; CODE XREF: code_C88B+29j
		lcall	code_C50D
		sjmp	code_C8EB
; ---------------------------------------------------------------------------

code_C8BD:				; CODE XREF: code_C88B+18j
		mov	A, R2
		xrl	A, R3
		jnz	code_C8D5
		mov	A, R3
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #9Dh ; 'Э'
		mov	R1, #1
		lcall	code_C125
		jnc	code_C8D0
		setb	RAM_22.2

code_C8D0:				; CODE XREF: code_C88B+41j
		lcall	code_C50D
		sjmp	code_C8EB
; ---------------------------------------------------------------------------

code_C8D5:				; CODE XREF: code_C88B+34j
		mov	A, R1
		xrl	A, R2
		jnz	code_C8EB
		mov	A, R1
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #9Fh ; 'Я'
		mov	R1, #1
		lcall	code_C125
		jnc	code_C8E8
		setb	RAM_22.2

code_C8E8:				; CODE XREF: code_C88B+59j
		lcall	code_C50D

code_C8EB:				; CODE XREF: code_C88B+1Cj
					; code_C88B+30j ...
		mov	R0, #94h ; 'Ф'
		mov	A, @R0
		mov	R5, A
		mov	DPTR, #0FA9Ah
		movx	@DPTR, A
		ret
; End of function code_C88B


; =============== S U B	R O U T	I N E =======================================


code_C8F4:				; CODE XREF: RESET_0-A7A4p
					; RESET_0-9009p
		mov	R0, #94h ; 'Ф'
		mov	R1, #3

code_C8F8:				; CODE XREF: code_C8F4+6j
		mov	@R0, A
		inc	R0
		djnz	R1, code_C8F8
		mov	R4, #9Dh ; 'Э'
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_C909
		setb	RAM_22.2

code_C909:				; CODE XREF: code_C8F4+11j
		lcall	code_C50D
		ret
; End of function code_C8F4


; =============== S U B	R O U T	I N E =======================================


code_C90D:				; CODE XREF: RESET_0-A79Bp
					; RESET_0-8FFAp
		mov	R0, #94h ; 'Ф'
		mov	R1, #3
		mov	DPTR, #0F942h
		movx	A, @DPTR

code_C915:				; CODE XREF: code_C90D+Aj
		mov	@R0, A
		inc	R0
		djnz	R1, code_C915
		mov	R4, #1Ch
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		lcall	code_C18D
		jnc	code_C926
		setb	RAM_22.2

code_C926:				; CODE XREF: code_C90D+15j
		lcall	code_C50D
		ret
; End of function code_C90D


; =============== S U B	R O U T	I N E =======================================


code_C92A:				; CODE XREF: RESET_0-A798p
					; RESET_0-8FF7p
		mov	R0, #94h ; 'Ф'
		mov	R1, #3
		mov	DPTR, #0FA43h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	B, #0		; B-Register

code_C93A:				; CODE XREF: code_C92A+16j
					; code_C92A+2Aj
		mov	A, R2
		mov	@R0, A
		inc	R0
		mov	A, R3
		mov	@R0, A
		inc	R0
		djnz	R1, code_C93A
		mov	A, B		; B-Register
		jnz	code_C956
		mov	R1, #3
		mov	DPTR, #0FA45h
		movx	A, @DPTR
		mov	R2, A
		inc	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		mov	R3, A
		mov	B, #1		; B-Register
		sjmp	code_C93A
; ---------------------------------------------------------------------------

code_C956:				; CODE XREF: code_C92A+1Aj
		mov	R4, #20h ; ' '
		mov	R1, #0Ch
		mov	R0, #94h ; 'Ф'
		lcall	code_C18D
		jnc	code_C963
		setb	RAM_22.2

code_C963:				; CODE XREF: code_C92A+35j
		lcall	code_C50D
		ret
; End of function code_C92A


; =============== S U B	R O U T	I N E =======================================


code_C967:				; CODE XREF: RESET_0-A79Ep
					; RESET_0-8FFDp ...
		mov	R7, #0
		mov	R0, #94h ; 'Ф'
		mov	R1, #8
		clr	RAM_22.2

code_C96F:				; CODE XREF: code_C967+Ej
		movx	A, @DPTR
		mov	@R0, A
		add	A, R7
		mov	R7, A
		inc	DPTR
		inc	R0
		djnz	R1, code_C96F
		mov	R4, #0
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C18D
		jnc	code_C984
		setb	RAM_22.2

code_C984:				; CODE XREF: code_C967+19j
		lcall	code_C50D
		mov	R4, #8
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C18D
		jnc	code_C994
		setb	RAM_22.2

code_C994:				; CODE XREF: code_C967+29j
		lcall	code_C50D
		mov	R4, #10h
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C18D
		jnc	code_C9A4
		setb	RAM_22.2

code_C9A4:				; CODE XREF: code_C967+39j
		mov	R0, #94h ; 'Ф'
		mov	R1, #3
		mov	A, R7

code_C9A9:				; CODE XREF: code_C967+44j
		mov	@R0, A
		inc	R0
		djnz	R1, code_C9A9
		lcall	code_C50D
		mov	R4, #18h
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		lcall	code_C18D
		jnc	code_C9BD
		setb	RAM_22.2

code_C9BD:				; CODE XREF: code_C967+52j
		lcall	code_C50D
		ret
; End of function code_C967


; =============== S U B	R O U T	I N E =======================================


code_C9C1:				; CODE XREF: code_C7F5+3Ap
					; code_CD8F+3Ap
		clr	C
		mov	R0, #94h ; 'Ф'

code_C9C4:				; CODE XREF: code_C9C1+9j
		movx	A, @DPTR
		xrl	A, @R0
		jnz	code_C9CE
		inc	R0
		inc	DPTR
		djnz	R1, code_C9C4
		sjmp	code_C9CF
; ---------------------------------------------------------------------------

code_C9CE:				; CODE XREF: code_C9C1+5j
		setb	C

code_C9CF:				; CODE XREF: code_C9C1+Bj
		ret
; End of function code_C9C1

; ---------------------------------------------------------------------------
		INIT_DB_ZERO	%0CA07h - $
		db    3
		db  35h	; 5
		db  16h
		db  10h
		db  16h
		db    3
		db    1
		db  35h	; 5
		db    3
		db  40h	; @
		db  16h
		db  12h
		db    6
		db    3
		db    6
		db    1
		db    5
		db  62h	; b
		db  11h
		db  71h	; q
		db    1
		db  12h
		db    1
		db  17h
		db    1
		db  31h	; 1
		db    1
		db  22h	; "
		db    1
		db    2
		db    3
		db  27h	; '
		db    5
		db  63h	; c
		db  11h
		db  72h	; r
		db    1
		db  13h
		db    1
		db  18h
		db    1
		db  32h	; 2
		db    1
		db  23h	; #
		db    1
		db    3
		db    3
		db  28h	; (
		db    3
		db  25h	; %
		db  16h
		db    0
		db  39h	; 9
		db  99h	; Щ
		db    1
		db  34h	; 4
		db    1
		db  72h	; r
		db    1
		db  71h	; q
		db    5
		db    1
		db    5
		db    5
		db  16h
		db  11h
		db  16h
		db    2
		db    3
		db  37h	; 7
		db    3
		db  38h	; 8
		db  15h
		db  14h
		db  15h
		db  13h
		db  15h
		db    9
		db    3
		db    0
		db    2
		db    1
		db    2
		db    2
		db    2
		db    3
		db    2
		db    4
		db    2
		db  61h	; a
		db    2
		db  64h	; d
		db    2
		db  67h	; g
		db    2
		db  70h	; p
		db    2
		db  62h	; b
		db    2
		db  65h	; e
		db    2
		db  68h	; h
		db    2
		db  71h	; q
		db    4
		db  43h	; C
		db  14h
		db  26h	; &
		db  14h
		db  25h	; %
		db  14h
		db  10h
		db    4
		db  80h	; А
		db  15h
		db  41h	; A
		db  15h
		db    1
		db  15h
		db    2
		db    3
		db    1
		db    3
		db    3
		db    3
		db    4
		db    3
		db    2
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db  60h	; `
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db  60h	; `
		db 0E0h	; р
		db  60h	; `		; Максимальная фаза впрыска | гр.п.к.в.
		db  60h	; `
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db  60h	; `
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р
		db 0E0h	; р

; =============== S U B	R O U T	I N E =======================================


code_CAC7:				; CODE XREF: RESET_0-C502p
		mov	A, R7
		jb	ACC.3, code_CAEC ; Accumulator
		anl	A, #3
		mov	B, #8		; B-Register
		mul	AB
		add	A, #50h	; 'P'
		mov	R4, A
		mov	R1, #6
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_CADF
		setb	RAM_22.2

code_CADF:				; CODE XREF: code_CAC7+14j
		mov	R1, #6
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F4A0h

code_CAE6:				; CODE XREF: code_CAC7+23j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_CAE6

code_CAEC:				; CODE XREF: code_CAC7+1j
		ret
; End of function code_CAC7


; =============== S U B	R O U T	I N E =======================================


code_CAED:				; CODE XREF: RESET_0-A77Ap
		mov	R1, #6
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F4A0h

code_CAF4:				; CODE XREF: code_CAED+Bj
		movx	A, @DPTR
		mov	@R0, A
		inc	R0
		inc	DPTR
		djnz	R1, code_CAF4
		clr	RAM_22.2
		mov	A, R7
		anl	A, #0F0h
		mov	R7, A
		mov	R4, #50h ; 'P'
		mov	R1, #6
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_CB27
		lcall	code_C50D
		inc	R7
		mov	R4, #58h ; 'X'
		mov	R1, #6
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_CB27
		lcall	code_C50D
		inc	R7
		mov	R4, #60h ; '`'
		mov	R1, #6
		mov	R0, #94h ; 'Ф'
		lcall	code_C125

code_CB27:				; CODE XREF: code_CAED+1Cj
					; code_CAED+2Bj
		mov	A, R7
		mov	ACC.2, C	; Accumulator
		mov	R7, A
		lcall	code_C50D
		ret
; End of function code_CAED


; =============== S U B	R O U T	I N E =======================================


code_CB2F:				; CODE XREF: RESET_0-A777p
		mov	A, R7
		anl	A, #3
		mov	B, #8		; B-Register
		mul	AB
		add	A, #50h	; 'P'
		mov	R4, A
		mov	R1, #6
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jc	code_CB53
		mov	R0, #94h ; 'Ф'
		mov	R1, #25h ; '%'
		mov	R2, #6

code_CB48:				; CODE XREF: code_CB2F+1Fj
		mov	A, @R0
		xrl	A, @R1
		jnz	code_CB52
		inc	R0
		inc	R1
		djnz	R2, code_CB48
		sjmp	code_CB53
; ---------------------------------------------------------------------------

code_CB52:				; CODE XREF: code_CB2F+1Bj
		setb	C

code_CB53:				; CODE XREF: code_CB2F+11j
					; code_CB2F+21j
		mov	A, R7
		mov	ACC.3, C	; Accumulator
		mov	R7, A
		ret
; End of function code_CB2F


; =============== S U B	R O U T	I N E =======================================


code_CB58:				; CODE XREF: RESET_0-C510p
		mov	R4, #2
		mov	R1, #6
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		mov	R7, #0
		jnc	code_CB69
		setb	RAM_22.2
		sjmp	code_CBA8
; ---------------------------------------------------------------------------

code_CB69:				; CODE XREF: code_CB58+Bj
		mov	R0, #94h ; 'Ф'
		mov	A, @R0
		mov	R1, A
		inc	R0
		mov	A, @R0
		mov	R2, A
		inc	R0
		mov	A, @R0
		mov	R3, A
		inc	R0
		mov	A, @R0
		mov	R4, A
		inc	R0
		mov	A, @R0
		mov	R5, A
		inc	R0
		mov	A, @R0
		mov	R6, A
		mov	A, R1
		xrl	A, R3
		jz	code_CB82
		mov	R7, #1

code_CB82:				; CODE XREF: code_CB58+26j
		mov	A, R1
		xrl	A, R5
		jz	code_CB88
		mov	R7, #1

code_CB88:				; CODE XREF: code_CB58+2Cj
		mov	A, R3
		xrl	A, R5
		jz	code_CB90
		mov	R7, #1
		sjmp	code_CB92
; ---------------------------------------------------------------------------

code_CB90:				; CODE XREF: code_CB58+32j
		mov	A, R3
		mov	R1, A

code_CB92:				; CODE XREF: code_CB58+36j
		mov	A, R2
		xrl	A, R4
		jz	code_CB98
		mov	R7, #1

code_CB98:				; CODE XREF: code_CB58+3Cj
		mov	A, R2
		xrl	A, R6
		jz	code_CB9E
		mov	R7, #1

code_CB9E:				; CODE XREF: code_CB58+42j
		mov	A, R4
		xrl	A, R6
		jz	code_CBA6
		mov	R7, #1
		sjmp	code_CBA8
; ---------------------------------------------------------------------------

code_CBA6:				; CODE XREF: code_CB58+48j
		mov	A, R4
		mov	R2, A

code_CBA8:				; CODE XREF: code_CB58+Fj
					; code_CB58+4Cj
		mov	DPTR, #0F47Ch
		mov	A, R1
		movx	@DPTR, A
		inc	DPTR
		mov	A, R2
		mov	R6, A
		movx	@DPTR, A
		mov	C, ACC.7	; Accumulator
		cpl	C
		mov	RAM_2D.2, C
		mov	C, ACC.6	; Accumulator
		cpl	C
		mov	RAM_2D.4, C
		mov	A, R7
		jz	code_CBDA
		mov	R0, #94h ; 'Ф'
		mov	R3, #3

code_CBC2:				; CODE XREF: code_CB58+70j
		mov	A, R1
		mov	@R0, A
		inc	R0
		mov	A, R2
		mov	@R0, A
		inc	R0
		djnz	R3, code_CBC2
		mov	R4, #2
		mov	R1, #6
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_CBD7
		setb	RAM_22.2

code_CBD7:				; CODE XREF: code_CB58+7Bj
		lcall	code_C50D

code_CBDA:				; CODE XREF: code_CB58+64j
		mov	DPTR, #0F47Ch
		movx	A, @DPTR
		mov	R7, A
		mov	DPTR, #0F4AEh
		movx	A, @DPTR
		mov	DPTR, #0F47Eh
		movx	@DPTR, A
		mov	DPTR, #0F4AFh
		movx	A, @DPTR
		mov	DPTR, #0F47Fh
		movx	@DPTR, A
		ret
; End of function code_CB58


; =============== S U B	R O U T	I N E =======================================


code_CBF0:				; CODE XREF: RESET_0-A771p
					; code_CF85+54p
		mov	R0, #94h ; 'Ф'
		mov	R1, #3
		mov	DPTR, #0F47Dh

code_CBF7:				; CODE XREF: code_CBF0+Dj
		mov	A, R7
		mov	@R0, A
		inc	R0
		movx	A, @DPTR
		mov	@R0, A
		inc	R0
		djnz	R1, code_CBF7
		mov	R4, #2
		mov	R1, #6
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		lcall	code_C50D
		ret
; End of function code_CBF0


; =============== S U B	R O U T	I N E =======================================


code_CC0C:				; CODE XREF: RESET_0-C505p
		mov	A, R7
		swap	A
		jb	ACC.3, code_CC32 ; Accumulator
		anl	A, #3
		mov	B, #8		; B-Register
		mul	AB
		add	A, #70h	; 'p'
		mov	R4, A
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_CC25
		setb	RAM_22.2

code_CC25:				; CODE XREF: code_CC0C+15j
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F4A6h

code_CC2C:				; CODE XREF: code_CC0C+24j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_CC2C

code_CC32:				; CODE XREF: code_CC0C+2j
		ret
; End of function code_CC0C


; =============== S U B	R O U T	I N E =======================================


code_CC33:				; CODE XREF: RESET_0-A780p
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F4A6h
		mov	R1, #8

code_CC3A:				; CODE XREF: code_CC33+Bj
		movx	A, @DPTR
		mov	@R0, A
		inc	DPTR
		inc	R0
		djnz	R1, code_CC3A
		mov	R6, #0
		mov	R4, #70h ; 'p'
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_CC5A
		lcall	code_C50D
		inc	R6
		mov	R4, #78h ; 'x'
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C125

code_CC5A:				; CODE XREF: code_CC33+18j
		mov	A, R7
		swap	A
		anl	A, #0F0h
		orl	A, R6
		mov	ACC.2, C	; Accumulator
		swap	A
		mov	R7, A
		lcall	code_C50D
		ret
; End of function code_CC33


; =============== S U B	R O U T	I N E =======================================


code_CC67:				; CODE XREF: RESET_0:code_426Ep
		mov	A, R7
		swap	A
		anl	A, #3
		mov	B, #8		; B-Register
		mul	AB
		add	A, #70h	; 'p'
		mov	R4, A
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jc	code_CC8D
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F4A6h
		mov	R2, #8

code_CC82:				; CODE XREF: code_CC67+21j
		movx	A, @DPTR
		xrl	A, @R0
		jnz	code_CC8C
		inc	R0
		inc	DPTR
		djnz	R2, code_CC82
		sjmp	code_CC8D
; ---------------------------------------------------------------------------

code_CC8C:				; CODE XREF: code_CC67+1Dj
		setb	C

code_CC8D:				; CODE XREF: code_CC67+12j
					; code_CC67+23j
		mov	A, R7
		mov	ACC.7, C	; Accumulator
		mov	R7, A
		ret
; End of function code_CC67


; =============== S U B	R O U T	I N E =======================================


code_CC92:				; CODE XREF: RESET_0-A813p
		mov	DPTR, #0F4A6h
		movx	A, @DPTR
		xrl	A, TH1		; Timer	1, High	Byte
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		xrl	A, TL1		; Timer	1, Low Byte
		movx	@DPTR, A
		mov	DPTR, #0F813h
		movx	A, @DPTR
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0F4A8h
		movx	A, @DPTR
		xrl	A, R0
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		xrl	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F81Bh
		movx	A, @DPTR
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0F4AAh
		movx	A, @DPTR
		xrl	A, R0
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		xrl	A, R1
		movx	@DPTR, A
		mov	DPTR, #0F81Dh
		movx	A, @DPTR
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		mov	R1, A
		mov	DPTR, #0F4ACh
		movx	A, @DPTR
		xrl	A, R0
		movx	@DPTR, A
		inc	DPTR
		movx	A, @DPTR
		xrl	A, R1
		movx	@DPTR, A
		ret
; End of function code_CC92


; =============== S U B	R O U T	I N E =======================================


code_CCD5:				; CODE XREF: code_CD3Ap
		mov	R4, #98h ; 'Ш'
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_CCE2
		setb	RAM_22.2

code_CCE2:				; CODE XREF: code_CCD5+9j
		mov	R0, #94h ; 'Ф'
		mov	A, @R0
		mov	R1, A
		inc	R0
		mov	A, @R0
		mov	R2, A
		inc	R0
		mov	A, @R0
		mov	R3, A
		xrl	A, R1
		jnz	code_CD07
		mov	A, R1
		xrl	A, R2
		jz	code_CD35
		mov	A, R1
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #99h ; 'Щ'
		mov	R1, #1
		lcall	code_C125
		jnc	code_CD02
		setb	RAM_22.2

code_CD02:				; CODE XREF: code_CCD5+29j
		lcall	code_C50D
		sjmp	code_CD35
; ---------------------------------------------------------------------------

code_CD07:				; CODE XREF: code_CCD5+18j
		mov	A, R2
		xrl	A, R3
		jnz	code_CD1F
		mov	A, R3
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #98h ; 'Ш'
		mov	R1, #1
		lcall	code_C125
		jnc	code_CD1A
		setb	RAM_22.2

code_CD1A:				; CODE XREF: code_CCD5+41j
		lcall	code_C50D
		sjmp	code_CD35
; ---------------------------------------------------------------------------

code_CD1F:				; CODE XREF: code_CCD5+34j
		mov	A, R1
		xrl	A, R2
		jnz	code_CD35
		mov	A, R1
		mov	R0, #94h ; 'Ф'
		mov	@R0, A
		mov	R4, #9Ah ; 'Ъ'
		mov	R1, #1
		lcall	code_C125
		jnc	code_CD32
		setb	RAM_22.2

code_CD32:				; CODE XREF: code_CCD5+59j
		lcall	code_C50D

code_CD35:				; CODE XREF: code_CCD5+1Cj
					; code_CCD5+30j ...
		mov	R0, #94h ; 'Ф'
		mov	A, @R0
		mov	R5, A
		ret
; End of function code_CCD5


; =============== S U B	R O U T	I N E =======================================


code_CD3A:				; CODE XREF: RESET_0:code_24CFp
		lcall	code_CCD5
		mov	RAM_7E,	#0
		mov	R7, #0
		mov	R6, #3

code_CD44:				; CODE XREF: code_CD3A+3Fj
		mov	A, R7
		mov	B, #8		; B-Register
		mul	AB
		add	A, #80h	; 'А'
		mov	R4, A
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_CD57
		setb	RAM_22.2

code_CD57:				; CODE XREF: code_CD3A+19j
		mov	R0, #94h ; 'Ф'
		mov	R1, #8
		mov	R4, #0

code_CD5D:				; CODE XREF: code_CD3A+27j
		mov	A, @R0
		add	A, R4
		mov	R4, A
		inc	R0
		djnz	R1, code_CD5D
		mov	A, R4
		xrl	A, R5
		jz	code_CD6B
		inc	RAM_7E
		sjmp	code_CD78
; ---------------------------------------------------------------------------

code_CD6B:				; CODE XREF: code_CD3A+2Bj
		mov	R0, #94h ; 'Ф'
		mov	R1, #8
		mov	DPTR, #0F4AEh

code_CD72:				; CODE XREF: code_CD3A+3Cj
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_CD72

code_CD78:				; CODE XREF: code_CD3A+2Fj
		inc	R7
		djnz	R6, code_CD44
		mov	A, RAM_7E
		jz	code_CD8E
		xrl	A, #3
		jz	code_CD8B
		mov	DPTR, #0F4AEh
		lcall	code_CE02
		sjmp	code_CD8E
; ---------------------------------------------------------------------------

code_CD8B:				; CODE XREF: code_CD3A+47j
		lcall	code_CD8F

code_CD8E:				; CODE XREF: code_CD3A+43j
					; code_CD3A+4Fj
		ret
; End of function code_CD3A


; =============== S U B	R O U T	I N E =======================================


code_CD8F:				; CODE XREF: code_CD3A:code_CD8Bp
		mov	RAM_7E,	#0
		mov	RAM_51,	#0
		mov	R5, #0
		mov	R7, #0
		mov	R6, #3

code_CD9B:				; CODE XREF: code_CD8F+43j
		mov	A, R7
		mov	B, #8		; B-Register
		mul	AB
		add	A, #80h	; 'А'
		mov	R4, A
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_CDB0
		setb	RAM_22.2
		sjmp	code_CDD1
; ---------------------------------------------------------------------------

code_CDB0:				; CODE XREF: code_CD8F+1Bj
		mov	A, R5
		jnz	code_CDC4
		mov	R1, #8
		mov	DPTR, #0F4AEh
		mov	R0, #94h ; 'Ф'

code_CDBA:				; CODE XREF: code_CD8F+2Fj
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_CDBA
		mov	R5, #1
		sjmp	code_CDD1
; ---------------------------------------------------------------------------

code_CDC4:				; CODE XREF: code_CD8F+22j
		mov	R1, #8
		mov	DPTR, #0F4AEh
		lcall	code_C9C1
		mov	A, RAM_7E
		rlc	A
		mov	RAM_7E,	A

code_CDD1:				; CODE XREF: code_CD8F+1Fj
					; code_CD8F+33j
		inc	R7
		djnz	R6, code_CD9B
		mov	A, R5
		jz	code_CE01
		mov	A, RAM_7E
		jz	code_CDFB
		xrl	A, #3
		jz	code_CDEF
		mov	A, RAM_7E
		jb	ACC.1, code_CDFB ; Accumulator
		jnb	ACC.0, code_CDFB ; Accumulator
		mov	A, RAM_51
		jz	code_CDFB
		setb	RAM_22.2
		sjmp	code_CE01
; ---------------------------------------------------------------------------

code_CDEF:				; CODE XREF: code_CD8F+4Ej
		mov	RAM_7E,	#0
		mov	RAM_51,	#1
		mov	R5, #0
		mov	R7, #1
		mov	R6, #2

code_CDFB:				; CODE XREF: code_CD8F+4Aj
					; code_CD8F+52j ...
		mov	DPTR, #0F4AEh
		lcall	code_CE02

code_CE01:				; CODE XREF: code_CD8F+46j
					; code_CD8F+5Ej
		ret
; End of function code_CD8F


; =============== S U B	R O U T	I N E =======================================


code_CE02:				; CODE XREF: code_CD3A+4Cp
					; code_CD8F+6Fp ...
		mov	R7, #0
		mov	R0, #94h ; 'Ф'
		mov	R1, #8
		clr	RAM_22.2

code_CE0A:				; CODE XREF: code_CE02+Ej
		movx	A, @DPTR
		mov	@R0, A
		add	A, R7
		mov	R7, A
		inc	DPTR
		inc	R0
		djnz	R1, code_CE0A
		mov	R4, #80h ; 'А'
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_CE1F
		setb	RAM_22.2

code_CE1F:				; CODE XREF: code_CE02+19j
		lcall	code_C50D
		mov	R4, #88h ; 'И'
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_CE2F
		setb	RAM_22.2

code_CE2F:				; CODE XREF: code_CE02+29j
		lcall	code_C50D
		mov	R4, #90h ; 'Р'
		mov	R1, #8
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_CE3F
		setb	RAM_22.2

code_CE3F:				; CODE XREF: code_CE02+39j
		mov	R0, #94h ; 'Ф'
		mov	R1, #3
		mov	A, R7

code_CE44:				; CODE XREF: code_CE02+44j
		mov	@R0, A
		inc	R0
		djnz	R1, code_CE44
		lcall	code_C50D
		mov	R4, #98h ; 'Ш'
		mov	R1, #3
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_CE58
		setb	RAM_22.2

code_CE58:				; CODE XREF: code_CE02+52j
		lcall	code_C50D
		ret
; End of function code_CE02


; =============== S U B	R O U T	I N E =======================================


code_CE5C:				; CODE XREF: code_CF85+46p
		mov	R0, #94h ; 'Ф'
		mov	DPTR, #0F4AEh
		mov	R1, #8

code_CE63:				; CODE XREF: code_CE5C+Bj
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		inc	R0
		djnz	R1, code_CE63
		ret
; End of function code_CE5C


; =============== S U B	R O U T	I N E =======================================


code_CE6A:				; CODE XREF: RESET_0-904Dp
		mov	A, RAM_78
		clr	C
		subb	A, #0Ah
		jc	code_CEB2
		mov	DPTR, #0F4B6h
		movx	A, @DPTR
		mov	R3, A
		xrl	A, #4
		jnz	code_CEA6
		jb	RAM_2F.6, code_CE8E
		clr	S0CON.4		; Serial Channel 0 Control Register
		anl	IEN3, #0F7h	; Interrupt Enable Register 3
		mov	RAM_2F,	#0
		setb	RAM_2D.0
		lcall	code_C1B9
		setb	RAM_2F.6
		sjmp	code_CEB2
; ---------------------------------------------------------------------------

code_CE8E:				; CODE XREF: code_CE6A+10j
		jnb	RAM_2D.2, code_CEA1
		jnb	RAM_25.1, code_CEA1
		clr	RAM_2D.3
		jb	RAM_29.5, code_CEA1
		mov	DPTR, #0F4B9h
		movx	A, @DPTR
		inc	A
		jz	code_CEA1
		movx	@DPTR, A

code_CEA1:				; CODE XREF: code_CE6A:code_CE8Ej
					; code_CE6A+27j ...
		lcall	code_D04C
		sjmp	code_CEB2
; ---------------------------------------------------------------------------

code_CEA6:				; CODE XREF: code_CE6A+Ej
		mov	A, R3
		inc	A
		mov	DPTR, #0F4B6h
		movx	@DPTR, A
		lcall	code_C244
		lcall	code_C225

code_CEB2:				; CODE XREF: code_CE6A+5j
					; code_CE6A+22j ...
		ret
; End of function code_CE6A


; =============== S U B	R O U T	I N E =======================================


code_CEB3:				; CODE XREF: RESET_0:code_593Ap
		mov	DPTR, #0F4B6h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		lcall	code_CEBD
		ret
; End of function code_CEB3


; =============== S U B	R O U T	I N E =======================================


code_CEBD:				; CODE XREF: code_CEB3+6p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #82h	; 'В'
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0C0h ; 'L'
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0A0h ; 'а'
		movx	@DPTR, A
		inc	DPTR
		clr	A
		mov	C, RAM_2D.2
		mov	ACC.0, C	; Accumulator
		mov	C, RAM_29.5
		cpl	C
		mov	ACC.1, C	; Accumulator
		mov	C, RAM_2A.6
		mov	ACC.2, C	; Accumulator
		mov	C, RAM_2D.5
		mov	ACC.3, C	; Accumulator
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#5
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		setb	RAM_2F.4
		ret
; End of function code_CEBD


; =============== S U B	R O U T	I N E =======================================


code_CEF4:				; CODE XREF: code_CF85:code_D006p
		mov	A, #1
		mov	DPTR, #0F4B6h
		movx	@DPTR, A
		lcall	code_CEFE
		ret
; End of function code_CEF4


; =============== S U B	R O U T	I N E =======================================


code_CEFE:				; CODE XREF: code_CEF4+6p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #8Ah	; 'К'
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0C0h ; 'L'
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0AAh ; 'к'
		movx	@DPTR, A
		inc	DPTR
		mov	A, #80h	; 'А'
		mov	C, RAM_2D.3
		mov	ACC.0, C	; Accumulator
		mov	C, RAM_2F.2
		mov	ACC.1, C	; Accumulator
		clr	RAM_2F.2
		mov	C, RAM_2D.4
		mov	ACC.2, C	; Accumulator
		mov	C, RAM_2D.2
		cpl	C
		mov	ACC.3, C	; Accumulator
		movx	@DPTR, A
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F605h
		mov	R2, #8
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPTR, #0F4A6h
		lcall	COPY_RAM
		mov	RAM_51,	#0Dh
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		setb	RAM_2F.4
		ret
; End of function code_CEFE


; =============== S U B	R O U T	I N E =======================================


code_CF48:				; CODE XREF: code_CF85+62p
					; code_D584+1Ap ...
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #8Ah	; 'К'
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0C0h ; 'L'
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0AAh ; 'к'
		movx	@DPTR, A
		inc	DPTR
		mov	A, #0C0h ; 'L'
		mov	C, RAM_2D.3
		mov	ACC.0, C	; Accumulator
		mov	C, RAM_2F.2
		mov	ACC.1, C	; Accumulator
		mov	C, RAM_2D.4
		mov	ACC.2, C	; Accumulator
		mov	C, RAM_2D.2
		cpl	C
		mov	ACC.3, C	; Accumulator
		movx	@DPTR, A
		inc	DPTR
		mov	A, R3
		movx	@DPTR, A
		mov	DPTR, #0F60Eh
		mov	RAM_51,	#0Dh
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		setb	RAM_2F.4
		ret
; End of function code_CF48


; =============== S U B	R O U T	I N E =======================================


code_CF85:				; CODE XREF: code_D5EA+90p
		mov	DPTR, #0F704h
		movx	A, @DPTR
		mov	R4, A
		jb	RAM_2D.2, code_CFEC
		jb	RAM_2D.4, code_CFA1
		jb	ACC.2, code_CF9B ; Accumulator
		jnb	ACC.0, code_D006 ; Accumulator
		jnb	ACC.1, code_D006 ; Accumulator
		sjmp	code_D004
; ---------------------------------------------------------------------------

code_CF9B:				; CODE XREF: code_CF85+Bj
		setb	RAM_2D.4
		clr	RAM_2D.3
		sjmp	code_D006
; ---------------------------------------------------------------------------

code_CFA1:				; CODE XREF: code_CF85+8j
					; code_CF85:code_CFECj
		clr	RAM_2D.4
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		anl	A, #0FDh
		movx	@DPTR, A
		lcall	code_D0CC
		jnb	RAM_2D.3, code_D006
		mov	A, R4
		jnb	ACC.2, code_D006 ; Accumulator
		jnb	ACC.3, code_D006 ; Accumulator
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	WDTREL,	#80h ; 'А' ; Watchdog Timer Reload Register
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		clr	RAM_2F.2
		mov	DPTR, #0F4A6h
		lcall	code_CE02
		jb	RAM_22.2, code_CFE3
		lcall	code_CE5C
		setb	RAM_2F.2
		setb	RAM_2D.2
		setb	RAM_2D.3
		lcall	code_D0F3
		mov	R7, #0
		lcall	code_CBF0
		setb	IEN0.7		; Interrupt Enable Register 0
		jb	RAM_22.2, code_CFE3
		sjmp	code_D006
; ---------------------------------------------------------------------------

code_CFE3:				; CODE XREF: code_CF85+43j
					; code_CF85+59j
		setb	IEN0.7		; Interrupt Enable Register 0
		mov	R3, #10h
		lcall	code_CF48
		sjmp	code_D009
; ---------------------------------------------------------------------------

code_CFEC:				; CODE XREF: code_CF85+5j
		jb	RAM_2D.4, code_CFA1
		jnb	ACC.2, code_CFFC ; Accumulator
		lcall	code_D098
		jnb	RAM_2D.3, code_D006
		setb	RAM_2D.4
		sjmp	code_D006
; ---------------------------------------------------------------------------

code_CFFC:				; CODE XREF: code_CF85+6Aj
		jb	ACC.1, code_D004 ; Accumulator
		lcall	code_D098
		sjmp	code_D006
; ---------------------------------------------------------------------------

code_D004:				; CODE XREF: code_CF85+14j
					; code_CF85:code_CFFCj
		clr	RAM_2D.3

code_D006:				; CODE XREF: code_CF85+Ej
					; code_CF85+11j ...
		lcall	code_CEF4

code_D009:				; CODE XREF: code_CF85+65j
		ret
; End of function code_CF85


; =============== S U B	R O U T	I N E =======================================


code_D00A:				; CODE XREF: code_D5EA+9Ap
		mov	DPTR, #0F704h
		movx	A, @DPTR
		jb	RAM_2D.2, code_D015
		clr	RAM_25.1
		sjmp	code_D048
; ---------------------------------------------------------------------------

code_D015:				; CODE XREF: code_D00A+4j
		xrl	A, #1
		jnz	code_D048
		jb	RAM_2D.3, code_D046
		mov	DPTR, #0F4B6h
		movx	A, @DPTR
		xrl	A, #2
		jnz	code_D046
		clr	S0CON.4		; Serial Channel 0 Control Register
		anl	IEN3, #0F7h	; Interrupt Enable Register 3
		mov	RAM_78,	#33h ; '3'
		mov	RAM_51,	#3
		mov	R0, #91h ; 'С'
		mov	@R0, #0
		mov	RAM_2F,	#0
		mov	A, #1
		mov	DPTR, #0F4BAh
		movx	@DPTR, A
		clr	RAM_2D.1
		setb	RAM_2D.3
		setb	RAM_2F.6
		setb	RAM_2D.0
		sjmp	code_D04B
; ---------------------------------------------------------------------------

code_D046:				; CODE XREF: code_D00A+Fj
					; code_D00A+18j
		clr	RAM_25.1

code_D048:				; CODE XREF: code_D00A+9j code_D00A+Dj
		lcall	code_D04C

code_D04B:				; CODE XREF: code_D00A+3Aj
		ret
; End of function code_D00A


; =============== S U B	R O U T	I N E =======================================


code_D04C:				; CODE XREF: RESET_0:code_5915p
					; code_CE6A:code_CEA1p	...
		clr	S0CON.4		; Serial Channel 0 Control Register
		anl	IEN3, #0F7h	; Interrupt Enable Register 3
		clr	RAM_2D.1
		clr	RAM_2F.6
		lcall	code_D0F3
		mov	RAM_2F,	#1
		jb	RAM_25.1, code_D06E
		clr	A
		mov	DPTR, #0F4EBh
		movx	@DPTR, A
		mov	DPTR, #0F52Bh
		movx	@DPTR, A
		mov	DPTR, #0F4CDh
		movx	A, @DPTR
		anl	A, #0FDh
		movx	@DPTR, A

code_D06E:				; CODE XREF: code_D04C+Fj
		clr	A
		mov	RAM_78,	A
		mov	DPTR, #0F4B8h
		movx	@DPTR, A
		mov	DPTR, #0F4BAh
		movx	@DPTR, A
		mov	DPTR, #0F4B7h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		lcall	code_D5DB
		ret
; End of function code_D04C


; =============== S U B	R O U T	I N E =======================================


code_D083:				; CODE XREF: code_D5EA+A4p
		mov	DPTR, #0F603h
		movx	A, @DPTR
		xrl	A, #0A0h
		jnz	code_D092
		mov	RAM_51,	#6
		setb	RAM_2F.4
		sjmp	code_D097
; ---------------------------------------------------------------------------

code_D092:				; CODE XREF: code_D083+6j
		mov	RAM_51,	#0Eh
		setb	RAM_2F.4

code_D097:				; CODE XREF: code_D083+Dj
		ret
; End of function code_D083


; =============== S U B	R O U T	I N E =======================================


code_D098:				; CODE XREF: code_CF85+6Dp
					; code_CF85+7Ap
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F705h
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPTR, #0F4A0h
		mov	R2, #6

code_D0A8:				; CODE XREF: code_D098+20j
		movx	A, @DPTR
		mov	B, A		; B-Register
		inc	DPTR
		mov	DPSEL, #4	; Data Pointer Select Register
		movx	A, @DPTR
		xrl	A, B		; B-Register
		jnz	code_D0C7
		inc	DPTR
		mov	DPSEL, #3	; Data Pointer Select Register
		djnz	R2, code_D0A8
		setb	RAM_2D.3
		jb	IEN1.5,	code_D0C9 ; Interrupt Enable Register 1
		jb	RAM_29.4, code_D0C9
		lcall	code_B304
		sjmp	code_D0C9
; ---------------------------------------------------------------------------

code_D0C7:				; CODE XREF: code_D098+1Aj
		clr	RAM_2D.3

code_D0C9:				; CODE XREF: code_D098+24j
					; code_D098+27j ...
		pop	DPSEL		; Data Pointer Select Register
		ret
; End of function code_D098


; =============== S U B	R O U T	I N E =======================================


code_D0CC:				; CODE XREF: code_CF85+25p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F705h
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPTR, #0F4A6h
		mov	R2, #8

code_D0DC:				; CODE XREF: code_D0CC+1Ej
		movx	A, @DPTR
		mov	R3, A
		inc	DPTR
		mov	DPSEL, #4	; Data Pointer Select Register
		movx	A, @DPTR
		xrl	A, R3
		jnz	code_D0EE
		inc	DPTR
		mov	DPSEL, #3	; Data Pointer Select Register
		djnz	R2, code_D0DC
		sjmp	code_D0F0
; ---------------------------------------------------------------------------

code_D0EE:				; CODE XREF: code_D0CC+18j
		clr	RAM_2D.3

code_D0F0:				; CODE XREF: code_D0CC+20j
		pop	DPSEL		; Data Pointer Select Register
		ret
; End of function code_D0CC


; =============== S U B	R O U T	I N E =======================================


code_D0F3:				; CODE XREF: code_CF85+4Fp
					; code_D04C+9p
		mov	DPTR, #0F4B6h
		movx	A, @DPTR
		dec	A
		anl	A, #7
		orl	A, #0F0h
		mov	DPTR, #0F47Dh
		mov	C, RAM_2D.2
		cpl	C
		mov	ACC.7, C	; Accumulator
		mov	C, RAM_2D.4
		cpl	C
		mov	ACC.6, C	; Accumulator
		mov	C, RAM_2D.3
		cpl	C
		mov	ACC.5, C	; Accumulator
		mov	C, RAM_25.1
		cpl	C
		mov	ACC.4, C	; Accumulator
		movx	@DPTR, A
		ret
; End of function code_D0F3


; =============== S U B	R O U T	I N E =======================================


code_D115:				; CODE XREF: code_D32C+38p
		mov	R0, #94h ; 'Ф'
		mov	R1, #4
		clr	RAM_22.2

code_D11B:				; CODE XREF: code_D115+Aj
		movx	A, @DPTR
		mov	@R0, A
		inc	DPTR
		inc	R0
		djnz	R1, code_D11B
		mov	R4, #8
		mov	R1, #4
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_D12E
		setb	RAM_22.2

code_D12E:				; CODE XREF: code_D115+15j
		lcall	code_C50D
		mov	R4, #0Ch
		mov	R1, #4
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_D13E
		setb	RAM_22.2

code_D13E:				; CODE XREF: code_D115+25j
		lcall	code_C50D
		mov	R4, #2Ch ; ','
		mov	R1, #4
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_D14E
		setb	RAM_22.2

code_D14E:				; CODE XREF: code_D115+35j
		jnb	RAM_22.2, code_D158
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		anl	A, #7Fh
		movx	@DPTR, A

code_D158:				; CODE XREF: code_D115:code_D14Ej
		lcall	code_C50D
		ret
; End of function code_D115


; =============== S U B	R O U T	I N E =======================================


code_D15C:				; CODE XREF: RESET_0:code_25CFp
		lcall	code_D3D1
		mov	R4, #8
		mov	R1, #4
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		mov	R7, #0
		jnc	code_D172
		setb	RAM_22.2
		mov	R7, #1
		sjmp	code_D178
; ---------------------------------------------------------------------------

code_D172:				; CODE XREF: code_D15C+Ej
		mov	DPTR, #0F4BDh
		lcall	code_D23C

code_D178:				; CODE XREF: code_D15C+14j
		mov	R4, #0Ch
		mov	R1, #4
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		mov	DPTR, #0F4C1h
		lcall	code_D23C
		jnc	code_D191
		setb	RAM_22.2
		mov	A, R7
		orl	A, #2
		mov	R7, A
		sjmp	code_D1A8
; ---------------------------------------------------------------------------

code_D191:				; CODE XREF: code_D15C+2Bj
		mov	A, R7
		jz	code_D19C
		mov	DPTR, #0F4BDh
		lcall	code_D23C
		sjmp	code_D1A8
; ---------------------------------------------------------------------------

code_D19C:				; CODE XREF: code_D15C+36j
		mov	DPTR, #0F4BDh
		lcall	code_D252
		jnc	code_D1A8
		mov	A, R7
		orl	A, #10h
		mov	R7, A

code_D1A8:				; CODE XREF: code_D15C+33j
					; code_D15C+3Ej ...
		mov	R4, #2Ch ; ','
		mov	R1, #4
		mov	R0, #94h ; 'Ф'
		lcall	code_C0E9
		jnc	code_D1BB
		setb	RAM_22.2
		mov	A, R7
		orl	A, #4
		mov	R7, A
		sjmp	code_D1C8
; ---------------------------------------------------------------------------

code_D1BB:				; CODE XREF: code_D15C+55j
		mov	A, R7
		anl	A, #0Fh
		jz	code_D1C8
		mov	DPTR, #0F4BDh
		lcall	code_D23C
		sjmp	code_D1D4
; ---------------------------------------------------------------------------

code_D1C8:				; CODE XREF: code_D15C+5Dj
					; code_D15C+62j
		mov	DPTR, #0F4BDh
		lcall	code_D252
		jnc	code_D1D4
		mov	A, R7
		orl	A, #20h
		mov	R7, A

code_D1D4:				; CODE XREF: code_D15C+6Aj
					; code_D15C+72j
		mov	A, R7
		jz	code_D1DA
		lcall	code_D1E5

code_D1DA:				; CODE XREF: code_D15C+79j
		mov	DPTR, #0F4C0h
		movx	A, @DPTR
		mov	DPTR, #0F4C5h
		orl	A, #0FEh
		movx	@DPTR, A
		ret
; End of function code_D15C


; =============== S U B	R O U T	I N E =======================================


code_D1E5:				; CODE XREF: code_D15C+7Bp
		mov	A, R7
		anl	A, #0Fh
		jnz	code_D239
		mov	A, R7
		mov	C, ACC.4	; Accumulator
		anl	C, ACC.5	; Accumulator
		jnc	code_D20C
		mov	DPTR, #0F4C1h
		lcall	code_D247
		mov	DPTR, #0F4BDh
		lcall	code_D252
		jc	code_D239
		mov	R4, #8
		mov	R1, #4
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_D23B
		sjmp	code_D239
; ---------------------------------------------------------------------------

code_D20C:				; CODE XREF: code_D1E5+Aj
		mov	A, R7
		jb	ACC.4, code_D215 ; Accumulator
		jb	ACC.5, code_D228 ; Accumulator
		sjmp	code_D23B
; ---------------------------------------------------------------------------

code_D215:				; CODE XREF: code_D1E5+28j
		mov	DPTR, #0F4BDh
		lcall	code_D247
		mov	R4, #0Ch
		mov	R1, #4
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_D23B
		sjmp	code_D239
; ---------------------------------------------------------------------------

code_D228:				; CODE XREF: code_D1E5+2Bj
		mov	DPTR, #0F4BDh
		lcall	code_D247
		mov	R4, #2Ch ; ','
		mov	R1, #4
		mov	R0, #94h ; 'Ф'
		lcall	code_C125
		jnc	code_D23B

code_D239:				; CODE XREF: code_D1E5+3j
					; code_D1E5+18j ...
		setb	RAM_22.2

code_D23B:				; CODE XREF: code_D1E5+23j
					; code_D1E5+2Ej ...
		ret
; End of function code_D1E5


; =============== S U B	R O U T	I N E =======================================


code_D23C:				; CODE XREF: code_D15C+19p
					; code_D15C+28p ...
		mov	R0, #94h ; 'Ф'
		mov	R1, #4

code_D240:				; CODE XREF: code_D23C+8j
		mov	A, @R0
		movx	@DPTR, A
		inc	R0
		inc	DPTR
		djnz	R1, code_D240
		ret
; End of function code_D23C


; =============== S U B	R O U T	I N E =======================================


code_D247:				; CODE XREF: code_D1E5+Fp
					; code_D1E5+33p ...
		mov	R0, #94h ; 'Ф'
		mov	R1, #4

code_D24B:				; CODE XREF: code_D247+8j
		movx	A, @DPTR
		mov	@R0, A
		inc	R0
		inc	DPTR
		djnz	R1, code_D24B
		ret
; End of function code_D247


; =============== S U B	R O U T	I N E =======================================


code_D252:				; CODE XREF: code_D15C+43p
					; code_D15C+6Fp ...
		clr	C
		mov	R0, #94h ; 'Ф'

code_D255:				; CODE XREF: code_D252+7j
		movx	A, @DPTR
		xrl	A, @R0
		jnz	code_D25D
		djnz	R2, code_D255
		sjmp	code_D25E
; ---------------------------------------------------------------------------

code_D25D:				; CODE XREF: code_D252+5j
		setb	C

code_D25E:				; CODE XREF: code_D252+9j
		ret
; End of function code_D252


; =============== S U B	R O U T	I N E =======================================


code_D25F:				; CODE XREF: RESET_0:code_5981p
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		jb	ACC.6, code_D285 ; Accumulator
		jb	ACC.7, code_D270 ; Accumulator
		jnb	RAM_29.1, code_D285
		cpl	RAM_2E.0
		sjmp	code_D285
; ---------------------------------------------------------------------------

code_D270:				; CODE XREF: code_D25F+7j
		lcall	code_D286
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		jb	ACC.1, code_D27F ; Accumulator
		lcall	code_D32C
		sjmp	code_D285
; ---------------------------------------------------------------------------

code_D27F:				; CODE XREF: code_D25F+18j
		jb	ACC.0, code_D285 ; Accumulator
		lcall	code_D382

code_D285:				; CODE XREF: code_D25F+4j code_D25F+Aj ...
		ret
; End of function code_D25F


; =============== S U B	R O U T	I N E =======================================


code_D286:				; CODE XREF: code_D25F:code_D270p
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		jnb	ACC.7, code_D2A0 ; Accumulator
		jnb	RAM_29.1, code_D2A3
		mov	DPTR, #0F4C6h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, #3Ch, code_D2A3 ; '<'
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		anl	A, #7Fh
		movx	@DPTR, A

code_D2A0:				; CODE XREF: code_D286+4j
		ljmp	code_D32B
; ---------------------------------------------------------------------------

code_D2A3:				; CODE XREF: code_D286+7j
					; code_D286+10j
		mov	DPTR, #0F4C8h
		movx	A, @DPTR
		jnz	code_D2D3
		mov	A, #50h	; 'P'
		cjne	A, THR_CODE, code_D2AE

code_D2AE:
		jnc	code_D2D3
		setb	RAM_2E.0
		mov	DPTR, #0F4C7h
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		cjne	A, #0FAh, code_D2BB ; '·'

code_D2BB:
		jc	code_D2CC
		clr	RAM_2E.0
		mov	A, #1
		mov	DPTR, #0F4C8h
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F4C7h
		movx	@DPTR, A
		sjmp	code_D2FA
; ---------------------------------------------------------------------------

code_D2CC:				; CODE XREF: code_D286:code_D2BBj
		clr	A
		mov	DPTR, #0F4C6h
		movx	@DPTR, A
		sjmp	code_D32B
; ---------------------------------------------------------------------------

code_D2D3:				; CODE XREF: code_D286+21j
					; code_D286:code_D2AEj
		mov	A, #0Ah
		cjne	A, THR_CODE, code_D2D8

code_D2D8:
		jc	code_D32B
		clr	RAM_2E.0
		clr	A
		mov	DPTR, #0F4C8h
		movx	@DPTR, A
		mov	DPTR, #0F4C7h
		movx	A, @DPTR
		jz	code_D32B
		mov	DPTR, #0F4BBh
		movx	A, @DPTR
		inc	A
		anl	A, #0Fh
		movx	@DPTR, A
		clr	A
		mov	DPTR, #0F4C7h
		movx	@DPTR, A
		mov	DPTR, #0F4C6h
		movx	@DPTR, A
		sjmp	code_D32B
; ---------------------------------------------------------------------------

code_D2FA:				; CODE XREF: code_D286+44j
		mov	DPTR, #0F4BBh
		movx	A, @DPTR
		jnz	code_D309
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		anl	A, #0EBh
		movx	@DPTR, A
		sjmp	code_D315
; ---------------------------------------------------------------------------

code_D309:				; CODE XREF: code_D286+78j
		cjne	A, #0Ah, code_D30C

code_D30C:
		jc	code_D315
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		anl	A, #0FBh
		movx	@DPTR, A

code_D315:				; CODE XREF: code_D286+81j
					; code_D286:code_D30Cj
		mov	DPTR, #0F4BCh
		movx	A, @DPTR
		inc	A
		movx	@DPTR, A
		lcall	code_D3FF
		clr	A
		mov	DPTR, #0F4C7h
		movx	@DPTR, A
		mov	DPTR, #0F4BBh
		movx	@DPTR, A
		mov	DPTR, #0F4C6h
		movx	@DPTR, A

code_D32B:				; CODE XREF: code_D286:code_D2A0j
					; code_D286+4Bj ...
		ret
; End of function code_D286


; =============== S U B	R O U T	I N E =======================================


code_D32C:				; CODE XREF: code_D25F+1Bp
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		jb	ACC.2, code_D352 ; Accumulator
		jnb	ACC.4, code_D338 ; Accumulator
		sjmp	code_D349
; ---------------------------------------------------------------------------

code_D338:				; CODE XREF: code_D32C+7j
		mov	DPTR, #0F4BCh
		movx	A, @DPTR
		xrl	A, #1
		jnz	code_D349
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	DPTR, #0F4C4h
		mov	A, #0FFh
		sjmp	code_D35C
; ---------------------------------------------------------------------------

code_D349:				; CODE XREF: code_D32C+Aj
					; code_D32C+12j
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		anl	A, #7Fh
		movx	@DPTR, A
		sjmp	code_D381
; ---------------------------------------------------------------------------

code_D352:				; CODE XREF: code_D32C+4j
		jb	ACC.3, code_D381 ; Accumulator
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	DPTR, #0F4C4h
		mov	A, #0FEh ; '¦'

code_D35C:				; CODE XREF: code_D32C+1Bj
		movx	@DPTR, A
		mov	DPTR, #0F4C5h
		movx	@DPTR, A
		mov	DPTR, #0F4C1h
		lcall	code_D115
		setb	IEN0.7		; Interrupt Enable Register 0
		jnb	RAM_22.2, code_D375
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		anl	A, #7Fh
		movx	@DPTR, A
		sjmp	code_D381
; ---------------------------------------------------------------------------

code_D375:				; CODE XREF: code_D32C+3Dj
		setb	RAM_2E.0
		anl	RAM_79,	#0FEh
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		orl	A, #43h
		movx	@DPTR, A

code_D381:				; CODE XREF: code_D32C+24j
					; code_D32C:code_D352j	...
		ret
; End of function code_D32C


; =============== S U B	R O U T	I N E =======================================


code_D382:				; CODE XREF: code_D25F+23p
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		jb	ACC.3, code_D3D0 ; Accumulator
		jb	ACC.2, code_D391 ; Accumulator
		anl	A, #7Fh
		movx	@DPTR, A
		sjmp	code_D3D0
; ---------------------------------------------------------------------------

code_D391:				; CODE XREF: code_D382+7j
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	R3, #0
		mov	DPTR, #0F4BDh
		movx	A, @DPTR
		mov	R0, A
		inc	DPTR
		movx	A, @DPTR
		mov	R1, A
		inc	DPTR
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F4C1h
		movx	A, @DPTR
		xrl	A, R0
		orl	A, R3
		mov	R3, A
		inc	DPTR
		movx	A, @DPTR
		xrl	A, R1
		orl	A, R3
		mov	R3, A
		inc	DPTR
		movx	A, @DPTR
		xrl	A, R2
		orl	A, R3
		setb	IEN0.7		; Interrupt Enable Register 0
		jz	code_D3BD
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		anl	A, #7Fh
		movx	@DPTR, A
		sjmp	code_D3D0
; ---------------------------------------------------------------------------

code_D3BD:				; CODE XREF: code_D382+30j
		setb	RAM_2E.0
		anl	RAM_79,	#0FEh
		setb	RAM_2D.3
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		anl	A, #0DFh
		orl	A, #40h
		movx	@DPTR, A
		lcall	code_B304

code_D3D0:				; CODE XREF: code_D382+4j code_D382+Dj ...
		ret
; End of function code_D382


; =============== S U B	R O U T	I N E =======================================


code_D3D1:				; CODE XREF: code_D15Cp
		clr	A
		mov	DPTR, #0F4BBh
		movx	@DPTR, A
		mov	DPTR, #0F4BCh
		movx	@DPTR, A
		mov	DPTR, #0F4C7h
		movx	@DPTR, A
		mov	DPTR, #0F4C8h
		movx	@DPTR, A
		mov	A, #0FFh
		mov	DPTR, #0F4BDh
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #0F4C1h
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		movx	@DPTR, A
		mov	DPTR, #0F4C5h
		movx	@DPTR, A
		mov	A, #3Ch	; '<'
		mov	DPTR, #0F4C6h
		movx	@DPTR, A
		ret
; End of function code_D3D1


; =============== S U B	R O U T	I N E =======================================


code_D3FF:				; CODE XREF: code_D286+95p
		mov	DPTR, #0F4BBh
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F4BCh
		movx	A, @DPTR
		mov	R4, A
		xrl	A, #1
		jnz	code_D416
		mov	DPTR, #0F4C1h
		mov	A, B		; B-Register
		movx	@DPTR, A
		sjmp	code_D468
; ---------------------------------------------------------------------------

code_D416:				; CODE XREF: code_D3FF+Dj
		mov	A, R4
		xrl	A, #2
		jnz	code_D427
		mov	DPTR, #0F4C1h
		movx	A, @DPTR
		xch	A, B		; B-Register
		swap	A
		orl	A, B		; B-Register
		movx	@DPTR, A
		sjmp	code_D468
; ---------------------------------------------------------------------------

code_D427:				; CODE XREF: code_D3FF+1Aj
		mov	A, R4
		xrl	A, #3
		jnz	code_D434
		mov	DPTR, #0F4C2h
		mov	A, B		; B-Register
		movx	@DPTR, A
		sjmp	code_D468
; ---------------------------------------------------------------------------

code_D434:				; CODE XREF: code_D3FF+2Bj
		mov	A, R4
		xrl	A, #4
		jnz	code_D445
		mov	DPTR, #0F4C2h
		movx	A, @DPTR
		xch	A, B		; B-Register
		swap	A
		orl	A, B		; B-Register
		movx	@DPTR, A
		sjmp	code_D468
; ---------------------------------------------------------------------------

code_D445:				; CODE XREF: code_D3FF+38j
		mov	A, R4
		xrl	A, #5
		jnz	code_D452
		mov	DPTR, #0F4C3h
		mov	A, B		; B-Register
		movx	@DPTR, A
		sjmp	code_D468
; ---------------------------------------------------------------------------

code_D452:				; CODE XREF: code_D3FF+49j
		mov	A, R4
		xrl	A, #6
		jnz	code_D468
		mov	DPTR, #0F4C3h
		movx	A, @DPTR
		xch	A, B		; B-Register
		swap	A
		orl	A, B		; B-Register
		movx	@DPTR, A
		mov	DPTR, #0F4C5h
		movx	A, @DPTR
		anl	A, #0F7h
		movx	@DPTR, A

code_D468:				; CODE XREF: code_D3FF+15j
					; code_D3FF+26j ...
		ret
; End of function code_D3FF


; =============== S U B	R O U T	I N E =======================================


RI0_TI0_0:				; CODE XREF: RI0_TI0j
		jnb	S0CON.0, code_D4EB ; Serial Channel 0 Control Register
		clr	S0CON.0		; Serial Channel 0 Control Register
		push	PSW		; Program Status Word
		push	ACC		; Accumulator
		push	B		; B-Register
		push	DPSEL		; Data Pointer Select Register
		clr	A
		mov	RAM_78,	A
		mov	A, RAM_7E
		jnz	code_D482
		clr	RAM_2F.1
		orl	IEN3, #8	; Interrupt Enable Register 3

code_D482:				; CODE XREF: RI0_TI0_0+12j
		xrl	A, #80h
		jz	code_D4DD
		mov	DPSEL, #6	; Data Pointer Select Register
		mov	A, S0BUF	; Serial Channel 0 Buffer Register
		movx	@DPTR, A
		inc	DPTR
		inc	RAM_7E
		jb	RAM_2F.2, code_D4D6
		mov	A, RAM_7E
		cjne	A, #2, code_D497

code_D497:
		jc	code_D511
		push	DPH		; Data Pointer,	High Byte
		push	DPL		; Data Pointer,	Low Byte
		mov	DPTR, #0F700h
		movx	A, @DPTR
		mov	B, A		; B-Register
		anl	A, #3Fh
		jnz	code_D4C3
		jb	B.7, code_D4B2	; B-Register
		mov	DPTR, #0F701h
		movx	A, @DPTR
		add	A, #3
		sjmp	code_D4BF
; ---------------------------------------------------------------------------

code_D4B2:				; CODE XREF: RI0_TI0_0+3Ej
		mov	A, RAM_7E
		cjne	A, #4, code_D4B7

code_D4B7:
		jc	code_D4D0
		mov	DPTR, #0F703h
		movx	A, @DPTR
		add	A, #5

code_D4BF:				; CODE XREF: RI0_TI0_0+47j
		setb	RAM_2F.7
		sjmp	code_D4CC
; ---------------------------------------------------------------------------

code_D4C3:				; CODE XREF: RI0_TI0_0+3Cj
		clr	RAM_2F.7
		add	A, #2
		jnb	B.7, code_D4CC	; B-Register
		add	A, #2

code_D4CC:				; CODE XREF: RI0_TI0_0+58j
					; RI0_TI0_0+5Ej
		mov	RAM_73,	A
		setb	RAM_2F.2

code_D4D0:				; CODE XREF: RI0_TI0_0:code_D4B7j
		pop	DPL		; Data Pointer,	Low Byte
		pop	DPH		; Data Pointer,	High Byte
		sjmp	code_D511
; ---------------------------------------------------------------------------

code_D4D6:				; CODE XREF: RI0_TI0_0+26j
		mov	A, RAM_7E
		cjne	A, RAM_73, code_D4DB

code_D4DB:
		jc	code_D511

code_D4DD:				; CODE XREF: RI0_TI0_0+1Bj
		clr	S0CON.4		; Serial Channel 0 Control Register
		anl	IEN3, #0F7h	; Interrupt Enable Register 3
		clr	RAM_2F.2
		mov	RAM_78,	#0
		setb	RAM_2F.3
		sjmp	code_D511
; ---------------------------------------------------------------------------

code_D4EB:				; CODE XREF: RI0_TI0_0j
		jnb	S0CON.1, code_D519 ; Serial Channel 0 Control Register
		clr	S0CON.1		; Serial Channel 0 Control Register
		jb	RAM_2F.0, code_D519
		push	PSW		; Program Status Word
		push	ACC		; Accumulator
		push	B		; B-Register
		push	DPSEL		; Data Pointer Select Register
		mov	A, RAM_51
		jz	code_D50A
		mov	DPSEL, #7	; Data Pointer Select Register
		movx	A, @DPTR
		mov	S0BUF, A	; Serial Channel 0 Buffer Register
		inc	DPTR
		dec	RAM_51
		sjmp	code_D511
; ---------------------------------------------------------------------------

code_D50A:				; CODE XREF: RI0_TI0_0+94j
		setb	RAM_2F.0
		mov	RAM_78,	#0
		setb	RAM_2F.1

code_D511:				; CODE XREF: RI0_TI0_0:code_D497j
					; RI0_TI0_0+6Bj ...
		pop	DPSEL		; Data Pointer Select Register
		pop	B		; B-Register
		pop	ACC		; Accumulator
		pop	PSW		; Program Status Word

code_D519:				; CODE XREF: RI0_TI0_0:code_D4EBj
					; RI0_TI0_0+87j
		reti
; End of function RI0_TI0_0


; =============== S U B	R O U T	I N E =======================================


code_D51A:				; CODE XREF: RESET_0-9058p
		mov	DPTR, #0F701h
		movx	A, @DPTR
		xrl	A, #10h
		jz	code_D527
		clr	A
		orl	A, #1
		sjmp	code_D558
; ---------------------------------------------------------------------------

code_D527:				; CODE XREF: code_D51A+6j
		mov	DPTR, #0F700h
		movx	A, @DPTR
		anl	A, #0C0h
		xrl	A, #80h
		jz	code_D536
		clr	A
		orl	A, #2
		sjmp	code_D558
; ---------------------------------------------------------------------------

code_D536:				; CODE XREF: code_D51A+15j
		mov	R0, #73h ; 's'
		mov	A, RAM_7E
		setb	C
		subb	A, @R0
		jc	code_D543
		clr	A
		orl	A, #4
		sjmp	code_D558
; ---------------------------------------------------------------------------

code_D543:				; CODE XREF: code_D51A+22j
		mov	R4, #0
		mov	A, @R0
		dec	A
		mov	R3, A
		mov	DPTR, #0F700h

code_D54B:				; CODE XREF: code_D51A+35j
		movx	A, @DPTR
		add	A, R4
		mov	R4, A
		inc	DPTR
		djnz	R3, code_D54B
		movx	A, @DPTR
		xrl	A, R4
		jz	code_D558
		clr	A
		orl	A, #8

code_D558:				; CODE XREF: code_D51A+Bj
					; code_D51A+1Aj ...
		mov	R0, #91h ; 'С'
		mov	@R0, A
		ret
; End of function code_D51A


; =============== S U B	R O U T	I N E =======================================


code_D55C:				; CODE XREF: RESET_0-9055p
		mov	DPTR, #0F702h
		movx	A, @DPTR
		mov	R0, #0A9h ; 'й'
		mov	@R0, A
		jnb	RAM_2F.7, code_D56F
		mov	DPTR, #0F704h
		movx	A, @DPTR
		mov	R0, #0AAh ; 'к'
		mov	@R0, A
		sjmp	code_D576
; ---------------------------------------------------------------------------

code_D56F:				; CODE XREF: code_D55C+7j
		mov	DPTR, #0F703h
		movx	A, @DPTR
		mov	R0, #0AAh ; 'к'
		mov	@R0, A

code_D576:				; CODE XREF: code_D55C+11j
		mov	R0, #91h ; 'С'
		mov	A, @R0
		jz	code_D580
		lcall	code_D584
		sjmp	code_D583
; ---------------------------------------------------------------------------

code_D580:				; CODE XREF: code_D55C+1Dj
		lcall	code_D5EA

code_D583:				; CODE XREF: code_D55C+22j
		ret
; End of function code_D55C


; =============== S U B	R O U T	I N E =======================================


code_D584:				; CODE XREF: code_D55C+1Fp
		mov	R0, #91h ; 'С'
		mov	ACC, @R0	; Accumulator
		jnb	ACC.0, code_D58D ; Accumulator
		sjmp	code_D5D7
; ---------------------------------------------------------------------------

code_D58D:				; CODE XREF: code_D584+4j
		jnb	ACC.1, code_D592 ; Accumulator
		sjmp	code_D5D7
; ---------------------------------------------------------------------------

code_D592:				; CODE XREF: code_D584:code_D58Dj
		jnb	ACC.2, code_D599 ; Accumulator
		mov	R3, #31h ; '1'
		sjmp	code_D59B
; ---------------------------------------------------------------------------

code_D599:				; CODE XREF: code_D584:code_D592j
		mov	R3, #77h ; 'w'

code_D59B:				; CODE XREF: code_D584+13j
		jnb	RAM_2D.1, code_D5A3
		lcall	code_CF48
		sjmp	code_D5DA
; ---------------------------------------------------------------------------

code_D5A3:				; CODE XREF: code_D584:code_D59Bj
		jnb	RAM_2F.5, code_D5D7
		lcall	code_C233
		mov	DPTR, #0F600h
		mov	A, #83h	; 'Г'
		movx	@DPTR, A
		mov	R4, A
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		inc	DPTR
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		inc	DPTR
		mov	A, #7Fh	; ''
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		mov	R0, #0AAh ; 'к'
		mov	A, @R0
		inc	DPTR
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		mov	A, R3
		inc	DPTR
		movx	@DPTR, A
		add	A, R4
		inc	DPTR
		movx	@DPTR, A
		mov	RAM_51,	#7
		setb	RAM_2F.4
		sjmp	code_D5DA
; ---------------------------------------------------------------------------

code_D5D7:				; CODE XREF: code_D584+7j code_D584+Cj ...
		lcall	code_D5DB

code_D5DA:				; CODE XREF: code_D584+1Dj
					; code_D584+51j
		ret
; End of function code_D584


; =============== S U B	R O U T	I N E =======================================


code_D5DB:				; CODE XREF: code_D04C+33p
					; code_D584:code_D5D7p	...
		anl	IEN3, #0F7h	; Interrupt Enable Register 3
		clr	RAM_2F.3
		lcall	code_C225
		mov	R0, #91h ; 'С'
		mov	@R0, #0
		setb	S0CON.4		; Serial Channel 0 Control Register
		ret
; End of function code_D5DB


; =============== S U B	R O U T	I N E =======================================


code_D5EA:				; CODE XREF: code_D55C:code_D580p

; FUNCTION CHUNK AT E3E5 SIZE 0000000E BYTES

		mov	R0, #0AAh ; 'к'
		mov	A, @R0
		mov	R4, A
		xrl	A, #21h
		jnz	code_D5F8
		lcall	code_D813
		ljmp	code_D696
; ---------------------------------------------------------------------------

code_D5F8:				; CODE XREF: code_D5EA+6j
		mov	A, R4
		xrl	A, #18h
		jnz	code_D603
		lcall	code_D7BA
		ljmp	code_D696
; ---------------------------------------------------------------------------

code_D603:				; CODE XREF: code_D5EA+11j
		mov	A, R4
		xrl	A, #30h
		jnz	code_D60E
		lcall	code_D891
		ljmp	code_D696
; ---------------------------------------------------------------------------

code_D60E:				; CODE XREF: code_D5EA+1Cj
		mov	A, R4
		xrl	A, #14h
		jnz	code_D618
		lcall	code_D76F
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D618:				; CODE XREF: code_D5EA+27j
		mov	A, R4
		xrl	A, #3Eh
		jnz	code_D622
		lcall	code_D9BA
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D622:				; CODE XREF: code_D5EA+31j
		mov	A, R4
		xrl	A, #1Ah
		jnz	code_D62C
		lcall	code_D7FC
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D62C:				; CODE XREF: code_D5EA+3Bj
		mov	A, R4
		xrl	A, #23h
		jnz	code_D636
		lcall	code_E3F3
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D636:				; CODE XREF: code_D5EA+45j
		mov	A, R4
		xrl	A, #3Bh
		jnz	code_D640
		lcall	code_D95D
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D640:				; CODE XREF: code_D5EA+4Fj
		mov	A, R4
		xrl	A, #10h
		jnz	code_D64A
		lcall	code_D6D2
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D64A:				; CODE XREF: code_D5EA+59j
		mov	A, R4
		xrl	A, #20h
		jnz	code_D654
		lcall	code_D728
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D654:				; CODE XREF: code_D5EA+63j
		mov	A, R4
		xrl	A, #82h
		jnz	code_D65E
		lcall	code_D6AE
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D65E:				; CODE XREF: code_D5EA+6Dj
		mov	A, R4
		xrl	A, #81h
		jnz	code_D668
		lcall	code_D697
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D668:				; CODE XREF: code_D5EA+77j
		mov	A, R4
		xrl	A, #11h
		jnz	code_D672
		lcall	code_D750
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D672:				; CODE XREF: code_D5EA+81j
		jnb	RAM_2D.1, code_D693
		mov	A, R4
		xrl	A, #0E0h
		jnz	code_D67F
		lcall	code_CF85
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D67F:				; CODE XREF: code_D5EA+8Ej
		mov	A, R4
		xrl	A, #0EAh
		jnz	code_D689
		lcall	code_D00A
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D689:				; CODE XREF: code_D5EA+98j
		mov	A, R4
		xrl	A, #7Fh
		jnz	code_D693
		lcall	code_D083
		sjmp	code_D696
; ---------------------------------------------------------------------------

code_D693:				; CODE XREF: code_D5EA:code_D672j
					; code_D5EA+A2j
		ljmp	code_E3E5
; ---------------------------------------------------------------------------

code_D696:				; CODE XREF: code_D5EA+Bj
					; code_D5EA+16j ...
		ret
; End of function code_D5EA


; =============== S U B	R O U T	I N E =======================================


code_D697:				; CODE XREF: code_D5EA+79p
		jb	RAM_2F.5, code_D6AA
		setb	RAM_2F.5
		lcall	code_C233
		mov	R3, #80h ; 'А'
		mov	R4, #56h ; 'V'
		lcall	code_C270
		setb	RAM_2F.4
		sjmp	code_D6AD
; ---------------------------------------------------------------------------

code_D6AA:				; CODE XREF: code_D697j
		lcall	code_D5DB

code_D6AD:				; CODE XREF: code_D697+11j
		ret
; End of function code_D697


; =============== S U B	R O U T	I N E =======================================


code_D6AE:				; CODE XREF: code_D5EA+6Fp
		lcall	code_C233
		jnb	RAM_2F.5, code_D6C8
		clr	A
		mov	RAM_79,	A
		mov	DEV_FLAGS, A
		mov	RAM_7B,	A
		mov	RAM_7C,	A
		mov	R3, #80h ; 'А'
		mov	R4, #5Eh ; '^'
		lcall	code_C270
		clr	RAM_2F.5
		sjmp	code_D6CF
; ---------------------------------------------------------------------------

code_D6C8:				; CODE XREF: code_D6AE+3j
		mov	R3, #80h ; 'А'
		mov	R4, #8Dh ; 'Н'
		lcall	code_C270

code_D6CF:				; CODE XREF: code_D6AE+18j
		setb	RAM_2F.4
		ret
; End of function code_D6AE


; =============== S U B	R O U T	I N E =======================================


code_D6D2:				; CODE XREF: code_D5EA+5Bp
		lcall	code_C233
		jnb	RAM_2F.5, code_D71E
		jb	RAM_2F.6, code_D71E
		jnb	RAM_2F.7, code_D6E9
		mov	DPTR, #0F706h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F705h
		movx	A, @DPTR
		sjmp	code_D6F2
; ---------------------------------------------------------------------------

code_D6E9:				; CODE XREF: code_D6D2+9j
		mov	DPTR, #0F705h
		movx	A, @DPTR
		mov	R2, A
		mov	DPTR, #0F704h
		movx	A, @DPTR

code_D6F2:				; CODE XREF: code_D6D2+15j
		xrl	A, #81h
		jnz	code_D715
		setb	RAM_2F.6
		mov	R3, #80h ; 'А'
		mov	R4, #64h ; 'd'
		lcall	code_C270
		mov	A, R2
		xrl	A, #26h
		jnz	code_D70A
		mov	R0, #0A8h ; 'и'
		mov	@R0, #0F3h ; 'є'
		sjmp	code_D725
; ---------------------------------------------------------------------------

code_D70A:				; CODE XREF: code_D6D2+30j
		mov	A, R2
		xrl	A, #39h
		jnz	code_D725
		mov	R0, #0A8h ; 'и'
		mov	@R0, #0F7h ; 'ў'
		sjmp	code_D725
; ---------------------------------------------------------------------------

code_D715:				; CODE XREF: code_D6D2+22j
		mov	R3, #80h ; 'А'
		mov	R4, #0EDh ; 'э'
		lcall	code_C270
		sjmp	code_D725
; ---------------------------------------------------------------------------

code_D71E:				; CODE XREF: code_D6D2+3j code_D6D2+6j
		mov	R3, #80h ; 'А'
		mov	R4, #95h ; 'Х'
		lcall	code_C270

code_D725:				; CODE XREF: code_D6D2+36j
					; code_D6D2+3Bj ...
		setb	RAM_2F.4
		ret
; End of function code_D6D2


; =============== S U B	R O U T	I N E =======================================


code_D728:				; CODE XREF: code_D5EA+65p
		lcall	code_C233
		jnb	RAM_2F.5, code_D746
		clr	RAM_2F.6
		clr	A
		mov	RAM_79,	A
		mov	DEV_FLAGS, A
		mov	RAM_7B,	A
		mov	RAM_7C,	A
		mov	R3, #80h ; 'А'
		mov	R4, #6Bh ; 'k'
		lcall	code_C270
		mov	R0, #0A8h ; 'и'
		mov	@R0, #0D0h ; '¦'
		sjmp	code_D74D
; ---------------------------------------------------------------------------

code_D746:				; CODE XREF: code_D728+3j
		mov	R3, #80h ; 'А'
		mov	R4, #9Dh ; 'Э'
		lcall	code_C270

code_D74D:				; CODE XREF: code_D728+1Cj
		setb	RAM_2F.4
		ret
; End of function code_D728


; =============== S U B	R O U T	I N E =======================================


code_D750:				; CODE XREF: code_D5EA+83p
		lcall	code_C233
		jnb	RAM_2F.5, code_D765
		mov	R3, #80h ; 'А'
		mov	R4, #77h ; 'w'
		lcall	code_C270
		mov	R0, #91h ; 'С'
		mov	A, @R0
		orl	A, #20h
		mov	@R0, A
		sjmp	code_D76C
; ---------------------------------------------------------------------------

code_D765:				; CODE XREF: code_D750+3j
		mov	R3, #80h ; 'А'
		mov	R4, #0A5h ; 'е'
		lcall	code_C270

code_D76C:				; CODE XREF: code_D750+13j
		setb	RAM_2F.4
		ret
; End of function code_D750


; =============== S U B	R O U T	I N E =======================================


code_D76F:				; CODE XREF: code_D5EA+29p
		lcall	code_C233
		jnb	RAM_2F.5, code_D7B0
		setb	RAM_2F.6
		jnb	RAM_2F.7, code_D780
		mov	DPTR, #0F705h
		movx	A, @DPTR
		sjmp	code_D784
; ---------------------------------------------------------------------------

code_D780:				; CODE XREF: code_D76F+8j
		mov	DPTR, #0F704h
		movx	A, @DPTR

code_D784:				; CODE XREF: code_D76F+Fj
		jz	code_D78B
		inc	A
		jz	code_D799
		sjmp	code_D7A7
; ---------------------------------------------------------------------------

code_D78B:				; CODE XREF: code_D76F:code_D784j
		lcall	code_DA23
		mov	R3, #80h ; 'А'
		mov	R4, #7Dh ; '}'
		mov	R2, #7
		lcall	code_C294
		sjmp	code_D7B7
; ---------------------------------------------------------------------------

code_D799:				; CODE XREF: code_D76F+18j
		lcall	code_DA23
		mov	R3, #80h ; 'А'
		mov	R4, #85h ; 'Е'
		mov	R2, #7
		lcall	code_C294
		sjmp	code_D7B7
; ---------------------------------------------------------------------------

code_D7A7:				; CODE XREF: code_D76F+1Aj
		mov	R3, #80h ; 'А'
		mov	R4, #0F5h ; 'ї'
		lcall	code_C270
		sjmp	code_D7B7
; ---------------------------------------------------------------------------

code_D7B0:				; CODE XREF: code_D76F+3j
		mov	R3, #80h ; 'А'
		mov	R4, #0ADh ; 'н'
		lcall	code_C270

code_D7B7:				; CODE XREF: code_D76F+28j
					; code_D76F+36j ...
		setb	RAM_2F.4
		ret
; End of function code_D76F


; =============== S U B	R O U T	I N E =======================================


code_D7BA:				; CODE XREF: code_D5EA+13p
		lcall	code_C233
		jnb	RAM_2F.5, code_D7F2
		setb	RAM_2F.6
		jnb	RAM_2F.7, code_D7D1
		mov	DPTR, #0F706h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F705h
		movx	A, @DPTR
		sjmp	code_D7DB
; ---------------------------------------------------------------------------

code_D7D1:				; CODE XREF: code_D7BA+8j
		mov	DPTR, #0F705h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #0F704h
		movx	A, @DPTR

code_D7DB:				; CODE XREF: code_D7BA+15j
		jnz	code_D7E9
		mov	A, B		; B-Register
		jz	code_D7E4
		inc	A
		jnz	code_D7E9

code_D7E4:				; CODE XREF: code_D7BA+25j
		lcall	code_DBE3
		sjmp	code_D7F9
; ---------------------------------------------------------------------------

code_D7E9:				; CODE XREF: code_D7BA:code_D7DBj
					; code_D7BA+28j
		mov	R3, #81h ; 'Б'
		mov	R4, #5
		lcall	code_C270
		sjmp	code_D7F9
; ---------------------------------------------------------------------------

code_D7F2:				; CODE XREF: code_D7BA+3j
		mov	R3, #80h ; 'А'
		mov	R4, #0B5h ; '¦'
		lcall	code_C270

code_D7F9:				; CODE XREF: code_D7BA+2Dj
					; code_D7BA+36j
		setb	RAM_2F.4
		ret
; End of function code_D7BA


; =============== S U B	R O U T	I N E =======================================


code_D7FC:				; CODE XREF: code_D5EA+3Dp
		lcall	code_C233
		jnb	RAM_2F.5, code_D809
		setb	RAM_2F.6
		lcall	code_DAEF
		sjmp	code_D810
; ---------------------------------------------------------------------------

code_D809:				; CODE XREF: code_D7FC+3j
		mov	R3, #80h ; 'А'
		mov	R4, #0BDh ; '-'
		lcall	code_C270

code_D810:				; CODE XREF: code_D7FC+Bj
		setb	RAM_2F.4
		ret
; End of function code_D7FC


; =============== S U B	R O U T	I N E =======================================


code_D813:				; CODE XREF: code_D5EA+8p
		lcall	code_C233
		jnb	RAM_2F.5, code_D887
		setb	RAM_2F.6
		jnb	RAM_2F.7, code_D824
		mov	DPTR, #0F705h
		movx	A, @DPTR
		sjmp	code_D828
; ---------------------------------------------------------------------------

code_D824:				; CODE XREF: code_D813+8j
		mov	DPTR, #0F704h
		movx	A, @DPTR

code_D828:				; CODE XREF: code_D813+Fj
		mov	R4, A
		xrl	A, #1
		jnz	code_D832
		lcall	code_DC62
		sjmp	code_D88E
; ---------------------------------------------------------------------------

code_D832:				; CODE XREF: code_D813+18j
		mov	A, R4
		xrl	A, #2
		jnz	code_D83C
		lcall	code_DCAD
		sjmp	code_D88E
; ---------------------------------------------------------------------------

code_D83C:				; CODE XREF: code_D813+22j
		mov	A, R4
		xrl	A, #3
		jnz	code_D846
		lcall	code_DCF8
		sjmp	code_D88E
; ---------------------------------------------------------------------------

code_D846:				; CODE XREF: code_D813+2Cj
		mov	A, R4
		xrl	A, #4
		jnz	code_D850
		lcall	code_DD3C
		sjmp	code_D88E
; ---------------------------------------------------------------------------

code_D850:				; CODE XREF: code_D813+36j
		mov	A, R4
		xrl	A, #0A0h
		jnz	code_D85A
		lcall	code_DD79
		sjmp	code_D88E
; ---------------------------------------------------------------------------

code_D85A:				; CODE XREF: code_D813+40j
		mov	A, R4
		xrl	A, #0A1h
		jnz	code_D864
		lcall	code_DDE3
		sjmp	code_D88E
; ---------------------------------------------------------------------------

code_D864:				; CODE XREF: code_D813+4Aj
		mov	A, R4
		xrl	A, #0A2h
		jnz	code_D86E
		lcall	code_DE0F
		sjmp	code_D88E
; ---------------------------------------------------------------------------

code_D86E:				; CODE XREF: code_D813+54j
		mov	A, R4
		xrl	A, #0A3h
		jnz	code_D878
		lcall	code_DE3B
		sjmp	code_D88E
; ---------------------------------------------------------------------------

code_D878:				; CODE XREF: code_D813+5Ej
		mov	A, R4
		xrl	A, #0E0h
		jnz	code_D882
		lcall	code_DDAE
		sjmp	code_D88E
; ---------------------------------------------------------------------------

code_D882:				; CODE XREF: code_D813+68j
		lcall	code_E558
		sjmp	code_D88E
; ---------------------------------------------------------------------------

code_D887:				; CODE XREF: code_D813+3j
		mov	R3, #80h ; 'А'
		mov	R4, #0C5h ; '+'
		lcall	code_C270

code_D88E:				; CODE XREF: code_D813+1Dj
					; code_D813+27j ...
		setb	RAM_2F.4
		ret
; End of function code_D813


; =============== S U B	R O U T	I N E =======================================


code_D891:				; CODE XREF: code_D5EA+1Ep
		lcall	code_C233
		jnb	RAM_2D.3, code_D89A
		jb	RAM_2F.5, code_D89D

code_D89A:				; CODE XREF: code_D891+3j
		ljmp	code_D953
; ---------------------------------------------------------------------------

code_D89D:				; CODE XREF: code_D891+6j
		setb	RAM_2F.6
		jnb	RAM_2F.7, code_D8AC
		mov	DPTR, #0F706h
		movx	A, @DPTR
		mov	R3, A
		dec	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR
		sjmp	code_D8B4
; ---------------------------------------------------------------------------

code_D8AC:				; CODE XREF: code_D891+Ej
		mov	DPTR, #0F705h
		movx	A, @DPTR
		mov	R3, A
		dec	DPL		; Data Pointer,	Low Byte
		movx	A, @DPTR

code_D8B4:				; CODE XREF: code_D891+19j
		mov	R4, A
		jz	code_D8C0
		cjne	A, #5, code_D8BC
		sjmp	code_D8CC
; ---------------------------------------------------------------------------

code_D8BC:				; CODE XREF: code_D891+26j
		jnc	code_D8CC
		sjmp	code_D8C3
; ---------------------------------------------------------------------------

code_D8C0:				; CODE XREF: code_D891+24j
		ljmp	code_D953
; ---------------------------------------------------------------------------

code_D8C3:				; CODE XREF: code_D891+2Dj
		lcall	code_DFAC
		lcall	code_E28C
		ljmp	code_D95A
; ---------------------------------------------------------------------------

code_D8CC:				; CODE XREF: code_D891+29j
					; code_D891:code_D8BCj
		mov	A, R4
		xrl	A, #5
		jnz	code_D8E0
		jnb	RAM_2A.6, code_D8D7
		ljmp	code_D953
; ---------------------------------------------------------------------------

code_D8D7:				; CODE XREF: code_D891+40j
		lcall	code_E0D4
		lcall	code_E28C
		ljmp	code_D95A
; ---------------------------------------------------------------------------

code_D8E0:				; CODE XREF: code_D891+3Ej
		mov	A, R4
		xrl	A, #6
		jnz	code_D8F0
		jb	RAM_2A.6, code_D953
		lcall	code_E12C
		lcall	code_E28C
		sjmp	code_D95A
; ---------------------------------------------------------------------------

code_D8F0:				; CODE XREF: code_D891+52j
		mov	A, R4
		xrl	A, #9
		jnz	code_D900
		jb	RAM_2A.6, code_D953
		lcall	code_E249
		lcall	code_E28C
		sjmp	code_D95A
; ---------------------------------------------------------------------------

code_D900:				; CODE XREF: code_D891+62j
		mov	A, R4
		xrl	A, #0Ah
		jnz	code_D90D
		lcall	code_E20A
		lcall	code_E28C
		sjmp	code_D95A
; ---------------------------------------------------------------------------

code_D90D:				; CODE XREF: code_D891+72j
		mov	A, R4
		xrl	A, #0Bh
		jnz	code_D91A
		lcall	code_E1C7
		lcall	code_E28C
		sjmp	code_D95A
; ---------------------------------------------------------------------------

code_D91A:				; CODE XREF: code_D891+7Fj
		mov	A, R4
		xrl	A, #0Ch
		jnz	code_D927
		lcall	code_E184
		lcall	code_E28C
		sjmp	code_D95A
; ---------------------------------------------------------------------------

code_D927:				; CODE XREF: code_D891+8Cj
		mov	A, R4
		xrl	A, #41h
		jnz	code_D934
		lcall	code_E2D3
		lcall	code_E33B
		sjmp	code_D95A
; ---------------------------------------------------------------------------

code_D934:				; CODE XREF: code_D891+99j
		mov	A, R4
		xrl	A, #42h
		jnz	code_D941
		lcall	code_E306
		lcall	code_E33B
		sjmp	code_D95A
; ---------------------------------------------------------------------------

code_D941:				; CODE XREF: code_D891+A6j
		mov	A, R4
		xrl	A, #0Dh
		jnz	code_D94E
		lcall	code_E38F
		lcall	code_E28C
		sjmp	code_D95A
; ---------------------------------------------------------------------------

code_D94E:				; CODE XREF: code_D891+B3j
		lcall	code_E5DF
		sjmp	code_D95A
; ---------------------------------------------------------------------------

code_D953:				; CODE XREF: code_D891:code_D89Aj
					; code_D891:code_D8C0j	...
		mov	R3, #80h ; 'А'
		mov	R4, #0D5h ; '-'
		lcall	code_C270

code_D95A:				; CODE XREF: code_D891+38j
					; code_D891+4Cj ...
		setb	RAM_2F.4
		ret
; End of function code_D891


; =============== S U B	R O U T	I N E =======================================


code_D95D:				; CODE XREF: code_D5EA+51p
		lcall	code_C233
		jnb	RAM_2F.5, code_D9B0
		setb	RAM_2F.6
		jb	RAM_2A.6, code_D9B0
		jnb	RAM_2F.7, code_D971
		mov	DPTR, #0F705h
		movx	A, @DPTR
		sjmp	code_D975
; ---------------------------------------------------------------------------

code_D971:				; CODE XREF: code_D95D+Bj
		mov	DPTR, #0F704h
		movx	A, @DPTR

code_D975:				; CODE XREF: code_D95D+12j
		mov	R4, A
		xrl	A, #90h
		jnz	code_D97F
		lcall	code_DEE4
		sjmp	code_D9B7
; ---------------------------------------------------------------------------

code_D97F:				; CODE XREF: code_D95D+1Bj
		mov	A, R4
		xrl	A, #98h
		jnz	code_D989
		lcall	code_DF0C
		sjmp	code_D9B7
; ---------------------------------------------------------------------------

code_D989:				; CODE XREF: code_D95D+25j
		mov	A, R4
		xrl	A, #0A1h
		jnz	code_D993
		lcall	code_DF34
		sjmp	code_D9B7
; ---------------------------------------------------------------------------

code_D993:				; CODE XREF: code_D95D+2Fj
		mov	A, R4
		xrl	A, #0A2h
		jnz	code_D99D
		lcall	code_DF5C
		sjmp	code_D9B7
; ---------------------------------------------------------------------------

code_D99D:				; CODE XREF: code_D95D+39j
		mov	A, R4
		xrl	A, #0A3h
		jnz	code_D9A7
		lcall	code_DF84
		sjmp	code_D9B7
; ---------------------------------------------------------------------------

code_D9A7:				; CODE XREF: code_D95D+43j
		mov	R3, #81h ; 'Б'
		mov	R4, #1Dh
		lcall	code_C270
		sjmp	code_D9B7
; ---------------------------------------------------------------------------

code_D9B0:				; CODE XREF: code_D95D+3j code_D95D+8j
		mov	R3, #80h ; 'А'
		mov	R4, #0DDh ; '¦'
		lcall	code_C270

code_D9B7:				; CODE XREF: code_D95D+20j
					; code_D95D+2Aj ...
		setb	RAM_2F.4
		ret
; End of function code_D95D


; =============== S U B	R O U T	I N E =======================================


code_D9BA:				; CODE XREF: code_D5EA+33p
		jnb	RAM_2F.5, code_D9DB
		setb	RAM_2F.6
		jnb	RAM_2F.7, code_D9C8
		mov	DPTR, #0F705h
		movx	A, @DPTR
		sjmp	code_D9CC
; ---------------------------------------------------------------------------

code_D9C8:				; CODE XREF: code_D9BA+5j
		mov	DPTR, #0F704h
		movx	A, @DPTR

code_D9CC:				; CODE XREF: code_D9BA+Cj
		lcall	code_C233
		mov	R3, #80h ; 'А'
		mov	R4, #71h ; 'q'
		mov	R2, #5
		lcall	code_C294
		setb	RAM_2F.4
		ret
; ---------------------------------------------------------------------------

code_D9DB:				; CODE XREF: code_D9BAj
		lcall	code_C233
		mov	R3, #80h ; 'А'
		mov	R4, #0E5h ; 'х'
		lcall	code_C270
		setb	RAM_2F.4
		ret
; End of function code_D9BA


; =============== S U B	R O U T	I N E =======================================


code_D9E8:				; CODE XREF: code_D5EA:code_E3EFp
		jb	RAM_2D.1, code_DA1D
		lcall	code_C233
		mov	DPTR, #0F600h
		mov	A, #83h	; 'Г'
		movx	@DPTR, A
		mov	R4, A
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		inc	DPTR
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		inc	DPTR
		mov	A, #7Fh	; ''
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		mov	R0, #0AAh ; 'к'
		mov	A, @R0
		inc	DPTR
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		inc	DPTR
		mov	A, #11h
		movx	@DPTR, A
		add	A, R4
		inc	DPTR
		movx	@DPTR, A
		mov	RAM_51,	#7
		setb	RAM_2F.4
		sjmp	code_DA22
; ---------------------------------------------------------------------------

code_DA1D:				; CODE XREF: code_D9E8j
		mov	R3, #11h
		lcall	code_CF48

code_DA22:				; CODE XREF: code_D9E8+33j
		ret
; End of function code_D9E8


; =============== S U B	R O U T	I N E =======================================


code_DA23:				; CODE XREF: code_D76F:code_D78Bp
					; code_D76F:code_D799p
		setb	RAM_2E.0
		mov	R0, #93h ; 'У'
		clr	A
		mov	@R0, A
		mov	RAM_22,	A
		mov	RAM_23,	A
		mov	RAM_24,	A
		mov	RAM_5B,	A
		mov	RAM_25,	A
		mov	RAM_7C,	A
		mov	DPTR, #0F810h
		movx	@DPTR, A
		mov	DPTR, #0F8C5h
		movx	@DPTR, A
		mov	DPTR, #0F8C4h
		movx	@DPTR, A
		mov	DPTR, #0F8C3h
		movx	@DPTR, A
		mov	DPTR, #0F803h
		movx	@DPTR, A
		mov	DPTR, #0F9C2h
		movx	A, @DPTR
		jnb	ACC.7, code_DAA5 ; Accumulator
		clr	A
		mov	DPTR, #0F8CCh
		movx	@DPTR, A
		mov	DPTR, #0F8CDh
		movx	@DPTR, A
		mov	DPTR, #0F8CAh
		movx	@DPTR, A
		mov	DPTR, #0F8CBh
		movx	@DPTR, A
		mov	DPTR, #0F8C8h
		movx	@DPTR, A
		mov	DPTR, #0F8C9h
		movx	@DPTR, A
		mov	DPTR, #0F8C6h
		movx	@DPTR, A
		mov	DPTR, #0F8C7h
		movx	@DPTR, A
		mov	DPTR, #0FA79h
		movx	@DPTR, A
		mov	DPTR, #0FA7Ah
		movx	@DPTR, A
		mov	DPTR, #0FA7Bh
		movx	@DPTR, A
		mov	DPTR, #0FA7Ch
		movx	@DPTR, A
		mov	DPTR, #0FA7Dh
		movx	@DPTR, A
		mov	DPTR, #0FA7Eh
		movx	@DPTR, A
		mov	DPTR, #0FA7Fh
		movx	@DPTR, A
		mov	DPTR, #0FA80h
		movx	@DPTR, A
		mov	DPTR, #0FA78h
		movx	@DPTR, A
		mov	DPTR, #0FA87h
		movx	@DPTR, A
		mov	DPTR, #0FA88h
		movx	@DPTR, A
		mov	DPTR, #0FA89h
		movx	@DPTR, A
		mov	DPTR, #0FA8Ah
		movx	@DPTR, A

code_DAA5:				; CODE XREF: code_DA23+2Aj
		clr	A
		mov	DPTR, #0F9C2h
		movx	@DPTR, A
		mov	DPTR, #0F9C4h
		movx	@DPTR, A
		mov	DPTR, #0F9C5h
		movx	@DPTR, A
		mov	DPTR, #0F9C6h
		movx	@DPTR, A
		mov	DPTR, #0FA82h
		movx	@DPTR, A
		mov	DPTR, #0FAA1h
		movx	@DPTR, A
		mov	R2, #8
		mov	DPTR, #0F4CAh

code_DAC3:				; CODE XREF: code_DA23+A2j
		movx	@DPTR, A
		inc	DPTR
		djnz	R2, code_DAC3
		lcall	code_DAD4
		mov	R2, #40h ; '@'
		mov	DPTR, #0F4D2h

code_DACF:				; CODE XREF: code_DA23+AEj
		movx	@DPTR, A
		inc	DPTR
		djnz	R2, code_DACF
		ret
; End of function code_DA23


; =============== S U B	R O U T	I N E =======================================


code_DAD4:				; CODE XREF: RESET_0-BF49p
					; code_DA23+A4p
		mov	R2, #40h ; '@'
		mov	DPSEL, #2	; Data Pointer Select Register
		mov	DPTR, #0F552h
		mov	DPSEL, #0	; Data Pointer Select Register
		mov	DPTR, #0F512h

code_DAE2:				; CODE XREF: code_DAD4+18j
		movx	@DPTR, A
		inc	DPTR
		mov	DPSEL, #2	; Data Pointer Select Register
		movx	@DPTR, A
		inc	DPTR
		mov	DPSEL, #0	; Data Pointer Select Register
		djnz	R2, code_DAE2
		ret
; End of function code_DAD4


; =============== S U B	R O U T	I N E =======================================


code_DAEF:				; CODE XREF: code_D7FC+8p
		jnb	RAM_2F.7, code_DAF8
		mov	DPTR, #0F705h
		movx	A, @DPTR
		sjmp	code_DAFC
; ---------------------------------------------------------------------------

code_DAF8:				; CODE XREF: code_DAEFj
		mov	DPTR, #0F704h
		movx	A, @DPTR

code_DAFC:				; CODE XREF: code_DAEF+7j
		mov	R4, A
		xrl	A, #80h
		jnz	code_DB46
		mov	R3, #0BEh ; '-'
		mov	R4, #52h ; 'R'
		lcall	code_C270
		mov	R3, #0F4h ; 'Ї'
		mov	R4, #60h ; '`'
		lcall	code_C25A
		mov	R3, #80h ; 'А'
		mov	R4, #0
		lcall	code_C270
		mov	R3, #80h ; 'А'
		mov	R4, #11h
		lcall	code_C270
		mov	R3, #80h ; 'А'
		mov	R4, #1Ch
		lcall	code_C270
		mov	R3, #80h ; 'А'
		mov	R4, #27h ; '''
		lcall	code_C270
		mov	R3, #0F4h ; 'Ї'
		mov	R4, #74h ; 't'
		lcall	code_C25A
		mov	R3, #80h ; 'А'
		mov	R4, #37h ; '7'
		lcall	code_C270
		mov	R3, #80h ; 'А'
		mov	R4, #42h ; 'B'
		lcall	code_C270
		lcall	code_DBD2
		ljmp	code_DBB7
; ---------------------------------------------------------------------------

code_DB46:				; CODE XREF: code_DAEF+10j
		mov	A, R4
		xrl	A, #90h
		jnz	code_DB51
		lcall	code_DE67
		ljmp	code_DBB7
; ---------------------------------------------------------------------------

code_DB51:				; CODE XREF: code_DAEF+5Aj
		mov	A, R4
		xrl	A, #91h
		jnz	code_DB60
		mov	R3, #0BEh ; '-'
		mov	R4, #59h ; 'Y'
		lcall	code_C270
		ljmp	code_DBB7
; ---------------------------------------------------------------------------

code_DB60:				; CODE XREF: code_DAEF+65j
		mov	A, R4
		xrl	A, #92h
		jnz	code_DB6E
		mov	R3, #0BEh ; '-'
		mov	R4, #70h ; 'p'
		lcall	code_C270
		sjmp	code_DBB7
; ---------------------------------------------------------------------------

code_DB6E:				; CODE XREF: code_DAEF+74j
		mov	A, R4
		xrl	A, #94h
		jnz	code_DB7C
		mov	R3, #0BEh ; '-'
		mov	R4, #81h ; 'Б'
		lcall	code_C270
		sjmp	code_DBB7
; ---------------------------------------------------------------------------

code_DB7C:				; CODE XREF: code_DAEF+82j
		mov	A, R4
		xrl	A, #97h
		jnz	code_DB8A
		mov	R3, #0BEh ; '-'
		mov	R4, #92h ; 'Т'
		lcall	code_C270
		sjmp	code_DBB7
; ---------------------------------------------------------------------------

code_DB8A:				; CODE XREF: code_DAEF+90j
		mov	A, R4
		xrl	A, #98h
		jnz	code_DB94
		lcall	code_DE93
		sjmp	code_DBB7
; ---------------------------------------------------------------------------

code_DB94:				; CODE XREF: code_DAEF+9Ej
		mov	A, R4
		xrl	A, #99h
		jnz	code_DBA2
		mov	R3, #0BEh ; '-'
		mov	R4, #0A8h ; 'и'
		lcall	code_C270
		sjmp	code_DBB7
; ---------------------------------------------------------------------------

code_DBA2:				; CODE XREF: code_DAEF+A8j
		mov	A, R4
		xrl	A, #9Ah
		jnz	code_DBB0
		mov	R3, #0BEh ; '-'
		mov	R4, #0B9h ; '¦'
		lcall	code_C270
		sjmp	code_DBB7
; ---------------------------------------------------------------------------

code_DBB0:				; CODE XREF: code_DAEF+B6j
		mov	R3, #80h ; 'А'
		mov	R4, #0FDh ; '¤'
		lcall	code_C270

code_DBB7:				; CODE XREF: code_DAEF+54j
					; code_DAEF+5Fj ...
		ret
; End of function code_DAEF


; =============== S U B	R O U T	I N E =======================================


code_DBB8:				; CODE XREF: RESET_0:code_599Ap
		mov	A, RAM_78
		clr	C
		subb	A, #19h
		jc	code_DBD1
		mov	A, RAM_78
		clr	C
		subb	A, #33h	; '3'
		jnc	code_DBCE
		lcall	code_C244
		lcall	code_C225
		sjmp	code_DBD1
; ---------------------------------------------------------------------------

code_DBCE:				; CODE XREF: code_DBB8+Cj
		lcall	code_DC28

code_DBD1:				; CODE XREF: code_DBB8+5j
					; code_DBB8+14j
		ret
; End of function code_DBB8


; =============== S U B	R O U T	I N E =======================================


code_DBD2:				; CODE XREF: code_CEBD+31p
					; code_CEFE+44p ...
		mov	R4, #0
		mov	R3, RAM_51
		mov	DPTR, #0F600h

code_DBD9:				; CODE XREF: code_DBD2+Bj
		movx	A, @DPTR
		add	A, R4
		mov	R4, A
		inc	DPTR
		djnz	R3, code_DBD9
		movx	@DPTR, A
		inc	RAM_51
		ret
; End of function code_DBD2


; =============== S U B	R O U T	I N E =======================================


code_DBE3:				; CODE XREF: code_D7BA:code_D7E4p
		mov	R0, #93h ; 'У'
		mov	A, @R0
		mov	R3, A
		mov	B, #3		; B-Register
		mul	AB
		mov	R2, A
		add	A, #2
		orl	A, #80h
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		movx	@DPTR, A
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		inc	DPTR
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #58h	; 'X'
		movx	@DPTR, A
		mov	A, R3
		inc	DPTR
		movx	@DPTR, A
		mov	RAM_51,	#5
		jz	code_DC22
		mov	A, R2
		add	A, #5
		mov	RAM_51,	A
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F605h
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPTR, #0F400h
		lcall	COPY_RAM

code_DC22:				; CODE XREF: code_DBE3+29j
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		ret
; End of function code_DBE3


; =============== S U B	R O U T	I N E =======================================


code_DC28:				; CODE XREF: code_DBB8:code_DBCEp
		jnb	RAM_2F.5, code_DC61
		lcall	code_C233
		mov	DPTR, #0F600h
		mov	A, #83h	; 'Г'
		movx	@DPTR, A
		mov	R4, A
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		inc	DPTR
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		inc	DPTR
		mov	A, #7Fh	; ''
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		mov	R0, #0AAh ; 'к'
		mov	A, @R0
		inc	DPTR
		movx	@DPTR, A
		add	A, R4
		mov	R4, A
		inc	DPTR
		mov	A, #21h	; '!'
		movx	@DPTR, A
		add	A, R4
		inc	DPTR
		movx	@DPTR, A
		mov	RAM_51,	#7
		setb	RAM_2F.4
		lcall	code_C244
		lcall	code_C225

code_DC61:				; CODE XREF: code_DC28j
		ret
; End of function code_DC28


; =============== S U B	R O U T	I N E =======================================


code_DC62:				; CODE XREF: code_D813+1Ap
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #80h	; 'А'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		inc	DPTR
		mov	A, #61h	; 'a'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#6
		pop	DPSEL		; Data Pointer Select Register
		mov	R3, #0BBh ; '¬'
		mov	R4, #7Bh ; '{'
		lcall	code_C2A9
		mov	R3, #0BBh ; '¬'
		mov	R4, #8Ch ; 'М'
		lcall	code_C2ED
		mov	R3, #0BBh ; '¬'
		mov	R4, #9Ah ; 'Ъ'
		lcall	code_C2C2
		mov	A, RAM_51
		clr	C
		subb	A, #4
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F603h
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		ret
; End of function code_DC62


; =============== S U B	R O U T	I N E =======================================


code_DCAD:				; CODE XREF: code_D813+24p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #80h	; 'А'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		inc	DPTR
		mov	A, #61h	; 'a'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#6
		pop	DPSEL		; Data Pointer Select Register
		mov	R3, #0BBh ; '¬'
		mov	R4, #0AAh ; 'к'
		lcall	code_C2A9
		mov	R3, #0BBh ; '¬'
		mov	R4, #0B6h ; '¦'
		lcall	code_C2ED
		mov	R3, #0BBh ; '¬'
		mov	R4, #0C0h ; 'L'
		lcall	code_C2C2
		mov	A, RAM_51
		clr	C
		subb	A, #4
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F603h
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		ret
; End of function code_DCAD


; =============== S U B	R O U T	I N E =======================================


code_DCF8:				; CODE XREF: code_D813+2Ep
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #80h	; 'А'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		inc	DPTR
		mov	A, #61h	; 'a'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#6
		pop	DPSEL		; Data Pointer Select Register
		mov	R3, #0BBh ; '¬'
		mov	R4, #0CEh ; '+'
		lcall	code_C2A9
		mov	R3, #0BBh ; '¬'
		mov	R4, #0D0h ; '¦'
		lcall	code_C2ED
		mov	A, RAM_51
		clr	C
		subb	A, #4
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F603h
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		ret
; End of function code_DCF8


; =============== S U B	R O U T	I N E =======================================


code_DD3C:				; CODE XREF: code_D813+38p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #80h	; 'А'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		inc	DPTR
		mov	A, #61h	; 'a'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#6
		pop	DPSEL		; Data Pointer Select Register
		mov	R3, #0BBh ; '¬'
		mov	R4, #0E6h ; 'ц'
		lcall	code_C2ED
		mov	A, RAM_51
		clr	C
		subb	A, #4
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F603h
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		ret
; End of function code_DD3C


; =============== S U B	R O U T	I N E =======================================


code_DD79:				; CODE XREF: code_D813+42p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #86h	; 'Ж'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #61h	; 'a'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F605h
		mov	R2, #4
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPTR, #0F47Ch
		lcall	COPY_RAM
		mov	RAM_51,	#9
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		ret
; End of function code_DD79


; =============== S U B	R O U T	I N E =======================================


code_DDAE:				; CODE XREF: code_D813+6Ap
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #87h	; 'З'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #61h	; 'a'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F605h
		mov	R2, #5
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPTR, #0F480h
		lcall	COPY_RAM
		mov	RAM_51,	#0Ah
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		ret
; End of function code_DDAE


; =============== S U B	R O U T	I N E =======================================


code_DDE3:				; CODE XREF: code_D813+4Cp
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #89h	; 'Й'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #61h	; 'a'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#5
		pop	DPSEL		; Data Pointer Select Register
		mov	R3, #0F4h ; 'Ї'
		mov	R4, #85h ; 'Е'
		lcall	code_C25A
		lcall	code_DBD2
		ret
; End of function code_DDE3


; =============== S U B	R O U T	I N E =======================================


code_DE0F:				; CODE XREF: code_D813+56p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #89h	; 'Й'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #61h	; 'a'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#5
		pop	DPSEL		; Data Pointer Select Register
		mov	R3, #0F4h ; 'Ї'
		mov	R4, #8Dh ; 'Н'
		lcall	code_C25A
		lcall	code_DBD2
		ret
; End of function code_DE0F


; =============== S U B	R O U T	I N E =======================================


code_DE3B:				; CODE XREF: code_D813+60p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #8Ch	; 'М'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #61h	; 'a'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#5
		pop	DPSEL		; Data Pointer Select Register
		mov	R3, #0F4h ; 'Ї'
		mov	R4, #95h ; 'Х'
		lcall	code_C25A
		lcall	code_DBD2
		ret
; End of function code_DE3B


; =============== S U B	R O U T	I N E =======================================


code_DE67:				; CODE XREF: code_DAEF+5Cp
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #95h	; 'Х'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #5Ah	; 'Z'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#5
		pop	DPSEL		; Data Pointer Select Register
		mov	R3, #0F4h ; 'Ї'
		mov	R4, #60h ; '`'
		lcall	code_C25A
		lcall	code_DBD2
		ret
; End of function code_DE67


; =============== S U B	R O U T	I N E =======================================


code_DE93:				; CODE XREF: code_DAEF+A0p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #89h	; 'Й'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #5Ah	; 'Z'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#5
		pop	DPSEL		; Data Pointer Select Register
		mov	R3, #0F4h ; 'Ї'
		mov	R4, #74h ; 't'
		lcall	code_C25A
		lcall	code_DBD2
		ret
; End of function code_DE93


; =============== S U B	R O U T	I N E =======================================


code_DEBF:				; CODE XREF: code_DEE4+24p
					; code_DF0C+24p ...
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #82h	; 'В'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #7Bh	; '{'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#5
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		ret
; End of function code_DEBF


; =============== S U B	R O U T	I N E =======================================


code_DEE4:				; CODE XREF: code_D95D+1Dp
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F460h
		mov	R2, #13h
		mov	DPSEL, #3	; Data Pointer Select Register
		jnb	RAM_2F.7, code_DEF9
		mov	DPTR, #0F706h
		sjmp	code_DEFC
; ---------------------------------------------------------------------------

code_DEF9:				; CODE XREF: code_DEE4+Dj
		mov	DPTR, #0F705h

code_DEFC:				; CODE XREF: code_DEE4+13j
		lcall	COPY_RAM
		clr	A
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_C4B0
		mov	R4, #90h ; 'Р'
		lcall	code_DEBF
		ret
; End of function code_DEE4


; =============== S U B	R O U T	I N E =======================================


code_DF0C:				; CODE XREF: code_D95D+27p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F474h
		mov	R2, #7
		mov	DPSEL, #3	; Data Pointer Select Register
		jnb	RAM_2F.7, code_DF21
		mov	DPTR, #0F706h
		sjmp	code_DF24
; ---------------------------------------------------------------------------

code_DF21:				; CODE XREF: code_DF0C+Dj
		mov	DPTR, #0F705h

code_DF24:				; CODE XREF: code_DF0C+13j
		lcall	COPY_RAM
		clr	A
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_C453
		mov	R4, #98h ; 'Ш'
		lcall	code_DEBF
		ret
; End of function code_DF0C


; =============== S U B	R O U T	I N E =======================================


code_DF34:				; CODE XREF: code_D95D+31p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F485h
		mov	R2, #7
		mov	DPSEL, #3	; Data Pointer Select Register
		jnb	RAM_2F.7, code_DF49
		mov	DPTR, #0F706h
		sjmp	code_DF4C
; ---------------------------------------------------------------------------

code_DF49:				; CODE XREF: code_DF34+Dj
		mov	DPTR, #0F705h

code_DF4C:				; CODE XREF: code_DF34+13j
		lcall	COPY_RAM
		clr	A
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_C415
		mov	R4, #0A1h ; 'б'
		lcall	code_DEBF
		ret
; End of function code_DF34


; =============== S U B	R O U T	I N E =======================================


code_DF5C:				; CODE XREF: code_D95D+3Bp
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F48Dh
		mov	R2, #7
		mov	DPSEL, #3	; Data Pointer Select Register
		jnb	RAM_2F.7, code_DF71
		mov	DPTR, #0F706h
		sjmp	code_DF74
; ---------------------------------------------------------------------------

code_DF71:				; CODE XREF: code_DF5C+Dj
		mov	DPTR, #0F705h

code_DF74:				; CODE XREF: code_DF5C+13j
		lcall	COPY_RAM
		clr	A
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_C434
		mov	R4, #0A2h ; 'в'
		lcall	code_DEBF
		ret
; End of function code_DF5C


; =============== S U B	R O U T	I N E =======================================


code_DF84:				; CODE XREF: code_D95D+45p
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F495h
		mov	R2, #0Ah
		mov	DPSEL, #3	; Data Pointer Select Register
		jnb	RAM_2F.7, code_DF99
		mov	DPTR, #0F706h
		sjmp	code_DF9C
; ---------------------------------------------------------------------------

code_DF99:				; CODE XREF: code_DF84+Dj
		mov	DPTR, #0F705h

code_DF9C:				; CODE XREF: code_DF84+13j
		lcall	COPY_RAM
		clr	A
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_C472
		mov	R4, #0A3h ; 'г'
		lcall	code_DEBF
		ret
; End of function code_DF84


; =============== S U B	R O U T	I N E =======================================


code_DFAC:				; CODE XREF: code_D891:code_D8C3p
		mov	A, R3
		xrl	A, #0
		jnz	code_DFB9
		anl	RAM_79,	#0F7h
		anl	RAM_7C,	#0F0h
		sjmp	code_DFBE
; ---------------------------------------------------------------------------

code_DFB9:				; CODE XREF: code_DFAC+3j
		mov	A, R3
		xrl	A, #1
		jnz	code_DFE9

code_DFBE:				; CODE XREF: code_DFAC+Bj
		mov	R2, #1
		setb	C
		mov	A, R4
		xrl	A, #1
		jnz	code_DFCA
		anl	C, P4.2		; Port 4 (PDIR=0)
		sjmp	code_DFE3
; ---------------------------------------------------------------------------

code_DFCA:				; CODE XREF: code_DFAC+18j
		mov	A, R4
		xrl	A, #2
		jnz	code_DFD3
		anl	C, P4.1		; Port 4 (PDIR=0)
		sjmp	code_DFE3
; ---------------------------------------------------------------------------

code_DFD3:				; CODE XREF: code_DFAC+21j
		mov	A, R4
		xrl	A, #3
		jnz	code_DFDC
		anl	C, P4.0		; Port 4 (PDIR=0)
		sjmp	code_DFE3
; ---------------------------------------------------------------------------

code_DFDC:				; CODE XREF: code_DFAC+2Aj
		mov	A, R4
		xrl	A, #4
		jnz	code_DFEC
		anl	C, P4.3		; Port 4 (PDIR=0)

code_DFE3:				; CODE XREF: code_DFAC+1Cj
					; code_DFAC+25j ...
		jnc	code_E057
		mov	R2, #0
		sjmp	code_E057
; ---------------------------------------------------------------------------

code_DFE9:				; CODE XREF: code_DFAC+10j
		mov	A, R3
		xrl	A, #6

code_DFEC:				; CODE XREF: code_DFAC+33j
					; code_DFAC+87j
		jz	code_DFF1
		ljmp	code_E0C7
; ---------------------------------------------------------------------------

code_DFF1:				; CODE XREF: code_DFAC:code_DFECj
		mov	A, RAM_7C
		anl	A, #0Fh
		jz	code_E001
		mov	A, RAM_2E
		anl	A, #0F0h
		jnz	code_E04B
		mov	R2, #1
		sjmp	code_E057
; ---------------------------------------------------------------------------

code_E001:				; CODE XREF: code_DFAC+49j
		jb	RAM_2A.6, code_E009
		orl	RAM_79,	#8
		clr	RAM_2E.3

code_E009:				; CODE XREF: code_DFAC:code_E001j
		mov	A, R4
		xrl	A, #1
		jnz	code_E016
		orl	RAM_7C,	#1
		anl	CMEN, #0FBh	; Compare Enable Register (RMAP=0)
		sjmp	code_E03B
; ---------------------------------------------------------------------------

code_E016:				; CODE XREF: code_DFAC+60j
		mov	A, R4
		xrl	A, #2
		jnz	code_E023
		orl	RAM_7C,	#2
		anl	CMEN, #0FDh	; Compare Enable Register (RMAP=0)
		sjmp	code_E03B
; ---------------------------------------------------------------------------

code_E023:				; CODE XREF: code_DFAC+6Dj
		mov	A, R4
		xrl	A, #3
		jnz	code_E030
		orl	RAM_7C,	#4
		anl	CMEN, #0FEh	; Compare Enable Register (RMAP=0)
		sjmp	code_E03B
; ---------------------------------------------------------------------------

code_E030:				; CODE XREF: code_DFAC+7Aj
		mov	A, R4
		xrl	A, #4
		jnz	code_DFEC
		orl	RAM_7C,	#8
		anl	CMEN, #0F7h	; Compare Enable Register (RMAP=0)

code_E03B:				; CODE XREF: code_DFAC+68j
					; code_DFAC+75j ...
		jnb	RAM_2F.7, code_E044
		mov	DPTR, #0F707h
		movx	A, @DPTR
		sjmp	code_E048
; ---------------------------------------------------------------------------

code_E044:				; CODE XREF: code_DFAC:code_E03Bj
		mov	DPTR, #0F706h
		movx	A, @DPTR

code_E048:				; CODE XREF: code_DFAC+96j
		mov	R2, A
		sjmp	code_E059
; ---------------------------------------------------------------------------

code_E04B:				; CODE XREF: code_DFAC+4Fj
					; code_DFAC+B9j ...
		mov	R2, #0
		mov	DPTR, #0F95Eh
		clr	A
		movx	@DPTR, A
		mov	DPTR, #0F95Fh
		inc	A
		movx	@DPTR, A

code_E057:				; CODE XREF: code_DFAC:code_DFE3j
					; code_DFAC+3Bj ...
		sjmp	code_E0D3
; ---------------------------------------------------------------------------

code_E059:				; CODE XREF: code_DFAC+9Dj
		mov	A, R4
		xrl	A, #1
		jnz	code_E070
		mov	A, R2
		jnz	code_E067
		setb	P4.2		; Port 4 (PDIR=0)
		setb	RAM_2E.4
		sjmp	code_E04B
; ---------------------------------------------------------------------------

code_E067:				; CODE XREF: code_DFAC+B3j
		jb	RAM_2A.6, code_E0CB
		clr		RAM_2E.4
		mov	R2, #1
		sjmp	code_E0B3
; ---------------------------------------------------------------------------

code_E070:				; CODE XREF: code_DFAC+B0j
		mov	A, R4
		xrl	A, #2
		jnz	code_E087
		mov	A, R2
		jnz	code_E07E
		setb	P4.1		; Port 4 (PDIR=0)
		setb	RAM_2E.5
		sjmp	code_E04B
; ---------------------------------------------------------------------------

code_E07E:				; CODE XREF: code_DFAC+CAj
		jb	RAM_2A.6, code_E0CB
		clr		RAM_2E.5
		mov	R2, #1
		sjmp	code_E0B3
; ---------------------------------------------------------------------------

code_E087:				; CODE XREF: code_DFAC+C7j
		mov	A, R4
		xrl	A, #3
		jnz	code_E09E
		mov	A, R2
		jnz	code_E095
		setb	P4.0		; Port 4 (PDIR=0)
		setb	RAM_2E.6
		sjmp	code_E04B
; ---------------------------------------------------------------------------

code_E095:				; CODE XREF: code_DFAC+E1j
		jb	RAM_2A.6, code_E0CB
		clr		RAM_2E.6
		mov	R2, #1
		sjmp	code_E0B3
; ---------------------------------------------------------------------------

code_E09E:				; CODE XREF: code_DFAC+DEj
		mov	A, R4
		xrl	A, #4
		jnz	code_E0C7
		mov	A, R2
		jnz	code_E0AC
		setb	P4.3		; Port 4 (PDIR=0)
		setb	RAM_2E.7
		sjmp	code_E04B
; ---------------------------------------------------------------------------

code_E0AC:				; CODE XREF: code_DFAC+F8j
		jb	RAM_2A.6, code_E0CB
		mov	R2, #1
		clr		RAM_2E.7

code_E0B3:				; CODE XREF: code_DFAC+C2j
					; code_DFAC+D9j ...
		mov	DPTR, #0F95Fh
		mov	A, #63h	; 'c'
		movx	@DPTR, A
		mov	DPTR, #0F95Eh
		mov	A, #9
		movx	@DPTR, A
		mov	DPTR, #0F95Dh
		mov	A, #5
		movx	@DPTR, A
		sjmp	code_E0D3
; ---------------------------------------------------------------------------

code_E0C7:				; CODE XREF: code_DFAC+42j
					; code_DFAC+F5j
		mov	R2, #12h
		sjmp	code_E0D3
; ---------------------------------------------------------------------------

code_E0CB:				; CODE XREF: code_DFAC:code_E067j
					; code_DFAC:code_E07Ej	...
		anl	RAM_79,	#0F7h
		anl	RAM_7C,	#0F0h
		mov	R2, #31h ; '1'

code_E0D3:				; CODE XREF: code_DFAC:code_E057j
					; code_DFAC+119j ...
		ret
; End of function code_DFAC


; =============== S U B	R O U T	I N E =======================================


code_E0D4:				; CODE XREF: code_D891:code_D8D7p
		mov	A, R3
		xrl	A, #0
		jnz	code_E0DE
		anl	RAM_7C,	#0EFh
		sjmp	code_E0E3
; ---------------------------------------------------------------------------

code_E0DE:				; CODE XREF: code_E0D4+3j
		mov	A, R3
		xrl	A, #1
		jnz	code_E0EE

code_E0E3:				; CODE XREF: code_E0D4+8j
		mov	R2, #1
		setb	C
		anl	C, P4.4		; Port 4 (PDIR=0)
		jnc	code_E12B
		mov	R2, #0
		sjmp	code_E12B
; ---------------------------------------------------------------------------

code_E0EE:				; CODE XREF: code_E0D4+Dj
		mov	A, R3
		xrl	A, #6
		jnz	code_E129
		anl	RAM_7C,	#0DFh
		orl	RAM_7C,	#10h
		jnb	RAM_2F.7, code_E102
		mov	DPTR, #0F707h
		movx	A, @DPTR
		sjmp	code_E106
; ---------------------------------------------------------------------------

code_E102:				; CODE XREF: code_E0D4+25j
		mov	DPTR, #0F706h
		movx	A, @DPTR

code_E106:				; CODE XREF: code_E0D4+2Cj
		setb	P4.4		; Port 4 (PDIR=0)
		setb	P4.7		; Port 4 (PDIR=0)
		jnz	code_E113
		mov	R2, #0
		anl	RAM_7C,	#0EFh
		sjmp	code_E12B
; ---------------------------------------------------------------------------

code_E113:				; CODE XREF: code_E0D4+36j
		mov	R2, #1
		mov	DPTR, #0F960h
		mov	A, #9
		movx	@DPTR, A
		mov	DPTR, #0F961h
		mov	A, #8
		movx	@DPTR, A
		mov	DPTR, #0F962h
		mov	A, #14h
		movx	@DPTR, A
		sjmp	code_E12B
; ---------------------------------------------------------------------------

code_E129:				; CODE XREF: code_E0D4+1Dj
		mov	R2, #12h

code_E12B:				; CODE XREF: code_E0D4+14j
					; code_E0D4+18j ...
		ret
; End of function code_E0D4


; =============== S U B	R O U T	I N E =======================================


code_E12C:				; CODE XREF: code_D891+57p
		mov	A, R3
		xrl	A, #0
		jnz	code_E136
		anl	RAM_7C,	#0DFh
		sjmp	code_E13B
; ---------------------------------------------------------------------------

code_E136:				; CODE XREF: code_E12C+3j
		mov	A, R3
		xrl	A, #1
		jnz	code_E146

code_E13B:				; CODE XREF: code_E12C+8j
		mov	R2, #1
		setb	C
		anl	C, P4.6		; Port 4 (PDIR=0)
		jnc	code_E183
		mov	R2, #0
		sjmp	code_E183
; ---------------------------------------------------------------------------

code_E146:				; CODE XREF: code_E12C+Dj
		mov	A, R3
		xrl	A, #6
		jnz	code_E181
		anl	RAM_7C,	#0EFh
		orl	RAM_7C,	#20h
		jnb	RAM_2F.7, code_E15A
		mov	DPTR, #0F707h
		movx	A, @DPTR
		sjmp	code_E15E
; ---------------------------------------------------------------------------

code_E15A:				; CODE XREF: code_E12C+25j
		mov	DPTR, #0F706h
		movx	A, @DPTR

code_E15E:				; CODE XREF: code_E12C+2Cj
		setb	P4.6		; Port 4 (PDIR=0)
		setb	P4.5		; Port 4 (PDIR=0)
		jnz	code_E16B
		mov	R2, #0
		anl	RAM_7C,	#0DFh
		sjmp	code_E183
; ---------------------------------------------------------------------------

code_E16B:				; CODE XREF: code_E12C+36j
		mov	R2, #1
		mov	DPTR, #0F960h
		mov	A, #9
		movx	@DPTR, A
		mov	DPTR, #0F961h
		mov	A, #8
		movx	@DPTR, A
		mov	DPTR, #0F962h
		mov	A, #14h
		movx	@DPTR, A
		sjmp	code_E183
; ---------------------------------------------------------------------------

code_E181:				; CODE XREF: code_E12C+1Dj
		mov	R2, #12h

code_E183:				; CODE XREF: code_E12C+14j
					; code_E12C+18j ...
		ret
; End of function code_E12C


; =============== S U B	R O U T	I N E =======================================


code_E184:				; CODE XREF: code_D891+8Ep
		mov	A, R3
		xrl	A, #0
		jnz	code_E18E
		anl	RAM_79,	#0FEh
		sjmp	code_E193
; ---------------------------------------------------------------------------

code_E18E:				; CODE XREF: code_E184+3j
		mov	A, R3
		xrl	A, #1
		jnz	code_E1A1

code_E193:				; CODE XREF: code_E184+8j
		mov	R2, #1
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		mov	C, ACC.4	; Accumulator
		jc	code_E1C6
		mov	R2, #0
		sjmp	code_E1C6
; ---------------------------------------------------------------------------

code_E1A1:				; CODE XREF: code_E184+Dj
		mov	A, R3
		xrl	A, #6
		jnz	code_E1C4
		orl	RAM_79,	#1
		jnb	RAM_2F.7, code_E1B2
		mov	DPTR, #0F707h
		movx	A, @DPTR
		sjmp	code_E1B6
; ---------------------------------------------------------------------------

code_E1B2:				; CODE XREF: code_E184+25j
		mov	DPTR, #0F706h
		movx	A, @DPTR

code_E1B6:				; CODE XREF: code_E184+2Cj
		jnz	code_E1BE
		clr	RAM_2E.0
		mov	R2, #0
		sjmp	code_E1C6
; ---------------------------------------------------------------------------

code_E1BE:				; CODE XREF: code_E184:code_E1B6j
		setb	RAM_2E.0
		mov	R2, #1
		sjmp	code_E1C6
; ---------------------------------------------------------------------------

code_E1C4:				; CODE XREF: code_E184+20j
		mov	R2, #12h

code_E1C6:				; CODE XREF: code_E184+17j
					; code_E184+1Bj ...
		ret
; End of function code_E184


; =============== S U B	R O U T	I N E =======================================


code_E1C7:				; CODE XREF: code_D891+81p
		mov	A, R3
		xrl	A, #0
		jnz	code_E1D1
		anl	RAM_79,	#0FBh
		sjmp	code_E1D6
; ---------------------------------------------------------------------------

code_E1D1:				; CODE XREF: code_E1C7+3j
		mov	A, R3
		xrl	A, #1
		jnz	code_E1E4

code_E1D6:				; CODE XREF: code_E1C7+8j
		mov	R2, #1
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		mov	C, ACC.5	; Accumulator
		jc	code_E209
		mov	R2, #0
		sjmp	code_E209
; ---------------------------------------------------------------------------

code_E1E4:				; CODE XREF: code_E1C7+Dj
		mov	A, R3
		xrl	A, #6
		jnz	code_E207
		orl	RAM_79,	#4
		jnb	RAM_2F.7, code_E1F5
		mov	DPTR, #0F707h
		movx	A, @DPTR
		sjmp	code_E1F9
; ---------------------------------------------------------------------------

code_E1F5:				; CODE XREF: code_E1C7+25j
		mov	DPTR, #0F706h
		movx	A, @DPTR

code_E1F9:				; CODE XREF: code_E1C7+2Cj
		jnz	code_E201
		clr	RAM_2E.2
		mov	R2, #0
		sjmp	code_E209
; ---------------------------------------------------------------------------

code_E201:				; CODE XREF: code_E1C7:code_E1F9j
		setb	RAM_2E.2
		mov	R2, #1
		sjmp	code_E209
; ---------------------------------------------------------------------------

code_E207:				; CODE XREF: code_E1C7+20j
		mov	R2, #12h

code_E209:				; CODE XREF: code_E1C7+17j
					; code_E1C7+1Bj ...
		ret
; End of function code_E1C7


; =============== S U B	R O U T	I N E =======================================


code_E20A:				; CODE XREF: code_D891+74p
		mov	A, R3
		xrl	A, #0
		jnz	code_E214
		anl	RAM_79,	#0FDh
		sjmp	code_E219
; ---------------------------------------------------------------------------

code_E214:				; CODE XREF: code_E20A+3j
		mov	A, R3
		xrl	A, #1
		jnz	code_E223

code_E219:				; CODE XREF: code_E20A+8j
		mov	R2, #0
		mov	C, RAM_28.1
		jnc	code_E248
		mov	R2, #1
		sjmp	code_E248
; ---------------------------------------------------------------------------

code_E223:				; CODE XREF: code_E20A+Dj
		mov	A, R3
		xrl	A, #6
		jnz	code_E246
		orl	RAM_79,	#2
		jnb	RAM_2F.7, code_E234
		mov	DPTR, #0F707h
		movx	A, @DPTR
		sjmp	code_E238
; ---------------------------------------------------------------------------

code_E234:				; CODE XREF: code_E20A+21j
		mov	DPTR, #0F706h
		movx	A, @DPTR

code_E238:				; CODE XREF: code_E20A+28j
		jnz	code_E240
		clr	RAM_2E.1
		mov	R2, #0
		sjmp	code_E248
; ---------------------------------------------------------------------------

code_E240:				; CODE XREF: code_E20A:code_E238j
		setb	RAM_2E.1
		mov	R2, #1
		sjmp	code_E248
; ---------------------------------------------------------------------------

code_E246:				; CODE XREF: code_E20A+1Cj
		mov	R2, #12h

code_E248:				; CODE XREF: code_E20A+13j
					; code_E20A+17j ...
		ret
; End of function code_E20A


; =============== S U B	R O U T	I N E =======================================


code_E249:				; CODE XREF: code_D891+67p
		mov	A, R3
		xrl	A, #0
		jnz	code_E253
		anl	RAM_79,	#0F7h
		sjmp	code_E258
; ---------------------------------------------------------------------------

code_E253:				; CODE XREF: code_E249+3j
		mov	A, R3
		xrl	A, #1
		jnz	code_E266

code_E258:				; CODE XREF: code_E249+8j
		mov	R2, #1
		mov	DPTR, #0F9A7h
		movx	A, @DPTR
		mov	C, ACC.3	; Accumulator
		jc	code_E28B
		mov	R2, #0
		sjmp	code_E28B
; ---------------------------------------------------------------------------

code_E266:				; CODE XREF: code_E249+Dj
		mov	A, R3
		xrl	A, #6
		jnz	code_E289
		orl	RAM_79,	#8
		jnb	RAM_2F.7, code_E277
		mov	DPTR, #0F707h
		movx	A, @DPTR
		sjmp	code_E27B
; ---------------------------------------------------------------------------

code_E277:				; CODE XREF: code_E249+25j
		mov	DPTR, #0F706h
		movx	A, @DPTR

code_E27B:				; CODE XREF: code_E249+2Cj
		jnz	code_E283
		clr	RAM_2E.3
		mov	R2, #0
		sjmp	code_E28B
; ---------------------------------------------------------------------------

code_E283:				; CODE XREF: code_E249:code_E27Bj
		setb	RAM_2E.3
		mov	R2, #1
		sjmp	code_E28B
; ---------------------------------------------------------------------------

code_E289:				; CODE XREF: code_E249+20j
		mov	R2, #12h

code_E28B:				; CODE XREF: code_E249+17j
					; code_E249+1Bj ...
		ret
; End of function code_E249


; =============== S U B	R O U T	I N E =======================================


code_E28C:				; CODE XREF: code_D891+35p
					; code_D891+49p ...
		mov	A, R2
		xrl	A, #12h
		jnz	code_E29A
		mov	R3, #81h ; 'Б'
		mov	R4, #25h ; '%'
		lcall	code_C270
		sjmp	code_E2D2
; ---------------------------------------------------------------------------

code_E29A:				; CODE XREF: code_E28C+3j
		mov	A, R2
		xrl	A, #31h
		jnz	code_E2A8
		mov	R3, #81h ; 'Б'
		mov	R4, #35h ; '5'
		lcall	code_C270
		sjmp	code_E2D2
; ---------------------------------------------------------------------------

code_E2A8:				; CODE XREF: code_E28C+11j
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #84h	; 'Д'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #70h	; 'p'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	A, R3
		movx	@DPTR, A
		inc	DPTR
		mov	A, R2
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#7
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2

code_E2D2:				; CODE XREF: code_E28C+Cj
					; code_E28C+1Aj
		ret
; End of function code_E28C


; =============== S U B	R O U T	I N E =======================================


code_E2D3:				; CODE XREF: code_D891+9Bp
		mov	A, R3
		xrl	A, #0
		jnz	code_E2DF
		anl	DEV_FLAGS, #0DFh
		mov	R2, #0
		sjmp	code_E305
; ---------------------------------------------------------------------------

code_E2DF:				; CODE XREF: code_E2D3+3j
		mov	A, R3
		xrl	A, #1
		jnz	code_E2E8
		mov	R2, #0
		sjmp	code_E305
; ---------------------------------------------------------------------------

code_E2E8:				; CODE XREF: code_E2D3+Fj
		mov	A, R3
		xrl	A, #7
		jnz	code_E303
		orl	DEV_FLAGS, #20h
		jnb	RAM_2F.7, code_E2F9
		mov	DPTR, #0F707h
		movx	A, @DPTR
		sjmp	code_E2FD
; ---------------------------------------------------------------------------

code_E2F9:				; CODE XREF: code_E2D3+1Dj
		mov	DPTR, #0F706h
		movx	A, @DPTR

code_E2FD:				; CODE XREF: code_E2D3+24j
		mov	UFRXX, A
		mov	R2, #0
		sjmp	code_E305
; ---------------------------------------------------------------------------

code_E303:				; CODE XREF: code_E2D3+18j
		mov	R2, #12h

code_E305:				; CODE XREF: code_E2D3+Aj
					; code_E2D3+13j ...
		ret
; End of function code_E2D3


; =============== S U B	R O U T	I N E =======================================


code_E306:				; CODE XREF: code_D891+A8p
		mov	A, R3
		xrl	A, #0
		jnz	code_E312
		anl	DEV_FLAGS, #0BFh
		mov	R2, #0
		sjmp	code_E33A
; ---------------------------------------------------------------------------

code_E312:				; CODE XREF: code_E306+3j
		mov	A, R3
		xrl	A, #1
		jnz	code_E31B
		mov	R2, #0
		sjmp	code_E33A
; ---------------------------------------------------------------------------

code_E31B:				; CODE XREF: code_E306+Fj
		mov	A, R3
		xrl	A, #7
		jnz	code_E338
		orl	DEV_FLAGS, #40h
		jnb	RAM_2F.7, code_E32C
		mov	DPTR, #0F707h
		movx	A, @DPTR
		sjmp	code_E330
; ---------------------------------------------------------------------------

code_E32C:				; CODE XREF: code_E306+1Dj
		mov	DPTR, #0F706h
		movx	A, @DPTR

code_E330:				; CODE XREF: code_E306+24j
		mov	DPTR, #0F849h
		movx	@DPTR, A
		mov	R2, #0
		sjmp	code_E33A
; ---------------------------------------------------------------------------

code_E338:				; CODE XREF: code_E306+18j
		mov	R2, #12h

code_E33A:				; CODE XREF: code_E306+Aj
					; code_E306+13j ...
		ret
; End of function code_E306


; =============== S U B	R O U T	I N E =======================================


code_E33B:				; CODE XREF: code_D891+9Ep
					; code_D891+ABp
		mov	A, R2
		xrl	A, #12h
		jnz	code_E349
		mov	R3, #81h ; 'Б'
		mov	R4, #25h ; '%'
		lcall	code_C270
		sjmp	code_E38E
; ---------------------------------------------------------------------------

code_E349:				; CODE XREF: code_E33B+3j
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #87h	; 'З'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #70h	; 'p'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	A, R3
		movx	@DPTR, A
		inc	DPTR
		mov	A, UFRXX
		movx	@DPTR, A
		inc	DPTR
		mov	A, CRRXX
		movx	@DPTR, A
		inc	DPTR
		mov	A, RPM_XX
		cjne	A, #0FFh, code_E377
		mov	A, RPM

code_E377:				; CODE XREF: code_E33B+37j
		movx	@DPTR, A
		inc	DPTR
		pop	DPSEL		; Data Pointer Select Register
		mov	DPTR, #0F849h
		movx	A, @DPTR
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		movx	@DPTR, A
		inc	DPTR
		pop	DPSEL		; Data Pointer Select Register
		mov	RAM_51,	#0Ah
		lcall	code_DBD2

code_E38E:				; CODE XREF: code_E33B+Cj
		ret
; End of function code_E33B


; =============== S U B	R O U T	I N E =======================================


code_E38F:				; CODE XREF: code_D891+B5p
		mov	A, R3
		xrl	A, #0
		jnz	code_E399
		anl	RAM_7B,	#0FBh
		sjmp	code_E39E
; ---------------------------------------------------------------------------

code_E399:				; CODE XREF: code_E38F+3j
		mov	A, R3
		xrl	A, #1
		jnz	code_E3AA

code_E39E:				; CODE XREF: code_E38F+8j
		mov	R2, #0
		mov	DPTR, #0F806h
		movx	A, @DPTR
		jz	code_E3DB
		mov	R2, #1
		sjmp	code_E3DB
; ---------------------------------------------------------------------------

code_E3AA:				; CODE XREF: code_E38F+Dj
		mov	A, R3
		xrl	A, #6
		jnz	code_E3D9
		orl	RAM_7B,	#4
		jnb	RAM_2F.7, code_E3BB
		mov	DPTR, #0F707h
		movx	A, @DPTR
		sjmp	code_E3BF
; ---------------------------------------------------------------------------

code_E3BB:				; CODE XREF: code_E38F+23j
		mov	DPTR, #0F706h
		movx	A, @DPTR

code_E3BF:				; CODE XREF: code_E38F+2Aj
		jnz	code_E3CD
		clr		A
		mov	DPTR, #0F806h
		movx	@DPTR, A
		mov	R2, #0
		sjmp	code_E3DB
; ---------------------------------------------------------------------------

code_E3CD:				; CODE XREF: code_E38F:code_E3BFj
		mov	A, #40h	; '@'
		mov	DPTR, #0F806h
		movx	@DPTR, A
		mov	R2, #1
		sjmp	code_E3DB
; ---------------------------------------------------------------------------

code_E3D9:				; CODE XREF: code_E38F+1Ej
		mov	R2, #12h

code_E3DB:				; CODE XREF: code_E38F+15j
					; code_E38F+19j ...
		ret
; End of function code_E38F


; =============== S U B	R O U T	I N E =======================================


code_E3DC:				; CODE XREF: TF1_0+DBp
		mov	R0, #0A8h ; 'и'
		mov	@R0, #0D0h ; '¦'
		mov	S0RELL,	@R0	; Serial Channel 0 Reload Reg.,	Low Byte
		ljmp	code_C225
; End of function code_E3DC

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR code_D5EA

code_E3E5:				; CODE XREF: code_D5EA:code_D693j
		mov	A, R4
		xrl	A, #3Dh
		jnz	code_E3EF
		lcall	code_E47A
		sjmp	code_E3F2
; ---------------------------------------------------------------------------

code_E3EF:				; CODE XREF: code_D5EA+DFEj
		lcall	code_D9E8

code_E3F2:				; CODE XREF: code_D5EA+E03j
		ret
; END OF FUNCTION CHUNK	FOR code_D5EA

; =============== S U B	R O U T	I N E =======================================


code_E3F3:				; CODE XREF: code_D5EA+47p
		lcall	code_C233
		jb	RAM_2F.5, code_E3FC
		ljmp	code_E470
; ---------------------------------------------------------------------------

code_E3FC:				; CODE XREF: code_E3F3+3j
		setb	RAM_2F.6
		mov	DPTR, #0F704h
		jnb	RAM_2F.7, code_E405
		inc	DPTR

code_E405:				; CODE XREF: code_E3F3+Ej
		movx	A, @DPTR
		jnz	code_E466
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		inc	DPTR
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		jz	code_E45C
		cjne	A, #78h, code_E415 ; 'x'

code_E415:
		jnc	code_E45C
		mov	R2, A
		mov	A, #80h	; 'А'
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, R2
		inc	A
		movx	@DPTR, A
		inc	DPTR
		mov	A, #63h	; 'c'
		movx	@DPTR, A
		mov	A, R2
		add	A, #5
		mov	RAM_51,	A
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPTR, #0F605h
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPH, R3		; Data Pointer,	High Byte
		mov	DPL, R4		; Data Pointer,	Low Byte
		cjne	R3, #0F3h, code_E449 ; 'є'

code_E449:
		jnc	code_E451
		lcall	COPY_DALLAS_HASH_RAM
		jmp	code_E454
; ---------------------------------------------------------------------------

code_E451:				; CODE XREF: code_E3F3:code_E449j
		lcall	COPY_RAM

code_E454:				; CODE XREF: code_E3F3+5Bj
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		jmp	code_E477
; ---------------------------------------------------------------------------

code_E45C:				; CODE XREF: code_E3F3+1Dj
					; code_E3F3:code_E415j
		mov	R3, #81h ; 'Б'
		mov	R4, #4Dh ; 'M'
		lcall	code_C270
		jmp	code_E477
; ---------------------------------------------------------------------------

code_E466:				; CODE XREF: code_E3F3+13j
		mov	R3, #81h ; 'Б'
		mov	R4, #45h ; 'E'
		lcall	code_C270
		jmp	code_E477
; ---------------------------------------------------------------------------

code_E470:				; CODE XREF: code_E3F3+6j
		mov	R3, #81h ; 'Б'
		mov	R4, #3Dh ; '='
		lcall	code_C270

code_E477:				; CODE XREF: code_E3F3+66j
					; code_E3F3+70j ...
		setb	RAM_2F.4
		ret
; End of function code_E3F3


; =============== S U B	R O U T	I N E =======================================


code_E47A:				; CODE XREF: code_D5EA+E00p
		lcall	code_C233
		jb	RAM_2F.5, code_E483
		ljmp	code_E4FC
; ---------------------------------------------------------------------------

code_E483:				; CODE XREF: code_E47A+3j
		setb	RAM_2F.6
		mov	DPTR, #0F704h
		jnb	RAM_2F.7, code_E48C
		inc	DPTR

code_E48C:				; CODE XREF: code_E47A+Ej
		movx	A, @DPTR
		jnz	code_E4F2
		inc	DPTR
		movx	A, @DPTR
		mov	R3, A
		inc	DPTR
		movx	A, @DPTR
		mov	R4, A
		inc	DPTR
		movx	A, @DPTR
		jz	code_E4E8
		cjne	A, #70h, code_E49C ; 'p'

code_E49C:
		jnc	code_E4E8
		mov	R2, A
		mov	A, R4
		add	A, R2
		mov	A, R3
		addc	A, #0
		jc	code_E4E8
		inc	DPTR
		mov	R0, DPH		; Data Pointer,	High Byte
		mov	R1, DPL		; Data Pointer,	Low Byte
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #4	; Data Pointer Select Register
		mov	DPH, R3		; Data Pointer,	High Byte
		mov	DPL, R4		; Data Pointer,	Low Byte
		mov	DPSEL, #3	; Data Pointer Select Register
		mov	DPH, R0		; Data Pointer,	High Byte
		mov	DPL, R1		; Data Pointer,	Low Byte
		cjne	R3, #0F4h, code_E49D ; 'є'
code_E49D:
		jnc	code_E49E
		lcall	COPY_DALLAS_HASH_RAM
		jmp	code_E49F
code_E49E:				; CODE XREF: code_E3F3:code_E449j
		lcall	COPY_RAM
code_E49F:
		mov	A, #84h	; 'Д'
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #7Dh	; '}'
		movx	@DPTR, A
		inc	DPTR
		clr	A
		movx	@DPTR, A
		inc	DPTR
		mov	A, R3
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		mov	RAM_51,	#7
		lcall	code_DBD2
		ljmp	code_E503
; ---------------------------------------------------------------------------

code_E4E8:				; CODE XREF: code_E47A+1Dj
					; code_E47A:code_E49Cj	...
		mov	R3, #81h ; 'Б'
		mov	R4, #65h ; 'e'
		lcall	code_C270
		ljmp	code_E503
; ---------------------------------------------------------------------------

code_E4F2:				; CODE XREF: code_E47A+13j
		mov	R3, #81h ; 'Б'
		mov	R4, #5Dh ; ']'
		lcall	code_C270
		ljmp	code_E503
; ---------------------------------------------------------------------------

code_E4FC:				; CODE XREF: code_E47A+6j
		mov	R3, #81h ; 'Б'
		mov	R4, #55h ; 'U'
		lcall	code_C270

code_E503:				; CODE XREF: code_E47A+6Bj
					; code_E47A+75j ...
		setb	RAM_2F.4
		ret
; End of function code_E47A


; =============== S U B	R O U T	I N E =======================================


COPY_DALLAS_HASH_RAM:				; CODE XREF: code_E3F3+58p
					; code_E47A+41p
		mov	B, #0		; B-Register
		mov	DPSEL, #0	; Data Pointer Select Register
		mov	DPTR, #0F6F8h

code_E50F:				; CODE XREF: code_E506+2Cj
		mov	A, #3
		mul	AB
		add	A, #0A5h ; 'е'
		mov	B, A		; B-Register
		mov	DPSEL, #0	; Data Pointer Select Register
		movx	A, @DPTR
		add	A, B		; B-Register
		mov	B, A		; B-Register
		inc	DPTR
		mov	A, DPL		; Data Pointer,	Low Byte
		jnz	code_E526
		mov	DPTR, #0F6F8h

code_E526:				; CODE XREF: code_E506+1Bj
		mov	DPSEL, #3	; Data Pointer Select Register
		movx	A, @DPTR
		inc	DPTR
		xrl	A, B		; B-Register
		mov	DPSEL, #4	; Data Pointer Select Register
		movx	@DPTR, A
		inc	DPTR
		djnz	R2, code_E50F
		ret
; End of function code_E506


; =============== S U B	R O U T	I N E =======================================


code_E535:				; CODE XREF: code_E558+5p
					; code_E558+24p ...
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #80h	; 'А'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		inc	DPTR
		mov	A, #61h	; 'a'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#6
		pop	DPSEL		; Data Pointer Select Register
		ret
; End of function code_E535


; =============== S U B	R O U T	I N E =======================================


code_E558:				; CODE XREF: code_D813:code_D882p
		mov	A, R4
		xrl	A, #0Fh
		jnz	code_E577
		call	code_E535
		mov	R3, #0BBh ; '¬'
		mov	R4, #1Eh
		call	code_C2A9
		mov	R3, #0BBh ; '¬'
		mov	R4, #39h ; '9'
		call	code_C2ED
		mov	R3, #0BBh ; '¬'
		mov	R4, #55h ; 'U'
		call	code_C2C2
		jmp	code_E5CB
; ---------------------------------------------------------------------------

code_E577:				; CODE XREF: code_E558+3j
		mov	A, R4
		xrl	A, #0Eh
		jnz	code_E596
		call	code_E535
		mov	R3, #0BBh ; '¬'
		mov	R4, #63h ; 'c'
		call	code_C2A9
		mov	R3, #0BBh ; '¬'
		mov	R4, #6Bh ; 'k'
		call	code_C2ED
		mov	R3, #0BBh ; '¬'
		mov	R4, #73h ; 's'
		call	code_C2C2
		jmp	code_E5CB
; ---------------------------------------------------------------------------

;j7_es diag request
code_E596:				; CODE XREF: code_E558+22j
		mov	A, R4
		xrl	A, #0Dh
		jnz	code_E5C3
		call	code_E535
		mov	R3, #0BBh ; '¬'
		mov	R4, #1Eh
		call	code_C2A9
		mov	R3, #0BBh ; '¬'
		mov	R4, #39h ; '9'
		call	code_C2ED
		mov	R3, #0BBh ; '¬'
		mov	R4, #55h ; 'U'
		call	code_C2C2
		
		mov	R3, #0BAh ; '¬'
		mov	R4, #0EDh
		call	code_C2ED
		
		mov	R3, #0BAh ; '¬'
		mov	R4, #0E0h
		call	code_C2A9
		
		mov	R3, #0BAh ; '¦'
		mov	R4, #0D0h ; 'р'
		call	code_C2C2
		jmp	code_E5CB
; ---------------------------------------------------------------------------

code_E5C3:				; CODE XREF: code_E558+41j
		mov	R3, #81h ; 'Б'
		mov	R4, #0Dh
		call	code_C270
		ret
; ---------------------------------------------------------------------------

code_E5CB:				; CODE XREF: code_E558+1Cj
					; code_E558+3Bj ...
		mov	A, RAM_51
		clr	C
		subb	A, #4
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F603h
		movx	@DPTR, A
		pop	DPSEL		; Data Pointer Select Register
		call	code_DBD2
		ret
; End of function code_E558


; =============== S U B	R O U T	I N E =======================================


code_E5DF:				; CODE XREF: code_D891:code_D94Ep
		mov	A, R4
		xrl	A, #0Fh
		jnz	code_E5EC
		lcall	SwithToRAM
		jc	code_E647
		ljmp	code_E64F
; ---------------------------------------------------------------------------

code_E5EC:				; CODE XREF: code_E5DF+3j
		mov	A, R4
		xrl	A, #49h
		jnz	code_E5F9
		lcall	code_E688
		jc	code_E647
		ljmp	code_E64F
; ---------------------------------------------------------------------------

code_E5F9:				; CODE XREF: code_E5DF+10j
		mov	A, R4
		xrl	A, #4Ah
		jnz	code_E606
		lcall	code_E6B5
		jc	code_E647
		ljmp	code_E64F
; ---------------------------------------------------------------------------

code_E606:				; CODE XREF: code_E5DF+1Dj
		mov	A, R4
		xrl	A, #4Bh
		jnz	code_E613
		lcall	code_E6E2
		jc	code_E647
		ljmp	code_E64F
; ---------------------------------------------------------------------------

code_E613:				; CODE XREF: code_E5DF+2Aj
		mov	A, R4
		xrl	A, #4Ch
		jnz	code_E620
		lcall	code_E714
		jc	code_E647
		ljmp	code_E64F
; ---------------------------------------------------------------------------

code_E620:				; CODE XREF: code_E5DF+37j
		mov	A, R4
		xrl	A, #4Dh
		jnz	code_E62D
		lcall	code_E741
		jc	code_E647
		ljmp	code_E64F
; ---------------------------------------------------------------------------

code_E62D:				; CODE XREF: code_E5DF+44j
		mov	A, R4
		xrl	A, #4Eh
		jnz	code_E63A
		lcall	code_E76E
		jc	code_E647
		ljmp	code_E64F
; ---------------------------------------------------------------------------

code_E63A:				; CODE XREF: code_E5DF+51j
		mov	A, R4
		xrl	A, #71h
		jnz	code_E647
		lcall	RAM_CAPTURE_REQUEST_PROCESS
		jc	code_E647
		ljmp	code_E64F
; ---------------------------------------------------------------------------

code_E647:				; CODE XREF: code_E5DF+8j
					; code_E5DF+15j ...
		mov	R3, #81h ; 'Б'
		mov	R4, #25h ; '%'
		lcall	code_C270
		ret
; ---------------------------------------------------------------------------

code_E64F:				; CODE XREF: code_E5DF+Aj
					; code_E5DF+17j ...
		lcall	code_E79B
		ret
; End of function code_E5DF


; =============== S U B	R O U T	I N E =======================================


SwithToRAM:				; CODE XREF: code_E5DF+5p
		mov	A, R3
		jnz	code_E65B
		setb	P3.2		; Port 3 (PDIR=0)
		jmp	code_E660
; ---------------------------------------------------------------------------

code_E65B:				; CODE XREF: code_E653+1j
		mov	A, R3
		xrl	A, #1
		jnz	code_E66B

code_E660:				; CODE XREF: code_E653+5j
		clr	A
		mov	C, P3.2		; Port 3 (PDIR=0)
		cpl	C
		mov	ACC.0, C	; Accumulator
		mov	R2, A
		clr	C
		jmp	code_E687
; ---------------------------------------------------------------------------

code_E66B:				; CODE XREF: code_E653+Bj
		mov	A, R3
		xrl	A, #6
		jnz	code_E686
		mov	DPTR, #0F706h
		jnb	RAM_2F.7, code_E677
		inc	DPTR

code_E677:				; CODE XREF: code_E653+20j
		movx	A, @DPTR
		jz	code_E67C
		mov	A, #1

code_E67C:				; CODE XREF: code_E653+25j
		mov	C, ACC.0	; Accumulator
		cpl	C
		mov	P3.2, C		; Port 3 (PDIR=0)
		mov	R2, A
		clr	C
		jmp	code_E687
; ---------------------------------------------------------------------------

code_E686:				; CODE XREF: code_E653+1Bj
		setb	C

code_E687:				; CODE XREF: code_E653+15j
					; code_E653+30j
		ret
; End of function code_E653


; =============== S U B	R O U T	I N E =======================================


code_E688:				; CODE XREF: code_E5DF+12p
		mov	A, R3
		jnz	code_E691
		anl	DEV_FLAGS, #0FEh
		jmp	code_E696
; ---------------------------------------------------------------------------

code_E691:				; CODE XREF: code_E688+1j
		mov	A, R3
		xrl	A, #1
		jnz	code_E69C

code_E696:				; CODE XREF: code_E688+6j
		mov	R2, ALF_2
		clr	C
		jmp	code_E6B4
; ---------------------------------------------------------------------------

code_E69C:				; CODE XREF: code_E688+Cj
		mov	A, R3
		xrl	A, #7
		jnz	code_E6B3
		mov	DPTR, #0F706h
		jnb	RAM_2F.7, code_E6A8
		inc	DPTR

code_E6A8:				; CODE XREF: code_E688+1Cj
		movx	A, @DPTR
		orl	DEV_FLAGS, #1
		mov	ALF_2, A
		mov	R2, A
		clr	C
		jmp	code_E6B4
; ---------------------------------------------------------------------------

code_E6B3:				; CODE XREF: code_E688+17j
		setb	C

code_E6B4:				; CODE XREF: code_E688+11j
					; code_E688+28j
		ret
; End of function code_E688


; =============== S U B	R O U T	I N E =======================================


code_E6B5:				; CODE XREF: code_E5DF+1Fp
		mov	A, R3
		jnz	code_E6BE
		anl	DEV_FLAGS, #0FBh
		jmp	code_E6C3
; ---------------------------------------------------------------------------

code_E6BE:				; CODE XREF: code_E6B5+1j
		mov	A, R3
		xrl	A, #1
		jnz	code_E6C9

code_E6C3:				; CODE XREF: code_E6B5+6j
		mov	R2, UOZXX_1
		clr	C
		jmp	code_E6E1
; ---------------------------------------------------------------------------

code_E6C9:				; CODE XREF: code_E6B5+Cj
		mov	A, R3
		xrl	A, #7
		jnz	code_E6E0
		mov	DPTR, #0F706h
		jnb	RAM_2F.7, code_E6D5
		inc	DPTR

code_E6D5:				; CODE XREF: code_E6B5+1Cj
		movx	A, @DPTR
		orl	DEV_FLAGS, #4
		mov	UOZXX_1, A
		mov	R2, A
		clr	C
		jmp	code_E6E1
; ---------------------------------------------------------------------------

code_E6E0:				; CODE XREF: code_E6B5+17j
		setb	C

code_E6E1:				; CODE XREF: code_E6B5+11j
					; code_E6B5+28j
		ret
; End of function code_E6B5


; =============== S U B	R O U T	I N E =======================================


code_E6E2:				; CODE XREF: code_E5DF+2Cp
		mov	A, R3
		jnz	code_E6EB
		anl	DEV_FLAGS, #0F7h
		jmp	code_E6F0
; ---------------------------------------------------------------------------

code_E6EB:				; CODE XREF: code_E6E2+1j
		mov	A, R3
		xrl	A, #1
		jnz	code_E6F9

code_E6F0:				; CODE XREF: code_E6E2+6j
		mov	DPTR, #0F88Fh
		movx	A, @DPTR
		mov	R2, A
		clr	C
		jmp	code_E713
; ---------------------------------------------------------------------------

code_E6F9:				; CODE XREF: code_E6E2+Cj
		mov	A, R3
		xrl	A, #7
		jnz	code_E712
		mov	DPTR, #0F706h
		jnb	RAM_2F.7, code_E705
		inc	DPTR

code_E705:				; CODE XREF: code_E6E2+1Fj
		movx	A, @DPTR
		orl	DEV_FLAGS, #8
		mov	DPTR, #0F88Fh
		movx	@DPTR, A
		mov	R2, A
		clr	C
		jmp	code_E713
; ---------------------------------------------------------------------------

code_E712:				; CODE XREF: code_E6E2+1Aj
		setb	C

code_E713:				; CODE XREF: code_E6E2+14j
					; code_E6E2+2Dj
		ret
; End of function code_E6E2


; =============== S U B	R O U T	I N E =======================================


code_E714:				; CODE XREF: code_E5DF+39p
		mov	A, R3
		jnz	code_E71D
		anl	DEV_FLAGS, #0FDh
		jmp	code_E722
; ---------------------------------------------------------------------------

code_E71D:				; CODE XREF: code_E714+1j
		mov	A, R3
		xrl	A, #1
		jnz	code_E728

code_E722:				; CODE XREF: code_E714+6j
		mov		DPTR, #0FF47h
		movx	A, @DPTR
		mov	R2, A
		clr	C
		jmp	code_E740
; ---------------------------------------------------------------------------

code_E728:				; CODE XREF: code_E714+Cj
		mov	A, R3
		xrl	A, #7
		jnz	code_E73F
		mov	DPTR, #0F706h
		jnb	RAM_2F.7, code_E734
		inc	DPTR

code_E734:				; CODE XREF: code_E714+1Cj
		movx	A, @DPTR
		orl	DEV_FLAGS, #2
		mov		DPTR, #0FF47h
		movx	@DPTR, A
		mov	R2, A
		clr	C
		jmp	code_E740
; ---------------------------------------------------------------------------

code_E73F:				; CODE XREF: code_E714+17j
		setb	C

code_E740:				; CODE XREF: code_E714+11j
					; code_E714+28j
		ret
; End of function code_E714


; =============== S U B	R O U T	I N E =======================================


code_E741:				; CODE XREF: code_E5DF+46p
		mov	A, R3
		jnz	code_E74A
		anl	DEV_FLAGS, #0EFh
		jmp	code_E74F
; ---------------------------------------------------------------------------

code_E74A:				; CODE XREF: code_E741+1j
		mov	A, R3
		xrl	A, #1
		jnz	code_E755

code_E74F:				; CODE XREF: code_E741+6j
		mov	R2, RAM_6F
		clr	C
		jmp	code_E76D
; ---------------------------------------------------------------------------

code_E755:				; CODE XREF: code_E741+Cj
		mov	A, R3
		xrl	A, #7
		jnz	code_E76C
		mov	DPTR, #0F706h
		jnb	RAM_2F.7, code_E761
		inc	DPTR

code_E761:				; CODE XREF: code_E741+1Cj
		movx	A, @DPTR
		orl	DEV_FLAGS, #10h
		mov	RAM_6F,	A
		mov	R2, A
		clr	C
		jmp	code_E76D
; ---------------------------------------------------------------------------

code_E76C:				; CODE XREF: code_E741+17j
		setb	C

code_E76D:				; CODE XREF: code_E741+11j
					; code_E741+28j
		ret
; End of function code_E741


; =============== S U B	R O U T	I N E =======================================


code_E76E:				; CODE XREF: code_E5DF+53p
		mov	A, R3
		jnz	code_E777
		anl	DEV_FLAGS, #7Fh
		jmp	code_E77C
; ---------------------------------------------------------------------------

code_E777:				; CODE XREF: code_E76E+1j
		mov	A, R3
		xrl	A, #1
		jnz	code_E782

code_E77C:				; CODE XREF: code_E76E+6j
		mov	R2, TWAT
		clr	C
		jmp	code_E79A
; ---------------------------------------------------------------------------

code_E782:				; CODE XREF: code_E76E+Cj
		mov	A, R3
		xrl	A, #7
		jnz	code_E799
		mov	DPTR, #0F706h
		jnb	RAM_2F.7, code_E78E
		inc	DPTR

code_E78E:				; CODE XREF: code_E76E+1Cj
		movx	A, @DPTR
		orl	DEV_FLAGS, #80h
		mov	TWAT, A
		mov	R2, A
		clr	C
		jmp	code_E79A
; ---------------------------------------------------------------------------

code_E799:				; CODE XREF: code_E76E+17j
		setb	C

code_E79A:				; CODE XREF: code_E76E+11j
					; code_E76E+28j
		ret
; End of function code_E76E


; =============== S U B	R O U T	I N E =======================================


code_E79B:				; CODE XREF: code_E5DF:code_E64Fp
		push	DPSEL		; Data Pointer Select Register
		mov	DPSEL, #7	; Data Pointer Select Register
		mov	DPTR, #0F600h
		mov	A, #84h	; 'Д'
		movx	@DPTR, A
		inc	DPTR
		mov	R0, #0A9h ; 'й'
		mov	A, @R0
		movx	@DPTR, A
		inc	DPTR
		mov	A, #10h
		movx	@DPTR, A
		inc	DPTR
		mov	A, #70h	; 'p'
		movx	@DPTR, A
		inc	DPTR
		mov	A, R4
		movx	@DPTR, A
		inc	DPTR
		mov	A, R3
		movx	@DPTR, A
		inc	DPTR
		mov	A, R2
		movx	@DPTR, A
		inc	DPTR
		mov	RAM_51,	#7
		pop	DPSEL		; Data Pointer Select Register
		lcall	code_DBD2
		ret
; End of function code_E79B


; =============== S U B	R O U T	I N E =======================================


code_E7C6:				; CODE XREF: RESET_0-AE40p
		clr	RAM_28.3

code_E7C8:				; CODE XREF: code_E7C6+10j
		mov	ADCON1,	#2	; A/D Converter	Control	Register 1
		mov	ADDATL,	#0	; A/D Converter	Data Register, Low Byte

code_E7CE:				; CODE XREF: code_E7C6:code_E7CEj
		jb	ADCON0.4, code_E7CE ; A/D Converter Control Register 0
		mov	A, ADDATH	; A/D Converter	Data Register, High Byte
		mov	B, ADDATL	; A/D Converter	Data Register, Low Byte
		jbc	RAM_28.3, code_E7C8
		mov	C, B.7		; B-Register
		rlc	A
		mov	C, B.6		; B-Register
		rlc	A
		mov	DPTR, #0F5FFh
		movx	@DPTR, A
		mov	B, #2		; B-Register
		ljmp	code_A5A0
; End of function code_E7C6


; =============== S U B	R O U T	I N E =======================================


TestDS2401:				; CODE XREF: code_E8B3p
		orl	IP1, #80h	; Interrupt Priority Register 1
		anl	P9, #0F7h	; Port 9 (PDIR=0)
		nop
		anl	P9, #0F7h	; Port 9 (PDIR=0)
		push	ACC		; Accumulator
		mov	A, #7Eh	; '~'

code_E7F7:				; CODE XREF: code_E7E9:code_E7F7j
		djnz	ACC, code_E7F7	; Accumulator

code_E7FA:				; CODE XREF: code_E7E9:code_E7FAj
		djnz	ACC, code_E7FA	; Accumulator

code_E7FD:				; CODE XREF: code_E7E9:code_E7FDj
		djnz	ACC, code_E7FD	; Accumulator
		pop	ACC		; Accumulator
		orl	P9, #8		; Port 9 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		orl	P9, #8		; Port 9 (PDIR=0)
		nop
		mov	B, #16h		; B-Register

code_E80F:				; CODE XREF: code_E7E9+30j
		mov	A, P9		; Port 9 (PDIR=0)
		mov	C, ACC.3	; Accumulator
		dec	B		; B-Register
		mov	A, B		; B-Register
		jz	code_E837
		jc	code_E80F
		mov	B, #5Bh	; '['   ; B-Register

code_E81E:				; CODE XREF: code_E7E9+3Fj
		mov	A, P9		; Port 9 (PDIR=0)
		mov	C, ACC.3	; Accumulator
		dec	B		; B-Register
		mov	A, B		; B-Register
		jz	code_E836
		jnc	code_E81E
		push	ACC		; Accumulator
		mov	A, #3Eh	; '>'

code_E82E:				; CODE XREF: code_E7E9:code_E82Ej
		djnz	ACC, code_E82E	; Accumulator

code_E831:				; CODE XREF: code_E7E9:code_E831j
		djnz	ACC, code_E831	; Accumulator
		pop	ACC		; Accumulator

code_E836:				; CODE XREF: code_E7E9+3Dj
		cpl	C

code_E837:				; CODE XREF: code_E7E9+2Ej
		ret
; End of function code_E7E9


; =============== S U B	R O U T	I N E =======================================


SendDS2401Cmd:				; CODE XREF: code_E8B3+Bp
		mov	B, #8		; B-Register
		orl	IP1, #80h	; Interrupt Priority Register 1
		anl	P9, #0F7h	; Port 9 (PDIR=0)
		nop

code_E842:				; CODE XREF: code_E838+29j
		nop
		nop
		anl	P9, #0F7h	; Port 9 (PDIR=0)
		rrc	A
		nop
		nop
		jnc	code_E852
		orl	P9, #8		; Port 9 (PDIR=0)
		sjmp	code_E855
; ---------------------------------------------------------------------------

code_E852:				; CODE XREF: code_E838+12j
		anl	P9, #0F7h	; Port 9 (PDIR=0)

code_E855:				; CODE XREF: code_E838+17j
		push	ACC		; Accumulator
		mov	A, #4Eh	; 'N'

code_E859:				; CODE XREF: code_E838:code_E859j
		djnz	ACC, code_E859	; Accumulator
		pop	ACC		; Accumulator
		orl	P9, #8		; Port 9 (PDIR=0)
		djnz	B, code_E842	; B-Register
		orl	IP1, #80h	; Interrupt Priority Register 1
		orl	P9, #8		; Port 9 (PDIR=0)
		nop
		ret
; End of function code_E838


; =============== S U B	R O U T	I N E =======================================


ReadByteDS2401:				; CODE XREF: code_E8B3:code_E8C1p
		mov	B, #8		; B-Register
		mov	C, IEN0.7	; Interrupt Enable Register 0
		mov	PSW.1, C	; Program Status Word

code_E873:				; CODE XREF: code_E86C+43j
		orl	IP1, #80h	; Interrupt Priority Register 1
		anl	P9, #0F7h	; Port 9 (PDIR=0)
		nop
		clr	IEN0.7		; Interrupt Enable Register 0
		anl	P9, #0F7h	; Port 9 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		orl	P9, #8		; Port 9 (PDIR=0)
		nop
		orl	P9, #8		; Port 9 (PDIR=0)
		push	ACC		; Accumulator
		mov	A, P9		; Port 9 (PDIR=0)
		mov	C, ACC.3	; Accumulator
		pop	ACC		; Accumulator
		rrc	A
		mov	C, PSW.1	; Program Status Word
		mov	IEN0.7,	C	; Interrupt Enable Register 0
		mov	C, ACC.7	; Accumulator
		xch	A, R1
		jnc	code_E89D
		xrl	A, #1

code_E89D:				; CODE XREF: code_E86C+2Dj
		clr	C
		jnb	ACC.0, code_E8A4 ; Accumulator
		xrl	A, #18h
		setb	C

code_E8A4:				; CODE XREF: code_E86C+32j
		rrc	A
		xch	A, R1
		push	ACC		; Accumulator
		mov	A, #4Eh	; 'N'

code_E8AA:				; CODE XREF: code_E86C:code_E8AAj
		djnz	ACC, code_E8AA	; Accumulator
		pop	ACC		; Accumulator
		djnz	B, code_E873	; B-Register
		ret
; End of function code_E86C


; =============== S U B	R O U T	I N E =======================================


ReadDS2401:				; CODE XREF: RESET_0+48p
		lcall	TestDS2401
		jc	code_E8CD
		mov	R1, #0
		mov	R2, #8
		push	DPL
		push	DPH
		mov		DPTR, #5F00h
		clr	A
		movc	A, @A+DPTR
		mov		B, #0Fh
		jnb		ACC.5, OLD_READ_CMD
		mov		B, #33h

OLD_READ_CMD:
		mov		A, B
		pop		DPH
		pop		DPL
		lcall	SendDS2401Cmd

code_E8C1:				; CODE XREF: code_E8B3+13j
		lcall	ReadByteDS2401
		movx	@DPTR, A
		inc	DPTR
		djnz	R2, code_E8C1
		mov	A, R1
		jnz	code_E8CD
		clr	C
		ret
; ---------------------------------------------------------------------------

code_E8CD:				; CODE XREF: code_E8B3+3j
					; code_E8B3+16j
		setb	C
		ret
; End of function code_E8B3


; =============== S U B	R O U T	I N E =======================================


code_E8CF:				; CODE XREF: IE0_0+D83p IE0_0+EF8p
		mov	DPTR, #0F98Ch
		movx	A, @DPTR
		mov	R2, A
		mov	B, #1		; B-Register
		lcall	code_A5A0
		mov	R1, A
		setb	RAM_28.3
		mov	DPTR, #606Bh	; Минимальное напряжение ДПДЗ |	В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		clr	C
		subb	A, B		; B-Register
		jc	code_E923
		mov	DPTR, #606Ch	; Максимальное напряжение ДПДЗ | В
		clr	A
		movc	A, @A+DPTR
		mov	B, A		; B-Register
		mov	A, R1
		clr	C
		subb	A, B		; B-Register
		jnc	code_E923
		mov	B, R1		; B-Register
		mov	DPTR, #0F827h
		movx	A, @DPTR
		xch	A, B		; B-Register
		clr	C
		subb	A, B		; B-Register
		jnc	code_E905
		clr	A

code_E905:				; CODE XREF: code_E8CF+33j
		mov	B, A		; B-Register
		mov	DPTR, #6068h	; Коэффициент тарировки	ДПДЗ | %/В
		clr	A
		movc	A, @A+DPTR
		mul	AB
		mov	A, B		; B-Register
		mov	DPTR, #0F98Ch
		movx	@DPTR, A
		mov	DPTR, #606Ah	; Максимальное положение дросселя | %
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, B		; B-Register
		jnc	code_E923
		add	A, B		; B-Register
		mov	DPTR, #0F98Ch
		movx	@DPTR, A

code_E923:				; CODE XREF: code_E8CF+19j
					; code_E8CF+26j ...
		ret
; End of function code_E8CF


; =============== S U B	R O U T	I N E =======================================


code_E924:				; CODE XREF: RESET_0-9BD8p
					; RESET_0-9BC9p
		mov	DPTR, #6EEFh	; Зона регулирования по	дросселю | Положение дросселя, % - Обороты, об/мин
		mov	A, RPM_RT_32
		movc	A, @A+DPTR
		mov	B, THR_CODE
		clr	C
		subb	A, B
		mov	RAM_2B.2, C
		ret
; End of function code_E924


; =============== S U B	R O U T	I N E =======================================


CALC_ALF:				; CODE XREF: RESET_0:code_45D4p
		mov	DPTR, #5F01h
		clr	A
		movc	A, @A+DPTR
		jnb	ACC.1, code_E946 ; Accumulator
		mov	DPTR, #0F89Ah
		movx	A, @DPTR
		mov	R3, A
		mov	R2, RPM_RT
		
		; Состав смеси от оборотов и давления |	Отношение воздух/топливо - Обороты коленвала, об/мин - Абсолютное давление, кПа*10
		GET_3D_RAM_WITH_INTERPOLATION 83BAh, CAPTURE_AFR_DAD_MODE
		
		; mov	DPTR, #83BAh	; Состав смеси от оборотов и давления |	Отношение воздух/топливо - Обороты коленвала, об/мин - Абсолютное давление, кПа*10
		; lcall	GET_3D_VALUE
		ret

code_E946:				; CODE XREF: code_E931+5j
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		mov	R3, A
		mov	R2, RPM_RT
		
		; Состав смеси от оборотов и дросселя |	Отношение воздух/топливо - Обороты коленвала, об/мин - Положение дросселя,%
		GET_3D_RAM_WITH_INTERPOLATION 6953h, CAPTURE_AFR_MODE
		ret
; End of function code_E931

; =============== S U B	R O U T	I N E =======================================


code_E954:				; CODE XREF: RESET_0-A403p
		mov	DPTR, #5F01h
		clr	A
		movc	A, @A+DPTR
		jnb	ACC.1, code_E969 ; Accumulator
		mov	DPTR, #0F89Ah
		movx	A, @DPTR
		mov	R3, A
		mov	R2, RPM_RT
		
		; УОЗ от давления | УОЗ, гр.п.к.в. - Обороты коленвала,	об/мин - Абсолютное давление, кПа*10
		GET_3D_RAM_WITH_INTERPOLATION 6AC8h, CAPTURE_UOZ_DAD_MODE
		 
		;mov	DPTR, #6AC8h	; УОЗ от давления | УОЗ, гр.п.к.в. - Обороты коленвала,	об/мин - Абсолютное давление, кПа*10
		;lcall	GET_3D_VALUE
		sjmp	code_E971

code_E969:				; CODE XREF: code_E954+5j
		mov	DPTR, #7208h	; Таблица квантования ДПДЗ | Нормализованный код АЦП - Положение дросселя,%
		mov	A, THR_CODE
		movc	A, @A+DPTR
		mov	R3, A
		mov	R2, RPM_RT
		
		; УОЗ от дросселя | УОЗ, гр.п.к.в. - Обороты коленвала,	об/мин - Положение дросселя,%
		GET_3D_RAM_WITH_INTERPOLATION 6DC8h, CAPTURE_UOZ_MODE

code_E971:				; CODE XREF: code_E954+12j
		mov		B, A		; B-Register
		jb		RAM_2B.2, tcorr_uoz
		mov		A, RAM_6B
		jnz		no_corr_uoz

tcorr_uoz:
		mov	DPTR, #0F802h
		movx	A, @DPTR
		xch	A, B		; B-Register
		clr	C
		subb	A, B		; B-Register
		mov		B, A

no_corr_uoz:
		mov	UOZXX_1, B
		ret
; End of function code_E954


; =============== S U B	R O U T	I N E =======================================


code_E984:				; CODE XREF: RESET_0-A2C2p
		mov	DPTR, #5FFFh	; Состав смеси в аварийном режиме |
		clr	A
		movc	A, @A+DPTR
		mov	ALF_1, A
		jb		RAM_2B.1, code_E9A8
		mov	A, DEV_FLAGS
		anl	A, #4
		jnz	code_E9A8
		mov	DPTR, #7877h	; УОЗ при аварии ДПДЗ или ДМРВ | УОЗ, гр.п.к.в.	- Обороты коленвала, об/мин - Цикловое наполнение,мг/цикл
		mov	R2, RPM_RT
		mov	R3, GBC_RT
		lcall	GET_3D_VALUE
		mov	B, A		; B-Register
		mov	DPTR, #0F802h
		movx	A, @DPTR
		xch	A, B		; B-Register
		clr	C
		subb	A, B		; B-Register
		mov	UOZXX_1, A

code_E9A8:				; CODE XREF: code_E984+Bj
		ret
; End of function code_E984


; =============== S U B	R O U T	I N E =======================================
RESET_0:				; CODE XREF: RESETj
		clr	IEN0.7		; Interrupt Enable Register 0
		mov	SP, #SP_VALUE	; Stack	Pointer
		mov		SYSCON, #0      ; System Control Register
		setb	P3.2            ; Port 3 (PDIR=0)
		mov		DPTR, #6
		mov		A, #55h ; 'U'
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #55h, NO_OLT ; 'U'
		inc		DPTR
		mov		A, #0AAh ; 'ъ'
		movx	@DPTR, A
		movx	A, @DPTR
		cjne	A, #0AAh, NO_OLT ; 'ъ'
OLT:
		mov	A, IP0		; Interrupt Priority Register 0
		jb	ACC.6, NO_OLT ; Accumulator
		orl	P6, #1		; Port 6 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		mov	P3, #39h ; '9'  ; Port 3 (PDIR=0)
		orl	IP1, #80h	; Interrupt Priority Register 1
		mov	P6, #0D0h ; '¦' ; Port 6 (PDIR=0)

code_EA02:				; CODE XREF: RESET_0+3Cj
		mov	DPTR, #0

code_EA05:				; CODE XREF: RESET_0+31j
		clr	A
		movc	A, @A+DPTR
		movx	@DPTR, A
		mov	A, DPL		; Data Pointer,	Low Byte
		jnz	code_EA10
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1

code_EA10:				; CODE XREF: RESET_0+28j
		inc	DPTR
		mov	A, DPH		; Data Pointer,	High Byte
		cjne	A, #0F4h, code_EA05 ; 'Ї'
		mov	A, P6		; Port 6 (PDIR=0)
		jnb	ACC.0, code_EA20 ; Accumulator
		anl	P6, #0FEh	; Port 6 (PDIR=0)
		sjmp	code_EA02

code_EA20:				; CODE XREF: RESET_0+36j
		orl	P6, #1		; Port 6 (PDIR=0)
NO_OLT:
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		mov		DPTR, #5F00h
		clr	A
		movc	A, @A+DPTR
		jnb		ACC.6, READ_DALLAS_SN
		mov		DPSEL, 1
		mov		DPTR, #0F6F8h
		mov		DPSEL, 0
		mov		DPTR, #0F3F8h
		mov	B, #8
		
COPY_DALLAS_SN:
		clr	A
		movc	A, @A+DPTR
		inc		DPL
		mov		DPSEL, 1
		movx	@DPTR, A
		inc		DPL
		mov		DPSEL, 0
		djnz	B, COPY_DALLAS_SN
		sjmp	code_EA3F

READ_DALLAS_SN:
		mov		DPTR, #0F6F8h
		lcall	ReadDS2401
		setb	IEN0.6		; Interrupt Enable Register 0
		setb	IEN1.6		; Interrupt Enable Register 1
		jnc	code_EA3F
		mov	DPTR, #0F6F8h
		clr	A
		mov	B, #8		; B-Register

code_EA3A:				; CODE XREF: RESET_0+5Aj
		movx	@DPTR, A
		inc	DPTR
		djnz	B, code_EA3A	; B-Register

code_EA3F:				; CODE XREF: RESET_0+7j RESET_0+Ej ...
		ljmp	code_2483
; End of function RESET_0


; =============== S U B	R O U T	I N E =======================================


code_EA81:				; CODE XREF: code_EA42+1Fp
					; code_EA42+26p ...
		mov	R3, #8

code_EA83:				; CODE XREF: code_EA81+9j
		rlc	A
		mov	P5.3, C		; Port 5 (PDIR=0)
		setb	P5.4		; Port 5 (PDIR=0)
		clr	P5.4		; Port 5 (PDIR=0)
		djnz	R3, code_EA83
		ret
; End of function code_EA81


; =============== S U B	R O U T	I N E =======================================


code_EA8D:				; CODE XREF: RESET_0:code_58E9p
		mov	DPTR, #0F878h
		movx	A, @DPTR
		mov	B, A		; B-Register
		mov	DPTR, #5EF6h	; Дельта индикации отсечки лампой CE | об./мин
		clr	A
		movc	A, @A+DPTR
		jb	ACC.7, code_EABB ; Accumulator
		mov	R0, A
		mov	DPTR, #5EF7h	; Дельта гашения лампы CE | об./мин
		clr	A
		movc	A, @A+DPTR
		jb	ACC.7, code_EABB ; Accumulator
		mov	R1, A
		mov	DPTR, #0F9A6h
		movx	A, @DPTR
		clr	C
		subb	A, R0
		mov	R2, A
		clr	C
		subb	A, RPM
		jc	code_EAEA
		mov	A, R2
		clr	C
		subb	A, R1
		clr	C
		subb	A, RPM
		anl	C, B.7		; B-Register
		jc	code_EAEA

code_EABB:				; CODE XREF: code_EA8D+Bj
					; code_EA8D+14j
		clr	B.7		; B-Register
		mov	DPTR, #5EF8h	; Температура перегретого двигателя | град.С
		clr	A
		movc	A, @A+DPTR
		clr	C
		subb	A, TWAT
		jc	code_EACD
		mov	B, #0		; B-Register
		sjmp	code_EAED
; ---------------------------------------------------------------------------

code_EACD:				; CODE XREF: code_EA8D+38j
		mov	A, B		; B-Register
		anl	A, #3Fh
		jz	code_EAD9
		dec	B		; B-Register
		setb	C
		sjmp	code_EAED
; ---------------------------------------------------------------------------

code_EAD9:				; CODE XREF: code_EA8D+44j
		jb	B.6, code_EAE3	; B-Register
		mov	B, #54h	; 'T'   ; B-Register
		setb	C
		sjmp	code_EAED
; ---------------------------------------------------------------------------

code_EAE3:				; CODE XREF: code_EA8D:code_EAD9j
		mov	B, #0Ah		; B-Register
		clr	C
		sjmp	code_EAED
; ---------------------------------------------------------------------------

code_EAEA:				; CODE XREF: code_EA8D+22j
					; code_EA8D+2Cj
		mov	B, #80h	; 'А'   ; B-Register

code_EAED:				; CODE XREF: code_EA8D+3Dj
					; code_EA8D+49j ...
		mov	A, B		; B-Register
		mov	DPTR, #0F878h
		movx	@DPTR, A
		mov	RAM_2E.0, C
		ret
; End of function code_EA8D

$INCLUDE(j7es_table_gbc.asm)
$INCLUDE(j7es_dad.asm)
$INCLUDE(j7es_boost_control.asm)
$INCLUDE(j7es_out_pin.asm)
$INCLUDE(j7es_ram_capture_f.asm)
$INCLUDE(j7es_funcs.asm)
; ---------------------------------------------------------------------------
		INIT_DB_ZERO %0F3F8h - $
		db 0, 0, 0, 0, 0, 0, 0,	0 ; Серийный номер DS2401 (8 байт)
		INIT_DB_ZERO	%0FFFFh - $ + 1
		end ;RESET
