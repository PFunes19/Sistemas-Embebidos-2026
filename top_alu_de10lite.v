module top_alu_de10lite (
	input [4:0] A,
	input [4:0] B,
	input [1:0] sel,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output wire LED_overflow
);
	wire [9:0] result;
	wire [3:0] centenas, decenas, unidades;
	wire [3:0] digito0, digito1, digito2;

	wire overflow1;
	wire overflow2;
	wire Cout;
	wire Bout;
	wire [4:0] S;
	wire [4:0] D;
	wire [9:0] Z;

	alu alu_inst (
		.A(A),
		.B(B),
		.Cin(1'b0),
		.Bin(1'b0),
		.Cout(Cout),
		.Bout(Bout),
		.S(S),
		.D(D),
		.Z(Z),
		.sel(sel),
		.Y(result),
		.OFS(overflow1),
		.OFR(overflow2)
	);	
	
	bin_to_bcd conv_inst (
		.bin(result),
		.hund(centenas), .tens(decenas), .ones(unidades)
	);	 

	assign digito0 = (sel != 2'b11) ? unidades : result[3:0];
	assign digito1 = (sel != 2'b11) ? decenas  : result[7:4];
	assign digito2 = (sel != 2'b11) ? centenas : {2'b00, result[9:8]};

	assign LED_overflow = (sel == 2'b00) ? overflow1 : 
	                      (sel == 2'b01) ? overflow2 : 1'b0;

	bcd_to_7seg disp0 (.digit(digito0), .seg(HEX0));	
	bcd_to_7seg disp1 (.digit(digito1), .seg(HEX1));	
	bcd_to_7seg disp2 (.digit(digito2), .seg(HEX2));	

endmodule
