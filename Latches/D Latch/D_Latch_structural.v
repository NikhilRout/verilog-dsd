module D_Latch_Structural(
  input D, EN,
  output Q, Qbar
);
  wire D_bar, R_in, S_in;
  not(D_not, D);
  and R_eq(R_in, D_bar, EN);
  and S_eq(S_in, D, EN);
  nor(Q, R_in, Qbar);
  nor(Qbar, S_in, Q);
endmodule

