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
module PIP_REG_IFtoID #(parameter wid=32, dep=17)
(input CLK, STALL, RST,
    input[dep-1:0] PCplus1_IF, input[wid-1:0] instr_IF,
    output reg[dep-1:0] PCplus1_ID, output reg[wid-1:0] instr_ID);
    
    always @(posedge CLK) begin
        if (RST) instr_ID <= 0; //flush next instr if branching
        else if (!STALL) begin
            instr_ID <= instr_IF;
            PCplus1_ID <= PCplus1_IF;
        end
    end
endmodule
