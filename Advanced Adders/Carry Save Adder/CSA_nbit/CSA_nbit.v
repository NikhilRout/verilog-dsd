//3 operands - n bit depth

module CSA_nbit #(parameter N = 8) (
    input [N-1:0] A, B, C,
    output [N:0] Sum,
    output Cout
);
    wire [N-2:0] St;
    wire [N-1:0] Ct;

    FullAdder CSAU0(.a(A[0]), .b(B[0]), .cin(C[0]), .sum(Sum[0]), .cout(Ct[0]));
    genvar i;
    generate
        for (i = 1; i < N; i = i  + 1)
            FullAdder CSAU(.a(A[i]), .b(B[i]), .cin(C[i]), .sum(St[i-1]), .cout(Ct[i]));
    endgenerate

    RippleCarryAdder RCA0(.A(Ct), .B({1'b0, St}), .Sum(Sum[N:1]), .Cout(Cout));
endmodule

module RippleCarryAdder #(parameter N = 8) (
    input [N-1:0] A, B,
    output [N-1:0] Sum,
    output Cout
);
    wire [N-2:0] carry;
    FullAdder FA0(.sum(Sum[0]), .cout(carry[0]), .a(A[0]), .b(B[0]), .cin(1'b0));
    genvar i;
    generate
        for (i = 1; i < N-1; i = i + 1)
            FullAdder FA(.sum(Sum[i]), .cout(carry[i]), .a(A[i]), .b(B[i]), .cin(carry[i-1]));
    endgenerate
    FullAdder FAN(.sum(Sum[N-1]), .cout(Cout), .a(A[N-1]), .b(B[N-1]), .cin(carry[N-2]));
endmodule

module FullAdder (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule