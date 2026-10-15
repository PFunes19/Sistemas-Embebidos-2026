module seven_seg_decoder(
    input wire [9:0] mult_out, // 
    output wire [6:0] seg0,    // unidades
    output wire [6:0] seg1,    // decenas
    output wire [6:0] seg2     // centenas
);
    wire [3:0] h, t, o;

    // Elige UNO de los dos convertidores:
    // bin9_to_bcd3_struct u0(.bin(mult_out), .hund(h), .tens(t), .ones(o));
    bin9_to_bcd3_cmp_sub u0(.bin(mult_out), .hund(h), .tens(t), .ones(o));

    // Reutilizas tu decodificador BCD->7seg tres veces
    bcd_to_7seg s0(.digit(o), .seg(seg0));
    bcd_to_7seg s1(.digit(t), .seg(seg1));
    bcd_to_7seg s2(.digit(h), .seg(seg2));
endmodule
