//4-bit Even Parity Generator
module Parity_Generator_structural(
  input[3:0] data_in,
  output[4:0] data_out
);
  assign data_out[4:1] = data_in;
  xor(data_out[0], data_in[3], data_in[2], data_in[1], data_in[0]);
endmodule
