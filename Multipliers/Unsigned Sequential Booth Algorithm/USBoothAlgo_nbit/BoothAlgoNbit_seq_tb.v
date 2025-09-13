module BoothAlgoNbit_seq_tb;
    parameter N = 4;
    reg [N-1:0] M, Q;
    reg clk, rst;
    wire [2*N-1:0] Prod;
    BoothAlgoNbit_seq uut(.M(M), .Q(Q), .clk(clk), .rst(rst), .Prod(Prod));
    always #50 clk = ~clk;
    initial begin
        $random;
        M = $urandom_range(0, 2**N - 1);
        Q = $urandom_range(0, 2**N - 1);        
        clk = 1;
        rst = 1;
        #100; rst = 0;
        #(N*100);
        $stop;
    end
endmodule
