//8-bit signed combined parallel adder and subtractor
//ctrl = 1: Subtraction is performed (A-B)
//ctrl = 0: Addition is performed (A+B)

module FullAdder(sum, carry, a, b, Cin);
  output sum, carry;
  input a, b, Cin;
  assign sum = a ^ b ^ Cin;
  assign carry = (a & b)|(b & Cin)|(Cin & a);
endmodule

module Combined_Parallel_Adder_Subtractor(
  input [6:0] A, B,
  input ctrl,
  output [7:0] signed_Y,
  output cout
);
  wire [6:0] B_xored;
  assign B_xored = B^ctrl;
  wire [5:0] carry;
  FullAdder FA0(signed_Y[0], carry[0], A[0], B_xored[0], ctrl);
  genvar i;
  generate
    for (i=1;i<6;i=i+1) begin
      FullAdder FA(signed_Y[i], carry[i], A[i], B_xored[i], carry[i-1]);
    end
  endgenerate
  FullAdder FAN(signed_Y[6], cout, A[6], B_xored[6], carry[5]);
  assign signed_Y[7] = ~carry[5] & ctrl;
endmodule