module JK_FLipFLop_testbench;
  reg clk, rst, J, K;
  wire q, q_bar;
  JK_FLipFlop uut(.clk(clk), .rst(rst), .J(J), .K(K), .q(q), .q_bar(q_bar));
  always #10 clk = ~clk;
  initial begin
    clk = 0;
    $monitor("J = %b, K = %b, Q = %b, Qbar = %b", J, K, q, q_bar);
    rst = 1;
    #100 rst = 0; J = 0; K = 0;
    #100 J = 0; K = 1;
    #100 J = 1; K = 0;
    #100 J = 1; K = 1; 
    #100;
    $stop;
  end
endmodule
