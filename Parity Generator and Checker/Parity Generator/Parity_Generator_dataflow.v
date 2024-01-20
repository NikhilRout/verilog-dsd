//n-bit even parity generator
module Parity_Generator_dataflow #(parameter N = 32)(
  input [N-1:0] data_in,
  output [N:0] data_out
);
  assign data_out = {data_in, ^data_in};
endmodule
  /*
    the "^ reduction operator" performs an xor operation on all the bits of data_in,
    hence generating the even parity bit 
    the parity bit is then concatenated to the output on the LSB side
  */