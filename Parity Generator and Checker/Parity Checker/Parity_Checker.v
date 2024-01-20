//4-bit parity checker transmitted as {data_in, paraity_bit}

module Parity_Checker_Even(
  input [4:0] received,
  output checker_even
);
  assign checker_even = (received[0] == ^received[4:1]) ? 1'b0 : 1'b1;
  // 0 => transmitted corrctly
  // 1 => error in transmission
endmodule
