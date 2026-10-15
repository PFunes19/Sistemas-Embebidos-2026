module semaforo_simple(
	input wire clk,
	input wire rst,
	output reg [1:0] luz
);

reg [1:0] state, next_state;

localparam ROJO = 2'b00;
localparam AMARILLO = 2'b01;
localparam VERDE = 2'b10;

always @(posedge clk or posedge rst) begin
	if(rst)
		state <= ROJO;
	else
		state <= next_state;
end

always @(*) begin
	case (state)
		ROJO : next_state = VERDE;
		VERDE : next_state = AMARILLO;
		AMARILLO : next_state = ROJO;
		default next_state = ROJO;
	endcase
end

always @(*) begin
	case(state)
		ROJO : luz = 2'b00;
		AMARILLO : luz = 2'b01;
		VERDE : luz = 2'b10;
		default luz = 2'b00;
	endcase
end

endmodule