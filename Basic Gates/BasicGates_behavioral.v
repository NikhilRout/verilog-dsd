module BasicGates_behavioral(Y_and,Y_or,Y_not,Y_nand,Y_nor,Y_xor,Y_xnor,a,b);
  input a,b;
  output reg Y_and, Y_or, Y_not, Y_nand, Y_nor, Y_xor, Y_xnor;
  always @(*) begin //alternatively write always @(a or b) begin
    //Y_not inverts input a

    if(a == 0 && b == 0) begin
      Y_and <= 1'b0;	
      Y_or <= 1'b0;
      Y_not <= 1'b1;
      Y_nand <= 1'b1;
      Y_nor <= 1'b1;
      Y_xor <= 1'b0;
      Y_xnor <= 1'b1;
    end
    
    if(a == 0 && b == 1) begin
      Y_and <= 1'b0;	
      Y_or <= 1'b1;
      Y_not <= 1'b1;
      Y_nand <= 1'b1;
      Y_nor <= 1'b0;
      Y_xor <= 1'b1;
      Y_xnor <= 1'b0;
    end
    
    if(a == 1 && b == 0) begin
      Y_and <= 1'b0;	
      Y_or <= 1'b1;
      Y_not <= 1'b0;
      Y_nand <= 1'b1;
      Y_nor <= 1'b0;
      Y_xor <= 1'b1;
      Y_xnor <= 1'b0;
    end
    
    if(a == 1 && b == 1) begin
      Y_and <= 1'b1;	
      Y_or <= 1'b1;
      Y_not <= 1'b0;
      Y_nand <= 1'b0;
      Y_nor <= 1'b0;
      Y_xor <= 1'b0;
      Y_xnor <= 1'b1;
    end
    
  end
endmodule
  