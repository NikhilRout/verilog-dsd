module Decoder_2_4_dataflow(
  input a, b, en,
  output y0,y1,y2,y3
);
  assign y0 = (~a) & (~b) & en;
  assign y1 = (~a) & b & en;
  assign y2 = a & (~b) & en;
  assign y3 = a & b & en;
endmodule
