module cmosor(out, ina, inb);
   input ina, inb;
   output out;
   wire   w_p, w_nor;
   supply1 vdd;
   supply0 gnd;

   // pmos name(drain, source, gate);
   pmos p1(w_p, vdd, ina);
   pmos p2(w_nor, w_p, inb);
   pmos p3(out, vdd, w_nor);

   // nmos name(drain, source, gate);
   nmos n1(w_nor, gnd, ina);
   nmos n2(w_nor, gnd,inb);
   nmos n3(out, gnd, w_nor);
   
endmodule // cmosor
