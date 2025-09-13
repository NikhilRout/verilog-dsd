module RippleCarryAdder_nBit_testbench;
  parameter N = 4;
  reg [N-1:0] A, B;
  wire [N-1:0] sum;
  wire cout;
  RippleCarryAdder_nBit #(.N(N)) uut(.A(A), .B(B), .sum(sum), .cout(cout));
  initial begin
    $random;
    repeat (10) begin
      A = $urandom_range(0,2**N-1);
      B = $urandom_range(0,2**N-1);
      $display("A = %d, B = %d", $unsigned(A), $unsigned(B));
      #100;
      $display("Sum = %d, Carry = %d", $unsigned(sum), $unsigned(cout));
    end
    $stop;
  end
endmodule
