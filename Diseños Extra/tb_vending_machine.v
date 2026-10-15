`timescale 1ns/1ps

module tb_vending_machine;

    reg clk;
    reg rst;
    reg m5;
    reg m10;
    wire dispensar;

    vending_machine uut (
        .clk(clk),
        .rst(rst),
        .m5(m5),
        .m10(m10),
        .dispensar(dispensar)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        m5 = 0;
        m10 = 0;

        #12 rst = 0;

        // Caso 1: moneda de 10
        #10 m10 = 1;
        #10 m10 = 0;

        // Caso 2: dos monedas de 5
        #30 m5 = 1;
        #10 m5 = 0;

        #20 m5 = 1;
        #10 m5 = 0;

        #50;
        $finish;
    end

    initial begin
        $monitor("t=%0t m5=%b m10=%b dispensar=%b",
                 $time, m5, m10, dispensar);
    end

endmodule
