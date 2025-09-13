module FIFO_sync #(parameter DATA_WIDTH = 8, FIFO_DEPTH = 16) (
    input clk, rst, rd_en, wr_en,
    input [DATA_WIDTH-1:0]  din, 
    output reg [DATA_WIDTH-1:0]  dout,
    output reg full, empty
);
    localparam ADDR_WIDTH = $clog2(FIFO_DEPTH);
    reg [DATA_WIDTH-1:0] mem [0:FIFO_DEPTH-1];
    reg [ADDR_WIDTH:0] wr_ptr, rd_ptr;  //extra bit to differentiate full & empty

    always @(posedge clk or posedge rst) begin
        if (rst)
            wr_ptr <= 0;
        else if (wr_en && !full) begin
            mem[wr_ptr[ADDR_WIDTH-1:0]] <= din; //not using wr_ptr directly to prevent overflow
            wr_ptr <= wr_ptr + 1;
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            rd_ptr <= 0;
        else if (rd_en && !empty) begin
            dout <= mem[rd_ptr[ADDR_WIDTH-1:0]];
            rd_ptr <= rd_ptr + 1;
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            full <= 0;
            empty <= 1;
        end else begin
            full <= (wr_ptr[ADDR_WIDTH:0] == {~rd_ptr[ADDR_WIDTH], rd_ptr[ADDR_WIDTH-1:0]});
            empty <= (wr_ptr == rd_ptr);
        end
    end
endmodule
