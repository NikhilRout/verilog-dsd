module DualPortROM (
    input clk, ena, enb,
    input [2:0] addra, addrb,
    output reg [3:0] data_outa, data_outb 
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
        if(ena) //priority if ena & enb are HIGH
            data_outa <= mem[addra];
        else if(enb)
            data_outb <= mem[addrb];
    end
endmodule
