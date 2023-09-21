module BasicGates_structural(a,b,Y_and,Y_or,Y_not,Y_nand,Y_nor,Y_xor,Y_xnor);
  input a,b;
  output Y_and,Y_or,Y_not,Y_nand,Y_nor,Y_xor,Y_xnor;
  and g1(Y_and,a,b);
  or g2(Y_or,a,b);
  not g3(Y_not,a);
  nand g4(Y_nand,a,b);
  nor g5(Y_nor,a,b);
  xor g6(Y_xor,a,b);
  xnor g7(Y_xnor,a,b);
endmodule
