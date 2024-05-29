module demux_1_8_behavioral(
  output reg [7:0] y,
  input [2:0] sel,
  input d
  );
  always @(*) begin
    y=0;
    case(sel)
      3'd0: y[0]=d; //3'b000
      3'd1: y[1]=d;
      3'd2: y[2]=d;
      3'd3: y[3]=d;
      3'd4: y[4]=d;
      3'd5: y[5]=d;
      3'd6: y[6]=d;
      3'd7: y[7]=d;
    endcase
  end
endmodule
