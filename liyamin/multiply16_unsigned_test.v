`include "multiply16_unsigned.v"

module multiply16_unsigned_test;
/***
   reg [31:0] partial_product_finished, multiplicand, multiplier;
   wire [31:0] partial_product, multiplicand_shift_left, multiplier_shift_right;
   
   multiply_line_1 ml1_0(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_finished, multiplicand, multiplier);
   
   initial
     begin
	partial_product_finished = 32'h0000_0000; multiplicand = 32'h0000_1111; multiplier = 32'h0000_0001;
	#1 partial_product_finished = 32'h0000_0000; multiplicand = 32'h0000_1111; multiplier = 32'h0000_0011;
	#1 partial_product_finished = 32'h0000_0000; multiplicand = 32'h0000_1111; multiplier = 32'h0000_0111;
	#1 partial_product_finished = 32'h0000_0000; multiplicand = 32'h0000_1111; multiplier = 32'h0000_1111;	
     end

   initial
     begin
	$monitor($time, ": \ta=%h", multiplicand, "\tb=%h", multiplier, "\tres_carry=%h", partial_product_finished, "\ta<<1=%h", multiplicand_shift_left, "\tb>>1=%h",multiplier_shift_right);
	$dumpfile("multiply16_unsigned_test.vcd");
	$dumpvars;
     end
***/   
   
   reg [31:0] multiplicand, multiplier;
   wire [31:0] product;
 
   multiply16_unsigned mulu_0(product, multiplicand, multiplier);
 
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
	$dumpfile("multiply16_unsigned_test.vcd");
	$dumpvars;
     end
   
endmodule // multiply16_unsigned_test
