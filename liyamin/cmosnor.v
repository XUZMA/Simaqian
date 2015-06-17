module cmosnor(out, ina, inb);
   input ina, inb;
   output out;
   wire   w_p;
   supply1 vdd;
   supply0 gnd;
   
   // pmos name (drain, source, gate);
   pmos p1(w_p, vdd, ina);
   pmos p2(out, w_p, inb);
   
   // nmos name (drain, source, gate);
   nmos n1(out, gnd, ina);
   nmos n2(out, gnd, inb);

endmodule // cmosnor
