module SeqDec_1001_mealyNO (
    input clk, rst, data_in,
    output reg data_out
);
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] cs, ns;

    always @(posedge clk) begin
        if(rst)
            cs <= A;
        else
            cs <= ns;
    end

    always @(cs, data_in) begin
        case(cs)
            A: begin
                if(data_in) begin
                    ns <= B;
                    data_out = 1'b0;
                end else begin
                    ns <= A;
                    data_out = 1'b0;
                end
            end
            B: begin
                if(data_in) begin
                    ns <= B;
                    data_out = 1'b0;
                end else begin
                    ns <= C;
                    data_out = 1'b0;
                end
            end
            C: begin
                if(data_in) begin
                    ns <= B;
                    data_out = 1'b0;
                end else begin
                    ns <= D;
                    data_out = 1'b0;
                end
            end
            D: begin
                if(data_in) begin
                    ns <= A;
                    data_out = 1'b1;
                end else begin
                    ns <= A;
                    data_out = 1'b0;
                end
            end
            default: ns <= A;
        endcase
    end
endmodule
