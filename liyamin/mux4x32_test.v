`include "mux4x32.v"

module mux4x32_test;
   reg [31:0] a0, a1,a2,a3;
   reg [1:0]      s;
   wire [31:0] y;

   mux4x32 mux(y, s, a0, a1,a2,a3);

   initial
     begin
	s = 2'b00; a0 = 32'h0000_0000; a1 = 32'h0000_FFFF;a2 = 32'hFFFF_0000; a3 = 32'hFFFF_FFFF;
	#1 s = 2'b01; a0 = 32'h0000_0000; a1 = 32'h0000_FFFF;a2 = 32'hFFFF_0000; a3 = 32'hFFFF_FFFF;
	#1 s = 2'b10; a0 = 32'h0000_0000; a1 = 32'h0000_FFFF;a2 = 32'hFFFF_0000; a3 = 32'hFFFF_FFFF;
	#1 s = 2'b11; a0 = 32'h0000_0000; a1 = 32'h0000_FFFF;a2 = 32'hFFFF_0000; a3 = 32'hFFFF_FFFF;	
	#1 $finish;
     end

   initial
     begin
	$monitor($time, ": s=%b", s, "\ta0=%b", a0, "\ta1=%b", a1,"\ta2=%b", a2, "\ta3=%b", a3, "\ty=%b", y);
	$dumpfile("mux4x32_test.vcd");
	$dumpvars;
     end
   
endmodule // mux4x32_test
