`include "cmoscmos.v"
`include "cmosnot.v"

module mux2x1_cmos(y, s, a0, a1);
   input s, a0, a1;
   output y;
   wire   not_s;

   cmosnot nots(not_s, s);

   // cmoscmos name (drain, source, n_gate, p_gate);
   cmoscmos c0(y, a0, not_s,s);
   // cmos c0(y, a0, nots,s);
   cmoscmos c1(y, a1, s, not_s);
   // cmos c1(y, a1, s, nots);

endmodule // mux2x1_cmos
