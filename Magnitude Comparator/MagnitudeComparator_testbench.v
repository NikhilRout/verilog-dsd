module MagnitudeComparator_testbench;
  reg [3:0] A, B;
  wire lesser, equal, greater;
  MagnitudeComparator uut(.A(A), .B(B), .lesser(lesser), .equal(equal), .greater(greater));
  initial begin
    A = 4'b1001; B = 4'b0100;
    #100; A = 4'b1010; B = 4'b1010;
    #100; A = 4'b0011; B = 4'b1100;
    #100;
    $stop;
  end
endmodule
