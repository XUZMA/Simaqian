module multiply8_signed(product, multiplicand_a, multiplier_b);
   input [7:0] multiplicand_a, multiplier_b;
   output [15:0] product;

   wire [7:0] 	 b0_a = multiplier_b[0] ? multiplicand_a : 8'b0;
   wire [7:0] 	 b1_a = multiplier_b[1] ? multiplicand_a : 8'b0;
   wire [7:0] 	 b2_a = multiplier_b[2] ? multiplicand_a : 8'b0;
   wire [7:0] 	 b3_a = multiplier_b[3] ? multiplicand_a : 8'b0;
   wire [7:0] 	 b4_a = multiplier_b[4] ? multiplicand_a : 8'b0;
   wire [7:0] 	 b5_a = multiplier_b[5] ? multiplicand_a : 8'b0;
   wire [7:0] 	 b6_a = multiplier_b[6] ? multiplicand_a : 8'b0;
   wire [7:0] 	 b7_a = multiplier_b[7] ? multiplicand_a : 8'b0;

   assign product =
		 (({1'b1, 6'b0, 1'b1, ~b0_a[7], b0_a[6:0]         }   +
		   {         7'b0,          ~b1_a[7], b1_a[6:0], 1'b0})  +
		  ({         6'b0,          ~b2_a[7], b2_a[6:0], 2'b0}   +
		   {         5'b0,          ~b3_a[7], b3_a[6:0], 3'b0})) +
		 (({         4'b0,          ~b4_a[7], b4_a[6:0], 4'b0}    +
		   {         3'b0,          ~b5_a[7], b5_a[6:0], 5'b0})   +
		  ({         2'b0,          ~b6_a[7], b6_a[6:0], 6'b0}    +
		   {1'b0, b7_a[7],     ~b7_a[6:0],               7'b0}));
        
endmodule // multiply8_signed
