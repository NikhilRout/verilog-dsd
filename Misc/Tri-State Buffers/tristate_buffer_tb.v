module tristate_buffer_tb;
  reg data_in, en;
  wire data_out;
  tristate_buffer uut(.data_in(data_in), .en(en), .data_out(data_out));
  initial begin
    en = 0; data_in = 0;
    #100 en = 0; data_in = 1;
    #100 en = 1; data_in = 0;
    #100 en = 1; data_in = 1;
    #100;
    $stop;
  end
endmodule
