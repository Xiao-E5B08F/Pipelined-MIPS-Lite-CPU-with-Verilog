`timescale 1ns/1ns
module Bit_slice( dataA, dataB, cin, Signal, Binvert, sum, cout, less, Sel);
    input dataA, dataB, cin, Binvert,  less;
    input [2:0]Signal;
    output sum, cout, Sel;
    
    wire and_out, or_out, add_out;
    wire b_temp_out;
    
    parameter AND = 3'b000;
    parameter OR  = 3'b001;
    parameter SLT = 3'b111;

    
    and(and_out, dataA, dataB);
    or(or_out, dataA, dataB);

    xor(b_temp_out, dataB, Binvert);
    FA fa1( .a(dataA),  .b(b_temp_out),  .cin(cin), .sum(add_out),  .cout(cout));


    assign sum =(Signal == AND ? and_out : 
                (Signal == OR ? or_out :
                (Signal == SLT ? less : add_out)));
    assign Sel = add_out;
endmodule