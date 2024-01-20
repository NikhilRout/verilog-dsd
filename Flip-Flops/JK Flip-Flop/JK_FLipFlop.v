module JK_FLipFlop(
  input clk, rst, J, K,
  output reg q,
  output q_bar
);
  always @(posedge clk) begin
    if (rst)
      q <= 0;
    else begin
      case({J,K})
        2'b00: q <= q;
        2'b01: q <= 0;
        2'b10: q <= 1;
        2'b11: q <= ~q;
      endcase
    end
  end
  assign q_bar = ~q;
endmodule

