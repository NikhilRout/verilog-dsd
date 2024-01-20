module SR_FlipFlop(
  input clk, rst, R, S,
  output reg q,
  output q_bar
);
  always@(posedge clk) begin //add <or posedge rst> for asynchronous rest
    if (rst) q <= 1'b0; //change to <!rst> for active low reset signal
    else begin
      case({S,R})
        2'b00: q <= q;
        2'b01: q <= 1'b0;
        2'b10: q <= 1'b1;
        2'b11: q <= 1'bx;
      endcase
    end
  end
  assign q_bar = ~q;
endmodule
