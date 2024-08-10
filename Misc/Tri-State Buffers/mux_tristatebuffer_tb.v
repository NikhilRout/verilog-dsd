module mux_tristatebuffer_tb;
  reg [3:0] D;
  reg [1:0] sel;
  wire Y;
  mux_tristatebuffer uut(.D(D), .sel(sel), .Y(Y));
  initial begin
    $monitor(" D = %b, sel = %b, Y = %b.",D,sel,Y);
    D = 4'b0110; //sample data
    sel = 2'b00;
    #100 sel = 2'b01;
    #100 sel = 2'b10;
    #100 sel = 2'b11;
    #100;
    $stop;
  end
endmodule