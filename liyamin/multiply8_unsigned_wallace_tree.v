`include "fulladder_structural.v"
// fulladder_structural(sum, carry_out, a, b, carry_in);

module multiply8_unsigned_wallace_tree(product, multiplicand_a, multiplier_b);
   input [7:0] multiplicand_a, multiplier_b;
   output [15:0] product;

   reg [7:0] 	 a_b[7:0];
   integer i, j;
   
    // bit-and
   always @ *
     begin
	for(i = 0; i < 8; i = i + 1)
	  for(j = 0; j < 8; j = j + 1)
	     a_b[i][j] <= multiplicand_a[i] & multiplier_b[j];
     end
   
     wire bit_zero = 1'b0;

      // level-1 fulladders
	wire [2:0] s1[12:1]; // sum_level_1
	wire [2:0] c1[13:2]; // carry_level_1
	// index 14: a_b[7][7]
	// index 13: a_b[6][7], a_b[7][6]
	// index 12: a_b[5][7], a_b[6][6], a_b[7][5]
	// index 11: a_b[4][7], a_b[5][6], a_b[6][5], a_b[7][4]
	// index 10: a_b[3][7], a_b[4][6], a_b[5][5], a_b[6][4], a_b[7][3]
	// index 09: a_b[2][7], a_b[3][6], a_b[4][5], a_b[5][4], a_b[6][3], a_b[7][2]
	// index 08: a_b[1][7], a_b[2][6], a_b[3][5], a_b[4][4], a_b[5][3], a_b[6][2], a_b[7][1]
	// index 07: a_b[0][7], a_b[1][6], a_b[2][5], a_b[3][4], a_b[4][3], a_b[5][2], a_b[6][1], a_b[7][0]
	// index 06:                  a_b[0][6], a_b[1][5], a_b[2][4], a_b[3][3], a_b[4][2], a_b[5][1], a_b[6][0]
	// index 05:                                   a_b[0][5], a_b[1][4], a_b[2][3], a_b[3][2], a_b[4][1], a_b[5][0]
	// index 04:                                                    a_b[0][4], a_b[1][3], a_b[2][2], a_b[3][1], a_b[4][0]
	// index 03:                                                                     a_b[0][3], a_b[1][2], a_b[2][1], a_b[3][0]
	// index 02:                                                                                      a_b[0][2], a_b[1][1], a_b[2][0]
	// index 01:                                                                                                       a_b[0][1], a_b[1][0]
	// index 00:                                                                                                                        a_b[0][0]

	// index 14: ><a_b[7][7]
	// index 13: ><a_b[6][7], a_b[7][6]
	// index 12: a_b[5][7], a_b[6][6], a_b[7][5]><
	fulladder_structural fas1_12_0(s1[12][0], c1[13][0], a_b[5][7], a_b[6][6], a_b[7][5]); 
	// index 11: a_b[4][7], a_b[5][6], a_b[6][5], >< a_b[7][4]
	fulladder_structural fas1_11_0(s1[11][0], c1[12][0], a_b[4][7], a_b[5][6], a_b[6][5]);
	// index 10: a_b[3][7], a_b[4][6], a_b[5][5], a_b[6][4], a_b[7][3]><
	fulladder_structural fas1_10_0(s1[10][0], c1[11][0], a_b[3][7], a_b[4][6], a_b[5][5]);
	fulladder_structural fas1_10_1(s1[10][1], c1[11][1], a_b[6][4], a_b[7][3], bit_zero);
	// index 09: a_b[2][7], a_b[3][6], a_b[4][5], a_b[5][4], a_b[6][3], a_b[7][2]><
	fulladder_structural fas1_09_0(s1[9][0], c1[10][0], a_b[2][7], a_b[3][6], a_b[4][5]);
	fulladder_structural fas1_09_1(s1[9][1], c1[10][1], a_b[5][4], a_b[6][3], a_b[7][2]);
	// index 08: a_b[1][7], a_b[2][6], a_b[3][5], a_b[4][4], a_b[5][3], a_b[6][2], ><a_b[7][1]
	fulladder_structural fas1_08_0(s1[8][0], c1[9][0], a_b[1][7], a_b[2][6], a_b[3][5]);
	fulladder_structural fas1_08_1(s1[8][1], c1[9][1], a_b[4][4], a_b[5][3], a_b[6][2]);
	// index 07: a_b[0][7], a_b[1][6], a_b[2][5], a_b[3][4], a_b[4][3], a_b[5][2], a_b[6][1], a_b[7][0]><
	fulladder_structural fas1_07_0(s1[7][0], c1[8][0], a_b[0][7], a_b[1][6], a_b[2][5]);
	fulladder_structural fas1_07_1(s1[7][1], c1[8][1], a_b[3][4], a_b[4][3], a_b[5][2]);
	fulladder_structural fas1_07_2(s1[7][2], c1[8][2], a_b[6][1], a_b[7][0], bit_zero);
	// index 06: a_b[0][6], a_b[1][5], a_b[2][4], a_b[3][3], a_b[4][2], a_b[5][1], ><a_b[6][0]
	fulladder_structural fas1_06_0(s1[6][0], c1[7][0], a_b[0][6], a_b[1][5], a_b[2][4]);
	fulladder_structural fas1_06_1(s1[6][1], c1[7][1], a_b[3][3], a_b[4][2], a_b[5][1]);
	// index 05: a_b[0][5], a_b[1][4], a_b[2][3], a_b[3][2], a_b[4][1], a_b[5][0]><
	fulladder_structural fas1_05_0(s1[5][0], c1[6][0], a_b[0][5], a_b[1][4], a_b[2][3]);
	fulladder_structural fas1_05_1(s1[5][1], c1[6][1], a_b[3][2], a_b[4][1], a_b[5][0]);
	// index 04: a_b[0][4], a_b[1][3], a_b[2][2], a_b[3][1], a_b[4][0]><
	fulladder_structural fas1_04_0(s1[4][0], c1[5][0], a_b[0][4], a_b[1][3], a_b[2][2]);
	fulladder_structural fas1_04_1(s1[4][1], c1[5][1], a_b[3][1], a_b[4][0], bit_zero);
	// index 03: a_b[0][3], a_b[1][2], a_b[2][1], ><a_b[3][0]
	fulladder_structural fas1_03_0(s1[3][0], c1[4][0], a_b[0][3], a_b[1][2], a_b[2][1]);
	// index 02: a_b[0][2], a_b[1][1], a_b[2][0]><
	fulladder_structural fas1_02_0(s1[2][0], c1[3][0], a_b[0][2], a_b[1][1], a_b[2][0]);
	// index 01: a_b[0][1], a_b[1][0]><
	fulladder_structural fas1_01_0(s1[1][0], c1[2][0], a_b[0][1], a_b[1][0], bit_zero);
	// index 00: a_b[0][0]><
	assign product[0] = a_b[0][0];

	// level-2 fulladders
        wire [1:0]    s2[13:2];
	wire [1:0]    c2[14:3];
      	// index 14: a_b[7][7]
	// index 13: a_b[6][7], a_b[7][6], c1[13][0]
	// index 12: c1[12][0], s1[12][0]
	// index 11: a_b[7][4], c1[11][0], c1[11][1], s1[11][0]
	// index 10: c1[10][0], c1[10][1], s1[10][0], s1[10][1]
	// index 09: c1[9][0], c1[9][1], s1[9][0], s1[9][1]
	// index 08: a_b[7][1], c1[8][0], c1[8][1], c1[8][2], s1[8][0], s1[8][1]
	// index 07: c1[7][0], c1[7][1], s1[7][0], s1[7][1], s1[7][2]
	// index 06: a_b[6][0], c1[6][0], c1[6][1], s1[6][0], s1[6][1]
	// index 05: c1[5][0], c1[5][1], s1[5][0], s1[5][1]
	// index 04: c1[4][0], s1[4][0], s1[4][1]
	// index 03: a_b[3][0], c1[3][0], s1[3][0]
	// index 02: c1[2][0], s1[2][0]
	// index 01: s1[1][0]
	// index 00: 

	// index 14: ><a_b[7][7]
	// index 13: a_b[6][7], a_b[7][6], c1[13][0]><
	fulladder_structural fas2_13_0(s2[13][0], c2[14][0], a_b[6][7], a_b[7][6], c1[13][0]);
	// index 12: c1[12][0], s1[12][0]><
	fulladder_structural fas2_12_0(s2[12][0], c2[13][0], c1[12][0], s1[12][0], bit_zero);
	// index 11: a_b[7][4], c1[11][0], c1[11][1], ><s1[11][0]
	fulladder_structural fas2_11_0(s2[11][0], c2[12][0], a_b[7][4], c1[11][0], c1[11][1]);
	// index 10: c1[10][0], c1[10][1], s1[10][0], ><s1[10][1]
	fulladder_structural fas2_10_0(s2[10][0], c2[11][0], c1[10][0], c1[10][1], s1[10][0]);
	// index 09: c1[9][0], c1[9][1], s1[9][0], ><s1[9][1]
	fulladder_structural fas2_09_0(s2[9][0], c2[10][0], c1[9][0], c1[9][1], s1[9][0]);
	// index 08: a_b[7][1], c1[8][0], c1[8][1], c1[8][2], s1[8][0], s1[8][1]><
	fulladder_structural fas2_08_0(s2[8][0], c2[9][0], a_b[7][1], c1[8][0], c1[8][1]);
	fulladder_structural fas2_08_1(s2[8][1], c2[9][1], c1[8][2], s1[8][0], s1[8][1]);
	// index 07: c1[7][0], c1[7][1], s1[7][0], s1[7][1], s1[7][2]><
	fulladder_structural fas2_07_0(s2[7][0], c2[8][0], c1[7][0], c1[7][1], s1[7][0]);
	fulladder_structural fas2_07_1(s2[7][1], c2[8][1], s1[7][1], s1[7][2], bit_zero);
	// index 06: a_b[6][0], c1[6][0], c1[6][1], s1[6][0], s1[6][1]><
	fulladder_structural fas2_06_0(s2[6][0], c2[7][0], a_b[6][0], c1[6][0], c1[6][1]);
	fulladder_structural fas2_06_1(s2[6][1], c2[7][1], s1[6][0], s1[6][1], bit_zero);
	// index 05: c1[5][0], c1[5][1], s1[5][0], ><s1[5][1]
	fulladder_structural fas2_05_0(s2[5][0], c2[6][0], c1[5][0], c1[5][1], s1[5][0]);
	// index 04: c1[4][0], s1[4][0], s1[4][1]><
	fulladder_structural fas2_04_0(s2[4][0], c2[5][0], c1[4][0], s1[4][0], s1[4][1]);
	// index 03: a_b[3][0], c1[3][0], s1[3][0]><
	fulladder_structural fas2_03_0(s2[3][0], c2[4][0], a_b[3][0], c1[3][0], s1[3][0]);
	// index 02: c1[2][0], s1[2][0]><
	fulladder_structural fas2_02_0(s2[2][0], c2[3][0], c1[2][0], s1[2][0], bit_zero);
	// index 01: s1[1][0]><
	assign product[1] = s1[1][0];
	// index 00: 

	// level-3 fulladders
	wire [11:3]       s3;
	wire [12:4]       c3;

	// index 14: a_b[7][7], c2[14][0]
	// index 13: s2[13][0], c2[13][0]
	// index 12: s2[12][0], c2[12][0]
	// index 11: s1[11][0], s2[11][0], c2[11][0]
	// index 10: s1[10][1], s2[10][0], c2[10][0]
	// index 09: s1[9][1], s2[9][0], c2[9][0], c2[9][1]
	// index 08: s2[8][0], s2[8][1], c2[8][0], c2[8][1]
	// index 07: s2[7][0], s2[7][1], c2[7][0], c2[7][1]
	// index 06: s2[6][0], s2[6][1], c2[6][0]
	// index 05: s1[5][1], s2[5][0], c2[5][0]
	// index 04: s2[4][0], c2[4][0]
	// index 03: s2[3][0], c2[3][0]
	// index 02: s2[2][0]
	// index 01: 
	// index 00: 

	// index 14: ><a_b[7][7], c2[14][0]
	// index 13: ><s2[13][0], c2[13][0]
	// index 12: ><s2[12][0], c2[12][0]
	// index 11: s1[11][0], s2[11][0], c2[11][0]><
	fulladder_structural fas3_11_0(s3[11], c3[12], s1[11][0], s2[11][0], c2[11][0]);
	// index 10: s1[10][1], s2[10][0], c2[10][0]><
	fulladder_structural fas3_10_0(s3[10], c3[11], s1[10][1], s2[10][0], c2[10][0]);
	// index 09: s1[9][1], s2[9][0], c2[9][0], ><c2[9][1]
	fulladder_structural fas3_09_0(s3[9], c3[10], s1[9][1], s2[9][0], c2[9][0]);
	// index 08: s2[8][0], s2[8][1], c2[8][0], ><c2[8][1]
	fulladder_structural fas3_08_0(s3[8], c3[9], s2[8][0], s2[8][1], c2[8][0]);
	// index 07: s2[7][0], s2[7][1], c2[7][0], ><c2[7][1]
	fulladder_structural fas3_07_0(s3[7], c3[8], s2[7][0], s2[7][1], c2[7][0]);
	// index 06: s2[6][0], s2[6][1], c2[6][0]><
	fulladder_structural fas3_06_0(s3[6], c3[7], s2[6][0], s2[6][1], c2[6][0]);
	// index 05: s1[5][1], s2[5][0], c2[5][0]><
	fulladder_structural fas3_05_0(s3[5], c3[6], s1[5][1], s2[5][0], c2[5][0]);
	// index 04: s2[4][0], c2[4][0]><
	fulladder_structural fas3_04_0(s3[4], c3[5], s2[4][0], c2[4][0], bit_zero);
	// index 03: s2[3][0], c2[3][0]><
	fulladder_structural fas3_03_0(s3[3], c3[4], s2[3][0], c2[3][0], bit_zero);
	// index 02: s2[2][0]><
	assign product[2] = s2[2][0];
	// index 01: 
	// index 00: 

	// level-4 fulladders
	wire [14:4] 	  s4;
	wire [15:5] 	  c4;

	// index 14: a_b[7][7], c2[14][0]
	// index 13: s2[13][0], c2[13][0]
	// index 12: s2[12][0], c2[12][0], c3[12]
	// index 11:  c3[11], s3[11]
	// index 10:  c3[10], s3[10]
	// index 09: c2[9][1], c3[9], s3[9]
	// index 08: c2[8][1], c3[8], s3[8]
	// index 07: c2[7][1], c3[7], s3[7]
	// index 06: c3[6], s3[6]
	// index 05: c3[5], s3[5]
	// index 04: c3[4], s3[4] 
	// index 03: s3[3]
	// index 02: 
	// index 01: 
	// index 00: 

	// index 14: a_b[7][7], c2[14][0]><
	fulladder_structural fas4_14_0(s4[14], c4[15], a_b[7][7], c2[14][0], bit_zero);
	// index 13: s2[13][0], c2[13][0]><
	fulladder_structural fas4_13_0(s4[13], c4[14], s2[13][0], c2[13][0], bit_zero);
	// index 12: s2[12][0], c2[12][0], c3[12]><
	fulladder_structural fas4_12_0(s4[12], c4[13], s2[12][0], c2[12][0], c3[12]);
	// index 11:  c3[11], s3[11]><
	fulladder_structural fas4_11_0(s4[11], c4[12], c3[11], s3[11], bit_zero);
	// index 10:  c3[10], s3[10]><
	fulladder_structural fas4_10_0(s4[10], c4[11], c3[10], s3[10], bit_zero);
	// index 09: c2[9][1], c3[9], s3[9]><
	fulladder_structural fas4_09_0(s4[9], c4[10], c2[9][1], c3[9], s3[9]);
	// index 08: c2[8][1], c3[8], s3[8]><
	fulladder_structural fas4_08_0(s4[8], c4[9], c2[8][1], c3[8], s3[8]);
	// index 07: c2[7][1], c3[7], s3[7]><
	fulladder_structural fas4_07_0(s4[7], c4[8], c2[7][1], c3[7], s3[7]);
	// index 06: c3[6], s3[6]><
	fulladder_structural fas4_06_0(s4[6], c4[7], c3[6], s3[6], bit_zero);
	// index 05: c3[5], s3[5]><
	fulladder_structural fas4_05_0(s4[5], c4[6], c3[5], s3[5], bit_zero);
	// index 04: c3[4], s3[4]><
	fulladder_structural fas4_04_0(s4[4], c4[5], c3[4], s3[4] , bit_zero);
	// index 03: s3[3]><
	assign product[3] = s3[3];
	// index 02: 
	// index 01: 
	// index 00:

	// result
	// index 15:             c4[15]
	// index 14: s4[14], c4[14]
	// index 13: s4[13], c4[13]
	// index 12: s4[12], c4[12]
	// index 11: s4[11], c4[11]
	// index 10: s4[10], c4[10]
	// index 09: s4[9],   c4[9]
	// index 08: s4[8],   c4[8]
	// index 07: s4[7],   c4[7]
	// index 06: s4[6],   c4[6]
	// index 05: s4[5],   c4[5]
	// index 04: s4[4]
	// index 03: 
	// index 02: 
	// index 01: 
	// index 00:

	assign product[15:4] = {1'b0, s4[14:4]} + {c4[15:5], 1'b0};
endmodule // multiply8_unsigned_wallace_tree
