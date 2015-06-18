module mux2x32(y, s, a0, a1);
   input [31:0] a0, a1;
   input 	s;
   output [31:0] y;

   assign y = s ? a1 : a0;

endmodule // mux2x32
