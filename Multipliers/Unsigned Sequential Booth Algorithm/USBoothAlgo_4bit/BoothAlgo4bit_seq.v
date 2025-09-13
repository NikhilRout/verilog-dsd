module BoothAlgo4bit_seq (
    input [3:0] M, Q,
    input clk, rst,
    output [7:0] Prod
);
    reg[2:0] i;
    reg [8:0] Z;

    always @(posedge clk) begin
        if(rst) begin
            Z[8:4] <= 0;  //{carry,acc}
            Z[3:0] <= Q;  //multiplier
            i = 4;
        end else begin
            if(i != 0) begin
                if(Z[0])
                    Z[8:4] = Z[7:4] + M;
                Z = Z >> 1;
                i = i - 1;
            end
        end
    end
    assign Prod = Z[7:0];
endmodule
