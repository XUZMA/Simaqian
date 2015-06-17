module gates7_structural(a, b, f_and, f_or, f_not, f_nand, f_nor, f_xor, f_xnor);
    input a,b;
    output f_and, f_or, f_not, f_nand, f_nor, f_xor, f_xnor;
    and  i1(f_and, a, b);
    or     i2(f_or, a, b);
    not   i3(f_not, a);
   nand i4(f_nand, a, b);
    nor   i5(f_nor, a, b);
    xor   i6(f_xor, a, b);
    xnor i7(f_xnor, a, b);
endmodule
