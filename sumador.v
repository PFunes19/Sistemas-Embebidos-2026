module sumador (
	input wire [4:0] A,
	input wire [4:0] B,
	input wire Cin,
	output wire [4:0] S,
	output wire Cout,
	output reg overflow
	);
	
	wire C1;
	wire C2;
	wire C3;
	wire C4;
	reg [4:0] t;
	
   	full_adder FA0 (.A(A[0]),.B(B[0]),.Cin(Cin),.S(S[0]),.Cout(C1));
   	full_adder FA1 (.A(A[1]),.B(B[1]),.Cin(C1),.S(S[1]),.Cout(C2));
   	full_adder FA2 (.A(A[2]),.B(B[2]),.Cin(C2),.S(S[2]),.Cout(C3));
   	full_adder FA3 (.A(A[3]),.B(B[3]),.Cin(C3),.S(S[3]),.Cout(C4));
   	full_adder FA4 (.A(A[4]),.B(B[4]),.Cin(C4),.S(S[4]),.Cout(Cout));
	   
    always @(*) begin
        if ($signed(A) > $signed(B)) begin
            t = A;
        end
        else begin
            t = B;
        end

        if (t[4] ^ S[4]) begin
            overflow = 1'b1;
        end
        else begin
            overflow = 1'b0;
        end
    end
		
			
		
	

endmodule						  