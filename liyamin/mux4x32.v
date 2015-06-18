module mux4x32(y, s, a0, a1, a2, a3);
   input [31:0] a0, a1, a2, a3;
   input [1:0]	s;
   output [31:0] y;

   assign y = select(s, a0, a1, a2, a3);

   function [31:0] select;
      input [1:0]	ss;
      input [31:0] aa0, aa1, aa2, aa3;

      case(ss)
	2'b00: select = aa0;
	2'b01: select = aa1;
	2'b10: select = aa2;
	2'b11: select = aa3;
      endcase // case (ss)
      
   endfunction

endmodule // mux4x32
