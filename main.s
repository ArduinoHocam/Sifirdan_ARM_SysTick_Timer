;SIFIRDAN_ARM_ÖGRENIYORUM 
;#############
;ARDUINO HOCAM
;############# 
;LECTURE:SYSTICK TIMER

					AREA main , CODE, READONLY
					THUMB
					EXTERN INIT_GPIO ;include
					EXTERN INIT_TIMER
					EXTERN SysTick_Handler
					EXPORT __main
__main					
					BL INIT_TIMER
					BL INIT_GPIO

loop				B loop;do whatever you want here,stupid loop for example		 				
					
					
					END


			
	
				
			
			
			
			
			
			
			
			