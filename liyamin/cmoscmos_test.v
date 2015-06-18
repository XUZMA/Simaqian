`include "cmoscmos.v"

module cmoscmos_test;
   reg source, n_gate, p_gate;
   wire drain1, drain2;
   cmos c1(drain1, source, n_gate, p_gate);
   cmoscmos c2(drain2, source, n_gate, p_gate);

   initial
     begin
	source = 0; n_gate = 0; p_gate = 0;
	#1 source = 0; n_gate = 0; p_gate = 0;
	#1 source = 1; n_gate = 0; p_gate = 0;
	#1 source = 0; n_gate = 1; p_gate = 0;
	#1 source = 1; n_gate = 1; p_gate = 0;
	#1 source = 0; n_gate = 0; p_gate = 1;
	#1 source = 1; n_gate = 0; p_gate = 1;
	#1 source = 0; n_gate = 1; p_gate = 1;
	#1 source = 1; n_gate = 1; p_gate = 1;	
	#1 $finish;
     end

   initial
     begin
	$monitor($time, ": source=%b",source," n_gate=%b", n_gate, " p_gate=%b", p_gate, " drain1=%b", drain1, " drain2=%b", drain2);
	$dumpfile("cmoscmos_test.vcd");
	$dumpvars;
	
     end
   
endmodule // cmoscmos_test
