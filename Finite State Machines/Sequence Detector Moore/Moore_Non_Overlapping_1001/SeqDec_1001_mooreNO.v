module SeqDec_1001_mooreNO (
    input clk, rst, data_in,
    output reg data_out
);
    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
    reg [2:0] cs, ns;

    always @(posedge clk) begin
        if(rst)
            cs <= A;
        else
            cs <= ns;
    end

    always @(cs, data_in) begin
        case(cs)
            A: ns <= data_in ? B : A;
            B: ns <= data_in ? B : C;
            C: ns <= data_in ? B : D;
            D: ns <= data_in ? E : A;
            E: ns <= data_in ? B : A;
            default: ns <= A;
        endcase
    end

    always @(cs) begin
        data_out = (cs == E) ? 1'b1 : 1'b0;
    end
endmodule
