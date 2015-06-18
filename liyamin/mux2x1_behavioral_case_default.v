module mux2x1_behavioral_case_default(y, s, a0, a1);
   input s, a0, a1;
   output y;

   reg 	  y; // y can't be a net.
   
   always @(s or a0 or a1)
     begin
	case(s)
	  1'b0: y = a0;
	  default: y = a1;
	endcase // case (s)
     end
   
endmodule // mux2x1_behavioral_case_default
