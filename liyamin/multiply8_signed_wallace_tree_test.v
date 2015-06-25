`include "multiply8_signed_wallace_tree.v"

module multiply8_signed_wallace_tree_test;
   reg [7:0] multiplicand_a, multiplier_b;
   wire [15:0] product;
   
   multiply8_signed_wallace_tree m8uwt_0(product, multiplicand_a, multiplier_b);

   initial
     begin
	multiplicand_a = 8'h00; multiplier_b = 8'h00;
	#1 multiplicand_a = 8'h01; multiplier_b = 8'h01;
	#1 multiplicand_a = 8'h02; multiplier_b = 8'h02;
	#1 multiplicand_a = 8'h04; multiplier_b = 8'h04;
	#1 multiplicand_a = 8'h08; multiplier_b = 8'h08;
	#1 multiplicand_a = 8'h10; multiplier_b = 8'h10;
	#1 multiplicand_a = 8'h20; multiplier_b = 8'h20;
	#1 multiplicand_a = 8'h40; multiplier_b = 8'h40;
	#1 multiplicand_a = 8'h80; multiplier_b = 8'h80;
	#1 multiplicand_a = 8'b1111_1111; multiplier_b = 8'b1111_1111; // -1
	#1 multiplicand_a = 8'b1111_1110; multiplier_b = 8'b1111_1110; // -2
	#1 multiplicand_a = 8'b1111_1100; multiplier_b = 8'b1111_1100; // -4
	#1 multiplicand_a = 8'b1111_1000; multiplier_b = 8'b1111_1000; // -8
	#1 multiplicand_a = 8'b1111_0000; multiplier_b = 8'b1111_0000; // -16
	#1 multiplicand_a = 8'b1110_0000; multiplier_b = 8'b1110_0000; // -32
	#1 multiplicand_a = 8'b1100_0000; multiplier_b = 8'b1100_0000; // -64
	#1 multiplicand_a = 8'b1000_0000; multiplier_b = 8'b1000_0000; // -128
	#1 $finish;
     end

   initial
     begin
	$monitor($time, ":\ta=%h", multiplicand_a, "\tb=%h", multiplier_b, "\ta*b=%h", product);
	$dumpfile("multiply8_signed_wallace_tree_test.vcd");
	$dumpvars;
     end
   
endmodule // multiply8_signed_wallace_tree_test
