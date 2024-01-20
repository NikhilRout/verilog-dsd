module SR_FlipFlop_testbench;
  reg clk, rst, R, S;
  wire q, q_bar;
  SR_FlipFlop uut(.clk(clk), .rst(rst), .R(R), .S(S), .q(q), .q_bar(q_bar));
  always #10 clk = ~clk;
  initial begin
    clk = 1;
    $monitor("RST = %b, S = %b, R = %b, Q = %b, Qbar = %b", rst, S, R, q, q_bar);
    rst = 1;
    #100 rst = 0; S = 0; R = 0;
    #100 S = 0; R = 1;
    #100 S = 1; R = 0;
    #100 S = 1; R = 1;
    #100;
    $stop;
  end
endmodule  
