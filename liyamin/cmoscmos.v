module cmoscmos(drain, source,n_gate,p_gate);
   input source, n_gate, p_gate;
   output drain;

   // pmos name(drain, source ,gate);
   pmos p1(drain, source, p_gate);

   // nmos name(drain, source, gate);
   nmos n1(drain, source, n_gate);
   
endmodule // cmoscmos
