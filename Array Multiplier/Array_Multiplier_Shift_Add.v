module array_multiplier #(parameter N = 3, M = 4)(
  input [N-1:0] A,
  input [M-1:0] B,
  output reg [N+M-1:0] product
);
  reg [M+N-1:0] partial_products; //1 register of size(bit width) M+N
  integer i,j;
  always@(*) begin
    product = (N+M)*{1'b0};
    for (i= 0;i<N;i=i+1) begin
      partial_products = (M)*{1'b0};
      for (j = 0; j<M; j=j+1) begin
        partial_products = partial_products >> 1;
        partial_products[M-1] = A[i] & B[j];
      end
      partial_products = partial_products << i;
      product = product + partial_products;
    end
  end
endmodule
