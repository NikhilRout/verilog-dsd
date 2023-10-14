module D_Latch_behavioral(
  input D, EN,
  output reg Q,
  output Qbar
);
  always @(*) begin
    if(EN) begin
      Q <= D;
    end
  end
  assign Qbar = ~Q;
endmodule
