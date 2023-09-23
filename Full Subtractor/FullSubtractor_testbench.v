module FullSubtractor_testbench;
  reg a, b, Bin;
  wire diff, Bout;
  FullSubtractor_using2halfsubtractors uut(.diff(diff),.Bout(Bout),.a(a),.b(b),.Bin(Bin));
  initial begin
    $monitor ("A = %b, B = %b, Bin = %b DIFF = %b, BORROW = %b.",a,b,Bin,diff,Bout);
    a = 0; b = 0; Bin = 0;
    #100 a = 0; b = 0; Bin = 1;
    #100 a = 0; b = 1; Bin = 0;
    #100 a = 0; b = 1; Bin = 1;
    #100 a = 1; b = 0; Bin = 0;
    #100 a = 1; b = 0; Bin = 1;
    #100 a = 1; b = 1; Bin = 0;
    #100 a = 1; b = 1; Bin = 1;
    #100;
    $stop;
  end
endmodule
