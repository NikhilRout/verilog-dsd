//4-bit right shift SIPO register

module SIPO(
  input clk, rst, data_in,
  output reg [3:0] data_out
);
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      data_out <= 4'b0000;
    end else begin
      data_out = data_out >> 1;
      data_out[3] = data_in;
    end
  end
endmodule
