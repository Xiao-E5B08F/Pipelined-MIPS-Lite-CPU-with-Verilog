//-----------------------------------------------------------------------------
// Title         : 3-1 multiplexer
//-----------------------------------------------------------------------------
`timescale 1ns/1ns
module mux3( a, b, c, sel, y );
    parameter bitwidth=32;
    input  [1:0]sel;
    input  [bitwidth-1:0] a, b, c;
    output [bitwidth-1:0] y;

    assign y = (sel == 2'b00) ? a : (sel == 2'b01) ? b : c;
endmodule
