module multiplicacion (
	input wire signed [4:0] A,
	input wire signed [4:0] B,
	output wire signed [9:0] Z
);

	
	assign Z = A * B;	
	

endmodule						  