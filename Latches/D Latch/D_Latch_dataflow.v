module D_Latch_dataflow(
  input D, EN,
  output Q, Qbar
);
  assign Q = EN ? D : Q;
  assign Qbar = EN ? ~D : Qbar;
endmodule
