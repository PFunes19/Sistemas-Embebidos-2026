module full_adder (
	input wire A, B,
	input wire Cin,
	output wire S,
	output wire Cout
);
	
	//S = A XOR B XOR Cin
	assign S = A ^ B ^ Cin;
	
	//Cout = AB + ACin + BCin
	assign Cout = (A & B) | (A & Cin) | (B & Cin);
	
endmodule
