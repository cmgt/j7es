INJ_SEQ MACRO
	db 2, 4, 1, 8, 3, 0Ch, 3, 0Ch ;	Последовательность работы форсунок
ENDM

;квантование дросселя
RPM_CALIBR MACRO
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 6
	db 0Ah, 0Dh, 10h, 13h, 16h, 1Ah, 1Dh, 20h, 23h, 26h, 2Ah
	db 2Dh, 30h, 32h, 33h, 35h, 36h, 38h, 3Ah, 3Bh, 3Dh, 3Eh
	db 40h, 42h, 43h, 45h, 46h, 48h, 4Ah, 4Bh, 4Dh, 4Eh, 50h
	db 51h, 52h, 54h, 55h, 56h, 57h, 59h, 5Ah, 5Bh, 5Ch, 5Eh
	db 5Fh, 60h, 62h, 63h, 65h, 66h, 67h, 68h, 6Ah, 6Bh, 6Ch
	db 6Dh, 6Fh, 70h, 71h, 72h, 74h, 75h, 76h, 77h, 79h, 7Ah
	db 7Bh, 7Ch, 7Eh, 7Fh, 81h, 82h, 83h, 85h, 86h, 87h, 88h
	db 8Ah, 8Bh, 8Ch, 8Dh, 8Fh, 90h, 91h, 92h, 94h, 95h, 96h
	db 97h, 99h, 9Ah, 9Bh, 9Ch, 9Eh, 9Fh, 0A1h, 0A2h, 0A3h
	db 0A5h, 0A6h, 0A7h, 0A8h, 0AAh, 0ABh, 0ACh, 0ADh, 0AFh
	db 0B0h, 0B1h, 0B2h, 0B4h, 0B5h, 0B6h, 0B7h, 0B9h, 0BAh
	db 0BBh, 0BCh, 0BEh, 0BFh, 0C0h, 0C2h, 0C3h, 0C5h, 0C6h
	db 0C7h, 0C8h, 0CAh, 0CBh, 0CCh, 0CDh, 0CFh, 0D0h, 0D1h
	db 0D1h, 0D2h, 0D3h, 0D3h, 0D4h, 0D4h, 0D5h, 0D6h, 0D6h
	db 0D7h, 0D8h, 0D8h, 0D9h, 0DAh, 0DAh, 0DBh, 0DCh, 0DCh
	db 0DDh, 0DDh, 0DEh, 0DFh, 0DFh, 0E0h, 0E1h, 0E1h, 0E2h
	db 0E3h, 0E3h, 0E4h, 0E4h, 0E5h, 0E6h, 0E6h, 0E7h, 0E8h
	db 0E8h, 0E9h, 0EAh, 0EAh, 0EBh, 0ECh, 0ECh, 0EDh, 0EDh
	db 0EEh, 0EFh, 0EFh, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h
	db 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h
	db 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h
	db 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h
	db 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h
	db 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h
	db 0F0h, 0F0h, 0F0h, 0F0h, 0F0h
	ORG	623Ch
ENDM

