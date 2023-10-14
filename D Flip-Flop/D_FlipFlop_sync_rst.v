module D_FlipFlop_sync_rst(
  input clk, rst, D,
  output reg Q
);
  always @(posedge clk) begin
    if (rst) 
      Q <= 1'b0;
    else
      Q <= D;
  end 
endmodule
