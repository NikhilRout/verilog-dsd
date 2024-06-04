module gray_counter #(parameter N = 4)(
  input clk, rstn,
  output reg [N-1:0] out
);
  reg [N-1:0] q;
  integer i;
  always @(posedge clk) begin
    if(!rstn)
      q <= 0;
    else begin
      q <= q + 1;
      out[N-1] = q[N-1];
      for(i = 0; i < N-1; i = i + 1)
        out[i] <= q[i+1] ^ q[i];
    end
  end
endmodule
