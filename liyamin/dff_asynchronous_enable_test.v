`include "dff_asynchronous_enable.v"

module dff_asynchronous_enable_test;
   reg reset, clock, data, enable;
   output q;
   wire   q;
   
   dff_asynchronous_enable dffase_1(q, reset, clock, enable,data);

   initial
     begin
	clock = 0; reset = 0; enable = 0; data = 0;
	#1 clock = 1; reset = 0; enable = 0; data = 0;
	#1 clock = 0; reset = 1; enable = 0; data = 0;
	#1 clock = 1; reset = 1; enable = 0; data = 0;
	#1 clock = 0; reset = 0; enable = 1; data = 0;
	#1 clock = 1; reset = 0; enable = 1; data = 0;
	#1 clock = 0; reset = 1; enable = 1; data = 0;
	#1 clock = 1; reset = 1; enable = 1; data = 0;
	#1 clock = 0; reset = 0; enable = 0; data = 1;
	#1 clock = 1; reset = 0; enable = 0; data = 1;
	#1 clock = 0; reset = 1; enable = 0; data = 1;
	#1 clock = 1; reset = 1; enable = 0; data = 1;
	#1 clock = 0; reset = 0; enable = 1; data = 1;
	#1 clock = 1; reset = 0; enable = 1; data = 1;
	#1 clock = 0; reset = 1; enable = 1; data = 1;
	#1 clock = 1; reset = 1; enable = 1; data = 1;
    	#1 $finish;
     end

   initial
     begin
	$monitor($time,  "\tclock=%b", clock, "\treset=%b", reset, "\tenable=%b", enable, "\tdata=%b", data, "\tq=%b", q);
	$dumpfile("dff_asynchronous_enable_test.vcd");
	$dumpvars;
     end
   
endmodule // dff_asynchronous_enable_test
