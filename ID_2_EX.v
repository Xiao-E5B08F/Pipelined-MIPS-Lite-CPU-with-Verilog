`timescale 1ns/1ns
module ID_2_EX (clk, rst,
                RegDst_in,  ALUOp_in,  ALUSrc_in,  MemRead_in,  MemWrite_in,  RegWrite_in,  MemtoReg_in,  funct_in,  
                    RD1_in,  RD2_in,  immed_in,  rt_in,  rd_in,  shamt_in,
                RegDst_out, ALUOp_out, ALUSrc_out, MemRead_out, MemWrite_out, RegWrite_out, MemtoReg_out, funct_out, 
                    RD1_out, RD2_out, immed_out, rt_out, rd_out, shamt_out);
    
    input clk, rst;
    input RegDst_in, ALUSrc_in, MemRead_in, MemWrite_in, RegWrite_in, MemtoReg_in;
    input [1:0] ALUOp_in;
    input [31:0] RD1_in, RD2_in, immed_in;
    input [5:0] funct_in;
    input [4:0] rt_in, rd_in, shamt_in;
    
    output reg RegDst_out, ALUSrc_out, MemRead_out, MemWrite_out, RegWrite_out, MemtoReg_out;
    output reg [1:0] ALUOp_out;
    output reg [31:0] RD1_out, RD2_out, immed_out;
    output reg [5:0] funct_out;
    output reg [4:0] rt_out, rd_out, shamt_out;
    
    always @(posedge clk) begin
        if(rst)
        begin
            RegDst_out <= 0;
            ALUSrc_out <= 0;
            MemRead_out <= 0;
            MemWrite_out <= 0;
            RegWrite_out <= 0;
            MemtoReg_out <= 0;
            funct_out <= 6'b0;

            ALUOp_out <= 2'b0;
            RD1_out <= 32'b0;
            RD2_out <= 32'b0;
            immed_out <= 32'b0;

            rt_out <= 5'b0;
            rd_out <= 5'b0;
            shamt_out <= 5'b0;
        end
        else
        begin
            RegDst_out <= RegDst_in;
            ALUSrc_out <= ALUSrc_in;
            MemRead_out <= MemRead_in;
            MemWrite_out <= MemWrite_in;
            RegWrite_out <= RegWrite_in;
            MemtoReg_out <= MemtoReg_in;
            funct_out <= funct_in;

            ALUOp_out <= ALUOp_in;
            RD1_out <= RD1_in;
            RD2_out <= RD2_in;
            immed_out <= immed_in;

            rt_out <= rt_in;
            rd_out <= rd_in;
            shamt_out <= shamt_in;
        end
    end

endmodule