// Sumador de 5 bits Bon propagaBion de aBarreo
module restador (
	input wire [4:0] A,
	input wire [4:0] B,
	input wire Bin,
	output wire [4:0] D,
	output wire Bout,
	output reg overflow
	);
	
	wire B1;
	wire B2;
	wire B3;
	wire B4;
	reg [4:0] t;
	
	
   	full_sub FS0 (.A(A[0]),.B(B[0]),.Bin(Bin),.D(D[0]),.Bout(B1));
   	full_sub FS1 (.A(A[1]),.B(B[1]),.Bin(B1),.D(D[1]),.Bout(B2));
   	full_sub FS2 (.A(A[2]),.B(B[2]),.Bin(B2),.D(D[2]),.Bout(B3));
   	full_sub FS3 (.A(A[3]),.B(B[3]),.Bin(B3),.D(D[3]),.Bout(B4));
   	full_sub FS4 (.A(A[4]),.B(B[4]),.Bin(B4),.D(D[4]),.Bout(Bout)); 	   
	
	   
	   always @(*) begin
    if ($signed(A) < $signed(B)) begin
        t = A;
    end
    else begin
        t = B;
    end

    if ((A[4] ^ B[4]) && (t[4] ^ D[4])) begin
        overflow = 1'b1;
    end
    else begin
        overflow = 1'b0;
    end
end

endmodule						  
