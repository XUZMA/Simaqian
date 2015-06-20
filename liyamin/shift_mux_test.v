`include "shift_mux.v"

module shift_mux_test;
   reg [31:0] data;
   reg [4:0]  shift_amount;
   reg right, arithmetic;
   wire [31:0] sh;
   
   shift_mux shm_1 (sh, data, shift_amount, right, arithmetic);

   initial
     begin
	data = 32'hFF00_00FF; shift_amount = 4; right = 1; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 8; right = 1; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 12; right = 1; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 16; right = 1; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 20; right = 1; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 24; right = 1; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 28; right = 1; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 31; right = 1; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 4; right = 0; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 8; right = 0; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 12; right = 0; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 16; right = 0; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 20; right = 0; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 24; right = 0; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 28; right = 0; arithmetic = 1;
	#1 data = 32'hFF00_00FF; shift_amount = 31; right = 0; arithmetic = 1;
     end

   initial
     begin
	$monitor($time,"\td=%h",data,"\tsh=%h",sh,"\tsa=%d",shift_amount,"\tright=%b",right,"\tarithmetic=%b",arithmetic);
	$dumpfile("shift_mux_test.vcd");
	$dumpvars;
     end
   
endmodule // shift_mux_test
