`timescale 1ns / 1ps

module toUpper(A, B);
    input [7:0] A;
    output [7:0] B;

    wire [7:0] nA;
    wire term0, term1, term2, term3, term4;

    not #5 (nA[7], A[7]);
    not #5 (nA[6], A[6]);
    not #5 (nA[5], A[5]);
    not #5 (nA[4], A[4]);
    not #5 (nA[3], A[3]);
    not #5 (nA[2], A[2]);
    not #5 (nA[1], A[1]);
    not #5 (nA[0], A[0]);

    // Logic terms (sum of products)
    and #10 (term0, A[5], A[7]);                                 // A5A7
    and #10 (term1, A[5], nA[6], nA[7]);                         // A5A6'A7'
    and #10 (term2, nA[7], A[6], A[5], A[4], A[3], A[2]);        // A7’A6A5A4A3A2
    and #10 (term3, nA[7], A[5], nA[4], nA[3], nA[2], nA[1], nA[0]); // A7’A5A4’A3’A2’A1’A0’
    and #10 (term4, nA[7], A[6], A[5], A[4], A[3], nA[2], A[1], A[0]); // A7'A6A5A4A3A2'A1A0

    or  #10 (B[5], term0, term1, term2, term3, term4);

    // Other bits unchanged
    assign B[7:6] = A[7:6];
    assign B[4:0] = A[4:0];

endmodule
