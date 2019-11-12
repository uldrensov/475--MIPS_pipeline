`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 03:45:53 PM
// Design Name: 
// Module Name: PIP_REG_IFtoID
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


//PIPELINE REGISTER: FETCH TO DECODE
module PIP_REG_IFtoID #(parameter addrW=16)
(input CLK, STALL, RST,
    input[addrW-1:0] PCplus1_IF, input[31:0] instr_IF,
    output reg[addrW-1:0] PCplus1_ID, output reg[31:0] instr_ID);
    
    always @(posedge CLK) begin
        if (RST) instr_ID <= 0; //flush next instr if branching
        else if (!STALL) begin
            instr_ID <= instr_IF;
            PCplus1_ID <= PCplus1_IF;
        end
    end
endmodule
