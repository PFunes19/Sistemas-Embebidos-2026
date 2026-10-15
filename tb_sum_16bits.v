`timescale 1 ns / 1 ps

module tb_sum_16bits;
    reg [15:0] A;
    reg [15:0] B;
    reg Cin;
    
    wire [15:0] S;
    wire Cout;
    
    sum_16bits DUT (A, B, Cin, S, Cout);
    
    initial begin
        $monitor("Tiempo=%0t | A=%d B=%d Cin=%b | Cout=%b S=%d (%b)",
                 $time, A, B, Cin, Cout, S, S);
        
        // Caso 1:(0 + 0 = 0)
        A = 16'd0; B = 16'd0; Cin = 1'b0; #10;
        
        // Caso 2:(300 + 500 = 800)
        A = 16'd300; B = 16'd500; Cin = 1'b0; #10;
        
        // Caso 3:(1000 + 2000 + 1 = 3001)
        A = 16'd1000; B = 16'd2000; Cin = 1'b1; #10;
        
        // Caso 4:(65530 + 5 = 65535)
        A = 16'd65530; B = 16'd5; Cin = 1'b0; #10;
        
        // Caso 5:(65535 + 1 = 65536 -> S=0, Cout=1)
        A = 16'hFFFF; B = 16'h0001; Cin = 1'b0; #10;
        
        $finish;
    end
endmodule
