module CSelectA_16_4_tb;
    reg [15:0] A, B;
    wire [15:0] Sum;
    wire Cout;
    CSelectA_16_4 uut(.A(A), .B(B), .Sum(Sum), .Cout(Cout));
    initial begin
        $random;
        $monitor("A = %d, B = %d, Sum = %d", A, B, {Cout, Sum});
        repeat (10) begin
            A = $urandom_range(0,2**16-1);
            B = $urandom_range(0,2**16-1);
            #100;
        end
        $stop;
    end
endmodule
