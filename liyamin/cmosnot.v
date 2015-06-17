module cmosnot(f,a);
   input a;
   output f;
   supply1 vdd;
   supply0 gnd;
   // pmos name(drain, source, gate);
   // nmos name(drain, source, gate);
   pmos p1(f, vdd, a);
   nmos n1(f, gnd, a);
endmodule   
