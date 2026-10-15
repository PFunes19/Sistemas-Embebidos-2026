// Sumador de 16 bits usando 4 módulos de 4 bits
module sum_16bits (
    input wire [15:0] A,
    input wire [15:0] B,
    input wire Cin,
    output wire [15:0] S,
    output wire Cout
);

    wire C4;
    wire C5;
    wire C6;

    sum_4bits S4B0 (.A(A[3:0]),.B(B[3:0]),.Cin(Cin),.S(S[3:0]),.Cout(C4));
    sum_4bits S4B1 (.A(A[7:4]),.B(B[7:4]),.Cin(C4),.S(S[7:4]),.Cout(C5));
    sum_4bits S4B2 (.A(A[11:8]),.B(B[11:8]),.Cin(C5),.S(S[11:8]),.Cout(C6));
    sum_4bits S4B3 (.A(A[15:12]),.B(B[15:12]),.Cin(C6),.S(S[15:12]),.Cout(Cout));

endmodule
