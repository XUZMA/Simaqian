module rs_latch(q, q_bar, reset, set);
   input reset, set;
   output q, q_bar;

   nand(q_bar, reset, q);
   nand(q, set, q_bar);
   
endmodule // rs_latch
