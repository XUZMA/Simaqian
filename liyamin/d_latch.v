`include "rs_latch.v"

module d_latch(q, q_bar, clock, d);
   input clock, d;
   output q, q_bar;

   wire   d_not, reset, set;

   not not_1(d_not, d);
   nand nand_s(set, clock, d);
   nand nand_r(reset, clock, d_not);

   rs_latch rsl_1(q, q_bar, reset, set);
   
endmodule // d_latch
