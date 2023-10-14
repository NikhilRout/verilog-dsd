module SR_FlipFlop(
  input clk, R, S,
  output reg Q,
  output Qbar
);
  always@(posedge clk) begin
    case({S,R})
      2'b00: Q <= Q;
      2'b01: Q <= 1'b0;
      2'b10: Q <= 1'b1;
      2'b11: Q <= 1'bx;
    endcase
  end
  assign Qbar = ~Q;
endmodule