;Коэффициент модели выбора температуры
FCHARGE_CALIBR	MACRO
	db 40h, 41h, 42h, 42h, 44h, 45h, 47h, 48h, 49h, 49h, 46h 
	db 45h, 45h, 46h, 47h, 48h, 40h, 41h, 42h, 43h, 45h, 46h
	db 47h, 48h, 49h, 49h, 47h, 47h, 47h, 47h, 49h, 4Ah, 40h
	db 42h, 44h, 45h, 46h, 47h, 48h, 49h, 4Ah, 4Ah, 49h, 49h
	db 49h, 4Ah, 4Bh, 4Ch, 41h, 43h, 44h, 46h, 48h, 49h, 4Ah
	db 4Ah, 4Ah, 4Bh, 4Ch, 4Bh, 4Bh, 4Ch, 4Eh, 50h, 41h, 44h
	db 46h, 47h, 4Ah, 4Ch, 4Dh, 4Dh, 4Dh, 4Eh, 4Fh, 4Fh, 4Eh
	db 4Fh, 52h, 55h, 42h, 45h, 47h, 49h, 4Dh, 50h, 53h, 53h
	db 53h, 54h, 55h, 54h, 54h, 54h, 57h, 5Ah, 42h, 45h, 48h
	db 4Bh, 50h, 55h, 58h, 5Ah, 5Bh, 5Dh, 5Dh, 5Ch, 5Bh, 59h
	db 5Dh, 61h, 43h, 46h, 49h, 4Ch, 53h, 58h, 5Eh, 60h, 63h
	db 65h, 67h, 67h, 65h, 63h, 67h, 6Bh, 43h, 46h, 4Ah, 4Eh
	db 55h, 5Ch, 62h, 67h, 6Ch, 70h, 73h, 74h, 73h, 71h, 75h
	db 7Ah, 43h, 47h, 4Ah, 4Eh, 56h, 5Fh, 67h, 6Eh, 75h, 7Ch
	db 80h, 84h, 84h, 84h, 87h, 8Ch, 44h, 47h, 4Bh, 4Fh, 57h
	db 60h, 6Ah, 75h, 7Eh, 86h, 8Dh, 92h, 95h, 94h, 99h, 9Eh
	db 43h, 47h, 4Bh, 4Fh, 58h, 61h, 6Dh, 78h, 84h, 8Eh, 97h
	db 9Eh, 0A3h, 0A2h, 0A8h, 0AFh, 43h, 47h, 4Bh, 50h, 58h
	db 61h, 6Dh, 7Ah, 87h, 93h, 9Dh, 0A6h, 0ACh, 0AEh, 0B6h
	db 0C1h, 43h, 47h, 4Bh, 50h, 58h, 62h, 6Eh, 7Dh, 89h, 96h
	db 0A2h, 0ADh, 0B4h, 0B8h, 0C4h, 0D1h, 43h, 47h, 4Bh, 50h
	db 59h, 63h, 70h, 7Dh, 8Bh, 99h, 0A7h, 0B3h, 0BAh, 0C0h
	db 0CEh, 0E0h, 43h, 47h, 4Bh, 50h, 5Ah, 64h, 71h, 7Dh
	db 8Ch, 9Ah, 0AAh, 0B7h, 0BEh, 0C4h, 0D7h, 0E6h
ENDM

; Пересчет ТОЖ для модели Тзаряда
FCHARGE_TWAT_CONVERT_CALIBR	MACRO
		db 0, 5, 0Ah, 0Fh, 14h,	18h, 1Eh, 22h, 27h, 2Ch, 31h, 36h
		db 3Bh,	40h, 45h, 4Bh, 50h, 55h, 5Ah, 5Fh, 64h,	69h, 6Eh
		db 73h,	78h, 7Ah, 7Bh, 7Bh, 7Bh, 7Bh, 7Bh, 78h,	76h, 73h
		db 71h,	6Eh, 6Bh, 69h, 66h 
ENDM

;мультипликативная коррекция GBC по ДТВ
MULT_GBC_DTV MACRO
		db 0BEh, 0B8h, 0B2h, 0ADh, 0A7h, 0A2h, 9Ch, 97h, 92h, 8Eh
		db 89h, 84h, 80h, 7Ch, 77h, 73h, 6Fh, 6Bh, 68h, 64h, 60h
		db 5Dh, 59h, 56h, 52h, 4Fh, 4Ch, 49h, 46h, 43h, 40h, 3Dh
		db 3Ah, 37h, 35h, 32h, 2Fh, 2Dh, 2Ah
ENDM

;Время действия добавки ALF (прогрев)
ADD_ALF_TIME MACRO
		db 14h, 14h, 14h, 11h, 0Ah, 8, 7, 6, 6, 6, 6, 6, 6, 6
		db 6, 6, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4
		db 4, 4, 4, 4, 4, 4, 4
ENDM

;76EF - аддитивная коррекция БЦН по шагам РХХ
ADD_GBC_BY_RXX MACRO
		INIT_DB_ZERO 256
ENDM

