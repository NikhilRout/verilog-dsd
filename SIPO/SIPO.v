//4-bit right shift SIPO register

module SIPO(
  input clk, rst, data_in,
  output reg [3:0] data_out
);
  reg [3:0] tmp;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      tmp <= 4'b0000;
      data_out <= 4'b0000;
    end else begin
      tmp = tmp >> 1;
      tmp[3] = data_in;
      data_out <= tmp;
    end
  end
endmodule
