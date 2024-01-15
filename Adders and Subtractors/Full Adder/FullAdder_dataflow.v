module FullAdder_dataflow(sum,carry,a,b,Cin);
  output sum,carry;
  input a,b,Cin;
  assign sum = a^b^Cin;
  assign carry  = (a&b)|(Cin&(a|b)); //alternatively (a&b)|(Cin&a)|(Cin&b)
endmodule
