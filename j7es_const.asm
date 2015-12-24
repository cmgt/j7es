SP_VALUE				equ		0C3h			; ��������� �� ����

;�������� �������� ��������
	;�����
PART_FLAGS_ADDR			equ		5F00h			; �������������� ����� ������������
SOFT_FLAGS_ADDR			equ		5F01h			; �������������� ����� ������������

	;���
DAD_SLOPE_ADDR			equ		6098h			; ������ ��� +
DAD_OFFSET_ADDR			equ		609Ah			; �������� ��� +
DAD_MIN_ADDR			equ		5EF2h			; ������� ����������� ��� +
DAD_RANGE_ADDR			equ		5EF4h			; �������� ����������� ��� +
DAD_KGBC_ADDR			equ		9294h			; �������� ��������� ���������� �� �������� ��� ��� +
DAD_ADC_MIN				equ		5EF0h			; ����������� ���������� ��� ����������� ��� +
DAD_ADC_MAX				equ		5EF1h			; ������������ ���������� ��� ����������� ��� +
DAD_FILTER_XX_ADDR		equ		5F09h			; ����������� ������� GBC ��� ��� �� +
DAD_FILTER_ADDR			equ		5F08h			; ����������� ������� GBC ��� ��� �������� ������ + 
DAD_ADC_ERR_COUNT		equ		0F99Eh			; ���-�� ������ ����������� ��� �� ����������� ������ (20)

DAD_VALUE_LO			equ		47h				; �������� lo
DAD_VALUE_HI			equ		48h				; �������� hi
TINJ_BASE_CORR			equ		4Fh				; ��������� ��������� ������� �������
PRESSURE				equ		0F89Ah			; �������� �������� �� ���
DAD_EMUL_ADDR			equ		0A1B1h			; �������� �������� ��� ������ ��� +

FCHARGE_ADDR			equ		6613h			; ����������� ������ ������ ����������� ������ +
FCHARGE_TWAT_CONVERT_ADDR equ	84E1h			; �������� ��� ��� ������ ������� +
FCHARGE_TWAT			equ		0F87Bh			; ������������� ��� ��� ������ �������
TCHARGE					equ		0F99Bh			; ����������� ������
TCHARGE_FIN				equ		0F99Ah			; ������� ����� ���� ���������
TCHARGE_FCORR			equ		0F979h			; ����������� ��������� �������
FCHARGE_FCORR_ADDR		equ		8C27h			; �������������� ������� ��� ������� +
CYL_VOLUME_ADDR			equ		60ADh			; ����������� ����� ��������� +
FCHARGE_GBC_VALUE_ADDR	equ		0F99Ch			; GBC ����������� �� �������� � �������

	;������� ����� 
			;���
UOZ_BASE_ADDR			equ		6DC8h			; ������� ���
UOZ_PRESSURE_ADDR		equ		6AC8h			; ��� �� ��������
DUOZ					equ		0FAA7h			; ��������� ��� �� ���������
			;������ �����
ALF_BASE_ADDR			equ		6953h			; ������� ������ �����
ALF_PRESSURE_ADDR		equ		83BAh			; ������ ����� �� ��������
ALF_XX_ADDR				equ		87E4h
		
		;������������� �� ��
LAMBDA_THR_LINE_ADDR	equ		6EEFh		; ���� ������������� �� �� (���������� �����)

		;������� � ���������
THR_MAP_ADDR			equ		7208h		; ������� ����������� ���� X - ��������� ��������,% F - ��������������� ��� ���_
THR_CURRENT				equ		0F98Ch		; ������� ��������� ��������
SPARK_TIME_CALIBR_ADDR	equ		9194h		; ����� ���������� ��� ������ ��������� � �������-������������ ������
SPD_IMP_COUNT_ADDR		equ		5F63h		; ����� ��������� ���


FUEL_CUTOFF_RPM			equ		0F9A6h		; ������� ���������� �������
CE_FUNC_STATE			equ		0F878h		; ���. ������� ����� CE
CE_RPM1_ADDR			equ		5EF6h		; ������ ��������� ������� ������ CE
CE_RPM2_ADDR			equ		5EF7h		; ������ ������� ����� CE
CE_TWAT_ERROR_ADDR		equ		5EF8h		; �������� ����������� ���������

TAIR_VALUE				equ		0F93Bh		; ����������� �������


;===========================  ����� =============================
LAUNCH_SPEED_ADDR		equ		6075h		; �������� ����� � ����� �����
FUEL_LAUNCH_CUTOFF_RPM_ADDR	equ	7AA7h		;������� ���������� ������� ��	������ X - ����� � ������ �������� F - �������,	��/���
FUEL_LAUNCH_CUTOFF_RPM	equ		0F9B7h		;������� ���������� ������� ��	������
