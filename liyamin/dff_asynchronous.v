module dff_asynchronous(q, reset, clock, data);// d_flipflop with asynchronous reset
   input reset, clock, data;
   output q;
   reg 	  q;

   always @ (posedge clock or negedge reset)
     begin
	if(reset == 0)
	  q <= 0;
	else
	  q <= data;
     end
   
endmodule // dff_asynchronous
