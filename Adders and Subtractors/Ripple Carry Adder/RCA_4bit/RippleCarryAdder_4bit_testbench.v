module RippleCarryAdder_4bit_testbench;
  reg [3:0] A, B;
  wire [3:0] sum;
  wire cout;
  RippleCarryAdder_4bit uut(.A(A), .B(B), .sum(sum), .cout(cout));
  initial begin
    $random;
    repeat (10) begin
      A = $urandom_range(0,15);
      B = $urandom_range(0,15);
      $display("A = %d, B = %d", $unsigned(A), $unsigned(B));
      #100;
      $display("Sum = %d, Carry = %d", $unsigned(sum), $unsigned(cout));
    end
    $stop;
  end
endmodule
