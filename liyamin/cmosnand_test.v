`include "cmosnand.v"

module cmosnand_test;
   reg a,b;
   wire f;
   cmosnand nand_1(f,a,b);
   initial
     begin
	a = 0; b = 0;
	#1 a = 1;b = 0;
	#1 a = 0;b = 1;
	#1 a = 1;b = 1;
	#1 $finish;
     end
   initial
     begin
	$monitor($time, ": a=%b", a, " b=%b",b," f=%b;",f);
	$dumpfile("cmosnand.vcd");
	$dumpvars;
     end
endmodule // cmosnand_test
