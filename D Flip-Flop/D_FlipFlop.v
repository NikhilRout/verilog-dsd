module D_FlipFlop(
  input clk, D,
  output reg Q
);
  always @(posedge clk) begin
      Q <= D;
  end 
endmodule
