`timescale 1ns / 1ps

module tb_top_alu_de10lite;

    reg [4:0] A;
    reg [4:0] B;
    reg [1:0] sel;
    wire [6:0] HEX0;
    wire [6:0] HEX1;
    wire [6:0] HEX2;
    wire LED_overflow;

    top_alu_de10lite uut (
        .A(A),
        .B(B),
        .sel(sel),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .LED_overflow(LED_overflow)
    );

    initial begin
        $monitor("Tiempo=%0t | sel=%b | A=%d, B=%d | LED_OV=%b", 
                 $time, sel, $signed(A), $signed(B), LED_overflow);

        A = 5'd0; B = 5'd0; sel = 2'b00;
        #20;

        sel = 2'b00; A = 5'd4; B = 5'd2;
        #20;

        sel = 2'b00; A = 5'd12; B = 5'd5;
        #20;

        sel = 2'b01; A = -5'd4; B = 5'd2;
        #20;

        sel = 2'b01; A = -5'd12; B = 5'd5;
        #20;

        sel = 2'b10; A = 5'd3; B = 5'd5;
        #20;

        $display("Simulación de overflow terminada.");
        $finish;
    end

endmodule
