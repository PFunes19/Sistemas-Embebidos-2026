module top_semaforo(
	input wire rst_sem,
	input  wire clk,
    input  wire reset,
    input  wire enable,
    input  wire speed_sel,
	output wire [1:0] luz
);

wire tick;

tick_generator T (
		.clk(clk),
		.reset(reset),
		.enable(enable),
		.speed_sel(speed_sel),
		.tick(tick)
);

semaforo_simple S (
		.clk(tick),
		.rst(rst_sem),
		.luz(luz)
   );



endmodule
