module FSM_example (
    input clk, rst, req0, req1,
    output reg gnt0, gnt1
);
    parameter SIZE = 3;
    parameter IDLE = 3'b001, GNT0 = 3'b010, GNT1 = 3'b100; //one-hot encoding

    reg [SIZE-1:0] state;
    reg [SIZE-1:0] next_state;

    //----------Next State Combinational Logic-------------
    always @(state or req0 or req1) begin
        next_state = 3'b000;
        case(state)
        IDLE: 
        if(req0 == 1'b1) begin
            next_state = GNT0;
        end else if(req1 == 1'b1) begin
            next_state = GNT1;
        end else begin
            next_state = IDLE;
        end
        GNT0:
        if(req0 == 1'b1) begin
            next_state = GNT0;
        end else begin
            next_state = IDLE;
        end
        GNT1:
        if(req1 == 1'b1) begin
            next_state = GNT1;
        end else begin
            next_state = IDLE;
        end
        default: next_state = IDLE;
        endcase
    end

    //----------Sequential Logic-------------
    always @(posedge clk) begin
        if(rst == 1'b1) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    //----------Output Logic-------------
    always @(posedge clk) begin
        if(rst == 1'b1) begin
            gnt0 <= 1'b0;
            gnt1 <= 1'b0;
        end else begin
            case(state)
            IDLE:
            begin
                gnt0 <= 1'b0;
                gnt1 <= 1'b0;
            end
            GNT0:
            begin
                gnt0 <= 1'b1;
                gnt1 <= 1'b0;
            end
            GNT1:
            begin
                gnt0 <= 1'b0;
                gnt1 <= 1'b1;
            end
            default:
            begin
                gnt0 <= 1'b0;
                gnt1 <= 1'b0;
            end
            endcase
        end       
    end
endmodule
