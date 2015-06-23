module multiply_line_1(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_finished, multiplicand, multiplier);
   input [31:0] partial_product_finished, multiplicand, multiplier;
   output [31:0] partial_product, multiplicand_shift_left, multiplier_shift_right;

   wire [31:0] 	 addend;

   assign addend = multiplier[0] ? multiplicand : 32'b0;
   assign partial_product = partial_product_finished + addend;
   
   assign multiplicand_shift_left = multiplicand << 1;
   assign multiplier_shift_right = multiplier >> 1;
endmodule // multiply_line_1

module multiply_line_2(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_finished, multiplicand, multiplier);
   input [31:0] partial_product_finished, multiplicand, multiplier;
   output [31:0] partial_product, multiplicand_shift_left, multiplier_shift_right;

   wire [31:0] 	 partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle;
   multiply_line_1 ml_0(partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle,partial_product_finished, multiplicand, multiplier);
   multiply_line_1 ml_1(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle);
endmodule // multiply_line_2

module multiply_line_4(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_finished, multiplicand, multiplier);
   input [31:0] partial_product_finished, multiplicand, multiplier;
   output [31:0] partial_product, multiplicand_shift_left, multiplier_shift_right;

   wire [31:0] 	 partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle;
   multiply_line_2 ml_0(partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle,partial_product_finished, multiplicand, multiplier);
   multiply_line_2 ml_1(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle);
endmodule // multiply_line_4

module multiply_line_8(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_finished, multiplicand, multiplier);
   input [31:0] partial_product_finished, multiplicand, multiplier;
   output [31:0] partial_product, multiplicand_shift_left, multiplier_shift_right;

   wire [31:0] 	 partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle;
   multiply_line_4 ml_0(partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle,partial_product_finished, multiplicand, multiplier);
   multiply_line_4 ml_1(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle);
endmodule // multiply_line_8

module multiply_line_16(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_finished, multiplicand, multiplier);
   input [31:0] partial_product_finished, multiplicand, multiplier;
   output [31:0] partial_product, multiplicand_shift_left, multiplier_shift_right;

   wire [31:0] 	 partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle;
   multiply_line_8 ml_0(partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle,partial_product_finished, multiplicand, multiplier);
   multiply_line_8 ml_1(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle);
endmodule // multiply_line_16

module multiply_line_32(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_finished, multiplicand, multiplier);
   input [31:0] partial_product_finished, multiplicand, multiplier;
   output [31:0] partial_product, multiplicand_shift_left, multiplier_shift_right;

   wire [31:0] 	 partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle;

   multiply_line_16 ml_0(partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle,partial_product_finished, multiplicand, multiplier);
   multiply_line_16 ml_1(partial_product, multiplicand_shift_left, multiplier_shift_right, partial_product_middle, multiplicand_shift_left_middle, multiplier_shift_right_middle);
endmodule // multiply_line_32

module multiply16_unsigned(product, multiplicand, multiplier);
   input [31:0] multiplicand, multiplier;
   output [31:0] product;

   wire [31:0] multiplicand_shift_left, multiplier_shift_right;

   wire [31:0] 	 partial_product_finished;
   wire [31:0] 	 multiplicand_lsb16, multiplier_lsb16;
   
   assign partial_product_finished = 32'h0000_0000;
   assign multiplicand_lsb16 = multiplicand & 32'h0000_FFFF;
   assign multiplier_lsb16 = multiplier & 32'h0000_FFFF;
     
   multiply_line_32 ml32_0(product, multiplicand_shift_left, multiplier_shift_right, partial_product_finished, multiplicand_lsb16, multiplier_lsb16);

endmodule // multiply16_unsigned
