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
	reset = 0; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0
	#1 reset = 0; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // posedge clock, reset == 0, count = 0
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 1; // count = 0
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 1; // posedge clock, start == 1, count = 0
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 2
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 2
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 3
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 3
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 4
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 4
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 5
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 5
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 6
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 6
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 7
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 7
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 8
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 8
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 9
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 9
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0a
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0a
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0b
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0b
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0c
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0c
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0d
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0d
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0e
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0e
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0f
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 0f
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 10
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 10
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 11
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 11
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 12
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 12
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 13
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 13
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 14
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 14
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 15
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 15
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 16
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 16
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 17
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 17
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 18
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 18
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 19
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 19
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1a
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1a
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1b
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1b
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1c
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1c
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1d
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1d
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1e
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1e
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1f
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 1f
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 20
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 20
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 21
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 21
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 22
	#1 reset = 1; clock = 0; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 22
	#1 reset = 1; clock = 1; dividend = 32'h0002_0000; divisor = 16'hFFFF; start = 0; // count = 23
     end

   initial
     begin
	$monitor($time, "\tclock=%b", clock, "\treset=%b", reset, "\tstart=%b", start, "\tdividend=%h", dividend, "\tdivisor=%h", divisor, "\tbusy=%b", busy, "\tcount=%h", count, "\tready=%b", ready, "\tquotient=%h", quotient, "\tremainder=%h", remainder);
	$dumpfile("divide32_unsigned_restoring_remainder_test.vcd");
	$dumpvars;
     end
   
endmodule // divide32_unsigned_restoring_remainder_test
