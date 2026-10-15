module alu (
	input wire [4:0] A,
	input wire [4:0] B,
	input wire Cin,
	input wire Bin,
	output wire Cout,
	output wire Bout,
	output wire [4:0] S,
	output wire [4:0] D,
	output wire signed [9:0] Z,
	input wire [1:0] sel,
	output reg [9:0] Y,
	output wire OFS,
	output wire OFR
	
);

sumador SUM (.A(A),.B(B),.Cin(Cin),.S(S),.Cout(Cout),.overflow(OFS));  
restador RES (.A(A),.B(B),.Bin(Bin),.D(D),.Bout(Bout),.overflow(OFR));  
multiplicacion MUL (.A(A),.B(B),.Z(Z));

always @(*) begin
	case (sel)
		2'b00:   Y = {5'b00000, S};
		2'b01:   Y = {5'b00000, D};
		2'b10:   Y = Z;
		2'b11:   Y = 10'h0FA;
		default: Y = 10'b0000000000;
	endcase
end


endmodule