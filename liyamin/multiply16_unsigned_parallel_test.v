`include "multiply16_unsigned_parallel.v"

module multiply16_unsigned__parallel_test;
   reg [31:0] multiplicand, multiplier;
   wire [31:0] product;
 
   multiply16_unsigned_parallel mup_0(product, multiplicand, multiplier);
 
   initial
     begin
	multiplicand = 32'h0000_1111; multiplier = 32'h0000_0001;
	#1 multiplicand = 32'h0000_1111; multiplier = 32'h0000_0011;
	#1 multiplicand = 32'h0000_1111; multiplier = 32'h0000_0111;
	#1 multiplicand = 32'h0000_1111; multiplier = 32'h0000_1111;	
     end

   initial
     begin
	$monitor($time, ":\ta = %h", multiplicand, "\tb=%h", multiplier, "\ta*b=%h", product);
	$dumpfile("multiply16_unsigned_parallel_test.vcd");
	$dumpvars;
     end
   
endmodule // multiply16_unsigned_parallel_test
