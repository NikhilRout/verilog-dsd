module SR_Latch_behavioral(
    input R, S, EN,
    output reg Q,
    output Qbar
);
  always @(*) begin
    if (EN) begin
      case({S,R})
        2'b00: Q <= Q; // No change (latch)
        2'b01: Q <= 1'b0; // reset
        2'b10: Q <= 1'b1; // set
        2'b11: Q <= 1'bx; // Invalid inputs
      endcase
    end
  end
  assign Qbar = ~Q;
endmodule

