SP_VALUE				equ		0C3h			; Указатель на стек

;Описание адресных констант
	;Флаги
PART_FLAGS_ADDR			equ		5F00h			; Дополнительные флаги комплектации
SOFT_FLAGS_ADDR			equ		5F01h			; Дополнительные флаги комплектации

	;ДАД
DAD_SLOPE_ADDR			equ		6098h			; Наклон ДАД +
DAD_OFFSET_ADDR			equ		609Ah			; Смещение ДАД +
DAD_MIN_ADDR			equ		5EF2h			; Минимум квантования ДАД +
DAD_RANGE_ADDR			equ		5EF4h			; Диапазон квантования ДАД +
DAD_KGBC_ADDR			equ		9294h			; Поправка циклового наполнения по дросселю для ДАД +
DAD_ADC_MIN				equ		5EF0h			; минимальное напряжение для диагностики ДАД +
DAD_ADC_MAX				equ		5EF1h			; максимальное напряжение для диагностики ДАД +
DAD_FILTER_XX_ADDR		equ		5F09h			; Коэффициент фильтра GBC ДАД для ХХ +
DAD_FILTER_ADDR			equ		5F08h			; Коэффициент фильтра GBC ДАД для рабочего режима + 
DAD_ADC_ERR_COUNT		equ		0F99Eh			; кол-во циклов диагностики ДАД до выставления ошибки (20)

DAD_VALUE_LO			equ		47h				; Давление lo
DAD_VALUE_HI			equ		48h				; Давление hi
TINJ_BASE_CORR			equ		4Fh				; Начальная коррекция времени впрыска
PRESSURE				equ		0F89Ah			; Значение давления по ДАД
DAD_EMUL_ADDR			equ		0A1B1h			; Имитатор давления при отказе ДАД +

FCHARGE_ADDR			equ		6613h			; коэффициент модели выбора температуры заряда +
FCHARGE_TWAT_CONVERT_ADDR equ	84E1h			; пересчет ТОЖ для модели Тзаряда +
FCHARGE_TWAT			equ		0F87Bh			; пересчитанная ТОЖ ДЛЯ модели Тзаряда
TCHARGE					equ		0F99Bh			; температура заряда
TCHARGE_FIN				equ		0F99Ah			; Тзаряда после всех коррекций
TCHARGE_FCORR			equ		0F979h			; Коэффициент коррекции Тзаряда
FCHARGE_FCORR_ADDR		equ		8C27h			; корректирующая функция для Тзаряда +
CYL_VOLUME_ADDR			equ		60ADh			; цилиндровый объем двигателя +
FCHARGE_GBC_VALUE_ADDR	equ		0F99Ch			; GBC расчитанное по давлению и Тзаряда

	;Рабочий режим 
			;УОЗ
UOZ_BASE_ADDR			equ		6DC8h			; Базовый УОЗ
UOZ_PRESSURE_ADDR		equ		6AC8h			; УОЗ по давлению
DUOZ					equ		0FAA7h			; коррекция УОЗ по детонации
			;Состав смеси
ALF_BASE_ADDR			equ		6953h			; Базовый состав смеси
ALF_PRESSURE_ADDR		equ		83BAh			; Состав смеси от давления
ALF_XX_ADDR				equ		87E4h
		
		;Регулирование по ДК
LAMBDA_THR_LINE_ADDR	equ		6EEFh		; Зона регулирования по ДК (мощностной режим)

		;Датчики и механизмы
THR_MAP_ADDR			equ		7208h		; Таблица квантования ДПДЗ X - Положение дросселя,% F - Нормализованный код АЦП_
THR_CURRENT				equ		0F98Ch		; Текущее положение дросселя
SPARK_TIME_CALIBR_ADDR	equ		9194h		; время накопления для модуля зажигания в попарно-параллельном режиме
SPD_IMP_COUNT_ADDR		equ		5F63h		; Число импульсов ДСА


FUEL_CUTOFF_RPM			equ		0F9A6h		; обороты блокировки впрыска
CE_FUNC_STATE			equ		0F878h		; доп. функции лампы CE
CE_RPM1_ADDR			equ		5EF6h		; Дельта индикации отсечки лампой CE
CE_RPM2_ADDR			equ		5EF7h		; Дельта гашения лампы CE
CE_TWAT_ERROR_ADDR		equ		5EF8h		; Значение перегретого двигателя

TAIR_VALUE				equ		0F93Bh		; Температура воздуха


;===========================  Лаунч =============================
LAUNCH_SPEED_ADDR		equ		6075h		; скорость входа в режим лаунч
FUEL_LAUNCH_CUTOFF_RPM_ADDR	equ	7AA7h		;Обороты блокировки впрыска на	лаунче X - Время с начала движения F - Обороты,	об/мин
FUEL_LAUNCH_CUTOFF_RPM	equ		0F9B7h		;Обороты блокировки впрыска на	лаунче
