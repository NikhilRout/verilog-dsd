module FullAdder(a, b, Cin, sum);
  input a, b, Cin;
  output sum;
  assign sum = a ^ b ^ Cin;
endmodule

module Carry_Look_Ahead_Adder #(parameter WIDTH)(
  input [WIDTH-1:0] A, B,
  output [WIDTH:0] RESULT
);
  
  wire [WIDTH:0] w_C;
  wire [WIDTH-1:0] w_G, w_P, w_SUM;
  
  //Full Adders instantiation
  genvar i;
  generate
    for(i=0; i<WIDTH; i=i+1) begin
      FullAdder FA_inst(A[i], B[i], w_C[i], w_SUM[i]);
    end
  endgenerate
 
  //Creating the Generate (G) Terms:  Gi=Ai*Bi
  //             Propagate Terms: Pi=Ai+Bi
  //             Carry Terms: G_i + P_i * C_i-1
  genvar j;
  generate
    for(j=0; j<WIDTH; j=j+1) begin
      assign w_G[j]   = A[j] & B[j];
      assign w_P[j]   = A[j] | B[j];
      assign w_C[j+1] = w_G[j] | (w_P[j] & w_C[j]);
    end
  endgenerate
   
  assign w_C[0] = 1'b0; //no carry input on first adder
  assign RESULT = {w_C[WIDTH], w_SUM};
endmodule
