`timescale 1ns / 1ps

module toUpper(A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7);
    input A0,A1,A2,A3,A4,A5,A6,A7;
    output B0,B1,B2,B3,B4,B5,B6,B7;

    wire nA7, nA6, nA4, nA3, nA2, nA1, nA0;
    wire term1, term2, term3, term4;
    wire sum_terms;
    wire L, nL;
    not #5 (nA7, A7);
    not #5 (nA6, A6);
    not #5 (nA4, A4);
    not #5 (nA3, A3);
    not #5 (nA2, A2);
    not #5 (nA1, A1);
    not #5 (nA0, A0);

    and #10 (term1, nA7, nA6); // A7’A6'
    and #10 (term2, nA7, A6, A4, A3, A2); // A7’A6A4A3A2
    and #10 (term3, nA7, A6, A4, A3, nA2, A1, A0); // A7’A6A4A3A2’A1A0
    and #10 (term4, nA7, nA4, nA3, nA2, nA1, nA0); // A7’A4’A3’A2’A1’A0’​

    or #10 (sum_terms, A7, term1, term2, term3, term4); // A7 ​+ A7’A6′ ​+ A7’A6A4A3A2 + A7’A6A4A3A2’A1A0 + A7’A4’A3’A2’A1’A0’
    and #10 (L, sum_terms, A5);
    
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
