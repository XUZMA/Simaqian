`include "mux2x32.v"

module shift_mux(sh, data, shift_amount, right, arithmetic);
   input [31:0] data; // 32-bit data to be shifted
   input [4:0] 	shift_amount; // shift amount(0~31 bits)
   input 	right; // 1: shift right; 0: shift left
   input 	arithmetic;// 1: arithmetic; 0: logical
   output [31:0] sh;// shift result

   parameter zeroes = 16'b0;
   
   wire 	 sign_bit = data[31] & arithmetic;
   wire [15:0] 	 sign_extension = {16{sign_bit}};

   wire [31:0] 	 sdl4, sdr4, right_left_4, result_4;
   wire [31:0] 	 sdl3, sdr3, right_left_3, result_3;
   wire [31:0] 	 sdl2, sdr2, right_left_2, result_2;
   wire [31:0] 	 sdl1, sdr1, right_left_1, result_1;
   wire [31:0] 	 sdl0, sdr0, right_left_0;   
   
   // shift_amount[4]
   assign sdl4 = {data[15:0],zeroes};// shift left 16-bit
   assign sdr4 = {sign_extension,data[31:16]};//shift right 16-bit
   mux2x32 mux_right_left_4(right_left_4, right, sdl4, sdr4);// left or right
   mux2x32 mux_result_4(result_4, shift_amount[4], data, right_left_4); // shift or not
   
   // shift_amount[3]
   assign sdl3 = {result_4[23:0],zeroes[7:0]};// shift left 8-bit
   assign sdr3 = {sign_extension[7:0],result_4[31:8]};//shift right 8-bit
   mux2x32 mux_right_left_3(right_left_3, right, sdl3, sdr3);// left or right
   mux2x32 mux_result_3(result_3, shift_amount[3], result_4, right_left_3); // shift or not

   // shift_amount[2]   
   assign sdl2 = {result_3[27:0],zeroes[3:0]};// shift left 4-bit
   assign sdr2 = {sign_extension[3:0],result_3[31:4]};//shift right 4-bit
   mux2x32 mux_right_left_2(right_left_2, right, sdl2, sdr2);// left or right
   mux2x32 mux_result_2(result_2, shift_amount[2], result_3, right_left_2); // shift or not
   
   // shift_amount[1]
   assign sdl1 = {result_2[29:0],zeroes[1:0]};// shift left 2-bit
   assign sdr1 = {sign_extension[1:0],result_2[31:2]};//shift right 2-bit
   mux2x32 mux_right_left_1(right_left_1, right, sdl1, sdr1);// left or right
   mux2x32 mux_result_1(result_1, shift_amount[1], result_2, right_left_1); // shift or not
   
   // shift_amount[0]
   assign sdl0 = {result_1[30:0],zeroes[0]};// shift left 1-bit
   assign sdr0 = {sign_extension[0],result_1[31:1]};//shift right 1-bit
   mux2x32 mux_right_left_0(right_left_0, right, sdl0, sdr0);// left or right
   mux2x32 mux_result_0(sh, shift_amount[0], result_1, right_left_0); // shift or not

endmodule // shift_mux
