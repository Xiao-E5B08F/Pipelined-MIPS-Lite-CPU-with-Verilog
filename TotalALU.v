`timescale 1ns/1ns
module TotalALU(ctl, a, b, shamt, result);
input [2:0] ctl;
input [31:0] a, b;
input [4:0] shamt;

output[31:0] result;
wire [31:0] ALUOut;
wire [31:0] ShifterOut;

//module alu(ctl, a, b, result, zero);
alu ALU( .ctl(ctl), .a(a), .b(b), .result(ALUOut)); // and or add sub slt addiu
Shifter Shifter( .dataA(b), .dataB(shamt), .Signal(ctl), .dataOut(ShifterOut) ); // srl
MUX MUX( .ALUOut(ALUOut), .Shifter(ShifterOut), .Signal(ctl), .dataOut(result) );


endmodule