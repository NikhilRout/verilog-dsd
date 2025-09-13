module CSelectA_M_N_tb;
    parameter M = 32, N = 4;
    reg [M-1:0] A, B;
    wire [M-1:0] Sum;
    wire Cout;
    CSelectA_M_N #(.M(M), .N(N)) uut(.A(A), .B(B), .Sum(Sum), .Cout(Cout));
    initial begin
        $random;
        $monitor("A = %d, B = %d, Sum = %d", A, B, {Cout, Sum});
        repeat (10) begin
            A = $urandom_range(0,2**M-1);
            B = $urandom_range(0,2**M-1);
            #100;
        end
        $stop;
    end
endmodule

