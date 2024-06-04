module gray_to_bin_tb;
  reg [3:0] gray;
  wire [3:0] bin;
  gray_to_bin uut(.gray(gray), .bin(bin));
  integer i;
  initial begin
    $monitor("Gray = %b, Binary = %b", gray, bin);
    for(i=0;i<16;i=i+1) begin
      gray = i;
      #100;
    end
    $stop;
  end
endmodule

