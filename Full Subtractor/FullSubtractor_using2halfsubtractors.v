module HalfSubtractor( diff, borrow, a, b);
  output diff,borrow;
  input a, b;
  assign diff = a ^ b;
  assign borrow = (~a)&b;
endmodule

module FullSubtractor_using2halfsubtractors( diff,Bout, a, b, Bin);
  output diff, Bout;
  input a, b, Bin;
  wire diff1, bout1, bout2;
  HalfSubtractor HS1(diff1, bout1, a, b);
  HalfSubtractor HS2(diff, bout2, diff1, Bin);
  or g1(Bout, bout1, bout2);
endmodule
