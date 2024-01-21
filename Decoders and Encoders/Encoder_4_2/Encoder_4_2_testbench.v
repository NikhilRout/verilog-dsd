module Encoder_4_2_testbench;
  reg [3:0] D;
  wire [1:0] Y;
  Encoder_4_2_behavioral uut(.Y(Y),.D(D));
  initial begin
    $monitor ("D = %b, Y = %b", D, Y);
    D = 4'b0001;
    #100 D = 4'b0010;
    #100 D = 4'b0100;
    #100 D = 4'b1000;
    #100;
    $stop;
  end
endmodule
