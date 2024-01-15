module FullAdder_testbench;
  reg a,b,c;
  wire sum,carry;
  FullAdder_using2halfadders uut(.sum(sum),.carry(carry),.a(a),.b(b),.Cin(c));
  initial begin
    $monitor ("A = %b, B = %b, C = %b CARRY = %b, SUM = %b.",a,b,c,carry,sum);
    a = 0; b = 0; c = 0;
    #100 a = 0; b = 0; c = 1;
    #100 a = 0; b = 1; c = 0;
    #100 a = 0; b = 1; c = 1;
    #100 a = 1; b = 0; c = 0;
    #100 a = 1; b = 0; c = 1;
    #100 a = 1; b = 1; c = 0;
    #100 a = 1; b = 1; c = 1;
    #100;
    $stop;
  end
endmodule
