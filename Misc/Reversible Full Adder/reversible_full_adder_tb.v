module reversible_full_adder_tb;
    reg a, b, cin;
    wire sum, cout;
    wire [3:0] out_vec;
    reversible_full_adder uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout), .out_vec);
    integer i;
    initial begin
        $monitor("Cin=%b A=%b B=%b | Cout=%b Sum=%b", cin, a, b, cout, sum);
        for(i=0; i<8; i=i+1) begin
            {cin, a, b} = i;
            #100;
        end
    end
endmodule
