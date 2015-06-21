`include "fulladder_behavioral.v"

module  fulladderbehavioral_test;
   reg a, b, carry_in;
   wire sum, carry_out;

   fulladder_behavioral fab(sum, carry_out, a, b, carry_in);

   initial
     begin
	a = 0; b = 0; carry_in = 0;
	#1 a = 1; b = 0; carry_in = 0;
	#1 a = 0; b = 1; carry_in = 0;
	#1 a = 1; b = 1; carry_in = 0;
	#1 a = 0; b = 0; carry_in = 1;
	#1 a = 1; b = 0; carry_in = 1;
	#1 a = 0; b = 1; carry_in = 1;
	#1 a = 1; b = 1; carry_in = 1;
        #1 $finish;
     end

   initial
     begin
	$monitor($time, "\ta=%b", a, "\tb=%b", b, "\tcin=%b", carry_in, "\tsum=%b", sum, "\tcout=%b", carry_out);
	$dumpfile("fulladder_behavioral_test.vcd");
	$dumpvars;
     end
   
endmodule // fulladder_behavioral_test
