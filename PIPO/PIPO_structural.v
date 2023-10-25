module dff(
  output reg q,
  input clk, rst, d
);
  always @(posedge clk) begin
    if (rst)
      q <= 1'b0;
    else
      q <= d;
  end
endmodule

module PIPO_structural(
  output [3:0] data_out,
  input clk, rst,
  input [3:0] data_in
);
  dff dut3(data_out[3], clk, rst, data_in[3]);
  dff dut2(data_out[2], clk, rst, data_in[2]);
  dff dut1(data_out[1], clk, rst, data_in[1]);
  dff dut0(data_out[0], clk, rst, data_in[0]);
endmodule
