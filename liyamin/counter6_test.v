`include "counter6.v"

module counter6_test;
   reg clock, reset, button;

   wire [2:0] q;
   wire a, b, c, d, e, f, g;

   counter6 cnt6_1(a, b, c, d, e, f, g, q, clock, reset, button);

   initial
     begin
	clock = 0; reset = 0; button = 0;
	#1 clock = 1; reset = 0; button = 0;// s0
	#1 clock = 0; reset = 1; button = 0;
	#1 clock = 1; reset = 1; button = 1;// s1
	#1 clock = 0; reset = 1; button = 1;
	#1 clock = 1; reset = 1; button = 1;// s2
	#1 clock = 0; reset = 1; button = 1;
	#1 clock = 1; reset = 1; button = 1;// s3
	#1 clock = 0; reset = 1; button = 1;
	#1 clock = 1; reset = 1; button = 1;// s4
	#1 clock = 0; reset = 1; button = 1;
	#1 clock = 1; reset = 1; button = 1;// s5
	#1 clock = 0; reset = 1; button = 1;
	#1 clock = 1; reset = 1; button = 1;// s0
	#1 clock = 0; reset = 1; button = 0;
	#1 clock = 1; reset = 1; button = 0;// s5
	#1 clock = 0; reset = 1; button = 0;
	#1 clock = 1; reset = 1; button = 0;// s4
	#1 clock = 0; reset = 1; button = 0;
	#1 clock = 1; reset = 1; button = 0;// s3
	#1 clock = 0; reset = 1; button = 0;
	#1 clock = 1; reset = 1; button = 0;// s2
	#1 clock = 0; reset = 1; button = 0;
	#1 clock = 1; reset = 1; button = 0;// s1
	#1 clock = 0; reset = 1; button = 0;
	#1 clock = 1; reset = 1; button = 0;// s0
     end

   initial
     begin
	$monitor($time, "\treset=%b", reset, "\tbutton=%b", button, "\tq=%b", q, "\ta=%b", a," b=%b", b, " c=%b", c , " d=%b", d, " e=%b", e, " f=%b", f, " g=%b",g);
	$dumpfile("counter6_test.vcd");
	$dumpvars;
     end
   
endmodule // counter6_test
