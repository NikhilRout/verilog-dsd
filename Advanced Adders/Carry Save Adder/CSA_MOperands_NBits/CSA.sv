//Carry Save Adder
//M operands N-bit depth

module CSA #(parameter M = 6, N = 4) (
    input [N-1:0] Operands [M-1:0],
    output [N+M-3:0] Sum,
    output Cout
);

    wire [N+M-3:0] St[M-3:0], Ct[M-3:0]; //2d matrix of size (M-2)x(N+M-2)

    CSA_level #(.N(N)) CSA0(.A(Operands[0]), .B(Operands[1]), .C(Operands[2]), .St(St[0][N:0]), .Ct(Ct[0][N:0]));
    genvar i;
    generate
      for (i = 1; i < M-2; i=i+1)
        CSA_level #(.N(N+i)) CSA(.A(St[i-1][N-1+i:0]), .B(Ct[i-1][N-1+i:0]), .C({{i{1'b0}},Operands[2+i]}), .St(St[i][N+i:0]), .Ct(Ct[i][N+i:0]));
    endgenerate

    RippleCarryAdder #(.N(N+M-2)) RCA0(.A(St[M-3]), .B(Ct[M-3]), .Sum(Sum), .Cout(Cout));
endmodule

module CSA_level #(parameter N = 4) (
    input [N-1:0] A, B, C,
    output [N:0] St, Ct
);
    assign Ct[0] = 1'b0;
    genvar i;
    generate
        for (i = 0; i < N; i = i  + 1)
            FullAdder CSAU(.a(A[i]), .b(B[i]), .cin(C[i]), .sum(St[i]), .cout(Ct[i+1]));
    endgenerate
    assign St[N] = 1'b0;
endmodule

module RippleCarryAdder #(parameter N = 4) (
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
