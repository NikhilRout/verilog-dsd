//3 operands - 4 bit depth

module CSA_4bit (
    input [3:0] A, B, C,
    output [4:0] Sum,
    output Cout
);
    wire [2:0] St;
    wire [3:0] Ct;

    FullAdder CSAU0(.a(A[0]), .b(B[0]), .cin(C[0]), .sum(Sum[0]), .cout(Ct[0]));
    FullAdder CSAU1(.a(A[1]), .b(B[1]), .cin(C[1]), .sum(St[0]), .cout(Ct[1]));
    FullAdder CSAU2(.a(A[2]), .b(B[2]), .cin(C[2]), .sum(St[1]), .cout(Ct[2]));
    FullAdder CSAU3(.a(A[3]), .b(B[3]), .cin(C[3]), .sum(St[2]), .cout(Ct[3]));

    RippleCarryAdder RCA0(.A(Ct), .B({1'b0, St}), .Sum(Sum[4:1]), .Cout(Cout));
endmodule

module RippleCarryAdder (
    input [3:0] A, B,
    output [3:0] Sum,
    output Cout
);
    wire [2:0] carry;
    FullAdder FA0(.sum(Sum[0]), .cout(carry[0]), .a(A[0]), .b(B[0]), .cin(1'b0));
    FullAdder FA1(.sum(Sum[1]), .cout(carry[1]), .a(A[1]), .b(B[1]), .cin(carry[0]));
    FullAdder FA2(.sum(Sum[2]), .cout(carry[2]), .a(A[2]), .b(B[2]), .cin(carry[1]));
    FullAdder FA3(.sum(Sum[3]), .cout(Cout), .a(A[3]), .b(B[3]), .cin(carry[2]));
endmodule

module FullAdder (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule
