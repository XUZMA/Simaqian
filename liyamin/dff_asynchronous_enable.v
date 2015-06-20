module dff_asynchronous_enable(q, reset, clock, enable,data);// d_flipflop with asynchronous reset
   input reset, clock, data, enable;
   output q;
   reg 	  q;

   always @ (posedge clock or negedge reset)
     begin
	if(reset == 0)
	  q <= 0;
	else
	  if (enable)
            q <= data;
     end
   
endmodule // dff_asynchronous_enable
