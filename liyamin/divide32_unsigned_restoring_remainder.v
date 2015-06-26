module divide32_unsigned_restoring_remainder(quotient, remainder, ready, busy, count, dividend, divisor, start, clock, reset);
   input 	reset; 
   // in simulation, use reset negedge to initialize the state registers of division server(count, busy, busy2).
   // the negedge reset appears only ONCE for one division.
   input 	start;
   // in simulation, start = 1 to begin division operation.
   // the case, start = 1, holds for only ONE cycle (immediately after the cycle of negedge reset) .
   input 	clock;
   
   input [31:0] dividend;
   input [15:0] divisor;

   output 	 busy; 
    // in simulation, busy = 1 indicates division server is busy and can't receive new division operands(dividend, divisor) further
   output [4:0]  count;
    // in simulation, count tells the number of subtraction interation in division. 
   // when count = 5'h1F, division server completes subtraction.
   output 	 ready;
    // in simulation, ready = 1 tells the division client the division result is ready

   reg [4:0] 	 count;
   reg 		 busy; 

   output [31:0] quotient;
   output [15:0] remainder;

   reg 		 busy2;
   // ********************************
   // busy2 is used for generating 1-cycle ready.
   // i.e., ready = 1 holds for only ONE cycle.
   //  ready = ~busy & busy2.
   // ********************************

   reg [31:0] 	 reg_quotient;
   reg [15:0] 	 reg_remainder;
   reg [15:0] 	 reg_divisor;
   
   wire [16: 0]  difference;
   wire [15: 0]  restoring_remainder;

   assign difference = {remainder, quotient[31]} - {1'b0, reg_divisor};
   assign restoring_remainder = difference[16] ? {remainder[14:0], quotient[31]} : difference[15:0];
   assign quotient = reg_quotient;
   assign remainder = reg_remainder;
   assign ready = ~busy & busy2; // generate 1-cycle ready

   always @ (posedge clock or negedge reset)
     begin
	if(reset == 0)
	  begin
	     count <= 5'b0; // reset count
	     busy <= 0;       // set busy to 0
	     busy2 <= 0;     // set busy2 to 0
	  end
	else    // not reset
	  begin
	     busy2 <= busy;  // 1-cycle delay of busy
	     if(start)              // start: 1 cycle only
	       begin
		  reg_remainder <= 16'h0;    // reset remainder
		  reg_quotient <= dividend; // load dividend
		  reg_divisor <= divisor;       // load divisor
		  count <= 5'b0;                    // set count to 0
		  busy <= 1'b1;                     // set busy to 1
	       end
	     else
	       if(busy)                                  // execution: 32 cycles
		 begin
		    reg_remainder <= restoring_remainder;
		    reg_quotient <= {reg_quotient[30:0], ~difference[16]};
		    count <= count + 5'b00001; // count++
		    if(count == 5'h1F)
		      busy <= 0;    // finish
		 end
	  end
     end // always @ (posedge clock or negedge reset)

endmodule // divide32_unsigned_restoring_remainder
