`timescale 1ns/1ns
module mul_mux( a, b1, b2, sel, y );
    input sel;
    input [63:0] a;
    input [31:0] b1, b2;
    output [63:0] y;
    
    wire [63:0] temp; 
    assign temp = {b1, b2};

    assign y = sel ? temp : a;
endmodule
