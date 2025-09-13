module array_multiplier_repetitive_addition #(parameter N = 3, M = 4)(
  input [N-1:0] A,
  input [M-1:0] B,
  output reg [N+M-1:0] product
);
  integer i;
  always@(*) begin
    product = (N+M)*{1'b0};
    for(i= 0; i < B; i=i+1) begin
      product = product + A;
    end
  end
endmodule
