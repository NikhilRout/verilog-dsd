module Priority_Encoder_dataflow(
  input [3:0] D,
  output [1:0] Y
);
  assign Y[1] = D[2] | D[3];
  assign Y[0] = (D[1] & (~D[2])) | D[3];
endmodule
