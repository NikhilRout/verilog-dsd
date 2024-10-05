module SignExtenderMtoN #(parameter N = 9, M = 16)(
    input [N-1:0] in,
    output [M-1:0] out
);
    assign out = { {M-N{in[N-1]}}, in};
endmodule
