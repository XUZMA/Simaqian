`include "d_latch.v"

module d_latch_test;
   reg clock, d;
   wire q, q_bar;
   d_latch dl(q, q_bar, clock, d);

   initial
     begin
	clock = 0; d = 0;
	#1 clock = 1; d = 0;
	#1 clock = 0; d = 1;
	#1 clock = 1; d = 1;
	#1 clock = 0; d = 0;
	#1 clock = 1; d = 0;
	#1 clock = 0; d = 1;
	#1 clock = 1; d = 1;
	#1 $finish;
     end

   initial
     begin
	$monitor($time, "\tclock=%b",clock,"\td=%b",d,"\tq=%b",q,"\tqn=%b",q_bar);
	$dumpfile("d_latch_test.vcd");
	$dumpvars;
     end
   
endmodule // d_latch_test
