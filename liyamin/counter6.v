module counter6(a, b, c, d, e, f, g, q, clock, reset, button);
   input clock, reset;
   input button;// button = 1, increase counter6; button = 1, decrease counter6.
   output a, b, c, d , e, f, g;
   output [2:0] q;

   reg [2:0] 	q;
   
   always @ (posedge clock or negedge reset)
     begin
	if(reset == 0)
	  q <= 0;
	else
	  if(button == 1)
	    q <= (q + 1) % 6;
	  else
	    if(q == 0)
	      q <= 5;
	    else
	      q <= (q - 1) % 6;
     end

   assign {a, b, c, d, e, f, g}  = seg7(q);
   
   function [6:0] seg7;// 1, light off; 0, light on.
      input [2:0] qq;
      case(qq)
	3'd0: seg7 = 7'b000001;
	3'd1: seg7 = 7'b1001111;
	3'd2: seg7 = 7'b0010010;
	3'd3: seg7 = 7'b0000110;
	3'd4: seg7 = 7'b1001100;
	3'd5: seg7 = 7'b0100100;
	default: seg7 = 7'b1111111; // light off
      endcase // case (qq)
   endfunction
   
endmodule // counter6
