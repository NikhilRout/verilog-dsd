module HalfAdder_testbench;
  reg a,b;
  wire sum,carry;
  HalfAdder_dataflow uut(.sum(sum),.carry(carry),.a(a),.b(b)); //alternatively call HalfAdder_structural module
  initial begin
    $monitor ("A = %b, B = %b, CARRY = %b, SUM = %b.",a,b,carry,sum);
    a = 0; b = 0;
    #100 a = 0; b = 1;
    #100 a = 1; b = 0;
    #100 a = 1; b = 1;
    #100;
    $stop;
   end
endmodule
