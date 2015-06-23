#include<stdio.h>

unsigned int multiply16_unsigned(unsigned int x, unsigned int y){
    unsigned int a, b, c;
    unsigned int i; // counter

    a = x; // multiplicand
    b = y; // multiplier
    c = 0; // product

    for(i = 0; i < 16; i++){ // for 16 bits
      if( (b & 1) == 1){
	c += a;
      }
      a = a << 1; // shift a 1-bit left
      b = b >> 1; // shift b 1-bit right
    }

    return c; // return product
}

main(){
  unsigned int x, y;

  fprintf(stderr, "input 1st 16-bit unsigned integer in hexadecimal: x = ");
  fscanf(stdin, "%x", &x);

  fprintf(stderr, "input 2nd 16-bit unsigned integer in hexadecimal: y = ");
  fscanf(stdin, "%x", &y);

  x &= 0xFFFF; // left the lsb 16-bits of x
  y &= 0xFFFF; // left the lsb 16-bits of y

  fprintf(stderr, "%04x * %04x = %08x\n", x, y, multiply16_unsigned(x,y));
}
