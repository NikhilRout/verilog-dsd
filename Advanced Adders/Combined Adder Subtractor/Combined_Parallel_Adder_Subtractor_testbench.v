module Combined_Parallel_Adder_Subtractor_testbench;
  reg [6:0] A, B;
  reg ctrl;
  wire [7:0] signed_Y;
  wire cout;
  Combined_Parallel_Adder_Subtractor uut(.A(A), .B(B), .ctrl(ctrl), .signed_Y(signed_Y), .cout(cout));
  initial begin
    A = 7'b1000000; B = 7'b1010101; ctrl = 1'b0;
    #100;
    A = 7'b0000000; B = 7'b1111111; ctrl = 1'b1;
    #100;
  $stop;
  end
endmodule