module CSelectA_16_4 (
    input [15:0] A, B,
    output [15:0] Sum,
    output Cout
);
    wire [2:0] StageCout;
    wire [1:0] StageCarry[3:1];
    wire [3:0] StageSum[3:1][1:0];

    //Stage 3:0
    RCA_4bit RCA0(.A(A[3:0]), .B(B[3:0]), .Cin(1'b0), .Sum(Sum[3:0]), .Cout(StageCout[0]));

    //Stage 7:4
    RCA_4bit RCA10(.A(A[7:4]), .B(B[7:4]), .Cin(1'b0), .Sum(StageSum[1][0]), .Cout(StageCarry[1][0]));
    RCA_4bit RCA11(.A(A[7:4]), .B(B[7:4]), .Cin(1'b1), .Sum(StageSum[1][1]), .Cout(StageCarry[1][1]));
    carryMUX CM1(.u(StageCarry[1][1]), .d(StageCarry[1][0]), .sel(StageCout[0]), .y(StageCout[1]));
    sumMUX SM1(.U(StageSum[1][1]), .D(StageSum[1][0]), .Sel(StageCout[0]), .Y(Sum[7:4]));

    //Stage 11:8
    RCA_4bit RCA20(.A(A[11:8]), .B(B[11:8]), .Cin(1'b0), .Sum(StageSum[2][0]), .Cout(StageCarry[2][0]));
    RCA_4bit RCA21(.A(A[11:8]), .B(B[11:8]), .Cin(1'b1), .Sum(StageSum[2][1]), .Cout(StageCarry[2][1]));
    carryMUX CM2(.u(StageCarry[2][1]), .d(StageCarry[2][0]), .sel(StageCout[1]), .y(StageCout[2]));
    sumMUX SM2(.U(StageSum[2][1]), .D(StageSum[2][0]), .Sel(StageCout[1]), .Y(Sum[11:8]));

    //Stage 15:12
    RCA_4bit RCA30(.A(A[15:12]), .B(B[15:12]), .Cin(1'b0), .Sum(StageSum[3][0]), .Cout(StageCarry[3][0]));
    RCA_4bit RCA31(.A(A[15:12]), .B(B[15:12]), .Cin(1'b1), .Sum(StageSum[3][1]), .Cout(StageCarry[3][1]));
    carryMUX CM3(.u(StageCarry[3][1]), .d(StageCarry[3][0]), .sel(StageCout[2]), .y(Cout));
    sumMUX SM3(.U(StageSum[3][1]), .D(StageSum[3][0]), .Sel(StageCout[2]), .Y(Sum[15:12]));
endmodule

module sumMUX (
    input [3:0] U, D,
    input Sel,
    output [3:0] Y
);
    assign Y = Sel ? U : D;
endmodule

module carryMUX (
    input u, d, sel,
    output y
);
    assign y = sel ? u : d;
endmodule

module RCA_4bit (
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [2:0] carry;
    FullAdder FA0(.sum(Sum[0]), .cout(carry[0]), .a(A[0]), .b(B[0]), .cin(Cin));
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
