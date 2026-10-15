module vending_machine(
    input wire clk,
    input wire rst,
    input wire m5,
    input wire m10,
    output reg dispensar
);

    reg [1:0] state, next_state;

    localparam C0  = 2'd0,
               C5  = 2'd1,
               C10 = 2'd2;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= C0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)

            C0: begin
                if (m10)
                    next_state = C10;
                else if (m5)
                    next_state = C5;
                else
                    next_state = C0;
            end

            C5: begin
                if (m5 || m10)
                    next_state = C10;
                else
                    next_state = C5;
            end

            C10:
                next_state = C0;

            default:
                next_state = C0;

        endcase
    end

    always @(*) begin
        case (state)

            C10:
                dispensar = 1'b1;

            default:
                dispensar = 1'b0;

        endcase
    end

endmodule
