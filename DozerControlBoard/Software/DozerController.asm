
_main:

;DozerController.c,1 :: 		void main() {
;DozerController.c,2 :: 		PORTD = 0;
	CLRF        PORTD+0 
;DozerController.c,3 :: 		TRISD = 0;
	CLRF        TRISD+0 
;DozerController.c,4 :: 		while(1){
L_main0:
;DozerController.c,5 :: 		PORTD.F2 = 1;
	BSF         PORTD+0, 2 
;DozerController.c,6 :: 		delay_ms(150);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       231
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;DozerController.c,7 :: 		PORTD.F2 = 0;
	BCF         PORTD+0, 2 
;DozerController.c,8 :: 		delay_ms(150);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       231
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;DozerController.c,9 :: 		}
	GOTO        L_main0
;DozerController.c,10 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
