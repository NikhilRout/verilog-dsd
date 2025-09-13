module ArrayMultiplier_NxN_tb;
    parameter N = 8;
    reg [N-1:0] A, B;
    wire [2*N-1:0] Prod;
    ArrayMultiplier_NxN #(.N(N)) uut(.A(A), .B(B), .Prod(Prod));
    initial begin
        $monitor("A = %d, B = %d, Prod = %d", A, B, Prod);
        repeat (10) begin
            A = $urandom_range(0,2**N-1);
            B = $urandom_range(0,2**N-1);
            #100;
        end
        $stop;
    end
endmodule