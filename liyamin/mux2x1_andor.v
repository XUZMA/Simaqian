module mux2x1_andor(y, s, a0, a1);
   input s, a0, a1;
   output y;
   wire   not_s, a0_s, a1_s;

   not not_1(not_s, s);
   and and_0(a0_s, a0, not_s);
   and and_1(a1_s, a1, s);
   or or_1(y, a0_s, a1_s);

endmodule // mux2x1_andor
