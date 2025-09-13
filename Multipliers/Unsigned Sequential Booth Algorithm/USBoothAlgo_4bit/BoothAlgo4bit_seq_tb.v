module BoothAlgo4bit_seq_tb;
    reg [3:0] M, Q;
    reg clk, rst;
    wire [7:0] Prod;
    BoothAlgo4bit_seq uut(.M(M), .Q(Q), .clk(clk), .rst(rst), .Prod(Prod));
    always #50 clk = ~clk;
    initial begin
        M = 4'b1101; Q = 4'b1011;
        clk = 1;
        rst = 1;
        #100; rst = 0;
        #400;
        $stop;
    end
endmodule
