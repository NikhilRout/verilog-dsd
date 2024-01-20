module Decoder_2_4_testbench;
  reg a, b, en;
  wire y0, y1, y2, y3;
  Decoder_2_4_dataflow uut(.a(a), .b(b), .en(en),.y0(y0), .y1(y1), .y2(y2), .y3(y3));
  initial begin
    a = 1'bx; b = 1'bx; en = 0;
    #100 a = 0; b = 0; en = 1;
    #100 a = 0; b = 1; en = 1;
    #100 a = 1; b = 0; en = 1;
    #100 a = 1; b = 1; en = 1;
    #100;
  end
endmodule