DAD_KGBC_CALIBR MACRO ;9294h
		db 37h, 37h, 3Bh, 3Dh, 40h, 42h, 3Fh, 3Eh, 3Fh, 40h, 41h
		db 46h, 47h, 4Ch, 4Eh, 4Fh, 3Ah, 39h, 3Ch, 3Eh, 40h, 42h
		db 3Eh, 3Ch, 3Dh, 3Fh, 40h, 45h, 48h, 4Bh, 4Eh, 4Fh, 3Ch
		db 3Ch, 3Dh, 3Fh, 40h, 42h, 3Fh, 3Dh, 3Dh, 3Eh, 3Fh, 45h
		db 48h, 4Ch, 4Eh, 4Fh, 3Dh, 3Dh, 3Eh, 3Fh, 43h, 43h, 3Eh
		db 3Eh, 3Dh, 3Dh, 3Eh, 44h, 48h, 4Ah, 4Eh, 4Fh, 3Eh, 3Eh
		db 3Fh, 3Fh, 46h, 45h, 42h, 40h, 3Eh, 3Dh, 3Dh, 45h, 48h
		db 4Ah, 4Eh, 4Fh, 41h, 40h, 41h, 41h, 4Ch, 4Bh, 43h, 42h
		db 41h, 41h, 3Eh, 43h, 48h, 4Ah, 4Eh, 4Fh, 41h, 41h, 42h
		db 44h, 4Ch, 4Dh, 49h, 4Ch, 4Ah, 44h, 40h, 42h, 49h, 4Ch
		db 4Eh, 4Fh, 42h, 42h, 43h, 47h, 4Dh, 4Fh, 4Bh, 54h, 4Dh
		db 45h, 45h, 45h, 4Bh, 4Dh, 4Eh, 4Fh, 46h, 42h, 44h, 48h
		db 4Eh, 4Fh, 51h, 56h, 57h, 4Bh, 57h, 54h, 50h, 4Dh, 4Fh
		db 4Fh, 4Ah, 45h, 45h, 48h, 4Eh, 50h, 51h, 55h, 57h, 53h
		db 59h, 59h, 55h, 4Eh, 50h, 4Fh, 48h, 44h, 46h, 49h, 50h
		db 51h, 53h, 55h, 59h, 59h, 5Fh, 60h, 5Eh, 5Ah, 58h, 56h
		db 49h, 45h, 45h, 4Ah, 51h, 54h, 56h, 55h, 5Bh, 5Ah, 60h
		db 64h, 61h, 5Bh, 59h, 56h, 49h, 47h, 45h, 4Ah, 52h, 54h
		db 57h, 56h, 5Bh, 5Bh, 62h, 64h, 64h, 5Eh, 58h, 55h, 49h
		db 48h, 47h, 4Ah, 51h, 54h, 57h, 56h, 5Ch, 5Dh, 64h, 65h
		db 64h, 60h, 58h, 55h, 49h, 4Ah, 4Ah, 4Dh, 54h, 58h, 5Bh
		db 57h, 60h, 5Fh, 65h, 69h, 66h, 62h, 57h, 55h, 4Bh, 4Ch
		db 4Ch, 4Ch, 56h, 5Ah, 5Dh, 58h, 62h, 61h, 67h, 6Bh, 68h
		db 63h, 56h, 55h
ENDM

DAD_CALIBR MACRO
	dw	6A18h	;Наклон
	dw	3000h		;Смещение
ENDM

CE_FUNC_CALIBR MACRO
	db	5h		;Дельта индикации отсечки лампой CE
	db	0Ah		;Дельта гашения лампы CE
	db	96h		;Температура перегретого двигателя
ENDM

CYL_VOLUME_CALIBR MACRO
	dw 0DA93h		; Цилиндровый объем двигателя
ENDM

DAD_GBC_KFILTER_CALIBR MACRO
	db 0E6h			;Коэффициент фильтра в рабочем режиме
	db 40h			;Коэффициент фильтра для ХХ
ENDM

