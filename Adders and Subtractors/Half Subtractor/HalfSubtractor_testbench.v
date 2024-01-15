module HalfSubtractor_testbench;
  reg a,b;
  wire diff,borrow;
  HalfSubtractor_dataflow uut(.diff(diff),.Bout(borrow),.a(a),.b(b));
  initial begin	
    $monitor("A = %b, B = %b, Difference = %b, Borrow = %b",a,b,diff,borrow);
    a = 0; b = 0;
    #100 a = 0; b = 1;
    #100 a = 1; b = 0;
    #100 a = 1; b = 1;
    #100;
    $stop;
  end
endmodule
