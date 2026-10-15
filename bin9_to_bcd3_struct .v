module bin_to_bcd(
    input wire [9:0] bin,
    output wire [3:0] hund,  // centenas: 0..5
    output wire [3:0] tens,  // decenas:  0..9
    output wire [3:0] ones   // unidades: 0..9
);
    wire [8:0] r100; // residuo despues de extraer centenas (0..99)

    // (1) Extraer centenas: cuantas veces cabe 100 en bin
    //     Ej: bin=345 -> hund=3
    assign hund = bin / 9'd100;

    // (2) Residuo r100 = bin - hund*100
    //     Ej: 345 - 3*100 = 45
    assign r100 = bin - hund * 9'd100;

    // (3) Extraer decenas: cuantas veces cabe 10 en r100 (0..99)
    //     Ej: r100=45 -> tens=4
    assign tens = r100 / 9'd10;

    // (4) Unidades: lo que sobra al quitar decenas
    //     Ej: 45 - 4*10 = 5
    assign ones = r100 - tens * 9'd10;
endmodule
