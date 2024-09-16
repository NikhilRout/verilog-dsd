module SignExtender9to16_tb;
    reg [8:0] in;
    wire [15:0] out;
    SignExtender9to16 uut(.in(in), .out(out));
    initial begin
        $monitor("Input9bit = %b, Output16bit = %b", in, out);
        in = 110101101;
        #100 in = 010101010;
        #100;
        $stop;
    end
endmodule

