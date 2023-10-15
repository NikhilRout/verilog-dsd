module T_FlipFlop(
  input clk, rst, T,
  output reg q,
  output q_bar
);
  always @(posedge clk) begin
    if (rst)
      q <= 0;
    else
      q <= T ? ~q : q;
  end
  assign q_bar = ~q;
endmodule
