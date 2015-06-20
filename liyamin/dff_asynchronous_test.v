`include "dff_asynchronous.v"

module dff_asynchronous_test;
   reg reset, clock, data;
   output q;
   wire   q;
   
   dff_asynchronous dffs_1(q, reset, clock, data);

   initial
     begin
	clock = 0; reset = 0; data = 0;
	#1 clock = 1; reset = 0; data = 0;
	#1 clock = 0; reset = 1; data = 0;
	#1 clock = 1; reset = 1; data = 0;
	#1 clock = 0; reset = 0; data = 1;
	#1 clock = 1; reset = 0; data = 1;
	#1 clock = 0; reset = 1; data = 1;
	#1 clock = 1; reset = 1; data = 1;
	#1 reset = 0; clock = 0; data = 0;
	#1 reset = 1; clock = 0; data = 0;
	#1 reset = 0; clock = 1; data = 0;
	#1 reset = 1; clock = 1; data = 0;
	#1 reset = 0; clock = 0; data = 1;
	#1 reset = 1; clock = 0; data = 1;
	#1 reset = 0; clock = 1; data = 1;
	#1 reset = 1; clock = 1; data = 1;	
    	#1 $finish;
     end

   initial
     begin
	$monitor($time,  "\tclock=%b", clock, "\treset=%b", reset, "\tdata=%b", data, "\tq=%b", q);
	$dumpfile("dff_asynchronous_test.vcd");
	$dumpvars;
     end
   
endmodule // dff_asynchronous_test
