module BasicGates_dataflow(a,b,Y_and,Y_or,Y_not,Y_nand,Y_nor,Y_xor,Y_xnor);
  input a,b;
  output Y_and,Y_or,Y_not,Y_nand,Y_nor,Y_xor,Y_xnor;
  assign Y_and = a&b;
  assign Y_or = a|b;
  assign Y_not = ~a;
  assign Y_nand = ~(a&b);
  assign Y_nor = ~(a|b);
  assign Y_xor = a^b;
  assign Y_xnor = a^~b;
endmodule
