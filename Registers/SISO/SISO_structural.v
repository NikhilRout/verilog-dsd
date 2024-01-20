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

module SISO_structural(
  output data_out,
  input clk, rst, data_in
);
  wire w0, w1, w2;
  dff dut0(w0, clk, rst, data_in);
  dff dut1(w1, clk, rst, w0);
  dff dut2(w2, clk, rst, w1);
  dff dut3(data_out, clk, rst, w2);
endmodule
