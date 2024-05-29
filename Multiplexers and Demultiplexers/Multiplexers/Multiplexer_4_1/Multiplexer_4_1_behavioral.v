module mux4_1_behavioral(
  output reg Y,
  input [3:0] D,
  input [1:0] sel
  );
  always @(*) begin
    case(sel)
      2'b00: Y <= D[0];
      2'b01: Y <= D[1];
      2'b10: Y <= D[2];
      2'b11: Y <= D[3];
    endcase
  end
endmodule