;Имитатор давления
DAD_EMUL_CALIBR MACRO
	db 32h, 26h, 20h, 21h, 1Ch, 19h, 1Ch, 1Bh, 1Ah, 19h, 17h
	db 15h, 18h, 1Bh, 22h, 3Fh, 33h, 2Bh, 26h, 25h, 21h, 1Eh
	db 1Fh, 20h, 1Ch, 1Eh, 1Ah, 18h, 1Bh, 20h, 28h, 54h, 3Dh
	db 2Dh, 28h, 2Ah, 23h, 2Ah, 26h, 26h, 1Fh, 27h, 1Fh, 19h
	db 20h, 21h, 27h, 3Fh, 47h, 33h, 2Bh, 2Fh, 2Ch, 31h, 30h
	db 24h, 32h, 2Bh, 23h, 1Eh, 23h, 27h, 2Eh, 44h, 48h, 3Ch
	db 30h, 28h, 25h, 30h, 2Ch, 30h, 2Dh, 26h, 2Dh, 39h, 31h
	db 2Eh, 34h, 4Dh, 5Ah, 4Fh, 3Dh, 2Fh, 2Fh, 2Fh, 30h, 32h
	db 32h, 2Bh, 33h, 49h, 38h, 2Fh, 37h, 42h, 4Ah, 4Dh, 4Dh
	db 3Eh, 38h, 3Ch, 39h, 3Bh, 36h, 2Eh, 36h, 5Ah, 41h, 38h
	db 41h, 49h, 5Dh, 54h, 3Dh, 3Eh, 43h, 4Ch, 43h, 46h, 3Fh
	db 36h, 3Fh, 44h, 51h, 51h, 4Dh, 54h, 4Ah, 4Fh, 56h, 50h
	db 4Ah, 53h, 55h, 55h, 49h, 48h, 44h, 44h, 58h, 6Bh, 58h
	db 62h, 0Fh, 50h, 4Fh, 4Dh, 52h, 60h, 63h, 6Dh, 5Ch, 56h
	db 4Bh, 49h, 75h, 93h, 82h, 61h, 0Dh, 50h, 51h, 58h, 5Ch
	db 6Bh, 6Ah, 6Fh, 74h, 67h, 78h, 62h, 74h, 92h, 0A3h, 82h
	db 0Ch, 51h, 59h, 57h, 5Eh, 6Fh, 62h, 6Eh, 78h, 8Eh, 9Ch
	db 0C8h, 0A6h, 9Eh, 0BBh, 95h, 0Eh, 51h, 5Ch, 50h, 61h
	db 6Bh, 6Ah, 75h, 81h, 81h, 93h, 0A6h, 8Dh, 0B1h, 0A4h
	db 8Bh, 1Eh, 51h, 5Ah, 62h, 62h, 75h, 78h, 79h, 7Fh, 8Bh
	db 96h, 0ABh, 0B1h, 9Bh, 0B1h, 0B9h, 18h, 51h, 63h, 65h
	db 62h, 75h, 6Dh, 96h, 0A8h, 0A9h, 0AAh, 0AAh, 0A9h, 0A2h
	db 9Eh, 0B1h, 0Ch, 50h, 64h, 69h, 6Ah, 6Fh, 76h, 87h, 8Dh
	db 8Dh, 8Eh, 8Eh, 8Fh, 89h, 84h, 9Eh
ENDM

;корректирующая функция для Тзаряда 8C27
FCHARGE_FCORR_CALIBR MACRO
	db 2Dh, 30h, 33h, 36h, 3Ah, 3Dh, 40h, 43h, 47h, 4Ah, 4Dh
	db 50h, 53h, 56h, 5Ah, 5Dh, 60h, 63h, 66h, 6Ah, 6Dh, 70h
	db 73h, 76h, 7Ah, 7Dh, 80h, 83h, 86h, 8Ah, 8Dh, 90h, 93h
	db 96h, 9Ah, 9Dh, 0A0h, 0A3h, 0A6h
ENDM

