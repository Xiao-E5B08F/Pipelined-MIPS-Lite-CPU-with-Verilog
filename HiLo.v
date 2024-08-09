`timescale 1ns/1ns
module HiLo( clk, MulAns, HiOut, LoOut, reset, en_reg);
input clk ;
input reset ;
input en_reg ;
input [63:0] MulAns ;
output reg[31:0] HiOut ;
output reg[31:0] LoOut ;



always@( posedge clk or reset )
begin
    if(reset)
    begin
        HiOut = 32'b0;
        LoOut = 32'b0;
    end
    else if (en_reg)
    begin
        HiOut = MulAns[63:32];
        LoOut = MulAns[31:0];
    end
    
end

endmodule