module Parity_Checker_testbench;
  reg [4:0] received;
  wire checker_even;
  Parity_Checker_Even uut(.received(received), .checker_even(checker_even));
  initial begin
    $monitor("Received = %b, Pce = %b", received, checker_even);
    received = 5'b10100;
    #100 received = 5'b10101;
    #100;
    $stop;
  end
endmodule