;Время накопления для модуля зажигания в попарно-параллельном режиме
SPARK_TIME_CALIBR MACRO ;9194h
	db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh 
	db 0FFh, 0FFh, 0FFh, 0E5h, 0BCh, 8Eh, 8Bh, 0FFh, 0FFh
	db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
	db 0EDh, 0D9h, 0ADh, 8Ch, 8Bh, 0DBh, 0DBh, 0DBh, 0DBh
	db 0DBh, 0DBh, 0DBh, 0DBh, 0DBh, 0C5h, 0C4h, 0B5h, 0AEh
	db 0A0h, 8Bh, 8Bh, 8Bh, 8Bh, 8Bh, 8Bh, 8Bh, 8Bh, 8Bh, 8Bh
	db 8Bh, 8Bh, 8Bh, 8Bh, 8Bh, 8Bh, 8Bh, 8Bh, 75h, 75h, 75h
	db 75h, 75h, 75h, 75h, 75h, 75h, 75h, 75h, 75h, 75h, 75h
	db 75h, 75h, 5Eh, 5Eh, 5Eh, 5Eh, 5Eh, 5Eh, 5Eh, 5Eh, 5Eh
	db 5Eh, 5Eh, 5Eh, 5Eh, 5Eh, 5Eh, 5Eh, 4Fh, 4Fh, 4Fh, 4Fh
	db 4Fh, 4Fh, 4Fh, 4Fh, 4Fh, 4Fh, 4Fh, 4Fh, 4Fh, 4Fh, 4Fh
	db 4Fh, 47h, 47h, 47h, 47h, 47h, 47h, 47h, 47h, 47h, 47h
	db 47h, 47h, 47h, 47h, 47h, 47h, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh
	db 3Fh, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh
	db 3Bh, 3Bh, 3Bh, 3Bh, 3Bh, 3Bh, 3Bh, 3Bh, 3Bh, 3Bh, 3Bh
	db 3Bh, 3Bh, 3Bh, 3Bh, 3Bh, 35h, 35h, 35h, 35h, 35h, 35h
	db 35h, 35h, 35h, 35h, 35h, 35h, 35h, 35h, 35h, 35h, 31h
	db 31h, 31h, 31h, 31h, 31h, 31h, 31h, 31h, 31h, 31h, 31h
	db 31h, 31h, 31h, 31h, 2Eh, 2Eh, 2Eh, 2Eh, 2Eh, 2Eh, 2Eh
	db 2Eh, 2Eh, 2Eh, 2Eh, 2Eh, 2Eh, 2Eh, 2Eh, 2Eh, 2Ah, 2Ah
	db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
	db 2Ah, 2Ah, 2Ah, 27h, 27h, 27h, 27h, 27h, 27h, 27h, 27h
	db 27h, 27h, 27h, 27h, 27h, 27h, 27h, 27h, 25h, 25h, 25h
	db 25h, 25h, 25h, 25h, 25h, 25h, 25h, 25h, 25h, 25h, 25h
	db 25h, 25h
ENDM

UOZ_PRESSURE_CALIBR MACRO ;6AC8h
		db 33h, 35h, 37h, 39h, 3Eh, 43h, 47h, 4Ah, 4Eh, 50h, 51h
		db 52h, 53h, 53h, 53h, 53h, 31h, 33h, 34h, 36h, 3Bh, 3Fh
		db 42h, 47h, 4Ah, 4Ch, 4Eh, 4Eh, 4Fh, 4Fh, 50h, 50h, 2Fh
		db 31h, 32h, 34h, 38h, 3Ch, 40h, 43h, 47h, 49h, 4Ah, 4Bh
		db 4Bh, 4Dh, 4Dh, 4Dh, 2Ch, 2Dh, 30h, 32h, 35h, 39h, 3Dh
		db 40h, 44h, 45h, 46h, 47h, 48h, 49h, 49h, 4Ah, 2Bh, 2Dh
		db 2Eh, 30h, 32h, 37h, 3Ch, 3Eh, 40h, 41h, 43h, 45h, 45h
		db 46h, 46h, 46h, 2Bh, 2Ch, 2Dh, 2Eh, 30h, 33h, 37h, 3Ah
		db 3Bh, 3Eh, 3Fh, 41h, 43h, 44h, 45h, 45h, 29h, 2Ah, 2Bh
		db 2Dh, 2Fh, 31h, 34h, 37h, 39h, 3Bh, 3Ch, 3Dh, 3Fh, 40h
		db 41h, 42h, 27h, 27h, 2Ah, 2Ch, 2Dh, 30h, 33h, 36h, 37h
		db 38h, 39h, 3Ah, 3Ch, 3Dh, 3Eh, 3Fh, 25h, 25h, 29h, 2Ah
		db 2Ch, 2Eh, 32h, 33h, 34h, 35h, 35h, 38h, 3Ah, 3Ch, 3Dh
		db 3Fh, 24h, 24h, 27h, 28h, 2Ah, 2Ch, 2Eh, 30h, 31h, 32h
		db 34h, 37h, 39h, 3Bh, 3Bh, 3Ch, 21h, 21h, 25h, 27h, 29h
		db 2Bh, 2Eh, 2Fh, 31h, 33h, 35h, 37h, 39h, 3Ah, 3Ah, 3Ah
		db 1Eh, 1Fh, 23h, 25h, 28h, 2Ah, 2Dh, 30h, 31h, 32h, 33h
		db 36h, 38h, 39h, 39h, 39h, 1Ch, 1Eh, 21h, 24h, 26h, 28h
		db 2Bh, 2Fh, 30h, 31h, 32h, 34h, 37h, 38h, 39h, 39h, 1Dh
		db 1Eh, 20h, 23h, 25h, 27h, 29h, 2Dh, 2Eh, 2Fh, 30h, 33h
		db 36h, 37h, 37h, 37h, 1Dh, 1Eh, 20h, 22h, 24h, 25h, 27h
		db 2Bh, 2Ch, 2Dh, 2Eh, 31h, 33h, 34h, 35h, 35h, 1Dh, 1Eh
		db 20h, 22h, 23h, 24h, 26h, 2Ah, 2Bh, 2Ch, 2Dh, 30h, 32h
		db 33h, 33h, 33h

