//unsigned ripple carry 4-bit parallel adder

module FullAdder(sum, carry, a, b, Cin);
  output sum, carry;
  input a, b, Cin;
  assign sum = a ^ b ^ Cin;
  assign carry = (a & b)|(b & Cin)|(Cin & a);
endmodule

module RippleCarryAdder_4bit(
  input [3:0] A,B,
  output [3:0] sum,
  output cout
);
  wire [2:0] carry;
  FullAdder FA0(sum[0], carry[0], A[0], B[0], 1'b0);
  FullAdder FA1(sum[1], carry[1], A[1], B[1], carry[0]);
  FullAdder FA2(sum[2], carry[2], A[2], B[2], carry[1]);
  FullAdder FA3(sum[3], cout, A[3], B[3], carry[2]);
endmodule

