module D_Latch_testebench;
  reg D, EN;
  wire Q, Qbar;
  D_Latch_behavioral uut(.D(D), .EN(EN), .Q(Q), .Qbar(Qbar));
  initial begin
    $monitor("EN = %b, D = %b, Q = %b, Qbar = %b", EN, D, Q, Qbar);
    EN = 1; D = 0;
    #100; D = 1;
    #100; EN = 0; D = 0; //remains latched (not enabled)
    #100; EN = 1; D = 0; //latch is set (enabled)
    #100;
    $stop;
  end
endmodule
