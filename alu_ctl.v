/*
	Title:	ALU Control Unit
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ALUOp: ����alu�O�n��+�٬O-�άO��L���O
		2. Funct: �p�G�O��L���O�h�γo��6�X�P�_
	Output Port
		1. ALUOperation: �̫�ѽX���������O
*/
`timescale 1ns/1ns
module alu_ctl(ALUOp, Funct, ALUOperation, sel2, sel3);
    input [1:0] ALUOp;
    input [5:0] Funct;

    output reg sel2;
    output reg[1:0] sel3;
    output [2:0] ALUOperation;
    reg    [2:0] ALUOperation;

    // symbolic constants for instruction function code
    parameter F_add = 6'd32;
    parameter F_sub = 6'd34;
    parameter F_and = 6'd36;
    parameter F_or  = 6'd37;
    parameter F_slt = 6'd42;
    parameter F_srl = 6'd2;
    
    parameter F_mfhi = 6'd16;
    parameter F_mflo = 6'd18;

    parameter F_multu = 6'd25;
    parameter F_maddu = 6'd1;

    // symbolic constants for ALU Operations
    parameter ALU_add = 3'b010;
    parameter ALU_sub = 3'b110;
    parameter ALU_and = 3'b000;
    parameter ALU_or  = 3'b001;
    parameter ALU_slt = 3'b111;
    parameter ALU_srl = 3'b011;
    
    parameter ALU_mul = 3'b101;

    always @(ALUOp or Funct)
    begin
        case (ALUOp) 
            2'b00 : begin ALUOperation = ALU_add; sel3 = 2'b10; end
            2'b01 : begin ALUOperation =  ALU_sub; sel3 = 2'b10; end
            2'b10 : case (Funct) 
                        F_add : begin ALUOperation = ALU_add; sel3 = 2'b10; end
                        F_sub : begin ALUOperation = ALU_sub; sel3 = 2'b10; end
                        F_and : begin ALUOperation = ALU_and; sel3 = 2'b10; end
                        F_or  : begin ALUOperation = ALU_or;  sel3 = 2'b10; end
                        F_slt : begin ALUOperation = ALU_slt; sel3 = 2'b10; end
                        F_srl : begin ALUOperation = ALU_srl; sel3 = 2'b10; end
                        F_mflo: begin ALUOperation = 3'bxxx;  sel3 = 2'b00; end
                        F_mfhi: begin ALUOperation = 3'bxxx;  sel3 = 2'b01; end
                        F_multu : begin ALUOperation = 3'b101; sel2 = 1'b0; end
                        default ALUOperation = 3'bxxx;  
                    endcase
                    
            2'b11 : 
                    case(Funct)
                        F_maddu : begin ALUOperation = 3'b101; sel2 = 1'b1; end
                        default sel2 = 1'bx;
                    endcase 
            default ALUOperation = 3'bxxx;
        endcase
    end
endmodule

