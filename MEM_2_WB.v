`timescale 1ns/1ns
module MEM_2_WB (clk, rst,
                RegWrite_in,  MemtoReg_in,  ADDR_in,  RD_in,  WN_in,
                RegWrite_out, MemtoReg_out, ADDR_out, RD_out, WN_out);
    
    input clk, rst;
    input RegWrite_in, MemtoReg_in;
    input [31:0]ADDR_in,  RD_in;
    input [4:0] WN_in;
    
    output reg RegWrite_out,  MemtoReg_out;
    output reg [31:0] ADDR_out,  RD_out;
    output reg [4:0] WN_out;
    
    
    always @(posedge clk) begin
        if(rst)
        begin
            RegWrite_out <= 0;
            MemtoReg_out <= 0;

            ADDR_out <= 32'b0;  
            RD_out <= 32'b0;
            WN_out <= 5'b0;
        end
        else
        begin
            RegWrite_out <= RegWrite_in;
            MemtoReg_out <= MemtoReg_in;

            ADDR_out <= ADDR_in;  
            RD_out <= RD_in;
            WN_out <= WN_in;
        end
    end

endmodule