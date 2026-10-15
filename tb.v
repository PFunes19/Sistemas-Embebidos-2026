`timescale 1ns / 1ps

module tb;

    reg [15:0] A;
    reg [15:0] B;
    
    wire [6:0] S0;
    wire [6:0] S1;
    wire [6:0] S2;
    wire [6:0] S3;
    wire Cout;

    top_sum16_7seg uut (
        .A(A),
        .B(B),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .S3(S3),
        .Cout(Cout)
    );


    initial begin

        $monitor("Tiempo=%0d ns | A=%h B=%h | Cout=%b | S3=%b S2=%b S1=%b S0=%b", 
                 $time, A, B, Cout, S3, S2, S1, S0);

        A = 16'h0001; B = 16'h0001;

        A = 16'h1111; B = 16'h1111;

        A = 16'hAAAA; B = 16'h5555;

        A = 16'hFFFF; B = 16'h0001;

        A = 16'h8C02; B = 16'h31A5;

        $finish;
    end

endmodule
