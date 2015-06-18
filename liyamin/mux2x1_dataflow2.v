module mux2x1_dataflow2(y, s, a0, a1);
   input s, a0, a1;
   output y;

   assign y = s ? a1 : a0;

endmodule // mux2x1_dataflow2
