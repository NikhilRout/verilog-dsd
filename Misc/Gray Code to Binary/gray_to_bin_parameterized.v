module gray_to_bin_parameterized #(parameter N = 8, M =8)(
  input [N-1:0] gray,
  output [M-1:0] bin
);
  assign bin[M-1] = gray[N-1];
  genvar i;
  generate
    for(i=N-1;i>0;i=i-1) begin
      assign bin[i-1] = bin[i] ^ gray[i-1];
    end
  endgenerate
endmodule
