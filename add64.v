//-----------------------------------------------------------------------------
// Title         : ALU Behavioral Model
//-----------------------------------------------------------------------------
`timescale 1ns/1ns
module add64(a, b, result);
  input [63:0] a, b;
  output [63:0] result;

  assign result = a + b;
endmodule

