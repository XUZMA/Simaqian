`include "cmosnor.v"

module cmosnor_test;
   reg a, b;
   wire f;
   cmosnor nor_1(f, a, b);

   initial
     begin
	a = 0;b = 0;
	#1 a = 1;b = 0;
	#1 a = 0;b = 1;
	#1 a = 1;b = 1;
	#1 $finish;
     end

    initial
      begin
	 $monitor($time, ": a=%b", a, " b=%b",b," ~(a|b)=",f);
	 $dumpfile("cmosnor.vcd");
	 $dumpvars;
      end
endmodule // cmosnor_test
