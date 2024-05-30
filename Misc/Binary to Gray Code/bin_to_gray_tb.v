module bin_to_gray_tb;
  reg [3:0] bin;
  wire [3:0] gray;
  bin_to_gray uut(.bin(bin), .gray(gray));
  integer i;
  initial begin
    $monitor("Binary = %b, Gray = %b", bin, gray);
    for(i=0;i<16;i=i+1) begin
      bin = i;
      #100;
    end
    $stop;
  end
endmodule

