module mux4_1_tb;
  reg [3:0] D;
  reg [1:0] sel;
  wire Y;
  mux4_1_behavioral uut(.Y(Y),.D(D),.sel(sel));
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
