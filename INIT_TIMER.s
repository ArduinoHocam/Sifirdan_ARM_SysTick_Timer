STCTRL 		EQU 0xE000E010;control register
STRELOAD	EQU 0xE000E014;reload register
STCURRENT	EQU	0xE000E018;current register 24 bit
LOAD_VAL	EQU 0x003D0900

			AREA    timer_init, READONLY, CODE
			THUMB
			EXPORT  INIT_TIMER	; Make available for other subroutines
			EXTERN 	__main

INIT_TIMER
PROC
			LDR R1,=STCTRL
			LDR R0,[R1]
			BIC R0,#0xFF ;disable first 
			STR R0, [R1]
			
			LDR R0,=LOAD_VAL
			STR R0,[R1,#4];offset is 4  for reload register
			STR R0,[R1,#8]
			MOV R4,#0x3 ;enable timer 
			STR R4,[R1]
			BX LR
			ENDP
