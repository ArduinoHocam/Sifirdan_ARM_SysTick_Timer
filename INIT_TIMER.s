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
			BIC R0,#0xFF ;disable first with bit clear instruction
			STR R0, [R1]
			
			LDR R0,=LOAD_VAL ; load the reload value
			STR R0,[R1,#4];offset is 4  for reload register
			STR R0,[R1,#8];offset is 8 for stcurrent register, hence we use post index without update 
			MOV R4,#0x3 ;start timer for counting
			STR R4,[R1]
			BX LR
			ENDP
