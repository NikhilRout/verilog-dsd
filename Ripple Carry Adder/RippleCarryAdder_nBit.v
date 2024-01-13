module FullAdder(sum, carry, a, b, Cin);
  output sum, carry;
  input a, b, Cin;
  assign sum = a ^ b ^ Cin;
  assign carry = (a & b)|(b & Cin)|(Cin & a);
endmodule

module RippleCarryAdder_nBit #(parameter N = 8)(
  input [N-1:0] A, B,
  output [N-1:0] sum,
  output cout
);
  wire [N-2:0] carry;
  FullAdder FA0(sum[0], carry[0], A[0], B[0], 1'b0);
  genvar i;
  generate
    for (i=1;i<N-1;i=i+1) begin
      FullAdder FA(sum[i], carry[i], A[i], B[i], carry[i-1]);
    end
  endgenerate
  FullAdder FAN(sum[N-1], cout, A[N-1], B[N-1], carry[N-2]);
endmodule
