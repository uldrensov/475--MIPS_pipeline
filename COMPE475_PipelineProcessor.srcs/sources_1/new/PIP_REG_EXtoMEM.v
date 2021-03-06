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
module PIP_REG_EXtoMEM #(parameter wid=32, RFdep=5)
(input CLK, RFWE_EX, DMWE_EX, MtoRFsel_EX,
    input[RFdep-1:0] RFWA_EX, input signed[wid-1:0] ALUOut_EX, DMWD_EX,
    output reg RFWE_MEM, DMWE_MEM, MtoRFsel_MEM,
    output reg[RFdep-1:0] RFWA_MEM, output reg signed[wid-1:0] ALUOut_MEM, DMWD_MEM);

    always @(posedge CLK) begin
        RFWE_MEM <= RFWE_EX;
        DMWE_MEM <= DMWE_EX;
        MtoRFsel_MEM <= MtoRFsel_EX;
        
        ALUOut_MEM <= ALUOut_EX;
        DMWD_MEM <= DMWD_EX;
        RFWA_MEM <= RFWA_EX;
    end
endmodule
