module SISO_testbench;
  reg clk, rst, data_in;
  wire data_out;
  SISO uut( .data_out(data_out), .clk(clk), .rst(rst), .data_in(data_in));
  always #5 clk = ~clk;
  initial begin
    clk = 1;
    rst = 1;
    #10 rst = 0; data_in = 1'b1;
    #10 data_in = 1'b0;
    #10 data_in = 1'b0;
    #10 data_in = 1'b1;
    #10 data_in = 1'b0;
    #10 data_in = 1'b1;
    #10 data_in = 1'b0;
    #10;
  $stop;
  end
endmodule
