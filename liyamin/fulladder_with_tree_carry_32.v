module adder_with_gp_1(sum, generate_carry, pass_carry, a, b, carry_in);
   input a, b, carry_in;
   output sum, generate_carry, pass_carry;

   assign sum = a ^ b ^ carry_in;
   assign generate_carry = a & b;
   assign pass_carry = a | b;
endmodule // adder_with_gp_1

module connector_gp_carry(g_carry_out, p_carry_out, carry_middle,  g_carry_in, p_carry_in, carry_in);
   input [1:0] g_carry_in, p_carry_in; // g_, generate_; p_, pass_.
   input       carry_in;
   output      g_carry_out, p_carry_out;
   output      carry_middle;

   assign g_carry_out = g_carry_in[1] | g_carry_in[0] & p_carry_in[1];
   assign p_carry_out = p_carry_in[1] & p_carry_in[0]; // double the span of passing carry
   assign carry_middle = g_carry_in[0] | p_carry_in[0] & carry_in;
   
endmodule // connector_gp_carry

module adder_with_gp_2(sum, generate_carry, pass_carry, a, b, carry_in);
   input [1:0] a, b;
   input carry_in;
   output [1:0] sum;
   output generate_carry, pass_carry;

   wire [1:0] g_carry_middle, p_carry_middle;
   wire       carry_middle;
   
   adder_with_gp_1 agp1_0(sum[0], g_carry_middle[0], p_carry_middle[0], a[0], b[0], carry_in);
   adder_with_gp_1 agp1_1(sum[1], g_carry_middle[1], p_carry_middle[1], a[1], b[1], carry_middle);
   connector_gp_carry connector1(generate_carry, pass_carry, carry_middle,  g_carry_middle, p_carry_middle, carry_in);
endmodule // adder_with_gp_2

module adder_with_gp_4(sum, generate_carry, pass_carry, a, b, carry_in);
   input [3:0] a, b;
   input carry_in;
   output [3:0] sum;
   output generate_carry, pass_carry;

   wire [1:0] g_carry_middle, p_carry_middle;
   wire       carry_middle;
   
   adder_with_gp_2 agp2_0(sum[1:0], g_carry_middle[0], p_carry_middle[0], a[1:0], b[1:0], carry_in);
   adder_with_gp_2 agp2_1(sum[3:2], g_carry_middle[1], p_carry_middle[1], a[3:2], b[3:2], carry_middle);
   connector_gp_carry connector1(generate_carry, pass_carry, carry_middle,  g_carry_middle, p_carry_middle, carry_in);
endmodule // adder_with_gp_4

module adder_with_gp_8(sum, generate_carry, pass_carry, a, b, carry_in);
   input [7:0] a, b;
   input carry_in;
   output [7:0] sum;
   output generate_carry, pass_carry;

   wire [1:0] g_carry_middle, p_carry_middle;
   wire       carry_middle;
   
   adder_with_gp_4 agp4_0(sum[3:0], g_carry_middle[0], p_carry_middle[0], a[3:0], b[3:0], carry_in);
   adder_with_gp_4 agp4_1(sum[7:4], g_carry_middle[1], p_carry_middle[1], a[7:4], b[7:4], carry_middle);
   connector_gp_carry connector1(generate_carry, pass_carry, carry_middle,  g_carry_middle, p_carry_middle, carry_in);
endmodule // adder_with_gp_8

module adder_with_gp_16(sum, generate_carry, pass_carry, a, b, carry_in);
   input [15:0] a, b;
   input carry_in;
   output [15:0] sum;
   output generate_carry, pass_carry;

   wire [1:0] g_carry_middle, p_carry_middle;
   wire       carry_middle;
   
   adder_with_gp_8 agp8_0(sum[7:0], g_carry_middle[0], p_carry_middle[0], a[7:0], b[7:0], carry_in);
   adder_with_gp_8 agp8_1(sum[15:8], g_carry_middle[1], p_carry_middle[1], a[15:8], b[15:8], carry_middle);
   connector_gp_carry connector1(generate_carry, pass_carry, carry_middle,  g_carry_middle, p_carry_middle, carry_in);
endmodule // adder_with_gp_16

module adder_with_gp_32(sum, generate_carry, pass_carry, a, b, carry_in);
   input [31:0] a, b;
   input carry_in;
   output [31:0] sum;
   output generate_carry, pass_carry;

   wire [1:0] g_carry_middle, p_carry_middle;
   wire       carry_middle;
   
   adder_with_gp_16 agp16_0(sum[15:0], g_carry_middle[0], p_carry_middle[0], a[15:0], b[15:0], carry_in);
   adder_with_gp_16 agp16_1(sum[31:16], g_carry_middle[1], p_carry_middle[1], a[31:16], b[31:16], carry_middle);
   connector_gp_carry connector1(generate_carry, pass_carry, carry_middle,  g_carry_middle, p_carry_middle, carry_in);
endmodule // adder_with_gp_32

module fulladder_with_tree_carry_32(sum, carry_out, a, b, carry_in);
   input [31:0] a, b;
   input carry_in;
   output [31:0] sum;
   output 	 carry_out;

   wire generate_carry, pass_carry;

   adder_with_gp_32 agp32_0(sum, generate_carry, pass_carry, a, b, carry_in);
   assign carry_out = generate_carry | pass_carry & carry_in;
   
endmodule // fulladder_with_tree_carry_32
