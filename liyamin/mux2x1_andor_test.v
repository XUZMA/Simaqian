`include "mux2x1_andor.v"

module mux2x1_andor_test;
   reg s, a0, a1;
   wire y;

   mux2x1_andor mux2x1(y, s, a0, a1);

   initial
     begin
	s = 0; a0 = 0; a1 = 0;
	#1 s = 1; a0 = 0; a1 = 0;
	#1 s = 0; a0 = 1; a1 = 0;
	#1 s = 1; a0 = 1; a1 = 0;
	#1 s = 0; a0 = 0; a1 = 1;
	#1 s = 1; a0 = 0; a1 = 1;
	#1 s = 0; a0 = 1; a1 = 1;
	#1 s = 1; a0 = 1; a1 = 1;
	#1 $finish;
     end

   initial
     begin
	$monitor($time, ":\ts=%b", s, "\ta0=%b", a0, "\ta1=%b", a1, "\ty=%b", y);
	$dumpfile("mux2x1_andor_test.vcd");
	$dumpvars;
     end
   
endmodule // mux2x1_andor_test
