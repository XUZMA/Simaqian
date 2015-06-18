module cmosand(out, ina, inb);
   input ina, inb;
   output out;
   wire   w_n, w_nand;
   supply1 vdd;
   supply0 gnd;

   // pmos name(drain, source, gate);
   pmos p1(w_nand, vdd, inb);
   pmos p2(w_nand, vdd, ina);
   pmos p3(out, vdd, w_nand);

   // nmos name(drain, source, gate);
   nmos n1(w_n, gnd, inb);
   nmos n2(w_nand,w_n, ina);
   nmos n3(out, gnd, w_nand);
     
endmodule // cmosand
