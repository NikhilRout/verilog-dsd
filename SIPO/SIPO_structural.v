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

module SIPO_structural(
  output [3:0] data_out,
  input clk, rst, data_in
);
  dff dut0(data_out[3], clk, rst, data_in);
  dff dut1(data_out[2], clk, rst, data_out[3]);
  dff dut2(data_out[1], clk, rst, data_out[2]);
  dff dut3(data_out[0], clk, rst, data_out[1]);
endmodule
