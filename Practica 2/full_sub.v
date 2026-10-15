module full_sub (
	input wire A, B,
	input wire Bin,
	output wire D,
	output wire Bout
);
	
	//S = A XOR B XOR Cin
	assign D = A ^ B ^ Bin;
	
	//Cout = AB + ACin + BCin
	assign Bout = (~A & B) | (~A & Bin) | (B & Bin);
	
endmodule
