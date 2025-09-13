module CSA_tb;
    parameter M = 8, N = 4;
    reg [N-1:0] Operands [M-1:0];
    wire [N+M-3:0] Sum;
    wire Cout;

    CSA #(.M(M), .N(N)) uut(.Operands(Operands), .Sum(Sum), .Cout(Cout));
    integer i;
    initial begin
        for(i = 0; i < M; i=i+1) begin
            Operands[i] = $urandom_range(0,2**N-1);
            $display("Operand[%d] = %d", i, Operands[i]);
        end
        $monitor("Sum = %d", {Cout, Sum});
        #100;
    end
endmodule
