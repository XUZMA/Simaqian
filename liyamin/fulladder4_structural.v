`include "fulladder_structural.v"

module fulladder4_structural(sum, carry_out, a, b, carry_in);

   input [3:0] a, b;
   input carry_in;
   output [3:0] sum;
   output carry_out;

   wire [2:0] cout;
   
   fulladder_structural fas1(sum[0], cout[0], a[0], b[0], carry_in);
   fulladder_structural fas2(sum[1], cout[1], a[1], b[1], cout[0]);
   fulladder_structural fas3(sum[2], cout[2], a[2], b[2], cout[1]);
   fulladder_structural fas4(sum[3], carry_out, a[3], b[3], cout[2]);
   
endmodule // fulladder4_structural
