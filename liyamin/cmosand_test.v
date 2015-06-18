`include "cmosand.v"

module cmosand_test;
   reg a,b;
   wire f;
   
   cmosand and_1(f,a,b);
   
   initial
     begin
	a = 0; b = 0;
	#1 a = 1; b = 0;
	#1 a = 0; b = 1;
	#1 a = 1; b = 1;
	#1 $finish;
     end

   initial
     begin
	$monitor($time, ": a=%b",a," b=%b",b," (a&b)=%b",f);
	$dumpfile("cmosand.vcd");
	$dumpvars;
     end
   
endmodule // cmosand_test
