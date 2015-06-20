module shift(sh, data, shift_amount, right, arithmetic);
   input [31:0] data; // 32-bit data to be shifted
   input [4:0] 	shift_amount; // shift amount(0~31 bits)
   input 	right; // 1: shift right; 0: shift left
   input 	arithmetic;// 1: arithmetic; 0: logical
   output [31:0] sh;// shift result
   reg [31:0] 	 sh;

   always @ *
     begin
	if(right) // shift right
	  begin
	     if(arithmetic)
	       begin
		  sh = $signed(data) >>> shift_amount; // shift right arithmetic
	       end
	     else
	       begin
		  sh = data >> shift_amount; // shift right logical
	       end
	  end
	else
	  begin
	     sh = data << shift_amount; // shift left
	  end
     end

endmodule // shift
