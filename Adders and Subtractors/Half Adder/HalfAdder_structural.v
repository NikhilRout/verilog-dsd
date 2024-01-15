module HalfAdder_structural(sum,carry,a,b);
  output sum,carry;
  input a,b;
  xor g1(sum,a,b);
  and g2(carry,a,b);
endmodule
