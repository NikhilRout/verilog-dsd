module bin_to_gray_parametrized #(parameter N = 8, M =8)(
  input [N-1:0] bin,
  output [M-1:0] gray
);
  assign gray[M-1] = bin[M-1];
  genvar i;
  generate
    for(i=N-1;i>0;i=i-1) begin
      assign gray[i-1] = bin[i] ^ bin[i-1];
    end
  endgenerate
endmodule
