module BasicGates_testbench;
  reg a, b;
  wire Y_and,Y_or,Y_not,Y_nand,Y_nor,Y_xor,Y_xnor;
  BasicGates_dataflow uut(.Y_and(Y_and),.Y_or(Y_or),.Y_not(Y_not),.Y_nand(Y_nand),.Y_nor(Y_nor),.Y_xor(Y_xor),.Y_xnor(Y_xnor),.a(a),.b(b));
  initial begin
    $monitor("a = %b, b = %b, AND = %b, OR = %b, NOT = %b", a, b,Y_and,Y_or, Y_not);
    a = 0;b = 0;
    #100 a = 0; b = 1;
    #100 a = 1; b = 0;
    #100 a = 1; b = 1;
    #100; 
    $stop;
  end
endmodule
