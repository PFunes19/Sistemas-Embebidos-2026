module dec2bin (
	input wire B1,
	input wire B2,
	input wire B3,
	input wire B4,
	output reg L1,
	output reg L2,
	output reg L3
);
always@(*)
	begin case({B4,B3,B2,B1})
		4'b1110: {L3,L2,L1}=3'b001;
		4'b1101: {L3,L2,L1}=3'b010;
		4'b1011: {L3,L2,L1}=3'b011;
		4'b0111: {L3,L2,L1}=3'b100;
		default: {L3,L2,L1}=3'B000;
	endcase
end
endmodule	  

