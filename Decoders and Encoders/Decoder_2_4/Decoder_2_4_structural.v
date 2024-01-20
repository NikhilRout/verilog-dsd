module Decoder_2_4_structural(
  input a, b, en,
  output y0,y1,y2,y3
);
  wire a_not, b_not;
  not(a_not, a);
  not(b_not, b);
  and(y0, a_not, b_not, en);
  and(y1, a_not, b, en);
  and(y2, a, b_not, en);
  and(y3, a, b, en);
endmodule
