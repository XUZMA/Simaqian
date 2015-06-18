module mux2x1_3s(y, s, a0, a1);
   input s, a0, a1;
   output y;

   // bufif0 name(data, input, strob);
   bufif0 b0(y, a0, s);
   // bufif1 name(data, input, strob);
   bufif1 b1(y, a1, s);

endmodule // mux2x1_3s
