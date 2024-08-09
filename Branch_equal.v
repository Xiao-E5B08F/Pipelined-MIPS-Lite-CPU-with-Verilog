`timescale 1ns/1ns
module Branch_equal(rd1, rd2, zero);
    input [31:0] rd1, rd2;
    output zero;
    assign zero = (rd1 == rd2) ? 1 : 0;

endmodule