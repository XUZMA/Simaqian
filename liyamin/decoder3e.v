module decoder3e(n,ena,e);
   input [2:0] n;
   input       ena;
   output [7:0] e;
   reg [7:0]   e;
   
   always @ (ena or n)
     begin
	e = 8'b0;
	e[n] = ena;
     end
   
endmodule // decoder3e
