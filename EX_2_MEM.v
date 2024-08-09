`timescale 1ns/1ns
module EX_2_MEM (clk, rst,
                MemRead_in,  MemWrite_in,  RegWrite_in,  MemtoReg_in,  ALU_in,  RD2_in,  WN_in,
                MemRead_out, MemWrite_out, RegWrite_out, MemtoReg_out, ALU_out, RD2_out, WN_out);
    
    input clk, rst;
    input MemRead_in,  MemWrite_in,  RegWrite_in,  MemtoReg_in;
    input [31:0]ALU_in,  RD2_in;
    input [4:0] WN_in;
    
    output reg MemRead_out,  MemWrite_out,  RegWrite_out,  MemtoReg_out;
    output reg [31:0] ALU_out,  RD2_out;
    output reg [4:0] WN_out;
    
    
    always @(posedge clk) begin
        if(rst)
        begin
            MemRead_out <= 0;
            MemWrite_out <= 0;
            RegWrite_out <= 0;
            MemtoReg_out <= 0;

            ALU_out <= 32'b0;  
            RD2_out <= 32'b0;
            WN_out <= 5'b0;
        end
        else
        begin
            MemRead_out <= MemRead_in;
            MemWrite_out <= MemWrite_in;
            RegWrite_out <= RegWrite_in;
            MemtoReg_out <= MemtoReg_in;

            ALU_out <= ALU_in;  
            RD2_out <= RD2_in;
            WN_out <= WN_in;
        end
    end

endmodule