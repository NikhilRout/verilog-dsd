module SR_Latch_testbench;
  reg R, S, EN;
  wire Q, Qbar;
  SR_Latch_dataflow uut (.R(R),.S(S),.EN(EN), .Q(Q), .Qbar(Qbar));
  initial begin
    $monitor("EN=%b R=%b S=%b, Q=%b, Qbar=%b", EN, R, S, Q,Qbar);
    EN = 1; R = 0; S = 0;
    #100 R = 0; S = 1;
    #100 R = 1; S = 0;
    #100 EN = 0; R = 0; S = 1; //verifying enable
    #100 EN = 1; R = 1; S = 1;
    #100;
    $stop;
  end
endmodule
