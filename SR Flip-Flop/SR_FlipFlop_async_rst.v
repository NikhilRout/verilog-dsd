module SR_FlipFlop_async_rst(
  input clk, rst, R, S,
  output reg Q,
  output Qbar
);
  always@(posedge clk or posedge rst) begin
    if (rst) Q <= 1'b0;
    else begin
      case({S,R})
        2'b00: Q <= Q;
        2'b01: Q <= 1'b0;
        2'b10: Q <= 1'b1;
        2'b11: Q <= 1'bx;
      endcase
    end
  end
  assign Qbar = ~Q;
endmodule