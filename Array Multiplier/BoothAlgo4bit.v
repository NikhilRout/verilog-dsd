module BoothAlgo4bit (
    input [3:0] M, Q,
    output [7:0] Prod
);
    integer i;
    reg [8:0] Z;
    always @(*) begin

        Z[8:5] = 0;  //acc
        Z[4:1] = Q;  //multiplier
        Z[0] = 0;    //q0
        
        for(i = 0; i < 4; i = i + 1) begin
            case({Z[1], Z[0]})
                2'b01: begin
                    Z[8:5] = Z[8:5] + M;
                end
                2'b10: begin
                    Z[8:5] = Z[8:5] - M;
                end
            endcase

            Z = {Z[8], Z[8:1]};  //ASR with sign extension
        end
    end
    assign Prod = Z[8:1];
endmodule

