`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 10:53:08 PM
// Design Name: 
// Module Name: CTRL_ALUop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//ALU CONTROL UNIT
module CTRL_ALU #(parameter op_wid=2, mode_wid=3, f_wid=6)
(input[op_wid-1:0] ALUOp, input[f_wid-1:0] funct,
    output reg[mode_wid-1:0] ALUsel);
    
    always @(*) begin
        if (ALUOp == 2'b00) ALUsel <= 3'b010; //unconditional add 
        else if (ALUOp == 2'b01) ALUsel <= 3'b110; //unconditional subtract
        
        else begin //conditional on funct
            case (funct)
                6'b100000: ALUsel <= 3'b010; //add
                6'b100010: ALUsel <= 3'b110; //subtract
                6'b100100: ALUsel <= 3'b000; //and
                6'b100101: ALUsel <= 3'b001; //or
                6'b101010: ALUsel <= 3'b111; //slt (comparison flag)
                6'b000000: ALUsel <= 3'b011; //sll
                //6'b000010: //srl
                //6'b000011: //sra
                6'b000100: ALUsel <= 3'b100; //sllv
                //6'b000110: //srlv
                6'b000111: ALUsel <= 3'b101; //srav
            endcase
        end
    end
endmodule
