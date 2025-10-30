`timescale 1ns / 1ps

module toUpper(A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7);
    input A0,A1,A2,A3,A4,A5,A6,A7;
    output B0,B1,B2,B3,B4,B5,B6,B7;

    wire nA7, nA1;
    wire L_OR;       
    wire L_AND;     
    wire L;            
    wire nL;           

    // A7' --> nA7
    not #5 (nA7, A7);
    // A1' --> nA1
    not #5 (nA1, A1);

    // A4 + A3 + A2 --> L_OR
    or  #10 (L_OR, A4, A3, A2);

    // A7' * A6 * A5 * A1' --> L_AND
    and #10 (L_AND, nA7, A6, A5, nA1);

    // Final gate of L
    and #10 (L, L_AND, L_OR);

    not #5 (nL, L);

    // Determination of B5
    and #10 (B5, A5, nL);

    // all other inputs are the same
    buf #4 (B0, A0);
    buf #4 (B1, A1);
    buf #4 (B2, A2);
    buf #4 (B3, A3);
    buf #4 (B4, A4);
    buf #4 (B6, A6);
    buf #4 (B7, A7);

endmodule