ENDM

UOZ_BASE_CALIBR MACRO ;6DC8h
		db 23h, 24h, 27h, 2Ch, 34h, 42h, 48h, 45h, 47h, 4Ch, 51h ; Базовый УОЗ
		db 55h, 57h, 58h, 58h, 58h, 22h, 24h, 26h, 2Bh, 33h, 41h
		db 48h, 45h, 47h, 4Ch, 51h, 55h, 57h, 58h, 58h, 58h, 20h
		db 22h, 25h, 2Ah, 32h, 40h, 46h, 45h, 47h, 4Ch, 51h, 55h
		db 57h, 58h, 58h, 58h, 1Eh, 20h, 23h, 28h, 30h, 3Eh, 45h
		db 44h, 46h, 4Bh, 50h, 54h, 56h, 57h, 57h, 57h, 1Dh, 1Eh
		db 21h, 26h, 2Eh, 3Bh, 43h, 43h, 46h, 4Ah, 4Fh, 53h, 55h
		db 56h, 57h, 56h, 1Bh, 1Ch, 1Fh, 24h, 2Ch, 39h, 41h, 42h
		db 45h, 49h, 4Eh, 52h, 54h, 55h, 55h, 55h, 1Ah, 1Bh, 1Dh
		db 22h, 29h, 36h, 3Eh, 40h, 44h, 48h, 4Ch, 51h, 53h, 54h
		db 54h, 54h, 19h, 1Ah, 1Ch, 1Fh, 26h, 32h, 3Bh, 3Fh, 43h
		db 47h, 4Ah, 4Eh, 51h, 52h, 52h, 52h, 18h, 19h, 1Bh, 1Eh
		db 24h, 2Fh, 38h, 3Dh, 41h, 44h, 48h, 4Bh, 4Eh, 4Fh, 4Fh
		db 4Fh, 18h, 18h, 1Ah, 1Dh, 23h, 2Ch, 35h, 3Bh, 3Fh, 42h
		db 44h, 48h, 4Bh, 4Ch, 4Ch, 4Bh, 18h, 18h, 19h, 1Ch, 22h
		db 2Bh, 33h, 3Ah, 3Eh, 40h, 42h, 45h, 48h, 49h, 49h, 48h
		db 18h, 18h, 19h, 1Bh, 21h, 29h, 32h, 38h, 3Dh, 3Eh, 3Fh
		db 43h, 46h, 46h, 46h, 45h, 18h, 18h, 19h, 1Bh, 20h, 29h
		db 31h, 38h, 3Ch, 3Dh, 3Eh, 41h, 44h, 45h, 45h, 44h, 18h
		db 18h, 19h, 1Bh, 20h, 29h, 31h, 38h, 3Ch, 3Dh, 3Dh, 40h
		db 44h, 44h, 43h, 43h, 18h, 18h, 19h, 1Bh, 20h, 28h, 31h
		db 37h, 3Bh, 3Ch, 3Dh, 40h, 43h, 43h, 43h, 42h, 18h, 18h
		db 19h, 1Bh, 20h, 28h, 30h, 37h, 3Bh, 3Ch, 3Ch, 3Fh, 42h
		db 42h, 42h, 41h
