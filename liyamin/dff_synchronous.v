module dff_synchronous(q, reset, clock, data);// d_flipflop with synchronous reset
   input reset, clock, data;
   output q;
   reg 	  q;

   always @ (posedge clock)
     begin
	if(reset == 0)
	  q <= 0;
	else
	  q <= data;
     end
   
endmodule // dff_synchronous
