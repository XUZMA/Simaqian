`include "mux2x32.v"

module mux2x32_test;
   reg [31:0] a0, a1;
   reg 	      s;
   wire [31:0] y;

   mux2x32 mux(y, s, a0, a1);

   initial
     begin
	s = 0; a0 = 32'h0000_0000; a1 = 32'h0000_0000;
	#1 s = 1; a0 = 32'h0000_0000; a1 = 32'h0000_0000;
	#1 s = 0; a0 = 32'hFFFF_FFFF; a1 = 32'h0000_0000;
	#1 s = 1; a0 = 32'hFFFF_FFFF; a1 = 32'h0000_0000;
	#1 s = 0; a0 = 32'h0000_0000; a1 = 32'hFFFF_FFFF;
	#1 s = 1; a0 = 32'h0000_0000; a1 = 32'hFFFF_FFFF;
	#1 s = 0; a0 = 32'hFFFF_FFFF; a1 = 32'hFFFF_FFFF;
	#1 s = 1; a0 = 32'hFFFF_FFFF; a1 = 32'hFFFF_FFFF;
	#1 $finish;
     end

   initial
     begin
	$monitor($time, ":\ts=%b", s, "\ta0=%b", a0, "\ta1=%b", a1, "\ty=%b", y);
	$dumpfile("mux2x32_test.vcd");
	$dumpvars;
     end
   
endmodule // mux2x32_test
