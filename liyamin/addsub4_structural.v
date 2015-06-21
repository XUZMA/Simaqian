`include "fulladder_structural.v"

module addsub4_structural(result, carry_out, subtract, a, b, carry_in);

   input [3:0] a, b;
   input carry_in; // input carry or borrow
   input subtract; // subtract: 1, subtract; 0, add
   
   output [3:0] result;
   output 	carry_out;

   wire [2:0] carry_borrow;
   wire [3:0] b_subtract;
   wire       carry_borrow_in;

   xor xor0(b_subtract[0], b[0], subtract);
   xor xor1(b_subtract[1], b[1], subtract);
   xor xor2(b_subtract[2], b[2], subtract);
   xor xor3(b_subtract[3], b[3], subtract);   
   xor xor4(carry_borrow_in, carry_in, subtract);
   
   fulladder_structural fas1(result[0], carry_borrow[0], a[0], b_subtract[0], carry_borrow_in);
   fulladder_structural fas2(result[1], carry_borrow[1], a[1], b_subtract[1], carry_borrow[0]);
   fulladder_structural fas3(result[2], carry_borrow[2], a[2], b_subtract[2], carry_borrow[1]);
   fulladder_structural fas4(result[3], carry_out,            a[3], b_subtract[3], carry_borrow[2]);
   
endmodule // addsub4_structural
