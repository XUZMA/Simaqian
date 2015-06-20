`include "d_latch.v"

module d_flipflop(q, q_bar, clock, d);
   input clock, d;
   output q, q_bar;

   wire   q0, q_bar0;

   d_latch dl_pre(q0, q_bar0, ~clock, d);
   d_latch dl_post(q, q_bar, clock, q0);
   
endmodule // d_flipflop