ENDM

KUOZ_TWAT MACRO ; 6EC8	- Коррекция УОЗ	по температуре ОЖ | Поправка УОЗ, гр.п.к.в. - Температура, град.С
		db 0F2h, 0F3h, 0F3h, 0F4h, 0F5h, 0F5h, 0F6h, 0F6h, 0F7h 
		db 0F8h, 0F8h, 0F9h, 0F9h, 0FAh, 0FBh, 0FBh, 0FCh, 0FDh
		db 0FDh, 0FEh, 0FEh, 0FFh, 0, 0, 0, 0, 0, 0, 0, 7, 0Eh
		db 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh
ENDM

ALF_PRESSURE_CALIBR MACRO
		db 7Bh, 7Bh, 7Bh, 7Bh, 7Eh, 82h, 83h, 84h, 81h, 79h, 75h
		db 6Ah, 62h, 5Ch, 59h, 5Ah, 7Ah, 7Ah, 7Ah, 7Ah, 7Dh, 81h
		db 83h, 84h, 80h, 79h, 73h, 66h, 5Eh, 5Ah, 58h, 58h, 79h
		db 79h, 79h, 79h, 7Ch, 80h, 82h, 82h, 80h, 77h, 71h, 64h
		db 5Bh, 59h, 56h, 57h, 78h, 78h, 78h, 78h, 7Bh, 7Dh, 80h
		db 80h, 7Fh, 77h, 6Fh, 65h, 5Ch, 58h, 56h, 56h, 76h, 76h
		db 76h, 76h, 78h, 79h, 7Ah, 7Ah, 78h, 73h, 6Ch, 64h, 5Ch
		db 55h, 53h, 53h, 6Eh, 6Eh, 6Fh, 6Eh, 6Eh, 6Fh, 6Eh, 6Eh
		db 6Dh, 6Bh, 66h, 60h, 5Bh, 55h, 53h, 53h, 68h, 69h, 68h
		db 67h, 68h, 67h, 68h, 67h, 66h, 65h, 60h, 5Bh, 58h, 54h
		db 52h, 51h, 66h, 66h, 66h, 64h, 64h, 62h, 62h, 62h, 62h
		db 5Eh, 5Bh, 57h, 55h, 53h, 52h, 51h, 63h, 63h, 62h, 61h
		db 60h, 5Fh, 5Ch, 5Ch, 5Ah, 59h, 58h, 56h, 53h, 52h, 52h
		db 51h, 60h, 60h, 60h, 5Fh, 5Eh, 5Bh, 59h, 58h, 56h, 53h
		db 53h, 53h, 52h, 51h, 50h, 4Eh, 5Fh, 5Fh, 5Fh, 5Eh, 5Dh
		db 59h, 54h, 51h, 51h, 50h, 51h, 51h, 4Fh, 4Ch, 4Bh, 4Bh
		db 5Fh, 5Fh, 5Eh, 5Dh, 5Bh, 58h, 52h, 4Fh, 4Eh, 4Dh, 4Eh
		db 4Dh, 4Bh, 49h, 47h, 47h, 5Fh, 5Fh, 5Eh, 5Dh, 5Bh, 57h
		db 52h, 4Eh, 4Ch, 4Bh, 4Ah, 49h, 47h, 44h, 41h, 41h, 60h
		db 5Fh, 5Eh, 5Dh, 5Ah, 56h, 51h, 4Eh, 4Bh, 4Ah, 48h, 46h
		db 44h, 40h, 3Dh, 3Ch, 60h, 5Fh, 5Eh, 5Dh, 59h, 55h, 51h
		db 4Dh, 4Ah, 49h, 48h, 46h, 42h, 3Eh, 39h, 39h, 60h, 5Fh
		db 5Eh, 5Dh, 59h, 55h, 51h, 4Dh, 4Ah, 49h, 48h, 46h, 42h
		db 3Ch, 37h, 37h
