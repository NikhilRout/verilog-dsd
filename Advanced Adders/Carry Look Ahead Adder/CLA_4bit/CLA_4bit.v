module CLA_4bit (
    input [3:0] A, B,
    output [3:0] Sum,
    output Cout
);
    wire [3:0] G;
    wire [3:0] P;
    assign G = A & B;
    assign P = A ^ B;
    
    wire [3:1] carry;
    assign carry[1] = G[0]; //assuming Cin = 1'b0;
    assign carry[2] = G[1] | (P[1] & G[0]);
    assign carry[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]);
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);

    FullAdder FA0(.a(A[0]), .b(B[0]), .cin(1'b0), .sum(Sum[0]));
    FullAdder FA1(.a(A[1]), .b(B[1]), .cin(carry[1]), .sum(Sum[1]));
    FullAdder FA2(.a(A[2]), .b(B[2]), .cin(carry[2]), .sum(Sum[2]));
    FullAdder FA3(.a(A[3]), .b(B[3]), .cin(carry[3]), .sum(Sum[3]));
endmodule

module FullAdder(
    input a, b, cin,
    output sum
);
    assign sum = a ^ b ^ cin;
endmodule