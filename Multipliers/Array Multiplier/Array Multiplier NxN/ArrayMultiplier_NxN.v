module ArrayMultiplier_NxN #(parameter N = 4) (
    input [N-1:0] A, B,
    output [2*N-1:0] Prod
);
    wire [N-1:0] p[N-1:0]; //partial products
    genvar g, h;
    generate
        for(g = 0; g < N; g=g+1) begin
            for(h = 0; h < N; h=h+1) begin
                and a(p[g][h], A[h], B[g]);
            end
        end
    endgenerate

    assign Prod[0] = p[0][0];
    wire [N-2:1] couts;
    wire [N-1:1] sums[N-2:1];
    RCA_nBit #(.N(N)) RCA0(.A({1'b0,p[0][N-1:1]}), .B(p[1]), .Sum({sums[1],Prod[1]}), .Cout(couts[1]));
    //generating RCA1 to RCA(N-2)
    genvar i; 
    generate
        for(i = 2; i < N-1; i=i+1) begin
            RCA_nBit #(.N(N)) RCA(.A({couts[i-1],sums[i-1]}), .B(p[i]), .Sum({sums[i],Prod[i]}), .Cout(couts[i]));
        end
    endgenerate
    RCA_nBit #(.N(N))  RCAN(.A({couts[N-2], sums[N-2]}), .B(p[N-1]), .Sum(Prod[2*N-2:N-1]), .Cout(Prod[2*N-1]));
endmodule

module RCA_nBit #(parameter N = 8)(
  input [N-1:0] A, B,
  output [N-1:0] Sum,
  output Cout
);
  wire [N-2:0] carry;
  FullAdder FA0(.sum(Sum[0]), .cout(carry[0]), .a(A[0]), .b(B[0]), .cin(1'b0));
  genvar i;
  generate
    for (i=1;i<N-1;i=i+1) begin
      FullAdder FA(.sum(Sum[i]), .cout(carry[i]), .a(A[i]), .b(B[i]), .cin(carry[i-1]));
    end
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
