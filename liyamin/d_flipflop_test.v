`include "d_flipflop.v"

module d_flipflop_test;
   reg clock, d;
   wire q, q_bar;
   
   d_flipflop dff_1(q, q_bar, clock, d);

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
	#1 clock = 0; d = 0;
	#1 $finish;
     end

   initial
     begin
	$monitor($time, "\tclock=%b",clock, "\td=%b",d,"\tq=%b",q,"\tqn=%b",q_bar);
	$dumpfile("d_flipflop_test.vcd");
	$dumpvars;
     end
   
endmodule // d_flipflop_test
