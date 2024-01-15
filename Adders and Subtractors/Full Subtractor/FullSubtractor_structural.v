module FullSubtractor_structural( diff, Bout, a, b , Bin);
  output diff, Bout;
  input a, b, Bin;
  wire a_bar, axb, axb_bar, borrow1, borrow2;
  xor(axb, a, b);
  not(a_bar, a);
  and(borrow1, a_bar, b);
  xor(diff, axb, Bin);
  not(axb_bar,axb);
  and(borrow2, axb_bar, Bin);
  or(Bout, borrow1, borrow2);
endmodule
  
