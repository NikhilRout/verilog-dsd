module D_Latch_behavioral(
  input D, EN,
  output reg Q, Qbar
);
  always @(*) begin
    if(EN) begin
      Q <= D;
    end
  assign Qbar = ~Q;
  end
endmodule
