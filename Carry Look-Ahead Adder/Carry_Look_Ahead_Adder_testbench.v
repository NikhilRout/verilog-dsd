module Carry_Look_Ahead_Adder_testbench;
  parameter WIDTH = 3;
  reg [WIDTH-1:0] A, B;
  wire [WIDTH:0] RESULT;
  Carry_Look_Ahead_Adder #(.WIDTH(WIDTH)) uut(.A(A), .B(B), .RESULT(RESULT));
  initial begin
    A = 3'b001; B = 3'b100;
    #100;
    A = 3'b111; B = 3'b010;
    #100;
  end
endmodule
