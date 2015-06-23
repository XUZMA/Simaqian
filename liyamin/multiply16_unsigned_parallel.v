module multiply_line_parallel_1(product, multiplicand, multiplier);
   input [31:0] multiplicand, multiplier;
   output [31:0] product;

   assign product = multiplier[0] ? multiplicand : 32'b0;
endmodule // multiply_line_parallel_1

module multiply_line_parallel_2(product, multiplicand, multiplier);
   input [31:0] multiplicand, multiplier;
   output [31:0] product;

   wire [31:0] 	 multiplicand_shift_left, multiplier_shift_right;
   wire [31:0] 	 partial_product_0, partial_product_1;
   
   assign multiplicand_shift_left = multiplicand << 1;
   assign multiplier_shift_right = multiplier>> 1;
   
   multiply_line_parallel_1 mlp_0(partial_product_0, multiplicand, multiplier);
   multiply_line_parallel_1 mlp_1(partial_product_1, multiplicand_shift_left, multiplier_shift_right);

   assign product = partial_product_0 + partial_product_1;
endmodule // multiply_line_parallel_2

module multiply_line_parallel_4(product, multiplicand, multiplier);
   input [31:0] multiplicand, multiplier;
   output [31:0] product;

   wire [31:0] 	 multiplicand_shift_left, multiplier_shift_right;
   wire [31:0] 	 partial_product_0, partial_product_1;
   
   assign multiplicand_shift_left = multiplicand << 2;
   assign multiplier_shift_right = multiplier>> 2;
   
   multiply_line_parallel_2 mlp_0(partial_product_0, multiplicand, multiplier);
   multiply_line_parallel_2 mlp_1(partial_product_1, multiplicand_shift_left, multiplier_shift_right);

   assign product = partial_product_0 + partial_product_1;
endmodule // multiply_line_parallel_4

module multiply_line_parallel_8(product, multiplicand, multiplier);
   input [31:0] multiplicand, multiplier;
   output [31:0] product;

   wire [31:0] 	 multiplicand_shift_left, multiplier_shift_right;
   wire [31:0] 	 partial_product_0, partial_product_1;
   
   assign multiplicand_shift_left = multiplicand << 4;
   assign multiplier_shift_right = multiplier>> 4;
   
   multiply_line_parallel_4 mlp_0(partial_product_0, multiplicand, multiplier);
   multiply_line_parallel_4 mlp_1(partial_product_1, multiplicand_shift_left, multiplier_shift_right);

   assign product = partial_product_0 + partial_product_1;
endmodule // multiply_line_parallel_8

module multiply_line_parallel_16(product, multiplicand, multiplier);
   input [31:0] multiplicand, multiplier;
   output [31:0] product;

   wire [31:0] 	 multiplicand_shift_left, multiplier_shift_right;
   wire [31:0] 	 partial_product_0, partial_product_1;
   
   assign multiplicand_shift_left = multiplicand << 8;
   assign multiplier_shift_right = multiplier>> 8;
   
   multiply_line_parallel_8 mlp_0(partial_product_0, multiplicand, multiplier);
   multiply_line_parallel_8 mlp_1(partial_product_1, multiplicand_shift_left, multiplier_shift_right);

   assign product = partial_product_0 + partial_product_1;
endmodule // multiply_line_parallel_16

module multiply_line_parallel_32(product, multiplicand, multiplier);
   input [31:0] multiplicand, multiplier;
   output [31:0] product;

   wire [31:0] 	 multiplicand_shift_left, multiplier_shift_right;
   wire [31:0] 	 partial_product_0, partial_product_1;
   
   assign multiplicand_shift_left = multiplicand << 16;
   assign multiplier_shift_right = multiplier>> 16;
   
   multiply_line_parallel_16 mlp_0(partial_product_0, multiplicand, multiplier);
   multiply_line_parallel_16 mlp_1(partial_product_1, multiplicand_shift_left, multiplier_shift_right);

   assign product = partial_product_0 + partial_product_1;
endmodule // multiply_line_parallel_32

module multiply16_unsigned_parallel(product, multiplicand, multiplier);
   input [31:0] multiplicand, multiplier;
   output [31:0] product;

   wire [31:0]	 multiplicand_lsb16, multiplier_lsb16;
   
   assign multiplicand_lsb16 = multiplicand & 32'h0000_FFFF;
   assign multiplier_lsb16 = multiplier & 32'h0000_FFFF;
     
   multiply_line_parallel_32 ml32_0(product, multiplicand_lsb16, multiplier_lsb16);
endmodule // multiply16_unsigned_parallel
