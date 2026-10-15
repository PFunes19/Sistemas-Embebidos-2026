module signed_counter_fsm (
    input wire clk,
    input wire reset,
    input wire tick,
    input wire pause_pulse,
    input wire inc_pulse,
    input wire dec_pulse,
    output reg signed [8:0] count,
    output reg [1:0] state  
);                  

    reg [1:0] next_state;

    localparam [1:0] S_PAUSE = 2'd0;
    localparam [1:0] S_UP    = 2'd1;
    localparam [1:0] S_DOWN  = 2'd2;
    

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S_PAUSE;
        end else begin
            state <= next_state;  
        end
    end
    

    always @(*) begin
        next_state = state;
        case (state)
            S_UP : begin 
                if (pause_pulse)      next_state = S_PAUSE;
                else if (dec_pulse)   next_state = S_DOWN;
            end 
            S_DOWN : begin 
                if (pause_pulse)      next_state = S_PAUSE;
                else if (inc_pulse)   next_state = S_UP;
            end
            S_PAUSE : begin 
                if (dec_pulse)        next_state = S_DOWN;
                else if (inc_pulse)   next_state = S_UP;
            end
            default: next_state = S_PAUSE;
        endcase
    end     
        
   
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 1'b0;
        end else begin
            if (state == S_UP && tick) begin
                count <= count + 1'b1;
            end else if (state == S_DOWN && tick) begin
                count <= count - 1'b1;
            end
        end
    end

endmodule