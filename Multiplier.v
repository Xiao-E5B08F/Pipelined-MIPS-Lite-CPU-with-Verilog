`timescale 1ns/1ns
module Multiplier(clk, dataA, dataB, Signal, dataOut, reset, en_reg) ;
input [31:0] dataA;
input [31:0] dataB;
input clk ;
input reset ;
input [2:0] Signal ;
output reg[63:0] dataOut ;
output reg en_reg ;

reg [63:0] mcnd;
reg [63:0] last ;
reg [31:0] mpy;
reg [63:0] prod; 
reg [5:0] counter ;

parameter MUL = 3'b101;

always @(Signal)
begin
    if(Signal == MUL)
    begin      
        counter = 6'b0 ;
        prod = 64'b0;
        mcnd = {32'b0, dataA};
        mpy = dataB;
    end
end

always @(posedge clk or reset)
begin
    if( reset )
    begin   
        prod = 64'b0;
        mcnd = 32'b0;
        mpy = 32'b0;
        counter = 6'd32;
        last = 64'b0 ;
    end
    else
    begin
            if( mpy[0] == 1'b1) 
            begin
                prod =(mcnd + prod);
            end
            mcnd = (mcnd << 1);
            mpy = (mpy >> 1);

            if(counter <= 31)
                counter = counter + 1 ;

            if( counter == 31 )
	        begin     
                if( mpy[0] == 1'b1) 
                begin
                    prod =(mcnd + prod);
                end
                mcnd = (mcnd << 1);
                mpy = (mpy >> 1);
                counter = counter + 1 ;
                dataOut = prod ;
                en_reg = 1 ;
           end
           else
           begin
                en_reg = 0 ;
            end
    end
end
endmodule