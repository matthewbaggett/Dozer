#line 1 "C:/Users/Matthew/Dozer/DozerControlBoard/Software/DozerController.c"
#line 29 "C:/Users/Matthew/Dozer/DozerControlBoard/Software/DozerController.c"
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;

char cnt;
char kk;

void main(void){
 ADCON1 |= 0x0F;
 CMCON |= 7;

 HID_Enable(&readbuff,&writebuff);

 while(1){
 USB_Polling_Proc();
 kk = HID_Read();
 if(kk != 0){
 for(cnt=0;cnt<64;cnt++)
 writebuff[cnt]=readbuff[cnt];
 HID_Write(&writebuff,64);
 }
 }
}
