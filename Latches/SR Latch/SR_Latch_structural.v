module SR_Latch_structural(
  input R, S, EN,
  output Q, Qbar
);
  wire Rin, Sin;
  and(Rin, R, EN);
  and(Sin, S, EN);
  nor(Q, Rin, Qbar);
  nor(Qbar, Sin, Q);
endmodule
