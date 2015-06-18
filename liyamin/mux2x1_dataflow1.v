module mux2x1_dataflow1(y, s, a0, a1);
   input s, a0, a1;
   output y;

   assign y = a0 & ~s | a1 & s;

endmodule // mux2x1_dataflow1
