module CSA_nbit_tb;
    parameter N = 4;
    reg [N-1:0] A, B, C;
    wire [N:0] Sum;
    wire Cout;

    CSA_nbit #(.N(N)) uut(.A(A), .B(B), .C(C), .Sum(Sum), .Cout(Cout));
    initial begin
        $monitor("A = %d, B = %d, C = %d, Sum = %d", A, B, C, {Cout, Sum});
        A = $urandom_range(0,2**N-1);
        B = $urandom_range(0,2**N-1);
        C = $urandom_range(0,2**N-1);
        #100;
    end
endmodule
