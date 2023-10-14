module SR_Latch_behavioral(
    input R, S, EN,
    output reg Q, Qbar
);
    always @(EN) begin
    if (EN) begin
      Q <= ~(R | Qbar);
      Qbar <= ~(S | Q);
    end
  end

endmodule

