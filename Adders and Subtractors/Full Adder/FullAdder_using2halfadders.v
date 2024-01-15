//Full Adder Gate-Level Modeling using 2 Half Adders
module HalfAdder(sum,carry,a,b);
  output sum,carry;
  input a,b;
  assign sum = a^b;
  assign carry = a&b;
endmodule

module FullAdder_using2halfadders(sum,carry,a,b,Cin);
  output sum,carry;
  input a,b,Cin;
  wire s1,c1,c2;
  HalfAdder HA1(s1,c1,a,b);
  HalfAdder HA2(sum,c2,s1,Cin);
  or g1(carry,c1,c2);
endmodule
