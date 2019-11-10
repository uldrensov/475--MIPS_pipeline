`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 10:05:20 PM
// Design Name: 
// Module Name: PIP_REG_ID
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


//PIPELINE REGISTER: DECODE STAGE
module PIP_REG_ID #(parameter addrW=16)
(input CLK, input[addrW-1:0] PC_plus1, input[31:0] instrIF,
    output reg[31:0] instrID);
    
    always @(posedge CLK) begin
        
    end
endmodule
