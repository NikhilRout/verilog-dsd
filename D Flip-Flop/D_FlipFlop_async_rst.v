module D_FlipFlop_async_rst(
  input clk, rst, D,
  output reg Q
);
  always @(posedge clk or posedge rst) begin
    if (rst) 
      Q <= 1'b0;
    else
      Q <= D;
  end 
endmodule
