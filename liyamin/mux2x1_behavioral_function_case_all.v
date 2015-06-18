module mux2x1_behavioral_function_case_all(y, s, a0, a1);
   input s, a0, a1;
   output y;

   assign y = sel(s,a0,a1);
   
   function sel;
      input ss, aa0, aa1;
      case (ss)
	1'b0: sel = aa0;
	1'b1: sel = aa1;
      endcase // case (ss)
   endfunction

endmodule // mux2x1_behavioral_function_case_all
