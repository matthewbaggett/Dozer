
_main:

;DozerController.c,35 :: 		void main(void){
;DozerController.c,36 :: 		ADCON1 |= 0x0F;                         // Configure all ports with analog function as digital
	MOVLW       15
	IORWF       ADCON1+0, 1 
;DozerController.c,37 :: 		CMCON  |= 7;                            // Disable comparators
	MOVLW       7
	IORWF       CMCON+0, 1 
;DozerController.c,39 :: 		HID_Enable(&readbuff,&writebuff);       // Enable HID communication
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;DozerController.c,41 :: 		while(1){                               // USB servicing is done inside the while loop
L_main0:
;DozerController.c,42 :: 		USB_Polling_Proc();                   // Call this routine periodically
	CALL        _USB_Polling_Proc+0, 0
;DozerController.c,43 :: 		kk = HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _kk+0 
;DozerController.c,44 :: 		if(kk != 0){
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;DozerController.c,45 :: 		for(cnt=0;cnt<64;cnt++)
	CLRF        _cnt+0 
L_main3:
	MOVLW       64
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;DozerController.c,46 :: 		writebuff[cnt]=readbuff[cnt];
	MOVLW       _writebuff+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FSR1H 
	MOVF        _cnt+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _readbuff+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FSR0H 
	MOVF        _cnt+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;DozerController.c,45 :: 		for(cnt=0;cnt<64;cnt++)
	INCF        _cnt+0, 1 
;DozerController.c,46 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main3
L_main4:
;DozerController.c,47 :: 		HID_Write(&writebuff,64);
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;DozerController.c,48 :: 		}
L_main2:
;DozerController.c,49 :: 		}
	GOTO        L_main0
;DozerController.c,50 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
