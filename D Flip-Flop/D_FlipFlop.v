module D_FlipFlop(
  input clk, rst, D,
  output reg Q
);
  always @(posedge clk) begin
      Q <= D;
  end 
endmodule