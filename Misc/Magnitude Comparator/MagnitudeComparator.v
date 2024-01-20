module MagnitudeComparator(
  input [3:0] A, B,
  output reg lesser, equal, greater
);
  always @(*) begin
    if(A > B) begin
      greater = 1;
      equal = 0;
      lesser = 0;
    end else if(A == B) begin
      greater = 0;
      equal = 1;
      lesser = 0;
    end else begin
      greater = 0;
      equal = 0;
      lesser = 1;
    end
  end
endmodule
