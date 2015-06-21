`include "fulladder4_structural.v"

module  fulladder4_structural_test;
   reg [3:0] a, b;
   reg carry_in;
   wire [3:0] sum;
   wire carry_out;

   fulladder4_structural fa4s(sum, carry_out, a, b, carry_in);

   initial
     begin
	a = 4'b0000; b = 4'b0000; carry_in = 1;
	#1 a = 4'b0011; b = 4'b0000; carry_in = 1;
	#1 a = 4'b0011; b = 4'b1111; carry_in = 1;
	#1 a = 4'b1110; b = 4'b0011; carry_in = 1;
	#1 a = 4'b1011; b = 4'b0111; carry_in = 1;
        #1 $finish;
     end

   initial
     begin
	$monitor($time, "\ta=%b", a, "\tb=%b", b, "\tcin=%b", carry_in, "\tsum=%b", sum, "\tcout=%b", carry_out);
	$dumpfile("fulladder4_structural_test.vcd");
	$dumpvars;
     end
   
endmodule // fulladder4_structural_test
