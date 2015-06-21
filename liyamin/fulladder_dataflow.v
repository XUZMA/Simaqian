module fulladder_dataflow(sum, carry_out, a, b, carry_in);

   input a, b, carry_in;
   output sum, carry_out;

   assign sum = a ^ b ^ carry_in;
   assign carry_out = a & b | a & carry_in | b & carry_in;

endmodule // fulladder_dataflow
