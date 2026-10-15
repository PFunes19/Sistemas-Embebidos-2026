module top_sum16_7seg (
    input wire [15:0] A,
    input wire [15:0] B,
    output wire [6:0] S0,
    output wire [6:0] S1,
    output wire [6:0] S2,
    output wire [6:0] S3,
    output wire Cout
);				   

    wire [15:0] suma_total;
	
	sum_16bits S270 (A, B, 1'b0, suma_total, Cout);
																			
    hex_2_7seg decod_S0 (suma_total[3:0],   S0); 
    hex_2_7seg decod_S1 (suma_total[7:4],   S1);
    hex_2_7seg decod_S2 (suma_total[11:8],  S2);
    hex_2_7seg decod_S3 (suma_total[15:12], S3);

endmodule
