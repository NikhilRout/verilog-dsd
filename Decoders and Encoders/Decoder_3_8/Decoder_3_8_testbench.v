module Decoder_3_8_testbench;
  reg [2:0] D;
  wire [7:0] Y;
  Decoder_3_8_behavioal uut(.D(D),.Y(Y));
  initial begin
    $monitor("D = %b, Y0 = %b, Y1 = %b, Y2 = %b, Y3 = %b, Y4 = %b, Y5 = %b, Y6 = %b, Y7 = %b, Y in hex: %h",D,Y[0],Y[1],Y[2],Y[3],Y[4],Y[5],Y[6],Y[7], Y);
    D = 3'b000;
    #100 D = 3'b001;
    #100 D = 3'b010;
    #100 D = 3'b011;
    #100 D = 3'b100;
    #100 D = 3'b101;
    #100 D = 3'b110;
    #100 D = 3'b111;
    #100;
    $stop;
  end
endmodule  
