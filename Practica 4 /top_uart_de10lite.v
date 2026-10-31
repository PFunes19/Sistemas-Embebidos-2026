module top_uart_de10lite(
    input  wire CLOCK_50,
    input  wire RESET_N,
    input  wire UART_RX,
    output wire UART_TX
);

wire reset;
assign reset = ~RESET_N;

wire [7:0] rx_data;
wire       rx_done;
reg  [7:0] tx_data;
reg        tx_start;
wire       tx_busy;

// Registro temporal para no perder el dato si el TX está ocupado
reg [7:0] holding_register;
reg       data_ready;

uart_rx #(
    .CLK_FREQ(50000000),
    .BAUD_RATE(9600)
) RX0 (
    .clk(CLOCK_50),
    .reset(reset),
    .rx(UART_RX),
    .data_out(rx_data),
    .data_valid(rx_done)
);

uart_tx #(
    .CLK_FREQ(50000000),
    .BAUD_RATE(9600)
) TX0 (
    .clk(CLOCK_50),
    .reset(reset),
    .tx_start(tx_start),
    .data_in(tx_data),
    .tx(UART_TX),
    .busy(tx_busy)
);


always @(posedge CLOCK_50 or posedge reset) begin
    if (reset) begin
        tx_data          <= 8'd0;
        tx_start         <= 1'b0;
        holding_register <= 8'd0;
        data_ready       <= 1'b0;
    end else begin
        tx_start <= 1'b0;

     
        if (rx_done) begin
            holding_register <= rx_data + 8'd1;
            data_ready       <= 1'b1;
        end

      
        if (data_ready && !tx_busy && !tx_start) begin
            tx_data    <= holding_register;
            tx_start   <= 1'b1;
            data_ready <= 1'b0;
        end
    end
end

endmodule
