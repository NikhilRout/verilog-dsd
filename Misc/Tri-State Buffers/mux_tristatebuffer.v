module mux_tristatebuffer (
    input [3:0] D,
    input [1:0] sel,
    output Y
);

    wire w0, w1, w2, w3;
    decoder_2_4 d0(.in(sel), .y0(w0), .y1(w1), .y2(w2), .y3(w3));
    tristate_buffer u0(.data_in(D[0]), .en(w0), .data_out(Y));
    tristate_buffer u1(.data_in(D[1]), .en(w1), .data_out(Y));
    tristate_buffer u2(.data_in(D[2]), .en(w2), .data_out(Y));
    tristate_buffer u3(.data_in(D[3]), .en(w3), .data_out(Y));
endmodule

module decoder_2_4(
  input [1:0] in,
  output y0,y1,y2,y3
);
  assign y0 = (~in[0]) & (~in[1]);
  assign y1 = (~in[0]) & in[1];
  assign y2 = in[0] & (~in[1]);
  assign y3 = in[0] & in[1];
endmodule

module tristate_buffer (
    input data_in, en,
    output data_out
);
    assign data_out = en ? data_in : 1'bz;
endmodule
