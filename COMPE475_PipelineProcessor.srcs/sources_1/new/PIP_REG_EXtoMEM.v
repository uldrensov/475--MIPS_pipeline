`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 05:09:16 PM
// Design Name: 
// Module Name: PIP_REG_EXtoMEM
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


//PIPELINE REGISTER: EXECUTE TO MEMORY
module PIP_REG_EXtoMEM #(parameter WL=32)
(input CLK, RFWE_EX, DMWE_EX, MtoRFsel_EX,
    input[4:0] rtd_EX, input signed[WL-1:0] ALUOut_EX, DMWD_EX,
    output reg RFWE_MEM, DMWE_MEM, MtoRFsel_MEM,
    output reg[4:0] rtd_MEM, output reg signed[WL-1:0] ALUOut_MEM, DMWD_MEM);

    always @(posedge CLK) begin
        RFWE_MEM <= RFWE_EX;
        DMWE_MEM <= DMWE_EX;
        MtoRFsel_MEM <= MtoRFsel_EX;
        
        ALUOut_MEM <= ALUOut_EX;
        DMWD_MEM <= DMWD_EX;
        rtd_MEM <= rtd_EX;
    end
endmodule
