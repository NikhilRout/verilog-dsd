module HalfSubtractor_dataflow(diff, Bout, a, b);
  output diff,Bout;
  input a, b;
  assign diff = a ^ b;
  assign Bout = (~a)&b;
endmodule
