`timescale 1ns / 1ps

module toUpper_tb;

    reg [7:0] A;
    wire [7:0] B;

    toUpper uut (.A(A), .B(B));

    reg [7:0] test [0:18];
    integer i;
    integer passed = 0;
    integer failed = 0;
    reg [7:0] expected;
    reg [7:0] val;

    initial begin
        $dumpfile("toUpper.vcd");
        $dumpvars(0, toUpper_tb);
    end

    initial begin
        test[0]=8'd40; 
        test[1]=8'd72; 
        test[2]=8'd183; 
        test[3]=8'd131;
        test[4]=8'd124; 
        test[5]=8'd20; 
        test[6]=8'd235; 
        test[7]=8'd97;
        test[8]=8'd65; 
        test[9]=8'd122; 
        test[10]=8'd71; 
        test[11]=8'd109;
        test[12]=8'd146; 
        test[13]=8'd48; 
        test[14]=8'd207; 
        test[15]=8'd58;
        test[16]=8'd123; 
        test[17]=8'd148; 
        test[18]=8'd127;

        for (i = 0; i < 19; i = i + 1) begin
            val = test[i];
            A = val;
            expected = (val >= 8'd97 && val <= 8'd122) ? (val & 8'hDF) : val;
            #50;

            if (B === expected) begin
                passed = passed + 1;
            end 
            else begin
                failed = failed + 1;
                $display("FAIL: input %0d ('%c'), expected %0d ('%c'), got %0d ('%c')",
                         val, val, expected, expected, B, B);
            end
        end

        $display("\nRESULT: %0d passed, %0d failed", passed, failed);
        $finish;
    end

endmodule
