module CLA_4bit_tb;
    reg [3:0] A, B;
    wire [3:0] Sum;
    wire Cout;
    CLA_4bit uut(.A(A), .B(B), .Sum(Sum), .Cout(Cout));
    initial begin
        $random;
        $monitor("A = %d, B = %d, Sum = %d", A, B, {Cout, Sum});
	    repeat (10) begin
            A = $urandom_range(0, 15);
            B = $urandom_range(0, 15);
            #100;
        end
    end
endmodule
