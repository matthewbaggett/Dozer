#line 1 "C:/Users/Matthew/Dozer/DozerControlBoard/Software/DozerController.c"
void main() {
 PORTD = 0;
 TRISD = 0;
 while(1){
 PORTD.F2 = 1;
 delay_ms(150);
 PORTD.F2 = 0;
 delay_ms(150);
 }
}
