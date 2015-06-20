`include "dff_synchronous.v"

module dff_synchronous_test;
   reg reset, clock, data;
   output q;
   wire   q;
   
   dff_synchronous dffs_1(q, reset, clock, data);

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
    	#1 $finish;
     end

   initial
     begin
	$monitor($time,  "\tclock=%b", clock, "\treset=%b", reset, "\tdata=%b", data, "\tq=%b", q);
	$dumpfile("dff_synchronous_test.vcd");
	$dumpvars;
     end
   
endmodule // dff_synchronous_test
