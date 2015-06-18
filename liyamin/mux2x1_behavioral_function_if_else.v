module mux2x1_behavioral_function_if_else(y, s, a0, a1);
   input s, a0, a1;
   output y;

   assign y = sel(s,a0,a1);
   
   function sel;
      input ss, aa0, aa1;// note the order.
      if (ss)
	sel = aa1;
      else
	sel = aa0;
   endfunction

endmodule // mux2x1_behavioral_function_if_else
