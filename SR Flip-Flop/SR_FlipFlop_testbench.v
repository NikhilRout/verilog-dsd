module SR_FlipFlop_testbench;
  reg clk, rst, R, S;
  wire Q, Qbar;
  SR_FlipFlop_sync_rst uut(.clk(clk), .rst(rst), .R(R), .S(S), .Q(Q), .Qbar(Qbar));
  always #10 clk = ~clk;
  initial begin
    clk = 0;
    $monitor("RST = %b, S = %b, R = %b, Q = %b, Qbar = %b", rst, S, R, Q, Qbar);
    rst = 1; 
    #100; rst = 0; S = 0; R = 0;
    #100; S = 0; R = 1;
    #100; S = 1; R = 0;
    #100; S = 1; R = 1;
    #100;
    $stop;
  end
endmodule  
