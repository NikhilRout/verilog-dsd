module SinglePortROM (
    input clk, en,
    input [2:0] addr,
    output reg [3:0] data_out 
);
    reg [3:0] mem[0:7];
    always @(*) begin
        mem[0] = 4'b0001;
        mem[1] = 4'b0011;
        mem[2] = 4'b1010;
        mem[3] = 4'b0110;
        mem[4] = 4'b0111;
        mem[5] = 4'b1101;
        mem[6] = 4'b1001;
        mem[7] = 4'b1011;
    end
    always @(posedge clk) begin
        if(en)
            data_out <= mem[addr];
    end
endmodule
