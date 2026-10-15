`timescale 1 ns / 1 ps

module tb_sum_4bits_a;
	reg [3:0] A, B;
	reg Cin;
	wire [3:0] S;
	wire Cout;
	
	sum_4bits DUT (A, B, Cin, S, Cout);
	
	initial begin
		$monitor("A=%b B=%b Cin=%b | Cout=%b S=%b",
		A, B, Cin, Cout, S);
		
		A = 4'b0000; B = 4'b0000; Cin = 1'b0; #10; // 0 + 0 = 0
		A = 4'b0011; B = 4'b0101; Cin = 1'b0; #10; // 3 + 5 = 8
		A = 4'b0111; B = 4'b1000; Cin = 1'b0; #10; // 7 + 8 = 15
		A = 4'b1111; B = 4'b0001; Cin = 1'b0; #10; // 15 + 1 = 16
		$finish;
	end
endmodule
