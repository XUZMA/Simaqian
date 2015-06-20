`include "rs_latch.v"

module rs_latch_test;
   reg reset, set;
   wire q, q_bar;

   rs_latch rs_1(q, q_bar, reset, set);

   initial
     begin
	reset = 0; set = 0;
	#1 reset = 1; set = 0;
	#1 reset = 0; set = 1;
	#1 reset = 1; set = 1;
	#1 $finish;
     end

   initial
     begin
	$monitor($time, "\tr=%b", reset, "\ts=%b", set, "\tq=%b", q, "\tqn=%b", q_bar);
	$dumpfile("rs_latch_test.vcd");
	$dumpvars;
     end
   
endmodule // rs_latch_test
