module serial_adder_mealy (
    input clk, rst, a, b,
    output reg sum
);
    parameter G = 1'b0, H = 1'b1;
    reg cs,ns;

    //synchronous state updates and reset
    always @(posedge clk) begin
        if(rst)
            cs <= G;
        else
            cs <= ns;
    end

    //next state + output logic
    always @(cs, a, b) begin
        case(cs)
            G: begin
                sum <= a ^ b;
                ns <= (a & b) ? H : G;
            end
            H: begin
                sum <= a ~^ b;
                ns <= ~(a | b) ? G : H;
            end
            default: ns <= G;
        endcase
    end
endmodule
