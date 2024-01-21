module Priority_Encoder_behavioral(
  input [3:0] D,
  output reg [1:0] Y,
  output reg valid_bit
);
  always @(*) begin
    if(D == 0) begin
      Y = 2'bxx;
      valid_bit = 1'b0;
    end else begin
      valid_bit = 1'b1;
      case (D)
        4'b0001: Y = 2'b00;
        4'b001x: Y = 2'b01;
        4'b01xx: Y = 2'b10;
        4'b1xxx: Y = 2'b11;
        default: Y = 2'bxx;
      endcase
    end
  end
endmodule
