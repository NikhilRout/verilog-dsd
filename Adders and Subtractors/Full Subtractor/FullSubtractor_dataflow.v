module FullSubtractor_dataflow( diff,Bout, a, b, Bin);
  output diff, Bout;
  input a, b, Bin;
  assign diff = a ^ b ^ Bin;
  assign Bout = ((~a)&b) | (Bin&(a^~b)); //xnor symbol ^~ or ~^
endmodule
