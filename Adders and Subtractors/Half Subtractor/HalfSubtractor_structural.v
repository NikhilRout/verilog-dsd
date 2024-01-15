module HalfSubtractor_structural(diff, Bout, a, b);
  output diff,Bout;
  input a, b;
  wire a_bar;
  xor g1(diff,a,b);
  not g2(a_bar,a);
  and g3(Bout,a_bar,b);
endmodule
