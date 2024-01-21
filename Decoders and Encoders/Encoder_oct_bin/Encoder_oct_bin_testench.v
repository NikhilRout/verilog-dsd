module Encoder_oct_bin_testbench;
  reg [7:0] D;
  wire [2:0] Y;
  Encoder_oct_bin_dataflow uut(.Y(Y),.D(D));
  integer i;
  initial begin
    $monitor ("D = %b, Y = %b", D, Y);
    for(i=0;i<8;i=i+1) begin
      D = 8'b00000000;
      D[i] = 1'b1;
      #100;
    end
    $stop;
  end
endmodule
