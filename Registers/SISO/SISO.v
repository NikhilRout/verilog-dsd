//4-bit right shift SISO register

module SISO(
  input clk, rst, data_in,
  output reg data_out
);
  reg [3:0] tmp;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      tmp <= 4'b0000;
      data_out <= 1'b0;
    end else begin
      tmp = tmp >> 1; // << for left-shift
      tmp[3] = data_in; // tmp[0]
      data_out = tmp[0]; // tmp[3]
    end
  end
endmodule
