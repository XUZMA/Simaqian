module fulladder_structural(sum, carry_out, a, b, carry_in);

   input a, b, carry_in;
   output sum, carry_out;

   wire   and_ab, and_bc, and_ca;

   xor xor1(sum, a, b, carry_in);

   and and1(and_ab, a, b);
   and and2(and_bc, b, carry_in);
   and and3(and_ca, carry_in, a);
   or or1(carry_out, and_ab, and_bc, and_ca);
   
endmodule // fulladder_structural
