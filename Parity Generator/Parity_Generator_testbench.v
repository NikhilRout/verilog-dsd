module Parity_Generator_testbench;
  reg [3:0] data_in;
  wire [4:0] data_out;
  integer i;
  Parity_Generator_structural uut(.data_in(data_in), .data_out(data_out));
  initial begin
    $monitor("D = %b, Pe = %b", data_in, data_out[0]);
    for(i=0; i<16; i=i+1) begin
      data_in = i;
      #100;
    end
    $stop;
  end
endmodule
