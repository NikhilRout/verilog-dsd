module SR_Latch_dataflow(
    input R, S, EN,
    output Q, Qbar
);
  assign Q = (EN) ? ~(R | Qbar) : Q;
  assign Qbar = (EN) ? ~(S | Q) : Qbar;

endmodule

