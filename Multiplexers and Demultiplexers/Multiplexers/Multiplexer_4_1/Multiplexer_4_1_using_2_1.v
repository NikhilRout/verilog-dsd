//4:1 mux using 2:1 mux
module mux2_1(
  output Y,
  input [1:0] D,
  input sel
  );
  assign Y = sel?D[1]:D[0]; //if sel = 1 y = D[1], if sel = 0, y = D[0]
endmodule

module mux4_1_using2_1(
  output Y,
  input [3:0] D,
  input [1:0] sel
  );
  wire upper_mux, lower_mux;
  mux2_1 umux(.Y(upper_mux), .D({D[0],D[1]}), .sel(sel[0]));
  mux2_1 lmux(.Y(lower_mux), .D({D[2],D[3]}), .sel(sel[0]));
  mux2_1 top(.Y(Y), .D({upper_mux,lower_mux}), .sel(sel[1]));
endmodule
