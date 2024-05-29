module demux_1_8_testbench;
  reg d;
  reg [2:0] sel;
  wire [7:0] y;
  integer i;
  demux_1_8_behavioral uut(.y(y),.d(d),.sel(sel));
  initial begin
    d = 1;
    $monitor("D = %b, Sel = %b, Y = %b",d,sel,y);
    for (i  = 0; i<8; i=i+1) begin
      sel = i;
      #100;
    end
    $stop;
  end
endmodule
