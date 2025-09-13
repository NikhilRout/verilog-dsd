module BoothAlgoNbit_seq #(parameter N = 4)(
    input [N-1:0] M, Q,
    input clk, rst,
    output [2*N-1:0] Prod
);
    localparam counter_size = $clog2(N);
    reg[counter_size:0] i;
    reg [2*N:0] Z;

    always @(posedge clk) begin
        if(rst) begin
            Z[2*N:N] <= 0;  //{carry,acc}
            Z[N-1:0] <= Q;  //multiplier
            i = N;
        end else begin
            if(i != 0) begin
                if(Z[0])
                    Z[2*N:N] = Z[2*N-1:N] + M;
                Z = Z >> 1;
                i = i - 1;
            end
        end
    end
    assign Prod = Z[2*N-1:0];
endmodule
