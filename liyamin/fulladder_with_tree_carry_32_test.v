`include "fulladder_with_tree_carry_32.v"

module fulladder_with_tree_carry_32_test;
   reg [31:0] a, b;
   reg carry_in;
   wire [31:0] sum;
   wire 	 carry_out;

   fulladder_with_tree_carry_32 fawtc32_0(sum, carry_out, a, b, carry_in);

   initial
     begin
	a = 32'hAFFFFFFF; b = 32'h10000000; carry_in = 1;// C
	#1 a = 32'hAFFFFFFF; b = 32'h20000000; carry_in = 1; // D
	#1 a = 32'hAFFFFFFF; b = 32'h30000000; carry_in = 1; // E
	#1 a = 32'hAFFFFFFF; b = 32'h40000000; carry_in = 1; // F
	#1 a = 32'hAFFFFFFF; b = 32'h50000000; carry_in = 1; // 0		
	#1 $finish;
     end

   initial
     begin
	$monitor($time, "\ta=%h", a, "\tb=%h", b, "\tcin=%h", carry_in, "\tsum=%h", sum, "\tcout=%h", carry_out);
	$dumpfile("fulladder_with_tree_carry_32_test.vcd");
	$dumpvars;
     end

endmodule // fulladder_with_tree_carry_32_test
