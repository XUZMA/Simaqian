`include "divide32_unsigned_restoring_remainder.v"

module divide32_unsigned_restoring_remainder_test;
   reg [31:0] dividend;
   reg [15:0] divisor;
   reg 	      start;
   reg 	      clock;
   reg 	      reset;

   wire [31:0] quotient;
   wire [15:0] remainder;
   wire         ready;
   wire         busy;
   wire [4:0] count;

   divide32_unsigned_restoring_remainder d32urr_0(quotient, remainder, ready, busy, count, dividend, divisor, start, clock, reset);

   initial
     begin
	reset = 1; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 1; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 0; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
	#1 reset = 0; clock = 1; start = 0; dividend = 32'hFFFF_FFFF; divisor = 16'h0002;
     end

   initial
     begin
	$monitor($time, "\tclock=%b", clock, "\treset=%b", reset, "\tstart=%b", start, "\tdividend=%h", dividend, "\tdivisor=%h", divisor, "\tbusy=%b", busy, "\tcount=%h", count, "\tready=%b", ready, "\tquotient=%h", quotient, "\tremainder=%h", remainder);
	$dumpfile("divide32_unsigned_restoring_remainder_test.vcd");
	$dumpvars;
     end
   
endmodule // divide32_unsigned_restoring_remainder_test

