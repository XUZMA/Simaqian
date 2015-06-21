module fulladder_behavioral(sum, carry_out, a, b, carry_in);

   input a, b, carry_in;
   output sum, carry_out;

   assign {carry_out, sum} = a + b + carry_in;

endmodule // fulladder_behavioral
