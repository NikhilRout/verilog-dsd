module serial_adder_moore (
    input clk, rst, a, b,
    output reg sum
);

    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    reg [1:0] cs, ns;

    //synchronous state updates and reset
    always @(posedge clk) begin
        if(rst)
            cs <= s0;
        else
            cs <= ns;
    end

    //next state logic
    always @(cs, a, b) begin
        case(cs)
            s0: begin
                    case({a, b})
                        2'b00: ns <= s0;
                        2'b01: ns <= s1;
                        2'b10: ns <= s1;
                        2'b11: ns <= s2;
                    endcase
            end
            s1: begin
                    case({a, b})
                        2'b00: ns <= s0;
                        2'b01: ns <= s1;
                        2'b10: ns <= s1;
                        2'b11: ns <= s2;
                    endcase
            end
            s2: begin
                    case({a, b})
                        2'b00: ns <= s1;
                        2'b01: ns <= s2;
                        2'b10: ns <= s2;
                        2'b11: ns <= s3;
                    endcase 
            end                   
            s3: begin
                    case({a, b})
                        2'b00: ns <= s1;
                        2'b01: ns <= s2;
                        2'b10: ns <= s2;
                        2'b11: ns <= s3;
                    endcase
            end

            /*alternatively
            s0: ns = (A & B) ? s2 : ((a | b) ? s1 : s0); //worse critical path
            s1: ns = (A & B) ? s2 : ((a | b) ? s1 : s0);   since its 2 cascaded 2:1 MUX
            s2: ns = (A & B) ? s3 : ((a | b) ? s2 : s1);   instead of 1 4:1 MUX
            s3: ns = (A & B) ? s3 : ((a | b) ? s2 : s1);
            */

        endcase
    end

    //output logic
    always @(cs) begin
        case(cs)
            s0: sum <= 1'b0;
            s1: sum <= 1'b1;
            s2: sum <= 1'b0;
            s3: sum <= 1'b1;
        endcase
    end        
endmodule
