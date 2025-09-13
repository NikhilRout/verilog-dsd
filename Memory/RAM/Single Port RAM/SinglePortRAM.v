module SinglePortRAM #(
    parameter DATA_WIDTH = 8, DEPTH = 256
) (
    input clk, wr_en, rd_en,
    input [$clog2(DEPTH)-1:0] addr,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out
);
    reg [DATA_WIDTH-1:0] mem[0:DEPTH-1];
    always @(posedge clk) begin
        if(wr_en) //prioritizing wr over rd if both are HIGH
            mem[addr] <= data_in;
        else if(rd_en)
            data_out <= mem[addr];
    end
endmodule
