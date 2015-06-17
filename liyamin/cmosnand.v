module cmosnand(out, ina, inb);
   input ina, inb;
   output out;

   wire   w_n; // connect the 2 cmos transistors
   supply1 vdd;
   supply0 gnd;

   // pmos name(drain, source, gate);
   pmos p1(out, vdd, inb);
   pmos p2(out, vdd, ina);
   
   // nmos name(drain, source, gate);
   nmos n2(w_n, gnd, inb);
   nmos n1(out, w_n,ina);
endmodule // cmosnand
