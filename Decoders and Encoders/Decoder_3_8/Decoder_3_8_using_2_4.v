module Decoder_2_4(
  output [3:0] Y,
  input a, b, en
);
  assign Y[0] = (~a) & (~b) & en;
  assign Y[1] = (~a) & b & en;
  assign Y[2] = a & (~b) & en;
  assign Y[3] = a & b & en;
endmodule

module Decoder_3_8_using_2_4(
  input [2:0] D,
  output [7:0] Y
);
  Decoder_2_4 dec1(Y[3:0], D[1], D[0], ~D[2]);
  Decoder_2_4 dec2(Y[7:4], D[1], D[0], D[2]);
endmodule
