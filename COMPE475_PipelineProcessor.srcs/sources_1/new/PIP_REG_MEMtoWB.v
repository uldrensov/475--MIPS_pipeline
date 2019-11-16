`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 06:49:59 PM
// Design Name: 
// Module Name: PIP_REG_MEMtoWB
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


//PIPELINE REGISTER: MEMORY TO WRITEBACK
module PIP_REG_MEMtoWB #(parameter wid=32, RFdep=5)
(input CLK, RFWE_MEM, MtoRFsel_MEM, input[RFdep-1:0] RFWA_MEM,
    input signed[wid-1:0] ALUOut_MEM, DMRD_MEM,
    output reg RFWE_WB, MtoRFsel_WB, output reg[RFdep-1:0] RFWA_WB,
    output reg signed[wid-1:0] ALUOut_WB, DMRD_WB);

    always @(posedge CLK) begin
        RFWE_WB <= RFWE_MEM;
        MtoRFsel_WB <= MtoRFsel_MEM;
        
        ALUOut_WB <= ALUOut_MEM;
        DMRD_WB <= DMRD_MEM;
        RFWA_WB <= RFWA_MEM;
    end
endmodule
