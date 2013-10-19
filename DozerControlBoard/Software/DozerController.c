#include "USBdsc.c"

unsigned char readbuff[64] absolute 0x500;   // Buffers should be in USB RAM, please consult datasheet
unsigned char writebuff[64] absolute 0x540;
char cnt;
char kk;
int blink_i;


//void interrupt(){
  // USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
//}

void main(void){
  ADCON1 |= 0x0F;                         // Configure all ports with analog function as digital
  CMCON  |= 7;                            // Disable comparators
  PORTD = 0;
  TRISD = 0;
  HID_Enable(&readbuff,&writebuff);       // Enable HID communication
  
  for(blink_i= 0 ; blink_i <= 3; blink_i++){
    PORTD.F2 = 0;
    delay_ms(150);
    PORTD.F2 = 1;
    delay_ms(150);
  }
  while(1){}
  while(1){
    while(!HID_Read());
    for(cnt=0; cnt<64; cnt++){
      writebuff[cnt] = readbuff[cnt];    while(!HID_Write(&writebuff,64))      ;
      PORTD.F2 = ~PORTD.F2;
    }
  }
}