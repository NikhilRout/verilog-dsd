module CSA_4bit_tb;
    reg [3:0] A, B, C;
    wire [4:0] Sum;
    wire Cout;
    CSA_4bit uut(.A(A), .B(B), .C(C), .Sum(Sum), .Cout(Cout));
    initial begin
        $monitor("A = %d, B = %d, C = %d, Sum = %d", A, B, C, {Cout, Sum});
	    A = 4'b1010; B = 4'b0111; C = 4'b1110;
        #100;
    end
endmodule

