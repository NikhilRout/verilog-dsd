module CLA_nbit_tb;
    parameter N = 4;
    reg [N-1:0] A, B;
    wire [N-1:0] Sum;
    wire Cout;

    CLA_nbit #(.N(N)) uut(.A(A), .B(B), .Sum(Sum), .Cout(Cout));
    initial begin
        $monitor("A = %d, B = %d, Sum = %d", A, B, {Cout, Sum});
        repeat (10) begin
            A = $urandom_range(0,2**N-1);
            B = $urandom_range(0,2**N-1);
            #100;
        end
    end
endmodule