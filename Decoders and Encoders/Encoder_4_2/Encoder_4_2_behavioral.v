module Encoder_4_2_behavioral(
  output reg [1:0] Y,
  input [3:0] D
);
  always @(*) begin
    case(D)
      4'b0001: Y = 2'b00;
      4'b0010: Y = 2'b01;
      4'b0100: Y = 2'b10;
      4'b1000: Y = 2'b11;
      default: Y = 2'b00;
    endcase
  end
endmodule
