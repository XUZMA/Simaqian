module mux2x1_behavioral_if_else(y, s, a0, a1);
   input s, a0, a1;
   output y;

   reg 	  y; // y can't be a net.
   
   always @(s or a0 or a1)
     begin
	if (s)
	  begin
	     y = a1;
	  end
	else
	  begin
	     y = a0;
	  end
     end

endmodule // mux2x1_behavioral_if_else
