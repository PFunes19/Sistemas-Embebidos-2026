module signed_display_9bit (
    input  wire signed [8:0] value,
    output wire [6:0] HEX0,
    output wire [6:0] HEX1,
    output wire [6:0] HEX2,
    output wire [6:0] HEX3
);

    wire [8:0] magnitude;
    wire [3:0] h, t, o;

    // Convertir el numero a su magnitud para mostrar los digitos.
    // 9 bits sin signo permiten representar tambien |-256| = 256.
    assign magnitude = value[8]
                     ? (~value + 9'd1)
                     : value;

    // Tu convertidor bin_to_bcd tiene una entrada de 10 bits.
    bin_to_bcd u0 (
        .bin({1'b0, magnitude}),
        .hund(h),
        .tens(t),
        .ones(o)
    );

    bcd_to_7seg s0 (.digit(o), .seg(HEX0));
    bcd_to_7seg s1 (.digit(t), .seg(HEX1));
    bcd_to_7seg s2 (.digit(h), .seg(HEX2));

    assign HEX3 = value[8]
                ? 7'b0111111
                : 7'b1111111;

endmodule