/***
                   0	a=0000	b=0000	cin=1	subtract=0	result=0001	cout=0
 
                   1	a=0001	b=0001	cin=1	subtract=0	result=0011	cout=0
                   2	a=0011	b=0001	cin=1	subtract=0	result=0101	cout=0
                   3	a=0111	b=0001	cin=1	subtract=0	result=1001	cout=0
                   4	a=1111	b=0001	cin=1	subtract=0	result=0001	cout=1
 
                   5	a=0001	b=0001	cin=1	subtract=1	result=1111	cout=0
                   6	a=0011	b=0001	cin=1	subtract=1	result=0001	cout=1
                   7	a=0111	b=0001	cin=1	subtract=1	result=0101	cout=1
                   8	a=1111	b=0001	cin=1	subtract=1	result=1101	cout=1
 
                   9	a=0001	b=0001	cin=0	subtract=1	result=0000	cout=1
                  10	a=0011	b=0001	cin=0	subtract=1	result=0010	cout=1
                  11	a=0111	b=0001	cin=0	subtract=1	result=0110	cout=1
                  12	a=1111	b=0001	cin=0	subtract=1	result=1110	cout=1
 
                  13	a=0000	b=0001	cin=0	subtract=1	result=1111	cout=0
                  14	a=0000	b=0011	cin=0	subtract=1	result=1101	cout=0
                  15	a=0000	b=0111	cin=0	subtract=1	result=1001	cout=0
                  16	a=0000	b=1111	cin=0	subtract=1	result=0001	cout=0
 ***/

`include "addsub4_structural.v"

module  addsub4_structural_test;
   reg [3:0] a, b;
   reg carry_in;
   reg subtract;
   
   wire [3:0] result;
   wire carry_out;

   addsub4_structural ass1(result, carry_out, subtract, a, b, carry_in);

   initial
     begin
	a = 4'b0000; b = 4'b0000; carry_in = 1; subtract = 0;
	
	#1 a = 4'b0001; b = 4'b0001; carry_in = 1; subtract = 0;
	#1 a = 4'b0011; b = 4'b0001; carry_in = 1; subtract = 0;
	#1 a = 4'b0111; b = 4'b0001; carry_in = 1; subtract = 0;
	#1 a = 4'b1111; b = 4'b0001; carry_in = 1; subtract = 0;
	
	#1 a = 4'b0001; b = 4'b0001; carry_in = 1; subtract = 1;
	#1 a = 4'b0011; b = 4'b0001; carry_in = 1; subtract = 1;
	#1 a = 4'b0111; b = 4'b0001; carry_in = 1; subtract = 1;
	#1 a = 4'b1111; b = 4'b0001; carry_in = 1; subtract = 1;
	
	#1 a = 4'b0001; b = 4'b0001; carry_in = 0; subtract = 1;
	#1 a = 4'b0011; b = 4'b0001; carry_in = 0; subtract = 1;
	#1 a = 4'b0111; b = 4'b0001; carry_in = 0; subtract = 1;
	#1 a = 4'b1111; b = 4'b0001; carry_in = 0; subtract = 1;
	
	#1 a = 4'b0000; b = 4'b0001; carry_in = 0; subtract = 1;
	#1 a = 4'b0000; b = 4'b0011; carry_in = 0; subtract = 1;
	#1 a = 4'b0000; b = 4'b0111; carry_in = 0; subtract = 1;
	#1 a = 4'b0000; b = 4'b1111; carry_in = 0; subtract = 1;
        #1 $finish;
     end

   initial
     begin
	$monitor($time, "\ta=%b", a, "\tb=%b", b, "\tcin=%b", carry_in, "\tsubtract=%b", subtract, "\tresult=%b", result, "\tcout=%b", carry_out);
	$dumpfile("addsub4_structural_test.vcd");
	$dumpvars;
     end
   
endmodule // addsub4_structural_test
