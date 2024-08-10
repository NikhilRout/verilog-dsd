module tristate_buffer (
    input data_in, en,
    output data_out
);
    assign data_out = en ? data_in : 1'bz;
endmodule
