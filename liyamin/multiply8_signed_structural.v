module multiply8_signed_structural(product, multiplicand_a, multiplier_b);
   input [7:0] multiplicand_a, multiplier_b;
   output [15:0] product;

   reg [7:0] 	 b_a[7:0]; // b_a[i][j] - multiplier_b[j] & multiplicand_a[i]
   integer i, j;
   
   always @ *
     begin
	for(i = 0; i < 7; i = i + 1)
	  for(j=0; j < 7; j = j + 1)
	    b_a[j][i] = multiplier_b[j] & multiplicand_a[i];

	for(i = 0; i < 7; i = i + 1)
	  b_a[7][i] = ~(multiplier_b[7] & multiplicand_a[i]);

	for(j = 0; j < 7; j = j + 1)
	  b_a[j][7] = ~(multiplier_b[j] & multiplicand_a[7]);

	b_a[7][7] = multiplier_b[7] & multiplicand_a[7];
     end

   assign product =
		 (({1'b1, 6'b0, 1'b1, b_a[0][7], b_a[0][6:0]         }   +
		   {         7'b0,          b_a[1][7], b_a[1][6:0], 1'b0})  +
		  ({         6'b0,          b_a[2][7], b_a[2][6:0], 2'b0}   +
		   {         5'b0,          b_a[3][7], b_a[3][6:0], 3'b0})) +
		 (({         4'b0,          b_a[4][7], b_a[4][6:0], 4'b0}    +
		   {         3'b0,          b_a[5][7], b_a[5][6:0], 5'b0})   +
		  ({         2'b0,          b_a[6][7], b_a[6][6:0], 6'b0}    +
		   {1'b0,                   b_a[7][7], b_a[7][6:0], 7'b0}));
        
endmodule // multiply8_signed_structural
