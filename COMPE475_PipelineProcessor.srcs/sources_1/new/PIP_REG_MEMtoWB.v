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
module PIP_REG_MEMtoWB #(parameter WL=32)
(input CLK, RFWE_MEM, MtoRFsel_MEM, input[4:0] rtd_MEM,
    input signed[WL-1:0] ALUOut_MEM, DMRD_MEM,
    output reg RFWE_WB, MtoRFsel_WB, output reg[4:0] rtd_WB,
    output reg signed[WL-1:0] ALUOut_WB, DMRD_WB);

    always @(posedge CLK) begin
        RFWE_WB <= RFWE_MEM;
        MtoRFsel_WB <= MtoRFsel_MEM;
        
        ALUOut_WB <= ALUOut_MEM;
        DMRD_WB <= DMRD_MEM;
        rtd_WB <= rtd_MEM;
    end
endmodule
