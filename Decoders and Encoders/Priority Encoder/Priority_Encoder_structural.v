module Priority_Encoder_Structural(
  input [3:0] D,
  output [1:0] Y
);
  wire w1, w2;
  or(Y[1], D[3], D[2]);
  not(w1, D[2]);
  and(w2, w1, D[1]);
  or(Y[0], D[3], w2);
endmodule