ENDM

ALF_BASE_CALIBR MACRO
		db 80h, 80h, 7Ch, 7Ah, 7Ah, 7Dh, 81h, 85h, 86h, 7Dh, 77h
		db 77h, 76h, 73h, 72h, 6Fh, 80h, 80h, 7Ah, 79h, 79h, 7Ch
		db 80h, 84h, 85h, 7Ch, 77h, 76h, 76h, 73h, 72h, 6Fh, 80h
		db 80h, 79h, 78h, 78h, 7Bh, 7Eh, 83h, 85h, 7Ch, 77h, 76h
		db 76h, 73h, 72h, 6Fh, 80h, 7Fh, 77h, 77h, 77h, 7Bh, 7Eh
		db 81h, 84h, 7Dh, 77h, 76h, 76h, 73h, 72h, 6Fh, 80h, 7Eh
		db 76h, 75h, 76h, 7Ah, 7Eh, 80h, 83h, 7Ch, 77h, 76h, 76h
		db 73h, 72h, 6Fh, 80h, 7Dh, 75h, 75h, 76h, 79h, 7Dh, 80h
		db 82h, 7Ch, 76h, 76h, 76h, 73h, 72h, 6Fh, 80h, 7Dh, 74h
		db 74h, 74h, 77h, 7Ch, 7Fh, 81h, 7Bh, 75h, 74h, 75h, 73h
		db 71h, 6Fh, 80h, 7Ch, 72h, 71h, 72h, 75h, 79h, 7Eh, 80h
		db 79h, 74h, 73h, 73h, 72h, 71h, 70h, 80h, 7Ch, 71h, 70h
		db 71h, 72h, 75h, 7Ah, 7Ah, 77h, 73h, 71h, 71h, 70h, 6Fh
		db 6Dh, 80h, 7Ch, 70h, 6Fh, 6Fh, 6Fh, 72h, 76h, 76h, 75h
		db 70h, 6Fh, 6Fh, 6Dh, 6Ch, 6Bh, 80h, 7Dh, 6Fh, 6Dh, 6Ch
		db 6Dh, 6Eh, 70h, 70h, 6Fh, 6Dh, 6Bh, 6Bh, 6Ah, 68h, 66h
		db 80h, 7Dh, 6Eh, 6Bh, 6Bh, 6Bh, 6Bh, 6Ah, 6Ah, 6Ah, 69h
		db 67h, 65h, 63h, 61h, 5Fh, 80h, 7Dh, 6Dh, 6Ah, 69h, 68h
		db 67h, 66h, 65h, 64h, 63h, 60h, 5Fh, 5Ch, 5Ah, 59h, 80h
		db 7Dh, 6Dh, 69h, 67h, 66h, 65h, 64h, 63h, 62h, 61h, 5Eh
		db 5Bh, 59h, 56h, 55h, 80h, 7Dh, 6Ch, 68h, 66h, 65h, 64h
		db 62h, 61h, 60h, 5Fh, 5Ch, 58h, 55h, 53h, 52h, 80h, 7Dh
		db 6Ah, 67h, 65h, 64h, 63h, 61h, 60h, 5Fh, 5Dh, 5Bh, 56h
		db 54h, 51h, 51h
ENDM

LAUNCH_CUTOFF_RPM_CALIBR MACRO
		db 0C8h, 0CAh, 0CCh, 0CEh, 0D0h, 0D2h, 0D4h, 0D6h, 0D8h
		db 0DAh, 0DCh, 0DEh, 0E0h, 0E2h, 0E4h, 0E6h, 0E8h, 0EAh
		db 0ECh, 0EEh, 0F0h, 0F2h, 0F4h, 0F8h, 0FAh, 0FCh, 0FEh
		db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
ENDM

DIN_CORR_UOZ_BY_ADD_FUEL_CALIBR MACRO
		db 0, 0, 0, 0, 0, 0, 2, 5, 0Ah, 0Dh, 0Fh, 11h, 12h, 12h
		db 12h, 11h, 0Eh, 8, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0
ENDM
