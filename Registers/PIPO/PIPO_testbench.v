module PIPO_testbench;
  reg clk, rst;
  reg [3:0] data_in;
  wire [3:0] data_out;
  PIPO uut( .data_out(data_out), .clk(clk), .rst(rst), .data_in(data_in));
  always #5 clk = ~clk;
  initial begin
    clk = 1;
    rst = 1;
    #10 rst = 0; data_in = 4'b1001;
    #10 data_in = 4'b1010;
    #10 data_in = 4'b1111;
    #10;
  $stop;
  end
endmodule
