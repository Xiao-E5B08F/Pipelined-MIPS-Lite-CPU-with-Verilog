`timescale 1ns/1ns
module MUX( ALUOut, Shifter, Signal, dataOut );
input [31:0] ALUOut ;
input [31:0] Shifter ;
input [2:0] Signal ;
output [31:0] dataOut ;


parameter AND = 3'b000;
parameter OR  = 3'b001;
parameter ADD = 3'b010;
parameter SUB = 3'b110;
parameter SLT = 3'b111;
parameter SRL = 3'b011;

assign dataOut = Signal == SRL ? Shifter : ALUOut;

endmodule