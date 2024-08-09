/*
	Title:	ALU
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ctl: ��alu_ctl�ѽX��������T��
		2. a:   inputA,�Ĥ@���n�B�z�����
		3. b:   inputB,�ĤG���n�B�z�����
	Output Port
		1. result: �̫�B�z�������G
		2. zero:   branch���O�һݭn����X
*/

/*
AND: 3'b000
OR : 3'b001
ADD: 3'b010
SUB: 3'b110
SLT: 3'b111
SRL: 3'b011
*/
`timescale 1ns/1ns
module alu(ctl, a, b, result);
    input [2:0] ctl;  
    input [31:0] a, b;
    output [31:0] result;
    
    wire [31:0] carry;
    wire Binvert;
    wire less;

    parameter SUB = 3'b110;
    parameter SLT = 3'b111;
    
    assign Binvert = (ctl == SUB) ? 1'b1 :
                     ((ctl == SLT) ? 1'b1 :1'b0);

    //Bit_slice( .dataA(), .dataB(), .cin(), .sel(), .Binvert(), .sum(), .cout(), .less(), .reset());
    Bit_slice alu1( .dataA(a[0]),  .dataB(b[0]),  .cin(Binvert),   .Signal(ctl), .Binvert(Binvert), .sum(result[0]),  .cout(carry[0]),  .less(less), .Sel());
    Bit_slice alu2( .dataA(a[1]),  .dataB(b[1]),  .cin(carry[0]),  .Signal(ctl), .Binvert(Binvert), .sum(result[1]),  .cout(carry[1]),  .less(1'b0), .Sel());
    Bit_slice alu3( .dataA(a[2]),  .dataB(b[2]),  .cin(carry[1]),  .Signal(ctl), .Binvert(Binvert), .sum(result[2]),  .cout(carry[2]),  .less(1'b0), .Sel());
    Bit_slice alu4( .dataA(a[3]),  .dataB(b[3]),  .cin(carry[2]),  .Signal(ctl), .Binvert(Binvert), .sum(result[3]),  .cout(carry[3]),  .less(1'b0), .Sel());
    Bit_slice alu5( .dataA(a[4]),  .dataB(b[4]),  .cin(carry[3]),  .Signal(ctl), .Binvert(Binvert), .sum(result[4]),  .cout(carry[4]),  .less(1'b0), .Sel());
    Bit_slice alu6( .dataA(a[5]),  .dataB(b[5]),  .cin(carry[4]),  .Signal(ctl), .Binvert(Binvert), .sum(result[5]),  .cout(carry[5]),  .less(1'b0), .Sel());
    Bit_slice alu7( .dataA(a[6]),  .dataB(b[6]),  .cin(carry[5]),  .Signal(ctl), .Binvert(Binvert), .sum(result[6]),  .cout(carry[6]),  .less(1'b0), .Sel());
    Bit_slice alu8( .dataA(a[7]),  .dataB(b[7]),  .cin(carry[6]),  .Signal(ctl), .Binvert(Binvert), .sum(result[7]),  .cout(carry[7]),  .less(1'b0), .Sel());
    Bit_slice alu9( .dataA(a[8]),  .dataB(b[8]),  .cin(carry[7]),  .Signal(ctl), .Binvert(Binvert), .sum(result[8]),  .cout(carry[8]),  .less(1'b0), .Sel());
    Bit_slice alu10(.dataA(a[9]),  .dataB(b[9]),  .cin(carry[8]),  .Signal(ctl), .Binvert(Binvert), .sum(result[9]),  .cout(carry[9]),  .less(1'b0), .Sel());
    Bit_slice alu11(.dataA(a[10]), .dataB(b[10]), .cin(carry[9]),  .Signal(ctl), .Binvert(Binvert), .sum(result[10]), .cout(carry[10]), .less(1'b0), .Sel());
    Bit_slice alu13(.dataA(a[11]), .dataB(b[11]), .cin(carry[10]), .Signal(ctl), .Binvert(Binvert), .sum(result[11]), .cout(carry[11]), .less(1'b0), .Sel());
    Bit_slice alu12(.dataA(a[12]), .dataB(b[12]), .cin(carry[11]), .Signal(ctl), .Binvert(Binvert), .sum(result[12]), .cout(carry[12]), .less(1'b0), .Sel());
    Bit_slice alu14(.dataA(a[13]), .dataB(b[13]), .cin(carry[12]), .Signal(ctl), .Binvert(Binvert), .sum(result[13]), .cout(carry[13]), .less(1'b0), .Sel());
    Bit_slice alu15(.dataA(a[14]), .dataB(b[14]), .cin(carry[13]), .Signal(ctl), .Binvert(Binvert), .sum(result[14]), .cout(carry[14]), .less(1'b0), .Sel());
    Bit_slice alu16(.dataA(a[15]), .dataB(b[15]), .cin(carry[14]), .Signal(ctl), .Binvert(Binvert), .sum(result[15]), .cout(carry[15]), .less(1'b0), .Sel());
    Bit_slice alu17(.dataA(a[16]), .dataB(b[16]), .cin(carry[15]), .Signal(ctl), .Binvert(Binvert), .sum(result[16]), .cout(carry[16]), .less(1'b0), .Sel());
    Bit_slice alu18(.dataA(a[17]), .dataB(b[17]), .cin(carry[16]), .Signal(ctl), .Binvert(Binvert), .sum(result[17]), .cout(carry[17]), .less(1'b0), .Sel());
    Bit_slice alu19(.dataA(a[18]), .dataB(b[18]), .cin(carry[17]), .Signal(ctl), .Binvert(Binvert), .sum(result[18]), .cout(carry[18]), .less(1'b0), .Sel());
    Bit_slice alu20(.dataA(a[19]), .dataB(b[19]), .cin(carry[18]), .Signal(ctl), .Binvert(Binvert), .sum(result[19]), .cout(carry[19]), .less(1'b0), .Sel());
    Bit_slice alu21(.dataA(a[20]), .dataB(b[20]), .cin(carry[19]), .Signal(ctl), .Binvert(Binvert), .sum(result[20]), .cout(carry[20]), .less(1'b0), .Sel());
    Bit_slice alu22(.dataA(a[21]), .dataB(b[21]), .cin(carry[20]), .Signal(ctl), .Binvert(Binvert), .sum(result[21]), .cout(carry[21]), .less(1'b0), .Sel());
    Bit_slice alu23(.dataA(a[22]), .dataB(b[22]), .cin(carry[21]), .Signal(ctl), .Binvert(Binvert), .sum(result[22]), .cout(carry[22]), .less(1'b0), .Sel());
    Bit_slice alu24(.dataA(a[23]), .dataB(b[23]), .cin(carry[22]), .Signal(ctl), .Binvert(Binvert), .sum(result[23]), .cout(carry[23]), .less(1'b0), .Sel());
    Bit_slice alu25(.dataA(a[24]), .dataB(b[24]), .cin(carry[23]), .Signal(ctl), .Binvert(Binvert), .sum(result[24]), .cout(carry[24]), .less(1'b0), .Sel());
    Bit_slice alu26(.dataA(a[25]), .dataB(b[25]), .cin(carry[24]), .Signal(ctl), .Binvert(Binvert), .sum(result[25]), .cout(carry[25]), .less(1'b0), .Sel());
    Bit_slice alu27(.dataA(a[26]), .dataB(b[26]), .cin(carry[25]), .Signal(ctl), .Binvert(Binvert), .sum(result[26]), .cout(carry[26]), .less(1'b0), .Sel());
    Bit_slice alu28(.dataA(a[27]), .dataB(b[27]), .cin(carry[26]), .Signal(ctl), .Binvert(Binvert), .sum(result[27]), .cout(carry[27]), .less(1'b0), .Sel());
    Bit_slice alu29(.dataA(a[28]), .dataB(b[28]), .cin(carry[27]), .Signal(ctl), .Binvert(Binvert), .sum(result[28]), .cout(carry[28]), .less(1'b0), .Sel());
    Bit_slice alu30(.dataA(a[29]), .dataB(b[29]), .cin(carry[28]), .Signal(ctl), .Binvert(Binvert), .sum(result[29]), .cout(carry[29]), .less(1'b0), .Sel());
    Bit_slice alu31(.dataA(a[30]), .dataB(b[30]), .cin(carry[29]), .Signal(ctl), .Binvert(Binvert), .sum(result[30]), .cout(carry[30]), .less(1'b0), .Sel());
    Bit_slice alu32(.dataA(a[31]), .dataB(b[31]), .cin(carry[30]), .Signal(ctl), .Binvert(Binvert), .sum(result[31]), .cout(carry[31]), .less(1'b0), .Sel(less) ) ;

endmodule

