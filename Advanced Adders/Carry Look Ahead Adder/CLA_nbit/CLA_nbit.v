module CLA_nbit #(parameter N = 4)(
    input [N-1:0] A, B,
    output [N-1:0] Sum,
    output Cout
);
    wire [N:0] carry;
    wire [N-1:0] Gen, Prop;

    genvar i;
    generate
        for(i=0; i<N; i=i+1)
            FullAdder FA(.a(A[i]), .b(B[i]), .cin(carry[i]), .sum(Sum[i]));
    endgenerate
    
    assign carry[0] = 1'b0;
    genvar j;
    generate
        for(j=0; j<N; j=j+1) begin
            assign Gen[j] = A[j] & B[j];
            assign Prop[j] = A[j] ^ B[j];
            assign carry[j+1] = Gen[j] | (Prop[j] & carry[j]);
        end
    endgenerate
    assign Cout = carry[N];
endmodule

module FullAdder(
    input a, b, cin, 
    output sum
);
    assign sum = a ^ b ^ cin;
endmodule
