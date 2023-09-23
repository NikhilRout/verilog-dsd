module FullAdder_structural(sum,carry,a,b,Cin);
  output sum,carry;
  input a,b,Cin;
  wire sum1, carry1, carry2;
  xor g1(sum1,a,b);
  xor g2(sum, sum1,Cin);
  and g3(carry1,a,b);
  and g4(carry2,sum1,Cin);
  or g5(carry,carry1,carry2);
endmodule
