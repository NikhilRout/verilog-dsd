module T_FlipFlop_testbench;
  reg clk, rst, T;
  wire q, q_bar;
  T_FlipFlop uut(.clk(clk),.rst(rst), .T(T), .q(q), .q_bar(q_bar));
  always #10 clk = ~clk;
  initial begin
    clk = 1;
    $monitor("T = %b, Q = %b", T, q);
    rst = 1;
    #100; rst = 0; T = 0;
    #100 T = 1;
    #100 T = 0;
    #100 T = 1;
    #100;
    $stop;
  end
endmodule

