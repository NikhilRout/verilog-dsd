module dff_master_slave (
    input clk, d,
    output q
);
    wire clk_bar, q_int;
    not(clk_bar, clk);
    d_latch dl0(.en(clk_bar), .d(d), .q(q_int));
    d_latch dl1(.en(clk), .d(q_int), .q(q));
endmodule

module d_latch(
    input en, d,
    output q
);
    wire d_bar, r_in, s_in, q_bar;
    not(d_bar, d);
    nand g0(r_in, d, en);
    nand g1(s_in, d_bar, en);
    nand g2(q_bar, s_in, q);
    nand g3(q, r_in, q_bar);
endmodule
