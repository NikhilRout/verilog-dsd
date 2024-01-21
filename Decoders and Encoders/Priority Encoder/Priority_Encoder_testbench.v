module Priority_Encoder_testbench;
  reg [3:0] D;
  wire [1:0] Y;
  Priority_Encoder_dataflow uut(.D(D), .Y(Y));
  initial begin
    D = 4'b0101;
    #100 D = 4'b1001;
    #100 D = 4'b0001;
    #100 D = 4'b0011;
    #100;
    $stop;
  end
endmodule
